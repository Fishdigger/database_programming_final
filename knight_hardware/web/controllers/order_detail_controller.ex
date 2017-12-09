defmodule KnightHardware.OrderDetailController do
    use KnightHardware.Web, :controller
    alias KnightHardware.Order
    alias KnightHardware.OrderDetail
    alias KnightHardware.Part
    alias KnightHardware.Repo

    def show(conn, %{"order_number" => order_number}) do
        json conn, Repo.all(from od in OrderDetail, where: od.order_number == ^order_number)
    end

    def create(conn, order_detail) do
        changeset = OrderDetail.changeset(%OrderDetail{}, order_detail)
        if changeset.valid? do
            case Repo.insert(changeset) do
                {:ok, msg} -> json conn, %{status: :ok, message: msg}
                {:error, change} -> json conn, %{status: :error, changeset: change}
            end
        else
            json conn, %{status: :error, reasons: changeset.errors}
        end
    end

    def update(conn, order_detail) do
        changeset = OrderDetail.changeset(%OrderDetail{}, order_detail)
        if changeset.valid? do
            case Repo.update(changeset) do
                {:ok, msg} -> json conn, %{status: :ok, message: msg}
                {:error, change} ->
                    json conn, %{status: :error, changeset: change}
            end
        else
            json conn, %{status: :error, reasons: changeset.errors}
        end
    end

    def delete(conn, %{"order_number" => order_num, "part_number" => part_num}) do
        {status, data} =
            Repo.get_by(OrderDetail, [order_number: order_num, part_number: part_num])
            |> Repo.delete
        json conn, %{status: status, result: data}
    end
end
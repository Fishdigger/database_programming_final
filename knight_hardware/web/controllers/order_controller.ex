defmodule KnightHardware.OrderController do
    use KnightHardware.Web, :controller
    alias KnightHardware.Repo
    alias KnightHardware.Order

    def index(conn, _) do
        json conn, Repo.all(Order)
    end

    def show(conn, %{"order_number" => order_number}) do
        json conn, Repo.get(Order, order_number)
    end

    def create(conn, order) do
        order = %{order | order_number: Order.generate_order_number()}
        changeset = Order.changeset(%Order{}, order)
        if changeset.valid? do
           case Repo.insert(changeset) do
               {:ok, _} -> json conn, %{status: :ok}
               {:error, change} -> json conn, %{status: :error, changeset: change}
           end
        else
            json conn, %{status: :error, reasons: changeset.errors}
        end
    end

    def update(conn, order) do
        changeset = Order.changeset(%Order{}, order)
        if changeset.valid? do
            case Repo.update(changeset) do
                {:ok, _} -> json conn, %{status: :ok}
                {:error, change} -> json conn, %{status: :error, changeset: change}
            end
        else
            json conn, %{status: :error, reason: changeset.errors}
        end
    end

    def delete(conn, %{"order_number" => order_number}) do
        {status, data} = 
            Repo.get(Order, order_number)
            |> Repo.delete
        json conn, %{status: status, result: data}
    end
end
defmodule KnightHardware.OrderController do
    use KnightHardware.Web, :controller
    alias KnightHardware.Repo
    alias KnightHardware.Order
    alias KnightHardware.Customer
    alias KnightHardware.Part
    alias KnightHardware.OrderDetail

    def index(conn, _) do
        json conn, Repo.all(Order)
    end

    def show(conn, %{"order_number" => order_number}) do
        order = Repo.get(Order, order_number)
        customer = Repo.get(Customer, order.customer_number)
        order_details = Repo.all(from od in OrderDetail, where: od.order_number == ^order_number)
        parts = Enum.map(order_details, fn(od) ->
           Repo.get(Part, od.part_number)
        end)
        json conn, %{order_number: order_number, order_date: order.order_date, customer: customer, parts: parts, order_details: order_details}
    end

    def create(conn, %{"order_details" => order_details} = order) do
        order_num = Order.get_last_order_number() + 1
        order = %{order | order_number: order_num}
        order_details = Enum.map order_details, fn(detail) -> 
            %{detail | order_number: order_num}
        end
        detail_changeset = OrderDetail.changeset(%OrderDetail{}, order_details)
        changeset = Order.changeset(%Order{}, order)
        if changeset.valid? do
           if detail_changeset.valid? do
               case Repo.insert(changeset) do
                   {:ok, _} -> 
                    case Repo.insert(detail_changeset) do
                        {:ok, _} -> json conn, %{message: :ok}
                        {:error, _} -> json conn, %{message: :error}
                    end
                   {:error, _} -> json conn, %{message: :error}
               end
            else
                json conn, %{status: :error, reasons: detail_changeset.errors}
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
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
        changeset = Order.changeset(%Order{}, order)
    end
end
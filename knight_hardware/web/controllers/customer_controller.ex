defmodule KnightHardware.CustomerController do
    use KnightHardware.Web, :controller

    plug :action

    def index(conn, _params) do
        json conn, KnightHardware.Repo.all(KnightHardware.Customer)
    end

    def show(conn, %{"customer_number" => id}) do
        json conn, KnightHardware.Repo.get(KnightHardware.Customer, id)
    end
end
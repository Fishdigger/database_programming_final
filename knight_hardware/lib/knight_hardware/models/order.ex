defmodule KnightHardware.Models.Order do
    use Ecto.Schema

    @primary_key {:order_number, :id, autogenerate: false}
    schema "orders" do
        field :order_date, Ecto.Date
        has_one :customer, KnightHardware.Models.Customer
    end

    defstruct [
        :order_number,
        :customer_number,
        :order_date
    ]
end
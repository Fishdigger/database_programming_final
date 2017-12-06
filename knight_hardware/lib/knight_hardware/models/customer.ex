defmodule KnightHardware.Models.Customer do
    use Ecto.Schema

    @primary_key {:customer_number, :id, autogenerate: true}
    schema "customers" do
        field :name, :string
        field :city, :string
        field :state, :string
    end

    defstruct [
        :customer_id,
        :name,
        :city,
        :state
    ]
end
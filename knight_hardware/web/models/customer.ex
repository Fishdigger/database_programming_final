defmodule KnightHardware.Customer do
  use KnightHardware.Web, :model

  @primary_key false
  schema "customers" do
    field :customer_number, :integer, primary_key: true
    field :name, :string
    field :city, :string
    field :state, :string
  end
end

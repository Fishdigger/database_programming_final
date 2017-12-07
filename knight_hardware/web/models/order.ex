defmodule KnightHardware.Order do
  use KnightHardware.Web, :model

  @primary_key false
  schema "orders" do
    field :order_number, :integer, primary_key: true
    field :customer_number, :integer
    field :order_date, :date
  end

  def changeset(struct, params \\ %{}) do
    cast(struct, params, [:order_number, :customer_number, :order_date])
    |> validate_required([:customer_number, :order_date])
  end
end

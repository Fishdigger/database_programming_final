defmodule KnightHardware.OrderDetail do
  use KnightHardware.Web, :model

  @primary_key false
  schema "order_details" do
    field :order_number, :integer, primary_key: true
    field :part_number, :string, primary_key: true
    field :num_ordered, :integer
  end

  def changeset(struct, params \\ %{}) do
    cast(struct, params, [:order_number, :part_number, :num_ordered])
    |> validate_required([:order_number, :part_number, :num_ordered])
  end
end

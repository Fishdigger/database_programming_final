defmodule KnightHardware.OrderDetail do
  use KnightHardware.Web, :model

  @primary_key false
  schema "order_details" do
    field :order_number, :integer, primary_key: true
    field :part_number, :string, primary_key: true
    field :num_ordered, :integer
  end
end

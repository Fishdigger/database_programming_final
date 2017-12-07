defmodule KnightHardware.Part do
  use KnightHardware.Web, :model

  @primary_key false
  schema "parts" do
    field :part_number, :string, primary_key: true
    field :description, :string
    field :on_hand, :integer
    field :price, :float
    field :part_class, :string
  end
end

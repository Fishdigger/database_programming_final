defmodule KnightHardware.PartClass do
  use KnightHardware.Web, :model

  @primary_key false
  schema "part_classes" do
    field :part_class, :string, primary_key: true
    field :description, :string
  end
end

defmodule KnightHardware.Models.PartClass do
    use Ecto.Schema

    @primary_key {:part_class, :string, autogenerate: false}
    
    schema "part_classes" do
        field :description, :string
        has_many :parts, KnightHardware.Models.Part
    end

    defstruct [:part_class, :description]
end
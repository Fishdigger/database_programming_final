defmodule KnightHardware.Models.Part do
    use Ecto.Schema

    @primary_key {:part_number, :string, autogenerate: false}
    schema "parts" do
        field :description, :string
        field :on_hand, :integer
        field :price, :float
        belongs_to :part_class, KnightHardware.Models.PartClass
    end

    defstruct [
        :part_number,
        :description,
        :on_hand,
        :price,
        :part_class
    ]
end
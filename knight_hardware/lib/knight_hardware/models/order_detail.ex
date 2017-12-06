defmodule KnightHardware.Models.OrderDetail do
    use Ecto.Schema
    
    schema "order_details" do
        field :num_ordered, :int
        has_one :order, KnightHardware.Models.Order
        has_one :part, KnightHardware.Models.Part
    end

    defstruct [
        :num_ordered,
        :order_number,
        :part_number
    ]
end
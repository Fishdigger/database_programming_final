defmodule KnightHardware.PartClassController do
    use KnightHardware.Web, :controller
    alias KnightHardware.Repo
    alias KnightHardware.PartClass
    alias KnightHardware.Part

    def index(conn, _) do
        part_classes = 
            Repo.all(PartClass)
            |> Enum.map fn(pc) ->
                parts = Repo.all(from p in Part, where: p.part_class == ^pc.part_class)
                %{part_class: pc.part_class, parts: parts}
            end
        json conn, part_classes
    end

    def show(conn, %{"part_class" => part_class}) do
        json conn, Repo.get(PartClass, part_class)
    end

    def list_parts(conn, %{"part_class" => part_class}) do
        json conn, Repo.get_by(Part, part_class: part_class)
    end
end
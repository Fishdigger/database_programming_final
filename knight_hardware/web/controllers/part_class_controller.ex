defmodule KnightHardware.PartClassController do
    use KnightHardware.Web, :controller
    alias KnightHardware.Repo
    alias KnightHardware.PartClass
    alias KnightHardware.Part

    def index(conn, _) do
        json conn, Repo.all(PartClass)
    end

    def show(conn, %{"part_class" => part_class}) do
        json conn, Repo.get(PartClass, part_class)
    end

    def list_parts(conn, %{"part_class" => part_class}) do
        json conn, Repo.get_by(Part, part_class: part_class)
    end
end
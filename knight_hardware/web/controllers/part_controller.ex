defmodule KnightHardware.PartController do
    use KnightHardware.Web, :controller
    alias KnightHardware.Repo
    alias KnightHardware.Part

    def index(conn, _) do
        json conn, Repo.all(Part)
    end

    def show(conn, %{"part_number" => pn}) do
        json conn, Repo.get(Part, pn)
    end
end
defmodule KnightHardware.HomeController do
    use KnightHardware.Web, :controller

    def index(conn, _) do
        render conn, "index.html"
    end
end
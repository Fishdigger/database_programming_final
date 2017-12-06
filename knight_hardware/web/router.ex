defmodule KnightHardware.Router do
  use KnightHardware.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KnightHardware do
    pipe_through :api
  end
end

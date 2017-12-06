defmodule KnightHardwareWeb.Router do
  use KnightHardwareWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KnightHardwareWeb do
    pipe_through :api
  end
end

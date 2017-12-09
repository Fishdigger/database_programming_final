defmodule KnightHardware.Router do
  use KnightHardware.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # pipeline :browser do
  #   plug :accepts, ["html"]
  #   plug :fetch_session
  #   plug :fetch_flash
  #   plug :protect_from_forgery
  #   plug :put_secure_browser_headers
  # end

  # scope "/", KnightHardware do
  #   pipe_through :browser

  #   get "/", HomeController, :index
  #   get "/orders", HomeController, :orders
  # end

  scope "/api", KnightHardware do
    pipe_through :api

    get "/customers", CustomerController, :index
    get "/customers/:customer_number", CustomerController, :show

    get "/parts", PartController, :index
    get "/parts/:part_number", PartController, :show

    get "/part_classes", PartClassController, :index
    get "/part_classes/:part_class", PartClassController, :show
    get "/part_classes/:part_class/parts", PartClassController, :list_parts

    get "/orders", OrderController, :index
    get "/orders/:order_number", OrderController, :show
    post "/orders", OrderController, :create
    patch "/orders/:order_number", OrderController, :update
    delete "/orders/:order_number", OrderController, :delete

    get "/orders/:order_number/details", OrderDetailController, :show
    post "/orders/:order_number/details", OrderDetailController, :create
    patch "/orders/:order_number/details", OrderDetailController, :update
    delete "/orders/:order_number/details", OrderDetailController, :delete

  end
end

defmodule KanbanProjectWeb.Router do
  use KanbanProjectWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KanbanProjectWeb do
    pipe_through :api

    get "/", PageController, :index
    resources "/users", UserController, except: [:new, :edit]
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:kanban_project, :dev_routes) do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end

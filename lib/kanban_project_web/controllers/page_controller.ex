defmodule KanbanProjectWeb.PageController do
  use Phoenix.Controller, formats: [:json]
  
    def index(conn, _) do
      IO.inspect "here===="
      render(conn, :index, %{users: [%{name: "Hatsor"}, %{name: "Heritier"}]})
    end
  end
  
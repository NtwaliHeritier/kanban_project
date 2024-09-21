defmodule KanbanProject.Repo do
  use Ecto.Repo,
    otp_app: :kanban_project,
    adapter: Ecto.Adapters.Postgres
end

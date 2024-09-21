defmodule KanbanProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KanbanProjectWeb.Telemetry,
      KanbanProject.Repo,
      {DNSCluster, query: Application.get_env(:kanban_project, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: KanbanProject.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: KanbanProject.Finch},
      # Start a worker by calling: KanbanProject.Worker.start_link(arg)
      # {KanbanProject.Worker, arg},
      # Start to serve requests, typically the last entry
      KanbanProjectWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KanbanProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KanbanProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

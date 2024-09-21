defmodule KanbanProjectWeb.PageJSON do
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  defp data(user) do
    %{
      name: user.name
    }
  end
end

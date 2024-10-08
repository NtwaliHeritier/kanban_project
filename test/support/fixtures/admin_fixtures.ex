defmodule KanbanProject.AdminFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KanbanProject.Admin` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{})
      |> KanbanProject.Admin.create_user()

    user
  end
end

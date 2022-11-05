defmodule ProjectTrack.TeamsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProjectTrack.Teams` context.
  """

  @doc """
  Generate a unique team name.
  """
  def unique_team_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: unique_team_name()
      })
      |> ProjectTrack.Teams.create_team()

    team
  end
end

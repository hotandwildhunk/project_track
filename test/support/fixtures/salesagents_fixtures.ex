defmodule ProjectTrack.SalesagentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProjectTrack.Salesagents` context.
  """

  @doc """
  Generate a salesagent.
  """
  def salesagent_fixture(attrs \\ %{}) do
    {:ok, salesagent} =
      attrs
      |> Enum.into(%{
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> ProjectTrack.Salesagents.create_salesagent()

    salesagent
  end
end

defmodule ProjectTrack.StatusesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProjectTrack.Statuses` context.
  """

  @doc """
  Generate a unique status name.
  """
  def unique_status_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a status.
  """
  def status_fixture(attrs \\ %{}) do
    {:ok, status} =
      attrs
      |> Enum.into(%{
        name: unique_status_name()
      })
      |> ProjectTrack.Statuses.create_status()

    status
  end
end

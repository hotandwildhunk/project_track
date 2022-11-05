defmodule ProjectTrack.ClientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProjectTrack.Clients` context.
  """

  @doc """
  Generate a client.
  """
  def client_fixture(attrs \\ %{}) do
    {:ok, client} =
      attrs
      |> Enum.into(%{
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> ProjectTrack.Clients.create_client()

    client
  end
end

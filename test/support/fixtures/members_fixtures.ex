defmodule ProjectTrack.MembersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProjectTrack.Members` context.
  """

  @doc """
  Generate a member.
  """
  def member_fixture(attrs \\ %{}) do
    {:ok, member} =
      attrs
      |> Enum.into(%{
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> ProjectTrack.Members.create_member()

    member
  end
end

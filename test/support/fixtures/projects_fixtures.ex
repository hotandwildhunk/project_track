defmodule ProjectTrack.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProjectTrack.Projects` context.
  """

  @doc """
  Generate a unique project title.
  """
  def unique_project_title, do: "some title#{System.unique_integer([:positive])}"

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: unique_project_title()
      })
      |> ProjectTrack.Projects.create_project()

    project
  end
end

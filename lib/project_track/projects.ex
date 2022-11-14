defmodule ProjectTrack.Projects do
  @moduledoc """
  The Projects context.
  """

  import Ecto.Query, warn: false
  alias ProjectTrack.Repo

  alias ProjectTrack.Projects.Project
  alias ProjectTrack.Teams.Team
  alias ProjectTrack.Clients.Client
  alias ProjectTrack.Statuses.Status

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects(params) do
    search_term = search(params)
    Project
    |> list_projects_by_search(search_term)
    |> order_by(asc: :title)
    |> preload(:team)
    |> preload(:client)
    |> preload(:status)
    |> Repo.paginate(params)
  end

  def search(params) do
    get_in(params, ["search"])
  end

  def list_projects_by_search(query, search_term) when is_nil(search_term) or byte_size(search_term) == 0 do
    query
  end

  def list_projects_by_search(query, search_term) do
    wildcard_search = "%#{search_term}%"
    from project in query,
      where: ilike(project.title, ^wildcard_search),
      or_where: ilike(project.description, ^wildcard_search)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id) do
    Project
    |> Repo.get!(id)
    |> Repo.preload(:client)
    |> Repo.preload(:team)
    |> Repo.preload(:status)
  end
  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{data: %Project{}}

  """
  def change_project(%Project{} = project, attrs \\ %{}) do
    Project.changeset(project, attrs)
  end

  def list_teams do
    Repo.all(Team)
  end

  def list_clients do
    Repo.all(Client)
  end

  def list_statuses do
    Repo.all(Status)
  end

end

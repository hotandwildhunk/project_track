defmodule ProjectTrack.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias ProjectTrack.Teams.Team
  alias ProjectTrack.Clients.Client
  alias ProjectTrack.Statuses.Status

  schema "projects" do
    field :description, :string
    field :title, :string

    belongs_to :team, Team
    belongs_to :client, Client
    belongs_to :status, Status

  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:title, :description, :team_id, :client_id, :status_id])
    |> validate_required([:title, :description, :team_id, :client_id, :status_id])
    |> unique_constraint(:title)
  end
end

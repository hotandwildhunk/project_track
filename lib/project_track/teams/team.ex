defmodule ProjectTrack.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias ProjectTrack.Members.Member
  schema "teams" do
    field :description, :string
    field :name, :string
    has_many :member, Member
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
    |> unique_constraint(:name)
  end
end

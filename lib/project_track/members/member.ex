defmodule ProjectTrack.Members.Member do
  use Ecto.Schema
  import Ecto.Changeset
  alias ProjectTrack.Teams.Team

  schema "members" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string

    belongs_to :team, Team

  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:first_name, :last_name, :email, :team_id])
    |> validate_required([:first_name, :last_name, :email, :team_id])
  end
end

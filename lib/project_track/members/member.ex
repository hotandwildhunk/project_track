defmodule ProjectTrack.Members.Member do
  use Ecto.Schema
  import Ecto.Changeset
  alias ProjectTrack.Teams.Team
  schema "members" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    #field :team_id, :id
    belongs_to :team, Team

  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:first_name, :last_name, :email, :team_id])
    |> validate_required([:first_name, :last_name, :email, :team_id])
   # |> cast_or_constraint_assoc(:team)

  end

  #defp cast_or_constraint_assoc(changeset, name) do
  #  {:assoc, %{owner_key: key}} = changeset.types[name] |> IO.inspect
  #  if changeset.changes[key] do
  #    assoc_constraint(changeset, name)
  #  else
  #    cast_assoc(changeset, name, required: true)
  #  end
  #end

end

defmodule ProjectTrack.Salesagents.Salesagent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "salesagents" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string

  end

  @doc false
  def changeset(salesagent, attrs) do
    salesagent
    |> cast(attrs, [:first_name, :last_name, :email])
    |> validate_required([:first_name, :last_name, :email])
  end
end

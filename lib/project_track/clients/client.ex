defmodule ProjectTrack.Clients.Client do
  use Ecto.Schema
  import Ecto.Changeset
  alias ProjectTrack.Salesagents.Salesagent
  schema "clients" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string

    belongs_to :salesagent, Salesagent
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:first_name, :last_name, :email, :salesagent_id])
    |> validate_required([:first_name, :last_name, :email, :salesagent_id])
  end
end

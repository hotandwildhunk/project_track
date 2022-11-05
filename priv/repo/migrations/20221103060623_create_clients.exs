defmodule ProjectTrack.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :salesagent_id, references(:salesagents, on_delete: :nothing)

    end

    create index(:clients, [:salesagent_id])
  end
end

defmodule ProjectTrack.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :team_id, references(:teams, on_delete: :nothing)

    end

    create index(:members, [:team_id])
  end
end

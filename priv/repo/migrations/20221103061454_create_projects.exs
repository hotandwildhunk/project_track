defmodule ProjectTrack.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title, :string
      add :description, :string
      add :team_id, references(:teams, on_delete: :nothing)
      add :client_id, references(:clients, on_delete: :nothing)
      add :status_id, references(:statuses, on_delete: :nothing)

    end

    create unique_index(:projects, [:title])
    create index(:projects, [:team_id])
    create index(:projects, [:client_id])
    create index(:projects, [:status_id])
  end
end

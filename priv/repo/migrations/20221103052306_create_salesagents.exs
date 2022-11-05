defmodule ProjectTrack.Repo.Migrations.CreateSalesagents do
  use Ecto.Migration

  def change do
    create table(:salesagents) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string

    end
  end
end

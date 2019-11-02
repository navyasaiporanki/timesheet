defmodule Timesheet.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :jobcode, :string
      add :budget, :integer
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end

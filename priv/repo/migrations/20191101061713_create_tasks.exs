defmodule Timesheet.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :worker_id, :integer
      add :job_id, :string
      add :hours, :integer
      add :note, :string
      add :approved, :boolean, default: false, null: false

      timestamps()
    end

  end
end

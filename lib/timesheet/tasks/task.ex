defmodule Timesheet.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :approved, :boolean, default: false
    field :hours, :integer
    field :job_id, :string
    field :note, :string
    field :worker_id, :integer

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:worker_id, :job_id, :hours, :note, :approved])
    |> validate_required([:job_id, :hours])
    |> validate_inclusion(:hours, 1..8)
  end
end

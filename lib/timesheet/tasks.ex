defmodule Timesheet.Tasks do
  @moduledoc """
  The Tasks context.
  """

  import Ecto.Query, warn: false
  alias Timesheet.Repo

  alias Timesheet.Tasks.Task

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    Repo.all(Task)
  end

  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123)
      %Task{}

      iex> get_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id), do: Repo.get!(Task, id)

  @doc """
  Creates a task.

  ## Examples

      iex> create_task(%{field: value})
      {:ok, %Task{}}

      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(attrs \\ %{}) do

    total = calculateHours(attrs)
    IO.inspect(total)
    if total > 8 || total < 1 do
      map = %{"job_id" => attrs["job_id"], "hours" => total, "note" => attrs["note"], "worker_id" => attrs["worker_id"]}
      IO.inspect(map)
      %Task{}
      |> Task.changeset(map)
      |> Repo.insert()
    else
      insertNonEmptyRows(attrs)
    end
  end


  def insertNonEmptyRows(attrs) do
    hours = attrs["hours"]
    hours = returnInteger(hours)

   if hours > 0 do
   end 
   insertRows(attrs, 1)
  end

  def insertRows(attrs, index) when index <= 7 do
    newIndex = index
    newIndex = Integer.to_string(newIndex)
    job = "job_id" <> newIndex
    hour = "hours" <> newIndex
    IO.inspect("inside insert row method")
    IO.inspect(job)
    job1 = attrs[job]
    hours1 = attrs[hour]
    IO.inspect(job1)

    getHours = returnInteger(hours1)
    if getHours > 0 do
      map = %{"job_id" => job1, "hours" => hours1, "note" => attrs["note"], "worker_id" => attrs["worker_id"]}
      %Task{}
      |> Task.changeset(map)
      |> Repo.insert()
      insertRows(attrs, index + 1)
    else 
      insertRows(attrs, index + 1)
    end
    
  end

  def insertRows(attrs, index) when index > 7 do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end


  def calculateHours(inputMap) do
    totalHours = 0
    job = inputMap["hours"]
    job = returnInteger(job)
    job1 = inputMap["hours1"]
    job1 = returnInteger(job1)
    job2 = inputMap["hours2"]
    job2 = returnInteger(job2)
    job3 = inputMap["hours3"]
    job3 = returnInteger(job3)
    job4 = inputMap["hours4"]
    job4 = returnInteger(job4)
    job5 = inputMap["hours5"]
    job5 = returnInteger(job5)
    job6 = inputMap["hours6"]
    job6 = returnInteger(job6)
    job7 = inputMap["hours7"]
    job7 = returnInteger(job7)
 
    totalHours = job + job1 + job2 + job3 + job4 + job5 + job6 + job7
  end



  def returnInteger(job) do
    if job != "" do
      {a,_} = Integer.parse(job)
      a
    else 
      0  
    end
  end
  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task changes.

  ## Examples

      iex> change_task(task)
      %Ecto.Changeset{source: %Task{}}

  """
  def change_task(%Task{} = task) do
    Task.changeset(task, %{})
  end
end

defmodule ProjectTrack.Salesagents do
  @moduledoc """
  The Salesagents context.
  """

  import Ecto.Query, warn: false
  alias ProjectTrack.Repo

  alias ProjectTrack.Salesagents.Salesagent

  @doc """
  Returns the list of salesagents.

  ## Examples

      iex> list_salesagents()
      [%Salesagent{}, ...]

  """
  def list_salesagents do
    Repo.all(Salesagent)
  end

  @doc """
  Gets a single salesagent.

  Raises `Ecto.NoResultsError` if the Salesagent does not exist.

  ## Examples

      iex> get_salesagent!(123)
      %Salesagent{}

      iex> get_salesagent!(456)
      ** (Ecto.NoResultsError)

  """
  def get_salesagent!(id), do: Repo.get!(Salesagent, id)

  @doc """
  Creates a salesagent.

  ## Examples

      iex> create_salesagent(%{field: value})
      {:ok, %Salesagent{}}

      iex> create_salesagent(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_salesagent(attrs \\ %{}) do
    %Salesagent{}
    |> Salesagent.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a salesagent.

  ## Examples

      iex> update_salesagent(salesagent, %{field: new_value})
      {:ok, %Salesagent{}}

      iex> update_salesagent(salesagent, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_salesagent(%Salesagent{} = salesagent, attrs) do
    salesagent
    |> Salesagent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a salesagent.

  ## Examples

      iex> delete_salesagent(salesagent)
      {:ok, %Salesagent{}}

      iex> delete_salesagent(salesagent)
      {:error, %Ecto.Changeset{}}

  """
  def delete_salesagent(%Salesagent{} = salesagent) do
    Repo.delete(salesagent)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking salesagent changes.

  ## Examples

      iex> change_salesagent(salesagent)
      %Ecto.Changeset{data: %Salesagent{}}

  """
  def change_salesagent(%Salesagent{} = salesagent, attrs \\ %{}) do
    Salesagent.changeset(salesagent, attrs)
  end
end

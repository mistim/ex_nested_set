defmodule NestedSets do
  @moduledoc """
  Documentation for NestedSets.
  """

  import Ecto.Query, warn: false
  alias MmClub.Repo

  @doc """
  Hello world.

  ## Examples

      iex> NestedSets.hello
      :world

  """
  def hello do
    :world
  end

  # region get data
  # Собственно само дерево
  def tree(schema) do
    schema
    # |> IO.inspect
    |> Repo.all()
  end

  # Выбор подчиненных узлов
  def childrens(schema, id) do
    
  end

  # Выбор родительской "ветки"
  def parents(schema, id) do
    
  end

  # Выбор ветки в которой участвует наш узел
  def branch(chema, id) do
    
  end
  # endregion

  # region set data
  def create_root(schema, attrs \\ %{}) do
    %{attrs | left_key: 1, right_key: 2, level: 0, parent_id: 0}

    # %:"#{to_string schema}"{}
    # |> Author.changeset(attrs)
    # |> Repo.insert()
  end
  # endregion

  # region check data
  # endregion
end

defmodule MmClub.Repo.Migrations.CreateNestedSet do
  use Ecto.Migration

  def change do
    create table(:nested_set) do
      add :name, :string
      add :left, :integer
      add :right, :integer
      add :level, :integer
      add :parent_id, :integer

      timestamps()
    end

#    create unique_index(:nested_set, [:username])
  end
end
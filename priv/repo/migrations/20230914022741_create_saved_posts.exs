defmodule Blog.Repo.Migrations.CreateSavedPosts do
  use Ecto.Migration

  def change do
    create table(:saved_posts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id)
      add :post_id, references(:posts, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:saved_posts, [:user_id])
    create index(:saved_posts, [:post_id])
  end
end

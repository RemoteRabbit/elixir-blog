defmodule Blog.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "comments" do
    field :comment, :string
    belongs_to :user, Blog.Accounts.User
    belongs_to :post, Blog.Posts.Post

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:comment, :user_id, :post_id])
    |> validate_required([:comment, :user_id, :post_id])
  end
end

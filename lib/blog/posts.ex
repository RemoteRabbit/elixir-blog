defmodule Blog.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false
  alias Blog.Repo

  alias Blog.Posts.Post

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts do
    Repo.all(Post)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id), do: Repo.get!(Post, id)

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:posts)
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

  alias Blog.Posts.SavedPost

  @doc """
  Returns the list of saved_posts.

  ## Examples

      iex> list_saved_posts()
      [%SavedPost{}, ...]

  """
  def list_saved_posts do
    Repo.all(SavedPost)
  end

  @doc """
  Gets a single saved_post.

  Raises `Ecto.NoResultsError` if the Saved post does not exist.

  ## Examples

      iex> get_saved_post!(123)
      %SavedPost{}

      iex> get_saved_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_saved_post!(id), do: Repo.get!(SavedPost, id)

  @doc """
  Creates a saved_post.

  ## Examples

      iex> create_saved_post(%{field: value})
      {:ok, %SavedPost{}}

      iex> create_saved_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_saved_post(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:saved_posts)
    |> SavedPost.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a saved_post.

  ## Examples

      iex> update_saved_post(saved_post, %{field: new_value})
      {:ok, %SavedPost{}}

      iex> update_saved_post(saved_post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_saved_post(%SavedPost{} = saved_post, attrs) do
    saved_post
    |> SavedPost.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a saved_post.

  ## Examples

      iex> delete_saved_post(saved_post)
      {:ok, %SavedPost{}}

      iex> delete_saved_post(saved_post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_saved_post(%SavedPost{} = saved_post) do
    Repo.delete(saved_post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking saved_post changes.

  ## Examples

      iex> change_saved_post(saved_post)
      %Ecto.Changeset{data: %SavedPost{}}

  """
  def change_saved_post(%SavedPost{} = saved_post, attrs \\ %{}) do
    SavedPost.changeset(saved_post, attrs)
  end
end

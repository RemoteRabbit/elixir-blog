defmodule Blog.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blog.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        title: "some title",
        body: "some body"
      })
      |> Blog.Posts.create_post()

    post
  end

  @doc """
  Generate a saved_post.
  """
  def saved_post_fixture(attrs \\ %{}) do
    {:ok, saved_post} =
      attrs
      |> Enum.into(%{

      })
      |> Blog.Posts.create_saved_post()

    saved_post
  end
end

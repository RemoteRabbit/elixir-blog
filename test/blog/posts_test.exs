defmodule Blog.PostsTest do
  use Blog.DataCase

  alias Blog.Posts

  describe "posts" do
    alias Blog.Posts.Post

    import Blog.PostsFixtures

    @invalid_attrs %{title: nil, body: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Posts.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Posts.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{title: "some title", body: "some body"}

      assert {:ok, %Post{} = post} = Posts.create_post(valid_attrs)
      assert post.title == "some title"
      assert post.body == "some body"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{title: "some updated title", body: "some updated body"}

      assert {:ok, %Post{} = post} = Posts.update_post(post, update_attrs)
      assert post.title == "some updated title"
      assert post.body == "some updated body"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_post(post, @invalid_attrs)
      assert post == Posts.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Posts.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Posts.change_post(post)
    end
  end

  describe "saved_posts" do
    alias Blog.Posts.SavedPost

    import Blog.PostsFixtures

    @invalid_attrs %{}

    test "list_saved_posts/0 returns all saved_posts" do
      saved_post = saved_post_fixture()
      assert Posts.list_saved_posts() == [saved_post]
    end

    test "get_saved_post!/1 returns the saved_post with given id" do
      saved_post = saved_post_fixture()
      assert Posts.get_saved_post!(saved_post.id) == saved_post
    end

    test "create_saved_post/1 with valid data creates a saved_post" do
      valid_attrs = %{}

      assert {:ok, %SavedPost{} = saved_post} = Posts.create_saved_post(valid_attrs)
    end

    test "create_saved_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_saved_post(@invalid_attrs)
    end

    test "update_saved_post/2 with valid data updates the saved_post" do
      saved_post = saved_post_fixture()
      update_attrs = %{}

      assert {:ok, %SavedPost{} = saved_post} = Posts.update_saved_post(saved_post, update_attrs)
    end

    test "update_saved_post/2 with invalid data returns error changeset" do
      saved_post = saved_post_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_saved_post(saved_post, @invalid_attrs)
      assert saved_post == Posts.get_saved_post!(saved_post.id)
    end

    test "delete_saved_post/1 deletes the saved_post" do
      saved_post = saved_post_fixture()
      assert {:ok, %SavedPost{}} = Posts.delete_saved_post(saved_post)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_saved_post!(saved_post.id) end
    end

    test "change_saved_post/1 returns a saved_post changeset" do
      saved_post = saved_post_fixture()
      assert %Ecto.Changeset{} = Posts.change_saved_post(saved_post)
    end
  end
end

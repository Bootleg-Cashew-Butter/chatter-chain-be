defmodule ChatterChain.PostTest do
  use ChatterChain.ModelCase

  alias ChatterChain.Post

  @valid_attrs %{body: "some content", isLink: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end

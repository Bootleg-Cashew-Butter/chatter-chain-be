defmodule ChatterChain.PostView do
  use ChatterChain.Web, :view

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, ChatterChain.PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, ChatterChain.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      body: post.body,
      isLink: post.isLink,
      creator_id: post.creator_id,
      chat_id: post.chat_id}
  end
end

class MainController < ApplicationController
  def list_posts
    posts = Post.connection.execute("SELECT * FROM posts")

    render "main/list_posts", locals: { posts: posts }
  end

  def show_post
    post = Post.find(params["id"])

    render "main/show_post", locals: { post: post }
  end

  def new_post
  end

  def edit_post
    post = Post.find(params["id"])

    render "main/edit_post", locals: { post: post }
  end

  def update_post
    post = Post.find(params['id'])
    post.set_attributes('title' => params['title'],
                        'body' => params['body'],  
                        'author' => params['author']
                        )
    post.save

    redirect_to action: "list_posts"
  end

  def create_post
    post = Post.new(
                    "title"  => params["title"],
                    "body"   => params["body"],
                    "author" => params["author"]
                    )
    post.save
    redirect_to action: "list_posts"
  end

  def delete_post
    connection.execute("DELETE FROM posts WHERE posts.id = ?", params["id"])

    redirect_to action: "list_posts"
  end
end

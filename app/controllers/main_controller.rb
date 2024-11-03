class MainController < ApplicationController
  def list_posts
    @posts = connection.execute("SELECT * FROM posts")
  end

  def show_post
    @post = connection.execute("SELECT * FROM posts 
    WHERE posts.id = ? LIMIT 1", params['id']).first
  end

  def new_post
  end

  def create_post
    insert_query = <<-SQL
      INSERT INTO posts (title, body, author, created_at)
      VALUES (?,?,?,?)
    SQL

    connection.execute insert_query,
      [params['title'],
      params['body'],
      params['author'],
      Date.current.to_s]

    redirect_to action: 'list_posts'
  end

  private

  def connection
    db_connection = SQLite3::Database.new 'db/development.sqlite3'
    db_connection.results_as_hash = true
    db_connection
  end
   
end

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.userid = current_user.id
    post.save!
    redirect_to root_path, notice: 'save'
  end

  def show
  end

  def edit
  end

  private
  post_attr = [:title, :watched_on, :theater, :comment]
  def post_params
    params.require(:post).permit(:title, :watched_on, :theater, :comment)
  end
end

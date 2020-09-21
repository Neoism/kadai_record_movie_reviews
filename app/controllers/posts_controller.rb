class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.userid = current_user.id
    post.save!
    redirect_to root_path, notice: 'save'
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @helpful = Helpful.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

  end

  private
  post_attr = [:title, :watched_on, :theater, :comment]
  def post_params
    params.require(:post).permit(:title, :watched_on, :theater, :comment, :rate)
  end
end

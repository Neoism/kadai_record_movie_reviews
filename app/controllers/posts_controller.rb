class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_current_user!, only: [:edit, :destroy]

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save!
    redirect_to post_path(post), notice: 'save'
  end

  def index
    @posts = Post.all
  end

  def search
    @posts = Post.search(params[:keyword])
    render :index
  end

  def show
    @post = Post.find(params[:id])
    @helpful = Helpful.new
    @posts_of_the_same_name = Post.where(title: @post.title).where.not(id: @post.id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :watched_on, :theater, :comment, :rate)
  end

  def require_current_user!
    post = Post.find(params[:id])
    redirect_to posts_path unless post.user_id == current_user.id
  end
end

class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save!
    redirect_to root_path, notice: 'save'
  end

  def index
    @posts = Post.all
  end

  def search
    if params[:keyword].present?
      @posts = Post.where('title LIKE ?', "%#{params[:keyword]}%")
    else
      @posts = Post.none
    end
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

  end

  private
  post_attr = [:title, :watched_on, :theater, :comment]
  def post_params
    params.require(:post).permit(:title, :watched_on, :theater, :comment, :rate)
  end
end

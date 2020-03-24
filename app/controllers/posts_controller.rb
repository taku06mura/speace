class PostsController < ApplicationController
  # before_action :set_post, only:[:show, :edit]

  def index
    @posts = Post.page(params[:page]).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:image, :text, :title).merge(user_id: current_user.id)
  end

  # def set_post
  #   @post = Post.find(params[:id])
  # end
end

class PostsController < ApplicationController
  # before_action :set_post

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def create
    Post.create(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:image, :text).merge(user_id: current_user.id)
  end

  # def set_post
  #   @post = Post.find(params[:id])
  # end
end

class PostsController < ApplicationController
  before_action :user_signed_in?, only: [:new, :create] 
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id 
    @post.save
    redirect_to root_path
  end

  def index
    @posts = Post.all
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def user_signed_in?
      unless signed_in?
        redirect_to signin_path
      end
    end
end

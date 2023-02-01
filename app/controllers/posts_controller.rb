class PostsController < ApplicationController
 def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:post_id])
  end
end

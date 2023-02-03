class PostsController < ApplicationController
  def index
    @user = User.find(params[:author_id])
    @posts = Post.where(author_id: @user)
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(post_parameters)
    @post.user = current_user
    @post.author_id = current_user.id

    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_parameters
    params.require(:new_post).permit(:Title, :Text)
  end
end

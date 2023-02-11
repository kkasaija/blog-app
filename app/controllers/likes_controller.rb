class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(author_id: current_user, post_id: params[:post_id])

    if @like.save
      flash[:success] = 'You liked this post!'
      redirect_to "/users/#{params[:author_id]}/posts/#{params[:post_id]}"
    else
      flash[:danger] = 'Not able to like this post!!!'
    end

    @post.increment!(:likes_counter)
    redirect_to user_post_path(@user, @post)
  end
end

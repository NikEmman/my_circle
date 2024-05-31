class LikerLikedPostsController < ApplicationController
  before_action :ensure_profile_exists
  before_action :set_post, only: %i[create destroy]

  def create
    @liker_liked_post = current_user.liker_liked_posts.create(liked_post_id: params[:post_id])
    if @liker_liked_post.save
      redirect_to posts_path
    else
      render 'post/show'
    end
  end

  def destroy
    @liker_liked_post = LikerLikedPost.find(params[:id])
    @liker_liked_post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end

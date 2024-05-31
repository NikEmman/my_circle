class LikerLikedCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[create destroy]

  def create
    @liker_liked_comment = current_user.liker_liked_comments.create(liked_comment_id: params[:comment_id])
    if @liker_liked_comment.save
      redirect_to posts_path
    else
      render 'post/show'
    end
  end

  def destroy
    @liker_liked_comment = LikerLikedComment.find(params[:id])
    @liker_liked_comment.destroy
    redirect_to posts_path
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end

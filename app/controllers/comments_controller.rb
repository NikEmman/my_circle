class CommentsController < ApplicationController
  before_action :require_permission, only: %i[edit destroy]
  before_action :set_comment, only: %i[show edit update destroy]

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, notice: 'Comment was successfully created.' }
      else
        format.html { render 'posts/show', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Comment was successfully destroyed.' }
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to root_path, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def require_permission
    return unless current_user != Comment.find(params[:id]).user

    redirect_to root_path, alert: 'You are not the creator of this comment'
  end
end

class CommentsController < ApplicationController
  before_action :require_permission, only: %i[edit destroy]
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :ensure_profile_exists

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @comment.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('new_comment',
                                partial: 'shared/form_comment',
                                locals: { model: [@post, Comment.new] }),
            turbo_stream.prepend('comments',
                                 partial: 'shared/comment',
                                 locals: { comment: @comment })

          ]
        end
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('new_comment',
                                partial: 'shared/form_comment',
                                locals: { model: [@post, @comment] })

          ]
        end
        format.html { flash.now[:alert] = 'Comment was not created' }
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
        format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  private

  def set_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def require_permission
    return unless current_user != Comment.find(params[:id]).user || current_user.admin?

    redirect_to root_path, alert: 'You are not the creator of this comment'
  end
end

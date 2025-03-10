class PostsController < ApplicationController
  before_action :require_permission, only: %i[edit destroy]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :ensure_profile_exists

  def index
    @posts = current_user.posts.includes(:likers, comments: :liker_liked_comments)
    followee_posts = current_user.followees.flat_map do |followee|
      followee.posts.includes(comments: :liker_liked_comments)
    end
    @posts += followee_posts

    @posts.sort_by! { |post| -post.created_at.to_i }
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('new_post',
                                partial: 'shared/form',
                                locals: { model: Post.new }),
            turbo_stream.prepend('posts',
                                 partial: 'shared/post',
                                 locals: { post: @post })

          ]
        end
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('new_post',
                                partial: 'shared/form',
                                locals: { model: @post })

          ]
        end
        format.html { flash.now[:alert] = 'Post was not created' }
      end
    end
  end

  def show
    @comment = Comment.new
  end

  def edit; end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post was successfully destroyed.' }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :user_id)
  end

  def require_permission
    post = Post.find(params[:id]).includes(:likers, comments: :liker_liked_comments)
    return if post.user || current_user.admin?

    redirect_to root_path, alert: 'You are not the creator of this post'
  end
end

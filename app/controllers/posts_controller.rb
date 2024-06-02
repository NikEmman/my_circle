class PostsController < ApplicationController
  before_action :require_permission, only: %i[edit destroy]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :ensure_profile_exists

  def index
    @posts = current_user.posts
    @posts += current_user.followees.flat_map(&:posts)
    @posts.sort_by! { |post| -post.created_at.to_i }
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
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
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
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
    return unless current_user != Post.find(params[:id]).user

    redirect_to root_path, alert: 'You are not the creator of this post'
  end
end

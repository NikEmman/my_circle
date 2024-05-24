class FeedController < ApplicationController
  def index
    @posts = current_user.posts
    @posts += current_user.followees.flat_map(&:posts)
    @posts.sort_by! { |post| -post.created_at.to_i }
  end
end

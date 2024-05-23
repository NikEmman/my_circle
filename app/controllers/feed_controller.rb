class FeedController < ApplicationController
  def index
    @comments = Comment.all
  end
end

class FeedController < ApplicationController
  def index
    @comments = Comments.all
  end
end

class AdminController < ApplicationController
  def index; end

  def posts; end

  def comments
    @comments = Comment.all.includes(:user, :post)
  end

  def users
    @users = User.all.includes(:profile, :posts)
  end
end

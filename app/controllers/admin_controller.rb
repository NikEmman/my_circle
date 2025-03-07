class AdminController < ApplicationController
  def index; end

  def posts; end

  def comments; end

  def users
    @users = User.all.includes(:profile, :posts)
  end
end

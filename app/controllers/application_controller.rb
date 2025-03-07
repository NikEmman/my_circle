class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def ensure_profile_exists
    return if current_user.profile.present? || current_user.admin?

    flash[:alert] = 'Please create a profile first'
    redirect_to new_profile_path
  end
end

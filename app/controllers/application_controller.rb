class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def ensure_profile_exists
    return if current_user.profile.present?

    flash[:alert] = 'Please create a profile first'
    redirect_to new_profile_path # replace with your profile creation path
  end
end

class FolloweesFollowersController < ApplicationController
  before_action :ensure_profile_exists
  before_action :set_profile
  def destroy
    @followees_follower = FolloweesFollower.find_by(follower_id: current_user.id, followee_id: @profile.user.id.to_i)
    @followees_follower.destroy
    redirect_to @profile, notice: "You have successfully unfollowed #{@profile.first_name} #{@profile.last_name}"
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end
end

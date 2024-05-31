class ProfilesController < ApplicationController
  before_action :require_permission, only: %i[edit]
  before_action :set_profile, only: %i[show edit update]
  def new
    @profile = Profile.new
  end

  def show
    @follow_request = FollowRequest.new
  end

  def edit; end

  def create
    @profile = current_user.build_profile(profile_params)
    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_path, notice: 'Profile was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_path, notice: 'Profile was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name)
  end

  def require_permission
    return unless current_user != Profile.find(params[:id]).user

    redirect_to root_path, alert: 'You are not the owner of this profile'
  end
end

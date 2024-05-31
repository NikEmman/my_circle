class FollowRequestsController < ApplicationController
  before_action :set_follow_request, only: :update
  def create
    @follow_request = current_user.requested_follow_requests.build(approver_id: Profile.find(params[:profile_id]).id)
    respond_to do |format|
      if @follow_request.save
        format.html { redirect_to profile_path(params[:profile_id]), notice: 'Follow request was successfully sent!' }
      else
        format.html { redirect_to profile_path(params[:profile_id]), status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_url(@post), notice: 'Post was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_follow_request
    @follow_request = FollowRequest.find(params[:follow_request_id])
  end
end

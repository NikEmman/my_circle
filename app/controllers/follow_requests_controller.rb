class FollowRequestsController < ApplicationController
  def create
    @follow_request = FollowRequest.build(requester_id: current_user.id,
                                          approver_id: Profile.find(params[:profile_id]).user.id)
    respond_to do |format|
      if @follow_request.save
        format.html { redirect_to profile_path(params[:profile_id]), notice: 'Follow request was successfully sent!' }
      else
        format.html { redirect_to profile_path(params[:profile_id]), status: :unprocessable_entity }
      end
    end
  end

  def update
    @follow_request = FollowRequest.find(params[:id])

    respond_to do |format|
      if @follow_request.update(status: 1) # Set status to "accepted"
        format.html do
          redirect_to profile_path(params[:profile_id]), notice: 'Follow request was successfully answered!'
        end
      else
        format.html { redirect_to profile_path(params[:profile_id]), status: :unprocessable_entity }
      end
    end
  end
end

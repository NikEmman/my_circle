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
    @follow_request = FollowRequest.find_by(approver_id: current_user.id)

    respond_to do |format|
      ActiveRecord::Base.transaction do
        if @follow_request.update(status: params[:follow_request][:status].to_i)
          if @follow_request.status == 'accepted'
            FolloweesFollower.create!(followee_id: @follow_request.approver_id,
                                      follower_id: @follow_request.requester_id)
          end
          format.html do
            redirect_to profile_path(params[:profile_id]), notice: 'Follow request was successfully answered!'
          end
        else
          format.html { redirect_to profile_path(params[:profile_id]), status: :unprocessable_entity }
        end
      end
    end
  end
end

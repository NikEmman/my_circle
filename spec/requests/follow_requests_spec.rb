require 'rails_helper'

RSpec.describe 'FollowRequests', type: :request do
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user:) }
  let(:follow_request) { create(:follow_request) }

  context 'Prevent access when user' do
    it 'not signed_in' do
      post profile_follow_requests_path(profile),
           params: { follow_request: FactoryBot.attributes_for(:follow_request) }
      expect(response).not_to be_successful
    end
  end
  context 'all before_actions conditions are met ' do
    before { sign_in user }

    describe 'Post /FollowRequest' do
      it 'should create a follow request with valid attributes' do
        post profile_follow_requests_path(profile),
             params: { follow_request: FactoryBot.attributes_for(:follow_request) }
        expect(response).to redirect_to profile_path(profile)
        expect(flash[:notice]).to eq 'Follow request was successfully sent!'
      end
    end
    describe 'Put /FollowRequest' do
      it 'should update a follow request with valid attributes' do
        put profile_follow_request_path(profile, follow_request),
            params: { follow_request: FactoryBot.attributes_for(:follow_request) }

        expect(response).to redirect_to profile_path(profile)
        expect(flash[:notice]).to eq 'Follow request was successfully answered!'
      end
    end
  end
end

# spec/models/follow_request_spec.rb
require 'rails_helper'

RSpec.describe FollowRequest, type: :model do
  let(:follow_request) { create(:follow_request) }

  it 'has a valid factory' do
    expect(follow_request).to be_valid
  end

  it 'is invalid without a requester' do
    follow_request.requester = nil
    expect(follow_request).not_to be_valid
  end

  it 'is invalid without an approver' do
    follow_request.approver = nil
    expect(follow_request).not_to be_valid
  end

  it 'has a pending status by default' do
    expect(follow_request.status).to eq('pending')
  end
end

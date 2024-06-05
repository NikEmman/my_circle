require 'rails_helper'

RSpec.describe FolloweesFollower, type: :model do
  let(:followees_follower) { create(:followees_follower) }

  context 'validations' do
    it 'has a valid factory' do
      expect(followees_follower).to be_valid
    end

    it 'is invalid without a followee' do
      followees_follower.followee = nil
      expect(followees_follower).not_to be_valid
    end
    it 'is invalid without a follower' do
      followees_follower.follower = nil
      expect(followees_follower).not_to be_valid
    end
  end
  context 'associations' do
    it 'should return the follower' do
      expect(followees_follower.follower).to be_instance_of(User)
    end

    it 'should return the followee' do
      expect(followees_follower.followee).to be_instance_of(User)
    end
  end
end

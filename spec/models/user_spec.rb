require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.not_followed_by' do
    let(:user) { create(:user) }
    let(:second_user) { create(:user) }
    let(:third_user) { create(:user) }
    let(:fourth_user) { create(:user) }

    before do
      create(:profile, user: second_user)
      create(:profile, user: third_user)
      create(:followees_follower, follower: user, followee: second_user)
    end

    it 'returns users not followed by the given user and have a profile' do
      expect(User.not_followed_by(user)).to contain_exactly(third_user)
    end
    it 'does not return users followed by the given user' do
      expect(User.not_followed_by(user)).not_to include(second_user)
    end

    it 'does not return the given user' do
      expect(User.not_followed_by(user)).not_to include(user)
    end

    it 'does not return users without a profile' do
      expect(User.not_followed_by(user)).not_to include(fourth_user)
    end
  end
end

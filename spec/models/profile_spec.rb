require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user:) }
  context 'validations' do
    it 'has a valid factory' do
      expect(profile).to be_valid
    end

    it 'is invalid without a first_name' do
      profile.first_name = nil
      expect(profile).not_to be_valid
    end
    it 'is invalid without a last_name' do
      profile.last_name = nil
      expect(profile).not_to be_valid
    end
  end

  context 'associations' do
    it 'should return the user object' do
      expect(profile.user).to eq(user)
    end
    it 'has one attached avatar' do
      expect(profile.avatar).to be_an_instance_of(ActiveStorage::Attached::One)
    end
  end

  describe ' #full_name' do
    it 'should return the full name of the profile' do
      expect(profile.full_name).to eq('Mickey Mouse')
    end
  end
end

# spec/models/post_spec.rb

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }

  describe 'validations' do
    it 'is valid with a body and a user' do
      post = build(:post, user:)
      expect(post).to be_valid
    end

    it 'is invalid without a body' do
      post = build(:post, user:, body: nil)
      expect(post).not_to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:liker_liked_posts).dependent(:destroy) }
    it { should have_many(:likers).through(:liker_liked_posts) }
  end
end

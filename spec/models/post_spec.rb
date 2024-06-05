# spec/models/post_spec.rb

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user:) }
  let(:comment) { create(:comment, post:) }
  context 'validations' do
    it 'is valid with a body and a user' do
      expect(post).to be_valid
    end

    it 'is invalid without a body' do
      post.body = nil
      expect(post).not_to be_valid
    end
  end

  context 'associations' do
    it 'should return the user object' do
      expect(post.user).to eq(user)
    end
    it 'should return the comment object' do
      expect(post.comments).to include(comment)
    end
  end
end

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:comment) { create(:comment, post:, user:) }
  describe 'validations' do
    it 'is valid with a body and a user' do
      expect(comment).to be_valid
    end

    it 'is invalid without a body' do
      comment.body = nil
      expect(comment).not_to be_valid
    end
  end

  context 'associations' do
    it 'should return the user object' do
      expect(comment.user).to eq(user)
    end
    it 'should return the parent post' do
      expect(comment.post).to be(post)
    end
  end
end

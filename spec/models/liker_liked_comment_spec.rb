require 'rails_helper'

RSpec.describe LikerLikedComment, type: :model do
  let(:liker_liked_comment) { create(:liker_liked_comment) }
  context 'validations' do
    it 'has a valid factory' do
      expect(liker_liked_comment).to be_valid
    end

    it 'is invalid without a liker' do
      liker_liked_comment.liker = nil
      expect(liker_liked_comment).not_to be_valid
    end

    it 'is invalid without an liked_comment' do
      liker_liked_comment.liked_comment = nil
      expect(liker_liked_comment).not_to be_valid
    end
  end
  context 'associations' do
    it 'returns the user that liked the comment' do
      expect(liker_liked_comment.liker).to be_instance_of(User)
    end
    it 'returns the liked comment' do
      expect(liker_liked_comment.liked_comment).to be_instance_of(Comment)
    end
  end
end

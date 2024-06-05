require 'rails_helper'

RSpec.describe LikerLikedPost, type: :model do
  let(:liker_liked_post) { create(:liker_liked_post) }
  context 'validations' do
    it 'has a valid factory' do
      expect(liker_liked_post).to be_valid
    end

    it 'is invalid without a liker' do
      liker_liked_post.liker = nil
      expect(liker_liked_post).not_to be_valid
    end

    it 'is invalid without an liked_post' do
      liker_liked_post.liked_post = nil
      expect(liker_liked_post).not_to be_valid
    end
  end
  context 'associations' do
    it 'returns the user that liked the post' do
      expect(liker_liked_post.liker).to be_instance_of(User)
    end
    it 'returns the liked post' do
      expect(liker_liked_post.liked_post).to be_instance_of(Post)
    end
  end
end

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :liker_liked_posts, foreign_key: 'liked_post_id', dependent: :destroy
  has_many :likers, through: :liker_liked_posts, source: :liker
  validates :body, presence: true
end

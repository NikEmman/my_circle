class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :liker_liked_comments, foreign_key: 'liked_comment_id', dependent: :destroy
  has_many :likers, through: :liker_liked_comments, source: :liker
  validates :post_id, presence: true
  validates :body, presence: true, length: { maximum: 500 }
end

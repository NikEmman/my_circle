class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :followed_users, foreign_key: :follower_id, class_name: 'FolloweesFollower'
  has_many :followees, through: :followed_users, dependent: :destroy
  has_many :following_users, foreign_key: :followee_id, class_name: 'FolloweesFollower'
  has_many :followers, through: :following_users, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :liker_liked_comments, foreign_key: 'liker_id', dependent: :destroy
  has_many :liker_liked_posts, foreign_key: 'liker_id', dependent: :destroy
  has_many :liked_posts, through: :liker_liked_posts, source: :liked_post
  has_many :liked_comments, through: :liker_liked_comments, source: :liked_comment

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

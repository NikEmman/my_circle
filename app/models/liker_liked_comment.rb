class LikerLikedComment < ApplicationRecord
  belongs_to :liker, class_name: 'User'
  belongs_to :liked_comment, class_name: 'Comment'
end

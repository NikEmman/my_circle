# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.find_or_create_by(email: 'mickey@mail.com', password: 'password')
FolloweesFollower.find_or_create_by(followee_id: 1, follower_id: 2)
Profile.find_or_create_by(user_id: 1, first_name: 'Mickey', last_name: 'Mouse')
Profile.find_or_create_by(user_id: 2, first_name: 'Goofey', last_name: 'Dawg')
Post.find_or_create_by(body: "This is Mickey's post", user_id: 1)
Post.find_or_create_by(body: "This is Goofey's post", user_id: 2)
Comment.find_or_create_by(body: " I'm Goofey's comment on Mickey's post", post_id: 1, user_id: 2)
Comment.find_or_create_by(body: " I'm Mickey's comment on Goofey's post", post_id: 2, user_id: 1)
LikerLikedPost.find_or_create_by(liker_id: 1, liked_post_id: 1)
LikerLikedComment.find_or_create_by(liker_id: 2, liked_comment_id: 2)

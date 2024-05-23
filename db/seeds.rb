# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(email: 'mickey@mail.com', password: 'password')
User.create(email: 'goofey@mail.com', password: 'password')
FolloweesFollower.create(followee_id: 1, follower_id: 2)
Profile.create(user_id: 1, first_name: 'Mickey', last_name: 'Mouse')
Post.create(body: "This is Mickey's post", user_id: 1)
Post.create(body: "This is Goofey's post", user_id: 2)
Comment.create(body: " I'm Goofey's comment on Mickey's post", post_id: 1, user_id: 2)
Comment.create(body: " I'm Mickey's comment on Goofey's post", post_id: 2, user_id: 1)
LikerLikedPost.create(liker_id: 1, liked_post_id: 1)
LikerLikedComment.create(liker_id: 2, liked_comment_id: 2)

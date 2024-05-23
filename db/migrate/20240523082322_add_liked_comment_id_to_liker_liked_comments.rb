class AddLikedCommentIdToLikerLikedComments < ActiveRecord::Migration[7.1]
  def change
    add_column :liker_liked_comments, :liked_comment_id, :bigint
  end
end

class RemoveLikedCommentIdFromLikerLikedComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :liker_liked_comments, :liked_comment_id, :string
  end
end

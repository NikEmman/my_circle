class CreateLikerLikedComments < ActiveRecord::Migration[7.1]
  def change
    create_table :liker_liked_comments do |t|
      t.integer :liker_id
      t.string :liked_comment_id

      t.timestamps
    end
  end
end

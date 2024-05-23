class CreateLikerLikedPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :liker_liked_posts do |t|
      t.integer :liker_id
      t.integer :liked_post_id

      t.timestamps
    end
  end
end

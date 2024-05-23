class CreateFolloweesFollowers < ActiveRecord::Migration[7.1]
  def change
    create_table :followees_followers do |t|
      t.integer :followee_id
      t.integer :follower_id

      t.timestamps
    end
  end
end

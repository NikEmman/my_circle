class CreateFollowRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :follow_requests do |t|
      t.bigint :requester_id
      t.bigint :approver_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

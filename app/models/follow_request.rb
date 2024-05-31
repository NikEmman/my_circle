class FollowRequest < ApplicationRecord
  enum status: %i[pending accepted rejected]
  belongs_to :requester, class_name: 'User', foreign_key: 'requester_id'
  belongs_to :approver, class_name: 'User', foreign_key: 'approver_id'
  scope :pending, -> { where(status: 0) }
end

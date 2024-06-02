class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one_attached :avatar

  def full_name
    "#{first_name} #{last_name}"
  end
end

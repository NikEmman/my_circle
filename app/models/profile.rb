class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one_attached :avatar
  before_save :normalize_name

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def normalize_name
    self.first_name = first_name.squish.titleize
    self.last_name = last_name.squish.titleize
  end
end

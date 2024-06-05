FactoryBot.define do
  factory :followees_follower do
    association :followee, factory: :user
    association :follower, factory: :user
  end
end

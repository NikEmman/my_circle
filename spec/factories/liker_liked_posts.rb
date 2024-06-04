FactoryBot.define do
  factory :liker_liked_post do
    association :liker, factory: :user
    association :liked_post, factory: :post
  end
end

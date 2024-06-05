FactoryBot.define do
  factory :liker_liked_comment do
    association :liker, factory: :user
    association :liked_comment, factory: :comment
  end
end

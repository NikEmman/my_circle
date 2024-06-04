FactoryBot.define do
  factory :comment do
    association :user
    association :post
    body { "I'm a comment" }
  end
end

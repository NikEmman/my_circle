FactoryBot.define do
  factory :post do
    association :user, strategy: :build
    body { 'MyString post' }
  end
end

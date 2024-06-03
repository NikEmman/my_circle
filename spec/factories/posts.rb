FactoryBot.define do
  factory :post do
    association :user
    body { 'MyString post' }
    user_id { 1 }
    created_at { '2024-06-02 19:32:39' }
    updated_at { '2024-06-02 19:32:39' }
  end
end

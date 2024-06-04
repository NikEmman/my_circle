FactoryBot.define do
  factory :post, aliases: %i[liked_post] do
    association :user, strategy: :build
    body { 'MyString post' }
    user_id { 1 }
    created_at { '2024-06-02 19:32:39' }
    updated_at { '2024-06-02 19:32:39' }
  end
end

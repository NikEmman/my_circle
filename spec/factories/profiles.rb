FactoryBot.define do
  factory :profile do
    first_name { 'Mickey' }
    last_name { 'Mouse' }
    association :user
  end
end

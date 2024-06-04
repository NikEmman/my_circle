# spec/factories/follow_requests.rb
FactoryBot.define do
  factory :follow_request do
    association :requester, factory: :user
    association :approver, factory: :user
    status { :pending }
  end
end

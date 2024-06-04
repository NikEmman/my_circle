FactoryBot.define do
  factory :user, aliases: %i[follower followee liker requester approver] do
    sequence :email do |n|
      "MyString+#{n}@mail.com"
    end
    encrypted_password { 'MyString' }
    password { 'password' }
  end
end

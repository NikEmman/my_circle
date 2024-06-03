FactoryBot.define do
  factory :user do
    email { 'MyString@mail.com' }
    encrypted_password { 'MyString' }
    password { 'password' }
  end
end

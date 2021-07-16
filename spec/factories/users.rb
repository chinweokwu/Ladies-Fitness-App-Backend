FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email { 'fake@example.com' }
    password { 'password' }
  end
end

FactoryBot.define do
  factory :notepad do
    title { 'notepads' }
    body { 'hello world' }
    user { create(:user) }
  end
end

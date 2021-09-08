FactoryBot.define do
  factory :calory do
    date { '1 june 2010' }
    calories_lost { '0.02' }
    user { create(:user) }
  end
end

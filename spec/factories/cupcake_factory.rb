# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cupcake do
    name Faker::Name.name
    current_score 1
  end
end

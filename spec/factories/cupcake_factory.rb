# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cupcake, class: Cupcake do
    name 'Isabel'
    #Faker::Name.name
    current_score 1
  end
  factory :invalid_cupcake, class: Cupcake do
    name nil
    current_score nil
  end
end

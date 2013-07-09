# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topping, :class => 'Toppings' do
    name "MyString"
    color "MyString"
  end
end

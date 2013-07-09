# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :frosting, :class => 'Frostings' do
    name "MyString"
    color "MyString"
  end
end

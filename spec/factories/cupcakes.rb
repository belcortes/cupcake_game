# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cupcake, :class => 'Cupcakes' do
    name "MyString"
    current_score 1
  end
end

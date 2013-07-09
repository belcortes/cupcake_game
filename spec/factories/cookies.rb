# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cooky, :class => 'Cookies' do
    name "MyString"
    color "MyString"
  end
end

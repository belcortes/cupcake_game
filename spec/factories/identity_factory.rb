# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
    provider "MyString"
    secret "MyString"
    uid "MyString"
    user_id 1
    user_name "MyString"
    expires_at "2013-07-09 11:39:31"
    name "MyString"
    image "MyString"
    url "MyString"
  end
end

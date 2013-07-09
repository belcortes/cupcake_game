# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  provider   :string(255)
#  secret     :string(255)
#  uid        :string(255)
#  user_id    :integer
#  user_name  :string(255)
#  expires_at :datetime
#  name       :string(255)
#  image      :string(255)
#  url        :string(255)
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

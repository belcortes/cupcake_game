# == Schema Information
#
# Table name: ice_creams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ice_cream do
    name "MyString"
    color "MyString"
  end
end

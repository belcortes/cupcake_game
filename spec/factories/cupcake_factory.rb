# == Schema Information
#
# Table name: cupcakes
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  current_score :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cupcake, class: Cupcake do
    name Faker::Name.name
    current_score 1
  end
  factory :invalid_cupcake, class: Cupcake do
    name nil
    current_score nil
  end
end

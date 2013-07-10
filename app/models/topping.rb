# == Schema Information
#
# Table name: toppings
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  cupcake_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topping < ActiveRecord::Base
  attr_accessible :color, :name, :cupcake_id

  validates_presence_of :name, :color

  belongs_to :cupcake
end

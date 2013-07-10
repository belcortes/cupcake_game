# == Schema Information
#
# Table name: ice_creams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  cupcake_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class IceCream < ActiveRecord::Base
  attr_accessible :color, :name, :cupcake_id
end

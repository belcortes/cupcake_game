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

class IceCream < ActiveRecord::Base
  attr_accessible :color, :name
end

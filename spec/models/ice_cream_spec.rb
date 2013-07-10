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

require 'spec_helper'

describe IceCream do
  pending "add some examples to (or delete) #{__FILE__}"
end

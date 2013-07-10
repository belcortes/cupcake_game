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

require 'spec_helper'

describe Topping do
  subject(:topping) {Topping.new(color: 'yellow', name: 'sprinkles')}

   describe 'validation' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:color)}
  end

  describe 'association' do
    it { should belong_to(:cupcake) }
  end
end

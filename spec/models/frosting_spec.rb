# == Schema Information
#
# Table name: frostings
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  cupcake_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Frosting do
  subject(:frosting) {Frosting.new(color: 'pink', name:'fluff')}

  describe 'validation' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:color)}
  end

  describe 'association' do
    it { should belong_to(:cupcake) }
  end
end

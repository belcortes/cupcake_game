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

require 'spec_helper'

describe Cupcake do
  subject(:cupcake) {Cupcake.new(current_score: 5, name:'Salted Caramel')}

  describe 'validation' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:current_score)}
  end

  describe 'association' do
    it {should belong_to(:user)}
    it {should have_many(:toppings)}
    it {should have_many(:frostings)}
    it {should have_many(:ice_creams)}
    it {should have_many(:cookies)}
  end
end

# == Schema Information
#
# Table name: cookies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Cookie do
  subject(:cookie) {Cookie.new(color: 'tan', name: 'sugar')}

  describe 'validation' do
    it 'requires a name' do
      expect(subject).to be_valid
      subject.name = nil
      expect(subject).to be_invalid
    end

    it 'requires a color' do
      expect(subject).to be_valid
      subject.color = nil
      expect(subject).to be_invalid
    end
  end

  describe 'association' do
    it 'has a cupcake method' do
      expect(subject).to respond_to(:cupcake)
    end

    it 'belongs to cupcake' do
      subject.cupcake = nil
      expect(subject.cupcake).to be_nil
      subject.cupcake_id = 1
      subject.should satisfy { |cookie| cookie.cupcake_id?}
    end
  end
end

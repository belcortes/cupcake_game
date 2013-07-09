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
  pending "add some examples to (or delete) #{__FILE__}"
end

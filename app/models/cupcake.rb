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

class Cupcake < ActiveRecord::Base
  attr_accessible :current_score, :name, :user_id
end

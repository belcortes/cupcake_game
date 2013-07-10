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

  validates_presence_of :name
  validates_presence_of :current_score

  has_many :toppings
  has_many :cookies
  has_many :frostings
  has_many :ice_creams

  belongs_to :user

end

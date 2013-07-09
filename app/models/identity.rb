# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  provider   :string(255)
#  secret     :string(255)
#  uid        :string(255)
#  user_id    :integer
#  user_name  :string(255)
#  expires_at :datetime
#  name       :string(255)
#  image      :string(255)
#  url        :string(255)
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Identity < ActiveRecord::Base
  attr_accessible :expires_at, :image, :name, :provider, :secret, :uid, :url, :user_id, :user_name, :token

    belongs_to :user
end

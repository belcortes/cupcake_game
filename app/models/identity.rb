class Identity < ActiveRecord::Base
  attr_accessible :expires_at, :image, :name, :provider, :secret, :uid, :url, :user_id, :user_name, :token

    belongs_to :user
end

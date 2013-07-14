# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  admin                  :boolean
#  total_score            :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :identities, :admin, :total_score
  # attr_accessible :title, :body

  has_many :identities
  has_many :cupcakes

  # validates_presence_of :total_score

  def self.find_for_twitter_oath(auth, user)
    identity = user.identities.where(provider: auth.provider).first
    if identity
      identity.update_attributes(name: auth.extra.raw_info.name,
                                         user_name: auth.extra.raw_info.screen_name,
                                         provider: auth.provider,
                                         uid: auth.uid,
                                         url: auth.info.urls.Twitter,
                                         image: auth.extra.raw_info.profile_image_url_https,
                                         token: auth.extra.access_token.token,
                                         secret: auth.extra.access_token.secret,
                                         user_id: user.id)
    else
      user.identities << Identity.create(
        name: auth.extra.raw_info.name,
                                         user_name: auth.extra.raw_info.screen_name,
                                         provider: auth.provider,
                                         uid: auth.uid,
                                         url: auth.info.urls.Twitter,
                                         image: auth.extra.raw_info.profile_image_url_https,
                                         token: auth.extra.access_token.token,
                                         secret: auth.extra.access_token.secret,
                                         user_id: user.id)
      user.save!
    end
    user
  end
end

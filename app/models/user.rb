class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :identities, :name, :admin, :total_score
  # attr_accessible :title, :body

  has_many :identities

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

class User < ActiveRecord::Base
   has_many :microposts, dependent: :destroy
   
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      emailAddress = auth.extra.raw_info.email
      if emailAddress[(emailAddress.length - 8)..-1] == "@asu.edu" || emailAddress == "hmwrktrdr@gmail.com"
        user.provider = auth.provider
        user.uid = auth.uid
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.email = emailAddress
        user.save! 
      else
        user = nil
        puts("failed to sign in with " + emailAddress)
      end
    end
  end

  
end
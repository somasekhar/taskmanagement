class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id
  belongs_to :user
  validates :provider, :uid, :presence => true

  def self.find_or_create(auth_hash)
    unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      unless user = User.find_by_email(auth_hash["info"]["email"])
        user = User.create(:email => auth_hash["info"]["email"], :password => 'somasekhar')
      end
      auth = user.authorizations.create(:provider => auth_hash["provider"], :uid => auth_hash["uid"])
    end
    auth
  end
end

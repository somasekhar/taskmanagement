class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  after_create :send_welcome_email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :email

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :tasks_attributes
  has_many :authorizations
  has_many :tasks
  # attr_accessible :title, :body

  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    if auth_hash["provider"] == "facebook"
      unless Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
        Authorization.create( :provider => auth_hash["provider"], :uid => auth_hash["uid"])
      end
    else
      unless Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
        Authorization.create( :provider => auth_hash["provider"], :uid => auth_hash["uid"])
      end
    end

  end

  private
  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end

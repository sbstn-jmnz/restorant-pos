class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  devise :omniauthable, omniauth_providers: [:facebook]
  has_many :orders, :dependent => :destroy
  has_many :details, through: :orders
  has_many :dishes, through: :details

  before_create :set_default_role

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)      
    user = User.where(provider: auth.provider, uid: auth.uid).first       
    # The User was found in our database    
    return user if user    
    # Check if the User is already registered without Facebook      
    user = User.where(email: auth.info.email).first 
    return user if user
    User.create(
      name: auth.extra.raw_info.name,
      provider: auth.provider, uid: auth.uid,
      email: auth.info.email,
      password: Devise.friendly_token[0,20],  
      photo: auth.info.image)
   end

  private
  def set_default_role
  	self.role ||= "user"
  end  
  
end

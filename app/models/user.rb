class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :orders
  has_many :details, through: :orders
  has_many :dishes, through: :details

  before_create :set_default_role

  private
  def set_default_role
  	self.role ||= "user"
  end  
  
end

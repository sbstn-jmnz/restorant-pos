class Order < ActiveRecord::Base
  has_many :details, :dependent => :destroy
  has_many :dishes, :through => :details
  belongs_to :user

  attr_accessor :cuenta, :suma
  
end

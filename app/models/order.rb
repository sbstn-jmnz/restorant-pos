class Order < ActiveRecord::Base
  has_many :details
  has_many :dishes, :through => :details
  belongs_to :user
end

class Order < ActiveRecord::Base
  has_many :details
  belongs_to :user
end

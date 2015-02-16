class Order < ActiveRecord::Base
  has_many :details, :dependent => :destroy
  has_many :dishes, :through => :details
  belongs_to :user

  def detalles(order_id)
  	@detail = Detail.find(order_id)
  	return @detail
  end
end

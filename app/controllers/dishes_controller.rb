class DishesController < ApplicationController

  before_action :all_dishes, only: [:index, :create, :update, :destroy]
  before_action :set_dishes, only:[:edit,:update, :destroy, :show]
  respond_to :html, :js
  layout 'bootstrap'

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.create(dish_params)
    respond_to do |format|    
      format.html { redirect_to dishes_url }
      format.js
    end
  end

  def update
   @dish.update_attributes(dish_params)
 end

 def destroy
  @dish.destroy
end

def show
end

private

def all_dishes
  @dishes = Dish.all
end

def set_dishes
  @dish = Dish.find(params[:id])
end

def dish_params
  params.require(:dish).permit(:name, :price, :description)
end

end

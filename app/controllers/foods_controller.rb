class FoodsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  private
  def food_params
    params.require(:food).permit(:name, :ways, :type_of_food_id, :image).merge(user_id: current_user.id)
  end
end

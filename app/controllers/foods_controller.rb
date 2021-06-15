class FoodsController < ApplicationController

  def index
    @foods = Food.all.order("created_at DESC")
  end

  def new
    @foods = Food.new()
  end

  def create
    @foods =Food.new(food_params)
    if @foods.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def food_params
    params.require(:food).permit(:name, :ways, :type_of_food_id, :image).merge(user_id: current_user.id)
  end
end

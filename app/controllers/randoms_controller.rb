class RandomsController < ApplicationController

  def index
    @random = Food.new
  end

  def search
    random = Food.where( type_of_food_id: params[:food][:type_of_food_id])
    @random =random[rand(random.length)]
  end

end

# @random = Food.where( type_of_food_id: params[:food][:type_of_food_id]).Food.find(rand(5))
# .then(Food.find(rand(Food.first.id..Food.last.id)))
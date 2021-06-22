class RandomsController < ApplicationController
    before_action :authenticate_user!

  def index
    @random = Food.new
  end

  def search
    random = Food.where( type_of_food_id: params[:food][:type_of_food_id])
    @random =random[rand(random.length)]
  end

end

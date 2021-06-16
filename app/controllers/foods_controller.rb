class FoodsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]

  def index
    @foods = Food.all.order("created_at DESC")
  end

  def show
    @food = Food.find(params[:id])
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

  def edit
    @foods = Food.find(params[:id])
  end

  def update
    @foods = Food.find(params[:id])
    if @foods.update(food_params)
      redirect_to root_path
    else
      render ;edit
    end
  end

  private
  def food_params
    params.require(:food).permit(:name, :ways, :type_of_food_id, :image).merge(user_id: current_user.id)
  end
end

class FoodsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :show, :create, :edit, :update, :destroy]
  before_action :find_params, only:[:edit, :update]
  before_action :move_to, only:[:edit, :update]

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

  def destroy
    unless current_user.id === params[:user_id]
      redirect_to root_path
    end

    food = Food.find(params[:id])
    if food.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def food_params
    params.require(:food).permit(:name, :ways, :type_of_food_id, :image, :ingredients).merge(user_id: current_user.id)
  end

  def move_to 
    unless current_user.id === @foods.user_id
      redirect_to root_path
    end
  end

  def find_params
    @foods = Food.find(params[:id])
  end

end

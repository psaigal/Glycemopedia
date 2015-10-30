class FoodsController < ApplicationController
  before_filter :authorize

  def index
  end

  def new
  end

  def create
    food_attr = params.require(:food).permit(:name)
    @food = Food.find_by(food_attr)
    @new_entry = UsersFood.create(user_id: current_user.id, food_id: @food.id)
    redirect_to "/users/#{current_user.id}/foods/#{@food.id}"
  end

  def show
    @user = User.find_by(id:params[:user_id])
    @specific_food = Food.find_by(id: params[:id])
    p "*" * 40
    p @specific_food
  end

    private

  def food_params
    params.require(:food).permit(:name, :glycemic_index)
  end
end

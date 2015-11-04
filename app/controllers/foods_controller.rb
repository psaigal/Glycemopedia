class FoodsController < ApplicationController
  before_filter :authorize
  respond_to :html, :js
  autocomplete :food, :name

  def index
    @foods = Food.all
  end

  def new
  end

  def create
    food_attr = params.require(:food).permit(:food_name)
    p food_attr[:food_name]
    @food = Food.find_by(name: food_attr[:food_name])
    @new_entry = UsersFood.create(user_id: current_user.id, food_id: @food.id)
    p "YEE" * 40
    redirect_to "/users/#{current_user.id}/foods/#{@food.id}"
  end

  def show
    @user = User.find_by(id:params[:user_id])
    @specific_food = Food.find_by(id: params[:id])
    p @specific_food
  end

    private

  def food_params
    params.require(:food).permit(:name, :glycemic_index)
  end
end

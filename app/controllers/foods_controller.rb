class FoodsController < ApplicationController
  before_filter :authorize
  respond_to :html, :js
  autocomplete :food, :name, :limit => 20

  def index
    @foods = Food.all
  end

  def new
    @entry = Entry.find_by(id:params[:id])
  end

  def create
    @entry = Entry.find_by(id:params[:entry_id])
    food_attr = params.require(:food).permit(:food_name)
    @food = Food.find_by(name: food_attr[:food_name])
    @new_user_food = UsersFood.create(user_id: current_user.id, food_id: @food.id)
    @entry.foods.push(@food)
    redirect_to "/users/#{current_user.id}/entries/#{@entry.id}"
  end

  def show
    @user = User.find_by(id:params[:user_id])
    @specific_food = Food.find_by(id: params[:id])
  end

  def destroy
    @food_to_delete = Food.find(params[:id])
    @food_to_delete.destroy
    redirect_to "/users/#{current_user.id}/foods"
  end

    private

  def food_params
    params.require(:food).permit(:name, :glycemic_index)
  end
end

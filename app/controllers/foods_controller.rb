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
    if Food.exists?(name: food_attr[:food_name])
      @new_entry_food = EntryFood.create(entry_id: @entry.id, food_id: @food.id)
      redirect_to "/users/#{current_user.id}/entries/#{@entry.id}"
    else
       redirect_to "/users/#{current_user.id}/entries/#{@entry.id}"
    end
  end

  def show
    @entry = Entry.find_by(id:params[:entry_id])
    @user = User.find_by(id:params[:user_id])
    @specific_food = Food.find_by(id: params[:id])
  end

  def destroy
    p params
    p "*********************************"
    @entry = Entry.find_by(id:params[:entry_id])
    @food = Food.find_by(id:params[:id])
    @entry_food_to_delete = EntryFood.find_by(entry_id:@entry.id, food_id:@food.id)
    @entry_food_to_delete.destroy
    redirect_to "/users/#{current_user.id}/entries/#{@entry.id}"
  end

    private

  def food_params
    params.require(:food).permit(:name, :glycemic_index)
  end
end

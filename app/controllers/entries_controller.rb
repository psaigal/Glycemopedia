class EntriesController < ApplicationController
  def index
    @all_entries = Entry.all
  end

  def create
    @user = User.find_by(id:params[:user_id])
    if @user.entries.exists?(created_on: Time.now.utc.strftime("%Y/%m/%d"))
      @existing_entry = @user.entries.find_by created_on: Time.now.utc.strftime("%Y/%m/%d")
      redirect_to action: :show, :id => @existing_entry.id
    else
      @entry = Entry.create
      @user.entries.push(@entry)
      redirect_to action: :show, :id => @entry.id
    end
  end

  def show
    @entry = Entry.find_by(id:params[:id])
    @foods = Food.all
  end

  def destroy
    @entry_to_delete = Entry.find_by(id:params[:id])
    @entry_to_delete.destroy
    redirect_to "/users/#{current_user.id}"
  end

  def graphs
    @entry = Entry.find_by(id:params[:entry_id])
  end
end

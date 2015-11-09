class UsersController < ApplicationController

  def new
  end

  def edit
  end

 def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      redirect_to '/signup'
    end
  end

  def update
    p "*" * 90
    p "HITTING UPDATE!!!!!"
    @user = User.find(params[:id])
    p @user
    if @user.update(user_params)
      redirect_to "/users/#{@user.id}"
    else
      render 'edit'
    end
  end

  def show
  end


  def destroy
    session[:user_id] = nil
    @user_to_delete = User.find(params[:id])
    @user_to_delete.destroy
    redirect_to '/'
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

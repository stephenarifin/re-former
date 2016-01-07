class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #@user = User.new(username: params[:username], password: params[:password], email: params[:email])
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end

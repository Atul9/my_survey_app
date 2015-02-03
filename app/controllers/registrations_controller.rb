class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def index

  end

  def create
    @user = User.new(user_params)
    puts @user.inspect
    if @user.save
      flash[:notice] = 'Successful registration'
      render 'index'
    else
      puts @user.errors.messages
      flash[:notice] = @user.errors.full_messages
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.build(user_params)
    if @user.save
      redirect_to login
    else
      flash[:notice] = 'Signup unsuccessful'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(params[:email])
    puts params
    puts @user.email
    if @user && @user.authenticate(params[:user][:password])
      flash[:notice] = "Welcome #{@user.name}"
      session[:user_id] = @user.id
      redirect_to surveys_path
    else
      flash[:notice] = 'Login unsuccessful'
      @user = User.new
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:email,:password)
  end
end

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(params[:email])
    if @user && @user.authenticate(params[:user][:password])
      flash[:notice] = "Welcome #{@user.name}"
        log_in @user
      redirect_to surveys_path
    else
      flash[:notice] = 'Login unsuccessful'
      @user = User.new
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
  private
  def user_params
    params.require(:user).permit(:email,:password)
  end
end

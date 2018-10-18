class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.authenticate(credentials)
    if user
      session[:user] = user.session_attributes
      redirect_to(user_path(user))
    else
      flash[:invalid_login] = "Email or password is incorrect."
    end
  end

  private
  def credentials
    params.require(:user).permit(:email_address, :password)
  end
end

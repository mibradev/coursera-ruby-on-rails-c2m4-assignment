class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  def new
  end

  def create
    if params[:user]
      username = params[:user][:username]
      password = params[:user][:password]

      user = User.find_by_username(username)

      if user&.authenticate(password)
        session[:user_id] = user.id
        redirect_to root_path, notice: "Logged in successfully"
      else
        redirect_to login_path, alert: "Invalid username or password"
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "Logged out successfully"
  end
end

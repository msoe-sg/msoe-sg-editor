class SessionsController < ApplicationController
  # GET /auth/google_oauth2/callback
  def create
    user_info = request.env["omniauth.auth"]

    user = User.new
    user.id = user_info["uid"]
    user.name = user_info["info"]["name"]

    session[:user] = Marshal.dump user

    redirect_to root_path
  end
end

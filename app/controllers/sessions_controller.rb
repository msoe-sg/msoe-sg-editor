##
# This controller deals creating user sessions for the application
# This application does not extend BaseSgEditorController since we don't want
# to require a user to be authenticated in order to create a session
class SessionsController < ApplicationController
  # GET /auth/google_oauth2/callback
  def create
    user_info = request.env['omniauth.auth']

    user = User.new
    user.id = user_info['uid']
    user.name = user_info['info']['name']

    session[:user] = Marshal.dump user

    redirect_to '/'
  end
end

##
# The base class for all contrllers in the SG editor which makes sure a user is authenticated
# before an action in the editor can be accessed
class BaseSgEditorController < ApplicationController
  before_action :check_user
  
  def current_user
    Marshal.load session[:user] if authenticated?
  end

  private
    def check_user
      if !authenticated?
        authenticate!
      else
        editor_result = Editors.find_by_email(current_user.email)
        redirect_to '/GooglePermissionsError.html' if editor_result.length == 0
      end
    end 

    def authenticated?
      session.has_key? :user
    end

    def authenticate!
      redirect_to '/auth/google_oauth2'
    end
end

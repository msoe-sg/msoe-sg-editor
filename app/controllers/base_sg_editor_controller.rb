class BaseSgEditorController < ApplicationController
  before_action :check_user

  private
    def check_user
      authenticate! if !authenticated?
    end

    def authenticated?
      session.has_key? :user
    end

    def authenticate!
      redirect_to '/auth/google_oauth2'
    end
end

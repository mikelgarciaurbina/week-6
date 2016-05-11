class ApplicationController < ActionController::Base
  before_action :user_is_logged?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  unless Rails.env.development?
  	protect_from_forgery with: :exception
  end
  include SessionsHelper

  private
    def user_is_logged?
      unless logged_in?
        respond_to do |format|
          format.html { redirect_to login_path, notice: 'You are not logged.' }
        end
      end
    end
end

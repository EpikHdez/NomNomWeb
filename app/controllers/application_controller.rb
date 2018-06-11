class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user

  protected

  def authenticate_user
    @current_user = session[:user]

    if !@current_user || @current_user['user_type_id'] != 1
      return redirect_to '/'
    end
  end
end
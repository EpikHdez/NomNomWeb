class WelcomeController < ApplicationController
  skip_before_action :authenticate_user

  def index
  end

  def signin
    user = User.find_for_database_authentication(email: params[:email])

    if user and user.valid_password?(params[:password])
      if(user.user_type.id == 1)
        session[:user] = user
        return redirect_to '/dashboard_users'
      else
        @error = 'Usted no cuenta con los permisos para continuar.'
      end
    else
      @error = 'El correo y/o la contraseña son incorrectos.'
    end

    render :index
  end

  def signout
    session[:user] = nil
    redirect_to '/'
  end
end

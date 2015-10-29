class SessionsController < ApplicationController
  def new
  end

  def create
    if env["omniauth.auth"] != nil
      @user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif
      @user = User.find_by_email(params[:user]) || User.find_by_phone(params[:user]) || User.find_by_userName(params[:user])
      if @user && @user.authenticate(params[:password])
        #le asigno a el id del usuario a la sesion actual
        session[:user_id] = @user.id
        #segun el tipo de usuario lo redirecciono a la pagina
        if @user.userType == "Usuario"
          redirect_to user_path(@user)
        else
          redirect_to admin_index_path
        end
      else
        redirect_to login_path
      end
    else
      redirect_to login_path
    end
  end

 ##Realiza el log out del sistema
  def destroy
  	session[:user_id] = nil
    redirect_to root_url
  end
end

class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to locations_path, notice: 'good job'
    else
      flash[:alert] = 'denied'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to locations_path, notice: 'you\'re signed out'
  end

end

class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
  end

  def welcome
  end

  def create
    @user = User.find_by(email: params[:email].downcase)

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id.to_s
      redirect_to root_path, notice: I18n.t('response.welcome', name: @user.name, surname: @user.surname)
    else
      flash[:error] = I18n.t('flash.login.error')
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: I18n.t('flash.logout.success')
  end
end

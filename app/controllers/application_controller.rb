class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :authenticate_user!
  helper_method :current_user, :user_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to login_path, alert: I18n.t('flash.login.required') if current_user.nil?
  end

end

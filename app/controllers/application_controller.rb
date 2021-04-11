class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :authenticate_user!
  helper_method :current_user, :counter_to_seconds, :seconds_to_counter

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to login_path, alert: I18n.t('flash.login.required') if current_user.nil?
  end

  def counter_to_seconds(time_string)
    splitted = time_string.split(':').reverse
    seconds  = 0
    seconds  += splitted.first&.to_s.to_i
    seconds  += splitted.second&.to_s.to_i * 60       # minutes to seconds
    seconds  += splitted.third&.to_s.to_i * 60 * 60   # hours to seconds
    seconds
  end

  def seconds_to_counter(seconds)
    # Time.at(seconds).utc.strftime('%H:%M:%S')
    #
    # more than 24 hours format
    "%02d:%02d:%02d" % [seconds/3600, seconds/60%60, seconds%60]
  end

end

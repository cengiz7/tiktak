class TimeLogsController < ApplicationController

  def index
    @time_log = current_user.time_logs.where(finished_at: nil).last || current_user.time_logs.new
    unless @time_log.started_at.nil?
      time_diff = (@time_log.started_at - Time.zone.now).to_i.abs
      params[:counter] = seconds_to_counter_time(time_diff)   # convert seconds to hours and minutes
    end
  end

  def create
    time_log   = current_user.time_logs.new(timelog_params)
    seconds    = counter_time_to_seconds(params[:counter].to_s)
    start_from = Time.zone.now.ago(seconds)
    time_log.started_at = start_from
    @check = time_log.save
  end

  def update

  end

  def destroy
  end

  private
  def timelog_params
    params.require(:time_log).permit(:comment)
  end
end
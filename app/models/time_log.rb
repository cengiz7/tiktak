class TimeLog < ApplicationRecord
  include LocalDateTimeAttrReaders
  time_zone_attr_reader :user_time_zone
  local_date_attr_reader :started_at, :finished_at

  belongs_to :user
  has_one :project
  has_many :tags

  scope :in_progress, -> { where(finished_at: nil) }
  scope :completed, -> { where.not(finished_at: nil) }

  private
  def user_time_zone
    self.user.time_zone
  end
end
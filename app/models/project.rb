class Project < ApplicationRecord
  has_many :project_users
  has_many :users, through: :project_users
  has_many :time_logs
  has_one :client

  before_create :set_project_slug

  private
  def set_project_slug
    self.slug = SecureRandom.hex(10)
  end
end
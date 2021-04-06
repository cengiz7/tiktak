class User < ApplicationRecord
  require 'bcrypt'

  strip_attributes only: [:name, :surname, :email], allow_empty: true, collapse_spaces: true

  has_secure_password
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :time_logs
  has_many :clients
  has_many :tags


  scope :admins, -> { where(admin: true) }

  validates :name, :surname, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :password, length: { minimum: 8 }, confirmation: { case_sensitive: true }, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :update
  validates :time_zone, presence: true, time_zone: true

  before_create :humanize_full_name

  def full_name
    "#{self.name} #{self.surname}"
  end

  def humanize_full_name
    self.name = self.name&.titlecase
    self.surname = self.surname&.titlecase
  end
end
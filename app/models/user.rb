class User < ApplicationRecord
  require 'bcrypt'

  has_secure_password
  has_and_belongs_to_many :projects

  strip_attributes only: [:name, :surname, :email], allow_empty: true, collapse_spaces: true

  scope :admins, -> { where(admin: true) }

  validates :name, :surname, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :password, length: { minimum: 8 }, confirmation: { case_sensitive: true }, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :update

  before_create :humanize_full_name

  def full_name
    "#{self.name} #{self.surname}"
  end

  def humanize_full_name
    self.name = self.name&.titlecase
    self.surname = self.surname&.titlecase
  end
end
class TimeLog < ApplicationRecord
  belongs_to :user
  has_one :project
  has_many :tags
end
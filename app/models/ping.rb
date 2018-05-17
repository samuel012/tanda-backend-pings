class Ping < ApplicationRecord
  belongs_to :device

  # validates :device_id, presence: true
  validates :datetimestamp, presence: true
end

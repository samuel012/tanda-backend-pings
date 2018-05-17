class Device < ApplicationRecord
  has_many :pings, dependent: :destroy
  accepts_nested_attributes_for :pings

  validates :identifier, presence: true
end

class Device < ApplicationRecord
  include DeviceHelper

  has_many :pings, dependent: :destroy
  accepts_nested_attributes_for :pings

  validates :identifier, presence: true

  def self.create_device_and_pings(params)
    device = find_or_initialize_by(identifier: params[:device_id])
    device.pings_attributes = [
      { datetimestamp: Time.at(params[:epoch_time].to_i).utc }
    ]
    device.save
    device
  end

  def self.get_pings_by_date(params)

    dt = params[:date].to_datetime.utc
    if params[:device_id] == "all"
      h = Hash.new
      devices = includes(:pings).where(pings: { datetimestamp: dt.beginning_of_day..dt.end_of_day })
      devices.each do |device|
        h[device.identifier] = device.pings.pluck(:datetimestamp).map(&:to_i)
      end
      h
    else
      # find_by_identifier(params[:device_id]).pings.where(datetimestamp: dt.beginning_of_day..dt.end_of_day).pluck(:datetimestamp).map(&:to_i)
      # includes(:pings).where.not(pings: { id: nil }).where(identifier: params[:device_id]).where(datetimestamp: dt.beginning_of_day..dt.end_of_day)
      includes(:pings).where.not(pings: { id: nil }).where(identifier: params[:device_id]).where(pings: { datetimestamp: dt.beginning_of_day..dt.end_of_day }).pluck(:datetimestamp).map(&:to_datetime).map(&:to_i)
    end
  end

  def self.get_pings_by_date_range(params)

    fr = self.is_iso_formatted_date?(params[:from])
    if (fr)
      fr = fr.to_datetime.utc
    elsif self.is_integer?(params[:from])
      fr = Time.at(params[:from].to_i).utc
    else 
      # raise error
    end

    to = self.is_iso_formatted_date?(params[:to])
    if (to)
      to = to.to_datetime.utc
    elsif self.is_integer?(params[:to])
      to = Time.at(params[:to].to_i).utc
    else
      # raise error
    end

    if params[:device_id] == "all"
      h = Hash.new
      devices = includes(:pings).where(pings: { datetimestamp: fr...to })
      devices.each do |device|
        h[device.identifier] = device.pings.pluck(:datetimestamp).map(&:to_i)
      end
      h
    else
      # find_by_identifier(params[:device_id]).pings.where(datetimestamp: fr...to).pluck(:datetimestamp).map(&:to_i)
      includes(:pings).where.not(pings: { id: nil }).where(identifier: params[:device_id]).where(pings: { datetimestamp: fr...to }).pluck(:datetimestamp).map(&:to_datetime).map(&:to_i)
    end
  end
end

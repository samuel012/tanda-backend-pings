class PingsController < ApplicationController

  # POST /:device_id/:epoch_time
  def create
    
    # TODO
    # if epoch_time not integer, raise ActiveRecord::RecordInvalid
    # if epoch_time > current year, raise ActiveRecord::RecordInvalid
    # raise 400 if
    #   invalid :device_id format
    #   invalid :epoch_time

    # device_input_params = {
    #   identifier: params[:device_id],
    #   pings_attributes: [
    #     { datetimestamp: Time.at(params[:epoch_time].to_i).utc }
    #   ]
    # }

    # @device = Device.create!(device_input_params)

    @device = Device.create_device_and_pings(params)

    json_response(@device, :created)

  end

  # GET /:device_id/:date
  # GET /all/:date
  def list_by_date

    # TODO
    # raise 400 if 
    #   invalid :device_id format
    #   invalid :date format
    #   invalid :from format
    #   invalid :to format
    #   date > current year

    @device = Device.get_pings_by_date(params)

    json_response(@device, :ok)

  end

  # GET /:device_id/:from/:to
  # GET /all/:from/:to
  def list_by_date_range

    # TODO
    # raise 400 if 
    #   invalid :device_id format
    #   invalid :date format
    #   invalid :from format
    #   invalid :to format
    #   from > to
    #   from > current year
    #   to > current year

    @device = Device.get_pings_by_date_range(params)

    json_response(@device, :ok)

  end

end

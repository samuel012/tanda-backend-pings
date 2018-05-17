class PingsController < ApplicationController

  # POST /:device_id/:epoch_time
  def create
    
    # TODO
    # if epoch_time not integer, raise ActiveRecord::RecordInvalid
    # if epoch_time > current year, raise ActiveRecord::RecordInvalid

    device_input_params = {
      identifier: params[:device_id],
      pings_attributes: [
        { datetimestamp: Time.at(params[:epoch_time].to_i).utc }
      ]
    }

    @device = Device.create!(device_input_params)

    json_response(@device, :created)
  end

  # GET /:device_id/:date
  # GET /:device_id/:from/:to
  def list_by_device
    
  end

  # GET /all/:date
  # GET /all/:from/:to
  def list
    
  end

end

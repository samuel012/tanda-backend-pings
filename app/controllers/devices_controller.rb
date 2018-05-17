class DevicesController < ApplicationController

  # GET /devices
  def list
    @devices = Device.pluck(:identifier)

    json_response(@devices, :ok)
  end

  # POST /clear_data
  def destroy
    Device.destroy_all

    json_response(nil, :ok)
  end
  
end

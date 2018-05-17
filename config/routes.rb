Rails.application.routes.draw do
  post "/:device_id/:epoch_time", to: "pings#create"
  get  "/:device_id/:date", to: "pings#list_by_device"
  get  "/:device_id/:from/:to", to: "pings#list_by_device"
  get  "/all/:date", to: "pings#list"
  get  "/all/:from/:to", to: "pings#list"
  get  "/devices", to: "devices#list"
  post "/clear_data", to: "devices#destroy"
end

module DeviceHelper
  extend ActiveSupport::Concern

  module ClassMethods

    # def is_iso_formatted_date?(dateString, format="%Y-%m-%d")
    #   begin
    #     Date.strptime(dateString, format) 
    #   rescue
    #     false
    #   end
    # end

    def is_iso_formatted_date?(dateString)
      begin
        Date.iso8601(dateString)
      rescue
        false
      end
    end

    def is_integer?(val)
      /\A[-+]?\d+\z/.match(val)
    end

  end
end
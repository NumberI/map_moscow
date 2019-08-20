class MapController < ApplicationController
  

  def map_json
    @buildings = Address.all
    @data = {}

    @data["data"] = []

    @buildings.each do |building|
      @data["data"] << {
        "id": rand(500),
        "dealer_data":{
          "dealer_logo": "",
          "dealer_email": "",
        },
        "other":{
          "coordinates": [building.latitude, building.longitude]
        }
      }
    end
    @data = ActiveSupport::JSON.encode(@data)
    render json: @data
  end

end

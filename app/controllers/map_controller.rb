class MapController < ApplicationController
  

  def map_json
    @buildings = Address.all
    @data = {}

    @data["data"] = []

    @buildings.each do |building|
      @data["data"] << {
        "title": building.city + "," + building.street + "," + building.dom.to_s,
        "city": building.city,
        "street": building.street,
        "dom": building.dom,
        "other":{
          "coordinates": [building.latitude, building.longitude]
        }
      }
    end
    @data = ActiveSupport::JSON.encode(@data)
    render json: @data
  end

end

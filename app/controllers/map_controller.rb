class MapController < ApplicationController
  

  def map_json
    @buildings = Address.all
    @data = {}

    @data["data"] = []

    @buildings.each do |building|
      if building.street.nil?
        title = building.city + ", ," + building.dom.to_s
      else
        title = building.city + "," + building.street + "," + building.dom.to_s
      end
      @data["data"] << {
        "title": title,
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

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neo
      @neo = {}
      @neo[:distance] = params[:distance].to_i
      @neo[:store_size] = params[:storeSize]
      @neo[:center_lat] = params[:center_lat].to_f
      @neo[:center_long] = params[:center_long].to_f
      @neo[:lat_end] = params[:lat_end].to_f
      @neo[:lat_start] = params[:lat_start].to_f
      @neo[:lng_end] = params[:lng_end].to_f
      @neo[:lng_start] = params[:lng_start].to_f
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def product_params
    #   params.require(:product).permit(:name, :background_image, :background_description, :description, :feeding_instruction)
    # end
  
  
end

class MapController < ApplicationController
  

  def map_json
  	# @stores = Store.where(enabled: true, lat:  @neo[:lat_start]..@neo[:lat_end], lng: @neo[:lng_start]..@neo[:lng_end])
   #  @stores = @stores.where(store_size: @neo[:store_size].humanize) if !@neo[:store_size].nil? && !@neo[:store_size].empty? 
    @buildings = [{:lat => 55.747761,:lon => 37.622561},{:lat => 55.746716,:lon => 37.629395},{:lat => 55.848238,:lon => 37.582881}]
    # @stores.map{|s| s.distance = s.distance_from([@neo[:center_lat], @neo[:center_long]])}
    
    # if !@stores.empty?
    #   @stores = @stores.flatten.delete_if {|s| s.distance > @neo[:distance]} if !@neo[:distance].nil? && @neo[:distance] != ""
    # end
    @data = {}
    # render text: @stores.inspect
    @data["data"] = []
    # @data["data"] << {"link": t('routes.contact')}
    @buildings.each do |building|
      @data["data"] << {
        "id": rand(500),
        "dealer_data":{
          "dealer_logo": "",
          "dealer_email": "",
        },
        "other":{
          "coordinates": [building[:lon], building[:lat]]
          # "distance_from_center": store.distance.round(3)
        }
      }
    end
    @data = ActiveSupport::JSON.encode(@data)
    # if -107 > @neo
    #   @data = ActiveSupport::JSON.encode("data":[{"id":"9902","dealer_data":{},"other":{"Fcilty_typ":"Retailer","State":"CO","Fcilty_nam":"PJ's Gourmet Market","Shp_num_an":"","Shp_centre":"","Street_add":"67 Trimble Lane","Locality":"Durango","Postcode":"81301","Phone":"970-247-0100","Hrs_of_bus":"","Display_wd":"1.5","Fcilty_typ_2":"","Xcoord":"-107.8478008","Ycoord":"37.3899630","uuid":"57baeb1e275ac","result":1,"dogTreats":"1","catTreats":"1","distance_from_center":"5.42"}}])
    # end

    render json: @data
    # render json: '{"type":"FeatureCollection","features":[{"type":"Feature","properties":{"mag":5.4,"place":"48km SSE of Pondaguitan, Philippines","time":1348176066,"tz":480,"url":"http://earthquake.usgs.gov/earthquakes/eventpage/usc000csx3","felt":2,"cdi":3.4,"mmi":null,"alert":null,"status":"REVIEWED","tsunami":null,"sig":"449","net":"us","code":"c000csx3","ids":",usc000csx3,","sources":",us,","types":",dyfi,eq-location-map,general-link,geoserve,historical-moment-tensor-map,historical-seismicity-map,nearby-cities,origin,p-wave-travel-times,phase-data,scitech-link,tectonic-summary,"},"geometry":{"type":"Point","coordinates":[126.3832,5.9775,111.16]},"id":"usc000csx3"},{"type":"Feature","properties":{"mag":5.7,"place":"35km ESE of Ndoi Island, Fiji","time":1348175020,"tz":-720,"url":"http://earthquake.usgs.gov/earthquakes/eventpage/usc000csw5","felt":0,"cdi":1,"mmi":2,"alert":"green","status":"REVIEWED","tsunami":null,"sig":"500","net":"us","code":"c000csw5","ids":",usc000csw5,","sources":",us,","types":",dyfi,eq-location-map,geoserve,historical-moment-tensor-map,historical-seismicity-map,losspager,nearby-cities,origin,p-wave-travel-times,phase-data,scitech-link,shakemap,tectonic-summary,"},"geometry":{"type":"Point","coordinates":[-178.3725,-20.753,544.19]},"id":"usc000csw5"},{"type":"Feature","properties":{"mag":3.8,"place":"43km NNE of Talkeetna, Alaska","time":1348174056,"tz":-480,"url":"http://earthquake.usgs.gov/earthquakes/eventpage/ak10562838","felt":0,"cdi":1,"mmi":null,"alert":null,"status":"REVIEWED","tsunami":"1","sig":"222","net":"ak","code":"10562838","ids":",ak10562838,at00mao1rc,","sources":",ak,at,","types":",dyfi,general-link,geoserve,impact-link,nearby-cities,origin,tectonic-summary,"},"geometry":{"type":"Point","coordinates":[-149.8072,62.6916,10.1]},"id":"ak10562838"},{"type":"Feature","properties":{"mag":2.6,"place":"150km S of False Pass, Alaska","time":1347575985,"tz":-660,"url":"http://earthquake.usgs.gov/earthquakes/eventpage/ak10559055","felt":null,"cdi":null,"mmi":null,"alert":null,"status":"REVIEWED","tsunami":null,"sig":"104","net":"ak","code":"10559055","ids":",ak10559055,","sources":",ak,","types":",general-link,geoserve,nearby-cities,origin,tectonic-summary,"},"geometry":{"type":"Point","coordinates":[-163.4408,53.5,64.8]},"id":"ak10559055"}]}'
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

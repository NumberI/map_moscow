class HomeController < ApplicationController
  def map_center
  	center = params[:data_value]
	@@cen = []
  	@@cen << center.split(',')[0].split(':')[1].to_f << center.split(',')[1].split(':')[1].gsub('}','').to_f
	@town = Address.near([@@cen[0],@@cen[1]], 4, units: :km)
	render partial: "partials/table", collection: @town, as: :item
	# redirect_to action: "show"
  end

  def show
  	@town = Address.near([@@cen[0],@@cen[1]], 4, units: :km)
	render json: @town
  end

  def index
	
  	# defined?(@@center) ? @coords = @@center : @coords = nil 
  end
end
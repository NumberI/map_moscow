class MapCenterController < ApplicationController
  def map_center
  	@center = params[:data_value]
  	
  end

  def show
  	render json: @center.inspect
  end
end

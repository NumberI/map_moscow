class HomeController < ApplicationController
  def map_center
  	@@center = params[:data_value]
  end

  def show
  	# render json: @@center
  end

  def index
  	@buildings = [{:lat => 55.747761,:lon => 37.622561},{:lat => 55.746716,:lon => 37.629395},{:lat => 55.848238,:lon => 37.582881}]

  	defined?(@@center) ? @coords = @@center : @coords = nil 
  end
end


"55.747127, 37.626005"
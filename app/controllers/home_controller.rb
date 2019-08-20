class HomeController < ApplicationController
before_action :verify_request_type

  def map_center
  	case request.method_symbol
			when :post
				@@center = params[:data_value]
			when :get
				
				@cen = []
			  @cen << @@center.split(',')[0].split(':')[1].to_f << @@center.split(',')[1].split(':')[1].gsub('}','').to_f
				@town = Address.near([@cen[0],@cen[1]], 4, units: :km).order(:distance)
				@town = ActiveSupport::JSON.encode(@town)
				respond_to do |format|
					format.json { render json: @center }
				end

		end	

  end

  def index
	
  end
  
  private
  
  def verify_request_type
	  unless allowed_methods.include?(request.method_symbol)
		head :method_not_allowed # 405
	  end
	end

	def allowed_methods
	  %i(get post)
	end

end
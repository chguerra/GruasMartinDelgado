class DriversController < ApplicationController
	def create
		@driver = Driver.new(driver_params)
		if(@driver.save)
			redirect_to(drivers_path)
		else
			render('new')
		end
	end

	def new
		@driver = Driver.new
	end

	def show
		@driver = Driver.find(params[:id])
	end

	def index
		@drivers = Driver.all
	end

	private

	def driver_params
		params.require(:driver).permit(:name, :phone, :email, :address)
	end
end

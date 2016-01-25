class TrucksController < ApplicationController
	def new
		@truck = Truck.new
	end

	def create
		@truck = Truck.new(truck_params)
		if(@truck.save)
			redirect_to(truck_path(@truck))
		else
			render('new')
		end
	end

	def show
		@truck = Truck.find(params[:id])
		@deliveries = Delivery.where('truck = ? AND delivery_status = ?', params[:id], "CARGADO")
		@places = Place.all
		@vehicles = Vehicle.all
	end

	def destroy
		@truck = Truck.find(params[:id])
		@truck.destroy
	end

	def index
		@trucks = Truck.all
	end

	private

	def truck_params
		params.require(:truck).permit(:marca, :modelo, :matricula)	
	end
end

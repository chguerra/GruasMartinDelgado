require 'pry'
class DeliveriesController < ApplicationController
	def new
		@client = Client.find(params[:client_id])
	end

	def show
		@client = Client.find(params[:client_id])
		@delivery = Delivery.find(params[:id])
		@vehicle = Vehicle.find(@delivery.vehicle)
		@origin = Place.find(@delivery.origin)
		@destiny = Place.find(@delivery.destination)
		@truck = Truck.all
		@driver = Driver.all
	end

	def index
		@deliveries = Delivery.all.limit(15)
		@vehicles = Vehicle.all
		@places = Place.all
	end

	def create
		@client = Client.find(params[:client_id])
		@delivery = @client.deliveries.new(observations: params[:observaciones])
		
		if @delivery.save
			@origin = @delivery.places.create(name: params[:origenEmpresa], address: params[:origenDireccion], address_details: params[:origenDetalles], postal_code: params[:origenCP], city: params[:origenCiudad], phone: params[:origenTelefono], contact_person: params[:origenContacto])
			@destiny = @delivery.places.create(name: params[:destinoEmpresa], address: params[:destinoDireccion], address_details: params[:destinoDetalles], postal_code: params[:destinoCP], city: params[:destinoCiudad], phone: params[:destinoTelefono], contact_person: params[:destinoContacto])
			@vehicle = @delivery.vehicles.create(bastidor_matricula: params[:basmat], model: params[:modelo], brand: params[:marca], observations: params[:observaciones])
			@delivery.update(origin: @origin.id, destination: @destiny.id, vehicle: @vehicle.id)
			NewJob.send_new_job_info(@client, @delivery, @vehicle, @origin, @destiny).deliver
			redirect_to(client_delivery_path(@client, @delivery))
		else
			render 'new'
		end

	end

	def edit
		@client = Client.find(params[:client_id])
		@delivery = Delivery.find(params[:id])
	end

	def update
		@delivery = Delivery.find(params[:id])
		@delivery.update(delivery_params)
		if delivery_params[:delivery_status] == 'ENTREGADO'
			@delivery.update(delivery_date: Date.today)
		end
		redirect_to(client_delivery_path(params[:client_id], params[:id]))
	end

	def pendientes
		@deliveries = Delivery.where(delivery_status: "PENDIENTE")
		@vehicles = Vehicle.all
		@places = Place.all
	end

	def pending
		@delivery = Delivery.find(params[:id])
		@delivery.update(price: params[:precio], driver_price: params[:precioConductor], truck: params[:camion], driver: params[:conductor], delivery_status: params[:estado])
		redirect_to(client_delivery_path(@delivery.client.id, @delivery))
	end	

	def ver_cargas
		@trucks = Truck.all
		@deliveries = Delivery.where(delivery_status: 'CARGADO')
		@places = Place.all
		@vehicles = Vehicle.all
	end

	private

	def delivery_params
		params.require(:delivery).permit(:price, :driver_price, :truck, :driver, :delivery_status)
	end
end

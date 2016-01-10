class SiteController < ApplicationController
	def home
		@deliveries = Delivery.where(delivery_status: "PENDIENTE")
		@clients = Client.all
		@trucks = Truck.all
		@drivers = Driver.all
	end

	def customreport
		@deliveriesfinal = []
		deliveries = Delivery.where(['DATE(created_at) >= ? AND DATE(created_at) <=?', Time.parse(params[:date_from]), Time.parse(params[:date_to])] )
		
		if params[:delivery_state] != "TODOS"
			deliveriesif = deliveries.where(['delivery_status = ?', params[:delivery_state]])
		else
			deliveriesif = deliveries
		end

		if params[:client] != "TODOS"
			deliveriesclient = deliveriesif.where(['client_id = ?', params[:client]])
		else
			deliveriesclient = deliveriesif
		end

		if params[:camion] != "TODOS"
			deliveriestruck = deliveriesclient.where(['truck = ?', params[:camion]])
		else
			deliveriestruck = deliveriesclient
		end

		if params[:conductor] != "TODOS"
			@deliveriesfinal = deliveriestruck.where(['driver = ?', params[:conductor]])
		else
			@deliveriesfinal = deliveriestruck
		end
		
		@vehicles = Vehicle.all
		@places = Place.all
	end
end

require 'pry'

class SiteController < ApplicationController
	def home
		@deliveries = Delivery.where(delivery_status: "PENDIENTE")
		@clients = Client.all
		@trucks = Truck.all
		@drivers = Driver.all
		@vehicles = Vehicle.all
		@places = Place.all
		@clientdeliveries = Delivery.all

	end

	def clientuser
		@clients = Client.all
		@users = User.all
	end

	def patsea
		@filtered_vehiles = Vehicle.where("bastidor_matricula like ?", "%#{params[:basmat]}%" )
		@deliveries = []
		@filtered_vehiles.each do |t|
			if Delivery.find(t.delivery_id)
				@deliveries.push(Delivery.find(t.delivery_id))
			end
		end
		@vehicles = Vehicle.all
		@places = Place.all
	end

	def customreport

		@deliveriesfinal = []
		@cabecera = ['Filtros aplicados: ', 'Fecha desde: ', params[:date_from] , ' hasta ' , params[:date_to]]
		deliveries = Delivery.where(['DATE(created_at) >= ? AND DATE(created_at) <=?', Time.parse(params[:date_from]), Time.parse(params[:date_to])] )
		
		if params[:delivery_state] != "TODOS"
			deliveriesif = deliveries.where(['delivery_status = ?', params[:delivery_state]])
			@cabecera.push(' - Estado: ')
			@cabecera.push(params[:delivery_state])
		else
			deliveriesif = deliveries
			@cabecera.push(' - Estado: Todos')
		end

		if params[:client] != "TODOS"
			deliveriesclient = deliveriesif.where(['client_id = ?', params[:client]])
			@cabecera.push(' - Cliente: ')
			@cabecera.push(Client.find(params[:client]).name)
		else
			deliveriesclient = deliveriesif
			@cabecera.push(' - Cliente: TODOS')
		end

		if params[:camion] != "TODOS"
			deliveriestruck = deliveriesclient.where(['truck = ?', params[:camion]])
			@cabecera.push(' - Camion: ')
			@cabecera.push(Truck.find(params[:camion]).matricula)
		else
			deliveriestruck = deliveriesclient
			@cabecera.push(' - Camion: TODOS')
		end

		if params[:conductor] != "TODOS"
			deliveriesdriver = deliveriestruck.where(['driver = ?', params[:conductor]])
			@cabecera.push(' - Conductor: ')
			@cabecera.push(Driver.find(params[:conductor]).name)
		else
			deliveriesdriver = deliveriestruck
			@cabecera.push(' - Conductor: TODOS')
		end
		
		if params[:pagoestado] != "TODOS"
			deliveriespagoestado = deliveriesdriver.where(['payment_status = ?', params[:pagoestado]])
			@cabecera.push(' - Estado del pago: ')
			@cabecera.push(params[:pagoestado])
		else
			deliveriespagoestado = deliveriesdriver
			@cabecera.push(' - Estado del pago: TODOS')
		end

		if params[:pago] != "TODOS"
			@deliveriesfinal = deliveriespagoestado.where(['driver = ?', params[:pago]])
			@cabecera.push(' - Tipo de pago: ')
			@cabecera.push(params[:pago])
		else
			@deliveriesfinal = deliveriespagoestado
			@cabecera.push(' - Tipo de pago: TODOS')
		end


		@vehicles = Vehicle.all
		@places = Place.all
	end

	def deliveredreport

		@cabecera = ['Filtros aplicados: ', 'Fecha desde: ', params[:date_deliver] , ' hasta ' , params[:date_deliver_end]]
		@deliveriesfinal = []
		deliveries = Delivery.where(['DATE(delivery_date) >= ? AND DATE(delivery_date) <=?', Time.parse(params[:date_deliver]).beginning_of_day, Time.parse(params[:date_deliver_end]).end_of_day] )
		
		if params[:client] != "TODOS"
			deliveriesclient = deliveries.where(['client_id = ?', params[:client]])
			@cabecera.push(' - Cliente: ')
			@cabecera.push(Client.find(params[:client]).name)
		else
			deliveriesclient = deliveries
			@cabecera.push(' - Cliente: TODOS')
		end

		if params[:camion] != "TODOS"
			deliveriestruck = deliveriesclient.where(['truck = ?', params[:camion]])
			@cabecera.push(' - Camion: ')
			@cabecera.push(Truck.find(params[:camion]).matricula)
		else
			deliveriestruck = deliveriesclient
			@cabecera.push(' - Camion: TODOS')
		end

		if params[:conductor] != "TODOS"
			@deliveriesfinal = deliveriestruck.where(['driver = ?', params[:conductor]])
			@cabecera.push(' - Conductor: ')
			@cabecera.push(Driver.find(params[:conductor]).name)
		else
			@deliveriesfinal = deliveriestruck
			@cabecera.push(' - Conductor: TODOS')
		end
		@vehicles = Vehicle.all
		@places = Place.all
	end
end

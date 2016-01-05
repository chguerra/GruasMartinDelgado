require 'pry'
class ClientsController < ApplicationController
	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		if(@client.save)
			redirect_to(client_path(@client))
		else
			render('new')
		end
	end

	def show
		@client = Client.find(params[:id])
	end

	def destroy
		@client = Client.find(params[:id])
		@client.destroy
	end

	def index
		@clients = Client.all
	end

	def edit
		@client = Client.find(params[:id])
	end

	def update
		@client = Client.find(params[:id])
		@client.update(client_params)
		redirect_to(client_path(@client))
	end

	private

	def client_params
		params.require(:client).permit(:nif, :name, :street, :street_number, :city, :postal_code, :phone, :email, :contact_person, :observations, :payment_method)		
	end
end

class SiteController < ApplicationController
	def home
		@deliveries = Delivery.where(delivery_status: "PENDIENTE")
	end
end

class Delivery < ActiveRecord::Base
	belongs_to :client
	has_many :vehicles
	has_many :places
end

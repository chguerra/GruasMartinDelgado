class AddDriverPriceToDeliveries < ActiveRecord::Migration
  def change
  	add_column :deliveries, :driver_price, :float
  end
end

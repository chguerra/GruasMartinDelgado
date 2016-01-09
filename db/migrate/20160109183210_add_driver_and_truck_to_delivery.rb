class AddDriverAndTruckToDelivery < ActiveRecord::Migration
  def change
  	add_column :deliveries, :driver, :integer
  	add_column :deliveries, :truck, :integer
  end
end

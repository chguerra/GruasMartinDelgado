class AddVehicleId < ActiveRecord::Migration
  def change
  	add_column :deliveries, :vehicle, :integer
  end
end

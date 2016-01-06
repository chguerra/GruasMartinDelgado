class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
    	t.float :price
    	t.date	:delivery_date
    	t.string :delivery_status, :default => 'PENDIENTE'
    	t.string :observations
      t.integer :origin
      t.integer :destination
    	t.references :client, index: true
      t.timestamps null: false
    end
  end
end

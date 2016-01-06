class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
    	t.string :bastidor_matricula
    	t.string :model
    	t.string :brand
    	t.string :observations
    	t.references :delivery, index: true
      t.timestamps null: false
    end
  end
end

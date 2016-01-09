class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
    	t.string :name
    	t.string :phone
    	t.string :address
    	t.string :email
      t.timestamps null: false
    end
  end
end

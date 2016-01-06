class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
    	t.string :name
    	t.string :address
    	t.string :address_details
    	t.string :postal_code
    	t.string :city
    	t.string :phone
    	t.string :contact_person
      t.references :delivery, index: true
      t.timestamps null: false
    end
  end
end

class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :name
    	t.string :street
    	t.string :street_number
    	t.string :city
    	t.integer :postal_code
    	t.string :phone
    	t.string :email
    	t.string :contact_person
    	t.string :observations
    	t.string :payment_method
    	t.string :nif
      t.timestamps null: false
    end
  end
end

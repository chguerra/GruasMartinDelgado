class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
    	t.string :matricula
    	t.string :modelo
    	t.string :marca
      t.timestamps null: false
    end
  end
end

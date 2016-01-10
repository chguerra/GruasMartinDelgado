class AddFilepath < ActiveRecord::Migration
  def change
  	add_column :deliveries, :filepath, :string
  end
end

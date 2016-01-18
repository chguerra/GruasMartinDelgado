class AddUserClientRelation < ActiveRecord::Migration
  def change
  	add_column :users, :role, :string
  	add_column :users, :assigned_client, :integer
  end
end

class AddPaidAndPaymentdateToDeliveries < ActiveRecord::Migration
  def change
  	add_column :deliveries, :payment_method, :string
  	add_column :deliveries, :payment_date, :date
  	add_column :deliveries, :payment_status, :string, default: 'PENDIENTE'
  end
end

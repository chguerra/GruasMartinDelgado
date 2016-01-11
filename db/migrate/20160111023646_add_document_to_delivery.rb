class AddDocumentToDelivery < ActiveRecord::Migration
  def change
  	add_attachment :deliveries, :document
  end
end

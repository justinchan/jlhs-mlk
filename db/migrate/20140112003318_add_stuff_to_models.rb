class AddStuffToModels < ActiveRecord::Migration
  def change
  	add_column :schools, :orignal_amount_owed, :decimal, :precision => 8, :scale => 2
  	add_column :payment_modifications, :amount_change, :decimal, :precision => 8, :scale => 2

  end
end

class AddForeignKey < ActiveRecord::Migration
  def change
  	add_column :payment_modifications, :school_id, :integer
  	add_column :payments, :school_id, :integer
  end
end

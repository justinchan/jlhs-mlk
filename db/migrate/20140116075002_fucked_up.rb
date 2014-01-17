class FuckedUp < ActiveRecord::Migration
  def change
  	remove_column :checks, :bank
  	remove_column :checks, :check_number
  	add_column :payments, :bank, :string
  	add_column :payments, :check_number, :integer
  end
end

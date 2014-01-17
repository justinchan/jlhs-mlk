class AddMoneytoClasses < ActiveRecord::Migration
  def change
  	add_column :payments, :amount, :decimal, :precision => 8, :scale => 2
  	add_column :schools, :amount_due, :decimal, :precision => 8, :scale => 2

  end
end

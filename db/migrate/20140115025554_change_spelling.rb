class ChangeSpelling < ActiveRecord::Migration
  def change
  	remove_column :schools, :orignal_amount_owed
  	add_column :schools, :original_amount_due, :decimal, :precision => 8, :scale => 2
  end
end

class ChangeAttributes < ActiveRecord::Migration
  def change
  	remove_column :schools, :original_amount_due
  end
end

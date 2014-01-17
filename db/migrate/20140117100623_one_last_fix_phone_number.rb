class OneLastFixPhoneNumber < ActiveRecord::Migration
  def change
  	remove_column :schools, :phone_number
  	add_column :schools, :phone_number, :integer, :limit => 8
  end
end

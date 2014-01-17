class AddDoneBooleanToSchool < ActiveRecord::Migration
  def change
  	add_column :schools, :done, :boolean, :default=>false
  end
end

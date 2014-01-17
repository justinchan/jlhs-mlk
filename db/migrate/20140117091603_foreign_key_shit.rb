class ForeignKeyShit < ActiveRecord::Migration
  def change
  	remove_column :users, :school_id
  	add_column :schools, :user_id, :integer
  end
end

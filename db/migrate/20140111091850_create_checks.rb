class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :check_number
      t.string :bank

      t.timestamps
    end
  end
end

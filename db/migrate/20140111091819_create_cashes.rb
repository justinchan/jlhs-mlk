class CreateCashes < ActiveRecord::Migration
  def change
    create_table :cashes do |t|

      t.timestamps
    end
  end
end

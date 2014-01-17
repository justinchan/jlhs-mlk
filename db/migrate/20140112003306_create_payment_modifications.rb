class CreatePaymentModifications < ActiveRecord::Migration
  def change
    create_table :payment_modifications do |t|
      t.string :reason

      t.timestamps
    end
  end
end

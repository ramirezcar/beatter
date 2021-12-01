class RemovePurchaserFromSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.string :buy_order

      t.timestamps
    end
  end
end

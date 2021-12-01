class RemoveLicenceFromSales < ActiveRecord::Migration[6.1]
  def change
    remove_column :sales, :licence, :integer
  end
end

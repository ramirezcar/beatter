class ChangeLineItemsColumnsToNullable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :line_items, :cart_id, true
    change_column_null :line_items, :licence_id, true
  end
end

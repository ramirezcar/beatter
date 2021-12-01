class ChangeLikeColumnsToNullable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :likes, :post_id, true
  end
end

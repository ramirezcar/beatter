class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :img_url, :avatar
  end
end
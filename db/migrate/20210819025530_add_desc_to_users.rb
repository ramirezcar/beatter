class AddDescToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :desc, :string
  end
end

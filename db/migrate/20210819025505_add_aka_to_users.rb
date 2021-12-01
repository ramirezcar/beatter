class AddAkaToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :aka, :string
  end
end

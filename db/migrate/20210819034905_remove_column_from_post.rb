class RemoveColumnFromPost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :desc, :string
  end
end

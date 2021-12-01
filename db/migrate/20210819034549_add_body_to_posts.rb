class AddBodyToPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :img_url, null: false

      t.timestamps
    end
    add_column :posts, :body, :string
  end
end

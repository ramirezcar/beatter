class AddImgUrlToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :img_file, :string, null: true
  end
end

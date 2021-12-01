class RemoveImgUrlFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :img_url, :string
  end
end

class AddCommentToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :comment, :longtext
  end
end

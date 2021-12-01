class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.string :body
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

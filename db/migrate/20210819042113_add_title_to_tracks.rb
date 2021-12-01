class AddTitleToTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :img_url
      t.integer :bpm

      t.timestamps
    end
    add_column :tracks, :title, :string
  end
end

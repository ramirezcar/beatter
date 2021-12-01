class AddTrackReferenceToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :track, null: true, foreign_key: true
  end
end

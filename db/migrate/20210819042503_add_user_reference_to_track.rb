class AddUserReferenceToTrack < ActiveRecord::Migration[6.1]
  def change
    add_reference :tracks, :user, null: false, foreign_key: true
  end
end

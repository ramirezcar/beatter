class RemoveLicencesFromTracks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tracks, :licences, :string
  end
end

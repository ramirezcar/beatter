class AddLicenceNameReferenceToLicence < ActiveRecord::Migration[6.1]
  def change
    create_table :licences do |t|
      t.integer :price
      t.string :file_url

      t.timestamps
      add_reference :licences, :licence_name, null: true, foreign_key: true
    end
  end
end

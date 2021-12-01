class AddLicenceNameReferenceToLicence < ActiveRecord::Migration[6.1]
  def change
    create_table :licences do |t|
      t.integer :price
      t.string :file_url

      t.timestamps
    end
    add_column :licences, :licence_name, :reference
  end
end

class AddLicenceNameReferenceToLicences < ActiveRecord::Migration[6.1]
  def change
    create_table :licence_names do |t|
      t.string :name

      t.timestamps
    end
    add_reference :licences, :licence_name, null: true, foreign_key: true
  end
end

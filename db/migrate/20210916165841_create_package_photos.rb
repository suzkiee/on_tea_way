class CreatePackagePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :package_photos do |t|
      t.references :subscription, foreign_key: true
      t.references :photo, foreign_key: true

      t.timestamps
    end
  end
end

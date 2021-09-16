class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :url
      t.string :unsplash_id
      t.boolean :user_uploaded
      t.string :user_photo_url

      t.timestamps
    end
  end
end

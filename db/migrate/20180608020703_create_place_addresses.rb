class CreatePlaceAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :place_addresses do |t|
      t.references :place, unique: true, foreign_key: true
      t.references :address, unique: true, foreign_key: true

      t.timestamps
    end
  end
end

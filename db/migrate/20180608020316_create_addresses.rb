class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :address_type, foreign_key: true

      t.timestamps
    end
  end
end

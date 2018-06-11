class CreatePlaceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :place_types do |t|
      t.references :place, foreign_key: true
      t.references :place_category, foreign_key: true

      t.timestamps
    end
  end
end

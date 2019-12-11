class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name

      t.references :npcs, index: true, foreign_key: {
        to_table: :creature
      }
      t.references :monsters, index: true, foreign_key: {
        to_table: :creature
      }

      t.timestamps
    end
  end
end

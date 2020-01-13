class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.text :description

      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end

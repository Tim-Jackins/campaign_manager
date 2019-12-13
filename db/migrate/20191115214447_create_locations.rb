class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :desc

      t.references :campaign, null: true, foreign_key: true

      t.timestamps
    end
  end
end

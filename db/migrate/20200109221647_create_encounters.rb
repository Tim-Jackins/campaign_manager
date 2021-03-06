class CreateEncounters < ActiveRecord::Migration[6.0]
  def change
    create_table :encounters do |t|
      t.string :name
      t.integer :level
      t.string :reward
      t.text :description

      t.boolean :completed

      t.references :campaign, foreign_key: true
      # t.references :building, foreign_key: true

      t.timestamps
    end
  end
end

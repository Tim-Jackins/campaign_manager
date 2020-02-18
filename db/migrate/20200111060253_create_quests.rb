class CreateQuests < ActiveRecord::Migration[6.0]
  def change
    create_table :quests do |t|
      t.string :name
      t.integer :level
      t.integer :order

      t.text :description
      t.string :reward

      t.boolean :completed

      t.references :main_quest, foreign_key: true

      # t.references :location, foreign_key: true
      # t.references :building, foreign_key: true

      t.timestamps
    end
  end
end

class CreateMainQuests < ActiveRecord::Migration[6.0]
  def change
    create_table :main_quests do |t|
      t.string :name
      t.string :short_description
      t.text :description

      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end

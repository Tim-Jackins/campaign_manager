class CreateDungeons < ActiveRecord::Migration[6.0]
  def change
    create_table :dungeons do |t|
      t.string :name
      t.text :rooms

      # t.references :encounter, foreign_key: true
      # t.references :quest, foreign_key: true
      # add_reference :dungeons, :dungeonable, polymorphic: true, index: true

      t.timestamps
    end
  end
end

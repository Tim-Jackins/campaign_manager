class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|

      t.string :name
      t.text :description
      t.text :higher_level
      t.string :range
      t.string :components
      t.string :material
      t.boolean :ritual
      t.string :duration
      t.boolean :concentration
      t.string :casting_time
      t.integer :level_int
      t.string :school
      t.string :dnd_class
      t.string :archetype
      t.string :circles
      
      t.timestamps
    end
  end
end

class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.text :description
      t.text :higher_level
      t.string :page
      t.string :range
      t.string :components
      t.text :material
      t.text :ritual
      t.string :duration
      t.text :concentration
      t.string :casting_time
      t.integer :level
      t.string :school
      t.string :classes
      t.string :circles

      t.timestamps
    end
  end
end

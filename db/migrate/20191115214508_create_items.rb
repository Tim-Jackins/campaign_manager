# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      # All items
      t.string :name
      t.string :cost
      t.text :item_category
      t.integer :weight

      # Weapon
      t.string :damage_dice
      t.string :damage_type
      t.integer :range_short
      t.integer :range_long
      t.text :weapon_properties
      t.integer :throw_range_short
      t.integer :throw_range_long

      # Armor
      t.text :armor_class_json
      t.text :str_minimum
      t.text :stealth_disadvantage

      # Equipment
      t.string :gear_category
      t.text :description

      t.timestamps
    end
  end
end

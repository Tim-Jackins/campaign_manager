# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :cost
      t.integer :weight
      t.string :rarity

      t.string :gear_category
      t.string :tool_category

      t.string :vehicle_category
      t.string :vehicle_speed
      t.string :capacity

      t.integer :ac
      t.boolean :dex_bonus
      t.integer :max_bonus
      t.string :armor_type
      t.integer :strength_required
      t.boolean :stealth_disadvantage

      t.string :damage
      t.string :weapon_category
      t.string :range_type
      t.integer :range_close
      t.integer :range_far
      t.integer :dice_count
      t.integer :dice_value
      t.string :damage_type
      t.string :properties

      t.timestamps
    end
  end
end

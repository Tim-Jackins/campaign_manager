class CreateCreatures < ActiveRecord::Migration[6.0]
  def change
    create_table :creatures do |t|
      t.string :name
      t.string :size
      t.string :body_type
      t.string :sub_body_type
      t.string :tag
      t.string :alignment

      t.integer :armor_class
      t.string :armor_name
      t.integer :hit_points
      t.string :hit_dice

      t.integer :speed
      t.integer :burrow_speed
      t.integer :climb_speed
      t.integer :fly_speed
      t.integer :swim_speed

      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma

      t.integer :strength_save
      t.integer :dexterity_save
      t.integer :constitution_save
      t.integer :intelligence_save
      t.integer :wisdom_save
      t.integer :charisma_save

      t.string :damage_vulnerabilities
      t.string :damage_resistances
      t.string :damage_immunities
      t.string :condition_immunities

      t.string :senses
      t.integer :challenge_rating
      t.string :skills
      t.string :languages

      t.text :spells_json # Figure out how to fix this
      t.text :actions_json
      t.text :special_abilities_json
      t.text :reactions_json
      t.text :legendary_desc
      t.text :legendary_actions_json

      t.timestamps
    end
  end
end

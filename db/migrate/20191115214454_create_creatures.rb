class CreateCreatures < ActiveRecord::Migration[6.0]
  def change
    create_table :creatures do |t|
      t.boolean :fof
      t.string :name
      t.string :size
      t.string :type
      t.string :tag
      t.string :alignment

      t.integer :armor_class
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

      t.references :damage_vulnerabilities
      t.references :damage_resistances
      t.references :damage_immunities
      t.references :condition_immunities

      t.integer :blindsight
      t.integer :darkvision
      t.integer :tremorsense
      t.integer :truesight
      t.integer :telepathy

      t.integer :challenge_rating

      t.string :skills
      t.string :languages

      t.text :spells_json
      t.text :actions_json
      t.text :special_abilities_json
      t.text :reactions_json
      t.text :legendary_desc
      t.text :legendary_actions_json

      t.timestamps
    end
  end
end

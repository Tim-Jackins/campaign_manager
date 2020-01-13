class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.references :creator, foreign_key: { to_table: :users }, index: true
      t.references :alignment, foreign_key: { to_table: :alignment_choices }, index: true

      t.string :name
      t.string :background
      t.string :player_name
      t.string :race
      t.integer :xp
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :wisdom
      t.integer :intelligence
      t.integer :charisma
      t.boolean :strength_save
      t.boolean :dexterity_save
      t.boolean :constitution_save
      t.boolean :wisdom_save
      t.boolean :intelligence_save
      t.boolean :charisma_save
      t.boolean :inspiration
      t.integer :proficiency_bonus
      t.integer :armor_class
      t.integer :initiative
      t.integer :speed
      t.integer :hp_max
      t.integer :current_hp
      t.integer :temporary_hp
      t.string :hit_dice
      t.integer :death_saves_success
      t.integer :death_saves_failure
      t.text :attack_json
      t.text :attack_desc
      t.text :proficiency_language_desc
      t.integer :copper_pieces
      t.integer :silver_pieces
      t.integer :electrum_pieces
      t.integer :gold_pieces
      t.integer :platinum_pieces
      t.integer :features_traits
      t.text :features_traits_desc
      # t.integer :spells

      t.timestamps
    end
  end
end

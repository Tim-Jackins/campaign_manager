class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|

      t.string :damage_dice
      t.string :attack_bonus
      t.string :name
      t.text :desc

      # Claws.
      # Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 14 (2d8 + 5) slashing damage.

      # Bite.
      # Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) piercing damage plus 10 (3d6) poison damage.

      t.references :actionable, polymorphic: true

      t.timestamps
    end
  end
end

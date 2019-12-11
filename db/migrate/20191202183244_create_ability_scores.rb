class CreateAbilityScores < ActiveRecord::Migration[6.0]
  def change
    create_table :ability_scores do |t|
      t.string :name
      t.string :full_name
      t.text :desc

      t.timestamps
    end
  end
end

class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.text :description
      t.references :ability_score, foreign_key: true

      t.timestamps
    end
  end
end



class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      t.string :area
      t.references :location, foreign_key: true
      t.references :creature, foreign_key: true

      t.timestamps
    end
  end
end

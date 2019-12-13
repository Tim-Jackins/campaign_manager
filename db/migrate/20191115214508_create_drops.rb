class CreateDrops < ActiveRecord::Migration[6.0]
  def change
    create_table :drops do |t|
      t.integer :money # In copper pieces
      t.boolean :fof

      t.references :creature, null: false, foreign_key: true
      t.references :items, null: false, foreign_key: true

      t.timestamps
    end
  end
end

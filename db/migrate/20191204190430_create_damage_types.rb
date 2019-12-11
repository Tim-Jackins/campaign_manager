class CreateDamageTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :damage_types do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreateWeaponProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :weapon_properties do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

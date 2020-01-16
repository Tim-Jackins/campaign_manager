class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :short_description
      t.text :description
      t.boolean :is_natural
      t.string :image_link

      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end

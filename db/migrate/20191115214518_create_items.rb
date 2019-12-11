class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :cost
      t.string :item_category
      t.text :category_specific_info

      t.references :api_resource, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateApiResources < ActiveRecord::Migration[6.0]
  def change
    create_table :api_resources do |t|
      t.string :base_url
      t.string :path
      t.integer :api_id
      t.string :url

      t.timestamps
    end
  end
end

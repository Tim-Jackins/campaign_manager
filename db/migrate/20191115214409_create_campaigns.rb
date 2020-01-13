class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :general_information
      t.text :regional_information
      t.text :backstory
      t.text :rules
      t.text :notes

      t.references :creator, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end

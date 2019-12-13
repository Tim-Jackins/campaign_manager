class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :summary
      t.text :notes

      t.references :locations, foreign_key: true
      # t.references :owner, index: true, foreign_key: {
      #   to_table: :user
      # }

      t.timestamps
    end
  end
end

class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :script
      t.string :typical_speakers

      t.timestamps
    end
  end
end

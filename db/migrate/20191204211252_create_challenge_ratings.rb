class CreateChallengeRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :challenge_ratings do |t|
      t.string :rating
      t.integer :xp

      t.timestamps
    end
  end
end

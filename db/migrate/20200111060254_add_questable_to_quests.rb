class AddQuestableToQuests < ActiveRecord::Migration[6.0]
  def change
    add_reference :quests, :questable, polymorphic: true, index: true
  end
end

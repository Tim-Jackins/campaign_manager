class AddDungeonableToDungeons < ActiveRecord::Migration[6.0]
  def change
    add_reference :dungeons, :dungeonable, polymorphic: true, index: true
  end
end

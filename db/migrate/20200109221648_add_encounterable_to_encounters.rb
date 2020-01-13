class AddEncounterableToEncounters < ActiveRecord::Migration[6.0]
  def change
    add_reference :encounters, :encounterable, polymorphic: true, index: true
  end
end

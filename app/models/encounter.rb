class Encounter < ApplicationRecord
  belongs_to :encounterable, polymorphic: true

  has_one :dungeon, as: :dungeonable, dependent: :destroy
end

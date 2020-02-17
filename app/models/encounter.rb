class Encounter < ApplicationRecord
  belongs_to :encounterable, polymorphic: true
  belongs_to :campaign

  has_one :dungeon, as: :dungeonable, dependent: :destroy
end

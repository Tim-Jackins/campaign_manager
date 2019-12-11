class Npc < ApplicationRecord
  belongs_to :location
  has_one :creature
end

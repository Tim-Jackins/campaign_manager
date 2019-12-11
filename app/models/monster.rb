class Monster < ApplicationRecord
  belongs_to :location
  has_one :creature
end

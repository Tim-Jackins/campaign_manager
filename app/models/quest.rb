class Quest < ApplicationRecord
  belongs_to :main_quest
  belongs_to :questable, polymorphic: true

  has_one :dungeon, as: :dungeonable, dependent: :destroy
end

class Building < ApplicationRecord
  belongs_to :location

  has_many :quests, as: :questable, dependent: :destroy
  has_many :encounters, as: :encounterable, dependent: :destroy
end

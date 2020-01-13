class Location < ApplicationRecord
  belongs_to :campaign

  has_many :quests, as: :questable, dependent: :destroy
  has_many :encounters, as: :encounterable, dependent: :destroy
  has_many :buildings, dependent: :destroy
end

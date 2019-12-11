class Location < ApplicationRecord
  belongs_to :campaign
  has_many :creatures
  has_one_attached :map
end

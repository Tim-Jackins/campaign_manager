class Location < ApplicationRecord
  belongs_to :campaign
  # has_many :drops
end

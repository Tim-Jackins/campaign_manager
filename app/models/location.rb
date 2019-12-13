class Location < ApplicationRecord
  belongs_to :campaign, dependent: :destroy
  has_many :drops
end

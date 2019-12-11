class Drop < ApplicationRecord
  has_many :items
  belongs_to :creature
end

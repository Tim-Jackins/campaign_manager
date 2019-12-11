class AbilityScore < ApplicationRecord
  has_many :skills, dependent: :destroy
end

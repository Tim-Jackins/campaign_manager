class Campaign < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :locations, dependent: :destroy
  has_many :main_quests, dependent: :destroy
  has_many :encounters, dependent: :destroy
end

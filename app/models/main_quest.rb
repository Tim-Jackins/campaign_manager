class MainQuest < ApplicationRecord
  belongs_to :campaign

  has_many :quests, as: :questable
end

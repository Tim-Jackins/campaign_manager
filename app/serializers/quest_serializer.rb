class QuestSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :description, :reward
  belongs_to :main_quest
end

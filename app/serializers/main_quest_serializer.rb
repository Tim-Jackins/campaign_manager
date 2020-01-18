class MainQuestSerializer < ActiveModel::Serializer
  attributes :id, :name, :short_description, :description
  belongs_to :campaign
end

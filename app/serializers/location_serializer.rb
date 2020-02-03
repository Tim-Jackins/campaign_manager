class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :short_description, :description, :image_link
  belongs_to :campaign
  has_many :quests, as: :questable
  has_many :encounters, as: :encounterable
  has_many :buildings
end

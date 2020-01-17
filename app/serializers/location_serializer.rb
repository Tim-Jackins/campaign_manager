class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :short_description, :description, :image_link
  belongs_to :campaign
end

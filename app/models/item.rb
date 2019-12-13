class Item < ApplicationRecord
  # Relations
  belongs_to :drop

  def armor_class_hash
    JSON.parse(armor_class_json)
  end
end

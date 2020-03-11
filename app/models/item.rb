class Item < ApplicationRecord
  belongs_to :quest

  def armor_class_hash
    JSON.parse(armor_class_json)
  end
end

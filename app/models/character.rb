class Character < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :alignment, class_name: 'AlignmentChoice', optional: true

  has_many :char_classes, dependent: :destroy
end

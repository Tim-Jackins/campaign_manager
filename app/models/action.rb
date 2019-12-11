class Action < ApplicationRecord
  belongs_to :actionable, polymorphic: true
end

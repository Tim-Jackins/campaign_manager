# frozen_string_literal: true

class Creature < ApplicationRecord
  # Relations
  has_one :drop
  has_many :actions, as: :actionable

  url_match_ex = %r!https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&\/\/=]*)!
  # See documentation http://www.dnd5eapi.co/docs/
  dnd_api_paths = [
    # Character data
    'ability-scores/',
    'skills/',
    'proficiencies/',
    'languages/',
    # Classes
    'classes',
    'subclasses/',
    'features',
    # Races
    'races',
    'subraces',
    # Equipment
    'equipment',
    # Game mechanics
    'conditions',
    'damage-type',
    'magic-schools'
  ]

  # Validations
  validates :api_id, presence: true, length: { is: 24 }
  validates :api_index, presence: true, numericality: { only_integer: true }
  validates :path, presence: true, inclusion: {
    in: dnd_api_paths,
    message: 'Use a valid path (ex: skills, monster, equipment)'
  }
  validates :base_url, presence: true, format: {
    with: url_match_ex,
    message: 'Please enter a valid url'
  }
  # validates :current_hp, presence: true, numericaly: {
  #   is: Integer,
  #   less_than: 1000
  # }
  validates :creature_info, presence: true
  # validates :custom_creature_info, presence: true
  validates :fof, presence: true, length: { minimum: 0, maximum: 1 }
end

# validate :json_format

# protected

#   def json_format
#     errors[:base] << "not in json format" unless json.is_json?
#   end

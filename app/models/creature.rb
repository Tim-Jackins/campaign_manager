# frozen_string_literal: true

require 'json'

class Creature < ApplicationRecord
  # Relations
  belongs_to :drops

  # Methods
  def get_modifier as_name
    generate_modifier = ->(x) { (x - 10) / 2 }
    case as_name
    when 'STR'
      return generate_modifier.call(strength)
    when 'DEX'
      return generate_modifier.call(dexterity)
    when 'CON'
      return generate_modifier.call(constitution)
    when 'INT'
      return generate_modifier.call(intelligence)
    when 'WIS'
      return generate_modifier.call(wisdom)
    when 'CHA'
      return generate_modifier.call(charisma)
    end
  end

  def get_proficiency_bonus
    proficiency_hash = {
      0 => 2,
      '1/8' => 2,
      '1/4' => 2,
      '1/2' => 2,
      1 => 2,
      2 => 2,
      3 => 2,
      4 => 2,
      5 => 3,
      6 => 3,
      7 => 3,
      8 => 3,
      9 => 4,
      10 => 4,
      11 => 4,
      12 => 4,
      13 => 5,
      14 => 5,
      15 => 5,
      16 => 5,
      17 => 6,
      18 => 6,
      19 => 6,
      20 => 6,
      21 => 7,
      22 => 7,
      23 => 7,
      24 => 7,
      25 => 8,
      26 => 8,
      27 => 8,
      28 => 8,
      29 => 9,
      30 => 9
    }
    proficiency_hash[challenge_rating]
  end

  def get_passive_perception
    passive_perception = get_modifier('WIS') + 10
    passive_perception += get_proficiency_bonus if skills.include?('Perception')
    passive_perception
  end

  def spells_hash
    JSON.parse(spells_json)
  end

  def actions_hash
    JSON.parse(actions_json)
  end

  def special_abilities_hash
    JSON.parse(special_abilities_json)
  end

  def reactions_hash
    JSON.parse(reactions_json)
  end

  def legendary_actions_hash
    JSON.parse(legendary_actions_json)
  end

  after_initialize :init

  def init
    # t.string :name
    # t.string :size
    # t.string :body_type
    # t.string :sub_body_type
    # t.string :tag
    # t.string :alignment

    self.armor_class ||= 0
    self.armor_name ||= 'natural armor'
    self.hit_points ||= 0
    self.hit_dice ||= '0d0'

    self.speed ||= 0
    self.burrow_speed ||= 0
    self.climb_speed ||= 0
    self.fly_speed ||= 0
    self.swim_speed ||= 0

    self.strength ||= 15
    self.dexterity ||= 14
    self.constitution ||= 13
    self.intelligence ||= 12
    self.wisdom ||= 10
    self.charisma ||= 8

    self.strength_save ||= 0
    self.dexterity_save ||= 0
    self.constitution_save ||= 0
    self.intelligence_save ||= 0
    self.wisdom_save ||= 0
    self.charisma_save ||= 0

    # t.string :damage_vulnerabilities
    # t.string :damage_resistances
    # t.string :damage_immunities
    # t.string :condition_immunities

    self.blindsight ||= 0
    self.darkvision ||= 0
    self.tremorsense ||= 0
    self.truesight ||= 0
    self.telepathy ||= 0

    # t.integer :challenge_rating

    # t.string :skills
    # t.string :languages

    # t.text :spells_json
    # t.text :actions_json
    # t.text :special_abilities_json
    # t.text :reactions_json
    # t.text :legendary_desc
    # t.text :legendary_actions_json
  end

  # Validations
  # validates :api_id, presence: true, length: { is: 24 }
  # validates :api_index, presence: true, numericality: { only_integer: true }
  # validates :path, presence: true, inclusion: {
  #   in: dnd_api_paths,
  #   message: 'Use a valid path (ex: skills, monster, equipment)'
  # }
  # validates :base_url, presence: true, format: {
  #   with: url_match_ex,
  #   message: 'Please enter a valid url'
  # }
  # validates :current_hp, presence: true, numericaly: {
  #   is: Integer,
  #   less_than: 1000
  # }
  # validates :creature_info, presence: true
  # validates :custom_creature_info, presence: true
  # validates :fof, presence: true, length: { minimum: 0, maximum: 1 }
end

# validate :json_format

# protected

#   def json_format
#     errors[:base] << "not in json format" unless json.is_json?
#   end

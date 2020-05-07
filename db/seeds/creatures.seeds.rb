require 'open-uri'
require 'json'

url = 'https://api.open5e.com/monsters/?format=json'

open(url) do |creatures_request|
  creatures_json = creatures_request.read
  creatures = JSON.parse(creatures_json)

  next_url = creatures['next']

  creatures['results'].each do |creature|
    object = {}

    object['name'] =                    creature['name'] if creature['name']
    object['size'] =                    creature['size'] if creature['size']
    object['body_type'] =               creature['body_type'] if creature['body_type']
    object['sub_body_type'] =           creature['sub_body_type'] if creature['sub_body_type']
    object['tag'] =                     creature['tag'] if creature['tag']
    object['alignment'] =               creature['alignment'] if creature['alignment']

    object['armor_class'] =             creature['armor_class'] if creature['armor_class']
    object['armor_name'] =              creature['armor_name'] if creature['armor_name']
    object['hit_points'] =              creature['hit_points'] if creature['hit_points']
    object['hit_dice'] =                creature['hit_dice'] if creature['hit_dice']

    object['speed'] =                   creature['speed']['walk'] if creature['speed']['walk']
    object['burrow_speed'] =            creature['speed']['burrow'] if creature['speed']['burrow']
    object['climb_speed'] =             creature['speed']['climb'] if creature['speed']['climb']
    object['fly_speed'] =               creature['speed']['fly'] if creature['speed']['fly']
    object['swim_speed'] =              creature['speed']['swim'] if creature['speed']['swim']

    object['strength'] =                creature['strength'] if creature['strength']
    object['dexterity'] =               creature['dexterity'] if creature['dexterity']
    object['constitution'] =            creature['constitution'] if creature['constitution']
    object['intelligence'] =            creature['intelligence'] if creature['intelligence']
    object['wisdom'] =                  creature['wisdom'] if creature['wisdom']
    object['charisma'] =                creature['charisma'] if creature['charisma']

    object['strength_save'] =           creature['strength_save'] if creature['strength_save']
    object['dexterity_save'] =          creature['dexterity_save'] if creature['dexterity_save']
    object['constitution_save'] =       creature['constitution_save'] if creature['constitution_save']
    object['intelligence_save'] =       creature['intelligence_save'] if creature['intelligence_save']
    object['wisdom_save'] =             creature['wisdom_save'] if creature['wisdom_save']
    object['charisma_save'] =           creature['charisma_save'] if creature['charisma_save']

    object['damage_vulnerabilities'] =  creature['damage_vulnerabilities'] if creature['damage_vulnerabilities']
    object['damage_resistances'] =      creature['damage_resistances'] if creature['damage_resistances']
    object['damage_immunities'] =       creature['damage_immunities'] if creature['damage_immunities']
    object['condition_immunities'] =    creature['condition_immunities'] if creature['condition_immunities']

    object['senses'] =                  creature['senses'] if creature['senses']
    object['challenge_rating'] =        creature['challenge_rating'] if creature['challenge_rating']
    object['languages'] =               creature['languages'] if creature['languages']

    object['skills'] =                  creature['skills'].keys.map(&:capitalize).join(', ') if creature['skills']
    object['actions_json'] =            creature['actions'].to_json if creature['actions']
    object['special_abilities_json'] =  creature['special_abilities'].to_json if creature['special_abilities']
    object['reactions_json'] =          creature['reactions'].to_json if creature['reactions']
    object['legendary_actions_json'] =  creature['legendary_actions'].to_json if creature['legendary_actions']

    object['legendary_desc'] =          creature['legendary_desc'].to_json if creature['legendary_desc']

    # t.text :spells_json # Figure out how to fix this

    Creature.create!(object)
  end

  while next_url do
    open(next_url) do |creatures_request|
      creatures_json = creatures_request.read
      creatures = JSON.parse(creatures_json)

      next_url = creatures['next']

      creatures['results'].each do |creature|
        object = {}

        object['name'] =                    creature['name'] if creature['name']
        object['size'] =                    creature['size'] if creature['size']
        object['body_type'] =               creature['body_type'] if creature['body_type']
        object['sub_body_type'] =           creature['sub_body_type'] if creature['sub_body_type']
        object['tag'] =                     creature['tag'] if creature['tag']
        object['alignment'] =               creature['alignment'] if creature['alignment']

        object['armor_class'] =             creature['armor_class'] if creature['armor_class']
        object['armor_name'] =              creature['armor_name'] if creature['armor_name']
        object['hit_points'] =              creature['hit_points'] if creature['hit_points']
        object['hit_dice'] =                creature['hit_dice'] if creature['hit_dice']

        object['speed'] =                   creature['speed']['walk'] if creature['speed']['walk']
        object['burrow_speed'] =            creature['speed']['burrow'] if creature['speed']['burrow']
        object['climb_speed'] =             creature['speed']['climb'] if creature['speed']['climb']
        object['fly_speed'] =               creature['speed']['fly'] if creature['speed']['fly']
        object['swim_speed'] =              creature['speed']['swim'] if creature['speed']['swim']

        object['strength'] =                creature['strength'] if creature['strength']
        object['dexterity'] =               creature['dexterity'] if creature['dexterity']
        object['constitution'] =            creature['constitution'] if creature['constitution']
        object['intelligence'] =            creature['intelligence'] if creature['intelligence']
        object['wisdom'] =                  creature['wisdom'] if creature['wisdom']
        object['charisma'] =                creature['charisma'] if creature['charisma']

        object['strength_save'] =           creature['strength_save'] if creature['strength_save']
        object['dexterity_save'] =          creature['dexterity_save'] if creature['dexterity_save']
        object['constitution_save'] =       creature['constitution_save'] if creature['constitution_save']
        object['intelligence_save'] =       creature['intelligence_save'] if creature['intelligence_save']
        object['wisdom_save'] =             creature['wisdom_save'] if creature['wisdom_save']
        object['charisma_save'] =           creature['charisma_save'] if creature['charisma_save']

        object['damage_vulnerabilities'] =  creature['damage_vulnerabilities'] if creature['damage_vulnerabilities']
        object['damage_resistances'] =      creature['damage_resistances'] if creature['damage_resistances']
        object['damage_immunities'] =       creature['damage_immunities'] if creature['damage_immunities']
        object['condition_immunities'] =    creature['condition_immunities'] if creature['condition_immunities']

        object['senses'] =                  creature['senses'] if creature['senses']
        object['challenge_rating'] =        creature['challenge_rating'] if creature['challenge_rating']
        object['languages'] =               creature['languages'] if creature['languages']

        object['skills'] =                  creature['skills'].keys.map(&:capitalize).join(', ') if creature['skills']
        object['actions_json'] =            creature['actions'].to_json if creature['actions']
        object['special_abilities_json'] =  creature['special_abilities'].to_json if creature['special_abilities']
        object['reactions_json'] =          creature['reactions'].to_json if creature['reactions']
        object['legendary_actions_json'] =  creature['legendary_actions'].to_json if creature['legendary_actions']

        object['legendary_desc'] =          creature['legendary_desc'].to_json if creature['legendary_desc']

        Creature.create!(object)
      end
    end
  end
end

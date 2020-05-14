require 'open-uri'
require 'json'

url = 'https://raw.githubusercontent.com/Tim-Jackins/5e-database/master/src/5e-SRD-Equipment.json'

count = {
  'Treasure' => 0,
  'Weapon' => 0,
  'Armor' => 0,
  'Adventuring Gear' => 0,
  'Tools' => 0,
  'Mounts and Vehicles' => 0
}

open(url) do |items_request|
  items_json = items_request.read
  items = JSON.parse(items_json)

  items.each do |item|
    object = {}

    case item['equipment_category']
    when 'Treasure'
      count['Treasure'] += 1

      object['name'] = item['name'] if item['name']
      object['description'] = 'Builtin weapon'
      object['category'] = item['equipment_category'] if item['equipment_category']
      object['cost'] = item['cost']['quantity'].to_s + item['cost']['unit'] if item['cost']['quantity'] && item['cost']['unit']
      object['weight'] = item['weight'] if item['weight']
      object['rarity'] = 'Common'
    when 'Weapon'
      count['Weapon'] += 1

      object['name'] = item['name'] if item['name']
      object['description'] = 'Builtin weapon'
      object['category'] = item['equipment_category'] if item['equipment_category']
      object['cost'] = item['cost']['quantity'].to_s + item['cost']['unit'] if item['cost']['quantity'] && item['cost']['unit']
      object['weight'] = item['weight'] if item['weight']
      object['rarity'] = 'Common'

      object['weapon_category'] = item['weapon_category'] if item['weapon_category']
      object['range_type'] = item['weapon_range'] if item['weapon_range']
      object['range_close'] = item['range']['normal'] if item['range']['normal']
      object['range_far'] = item['range']['long'] if item['range']['long']
      object['dice_count'] = item['damage']['dice_count'] if item['damage']['dice_count']
      object['dice_value'] = item['damage']['dice_value'] if item['damage']['dice_value']
      object['damage_type'] = item['damage']['damage_type']['name'] if item['damage']['damage_type']['name']

      object['properties'] = item['properties'].map{ |property| property['name'] }.join(', ') if item['property']
    when 'Armor'
      count['Armor'] += 1

      object['name'] = item['name'] if item['name']
      object['description'] = 'Builtin weapon'
      object['category'] = item['equipment_category'] if item['equipment_category']
      object['cost'] = item['cost']['quantity'].to_s + item['cost']['unit'] if item['cost']['quantity'] && item['cost']['unit']
      object['weight'] = item['weight'] if item['weight']
      object['rarity'] = 'Common'

      object['ac'] = item['armor_class']['base'] if item['armor_class']['base']
      object['dex_bonus'] = item['armor_class']['dex_bonus'] if item['armor_class']['dex_bonus']
      object['max_bonus'] = item['armor_class']['max_bonus'] if item['armor_class']['max_bonus']
      object['armor_type'] = item['armor_category'] if item['armor_category']
      object['strength_required'] = item['str_minimum'] if item['str_minimum']
      object['stealth_disadvantage'] = item['stealth_disadvantage'] if item['stealth_disadvantage']
    when 'Adventuring Gear'
      count['Adventuring Gear'] += 1

      object['name'] = item['name'] if item['name']
      object['description'] = 'Builtin weapon'
      object['category'] = item['equipment_category'] if item['equipment_category']
      object['cost'] = item['cost']['quantity'].to_s + item['cost']['unit'] if item['cost']['quantity'] && item['cost']['unit']
      object['weight'] = item['weight'] if item['weight']
      object['rarity'] = 'Common'

      object['gear_category'] = item['gear_category'] if item['gear_category']
    when 'Tools'
      count['Tools'] += 1

      object['name'] = item['name'] if item['name']
      object['description'] = item['desc'].join(', ') if item['desc']
      object['category'] = item['equipment_category'] if item['equipment_category']
      object['cost'] = item['cost']['quantity'].to_s + item['cost']['unit'] if item['cost']['quantity'] && item['cost']['unit']
      object['weight'] = item['weight'] if item['weight']
      object['rarity'] = 'Common'

      object['tool_category'] = item['tool_category'] if item['tool_category']
    when 'Mounts and Vehicles'
      count['Mounts and Vehicles'] += 1

      object['name'] = item['name'] if item['name']
      object['description'] = item['desc'].join(', ') if item['desc']
      object['category'] = item['equipment_category'] if item['equipment_category']
      object['cost'] = item['cost']['quantity'].to_s + item['cost']['unit'] if item['cost']['quantity'] && item['cost']['unit']
      object['weight'] = item['weight'] if item['weight']
      object['rarity'] = 'Common'

      object['vehicle_category'] = item['vehicle_category'] if item['vehicle_category']
      object['vehicle_speed'] = item['speed']['quantity'].to_s + item['speed']['unit'] unless item['speed'].nil?
      object['capacity'] = item['capacity'] if item['capacity']
    end

    Item.create!(object)
  end
end

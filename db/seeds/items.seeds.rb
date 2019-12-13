require 'open-uri'
require 'json'

url = 'https://raw.githubusercontent.com/Tim-Jackins/5e-database/master/5e-SRD-Equipment.json'

def convert_to_copper(value, unit)
  coin_hash = {
    'cp' => 1,
    'sp' => 10,
    'ep' => 50,
    'gp' => 100,
    'pp' => 1_000
  }
  return (coin_hash[unit] * value)
end

open(url) do |items_request|
  items_json = items_request.read
  items = JSON.parse(items_json)
  items = items[0..152]
  items.each do |item|
    object = {}

    # All items
    name = item['name'] if item.key?('name')
    cost = convert_to_copper(item['cost']['quantity'], item['cost']['unit']) if item.key?('cost')
    item_category = item['equipment_category'] if item.key?('equipment_category')
    weight = item['weight'] if item.key?('weight')

    object[:name] = name
    object[:cost] = cost
    object[:item_category] = item_category
    object[:weight] = weight

    case item['equipment_category']
    when 'Weapon'
      # Weapon
      if item['damage']['dice_count'] && item['damage']['dice_value']
        damage_dice = "#{item['damage']['dice_count']}d#{item['damage']['dice_value']}"
      end

      damage_type = item['damage']['damage_type']['name'] if item['damage']['damage_type']['name']
      range_short = item['range']['normal'] if item['range']['normal']
      range_long = item['range']['long'] if item['range']['long']

      if item.key?('properties')
        raw_properties = []
        item['properties'].each { |elem| raw_properties << elem['name'] }
        weapon_properties = raw_properties.join(', ')
      end

      if item.key?('throw_range')
        throw_range_short = item['throw_range']['normal'] if item['throw_range']['normal']
        throw_range_long = item['throw_range']['long'] if item['throw_range']['long']
      end

      object[:damage_dice] = damage_dice
      object[:damage_type] = damage_type
      object[:range_short] = range_short
      object[:range_long] = range_long
      object[:weapon_properties] = weapon_properties
      object[:throw_range_short] = throw_range_short
      object[:throw_range_long] = throw_range_long
    when 'Armor'
      # Armor
      armor_class_json = item['armor_class'] if item.key?('armor_class')
      str_minimum = item['str_minimum'] if item.key?('str_minimum')
      stealth_disadvantage = item['stealth_disadvantage'] if item.key?('stealth_disadvantage')

      object[:armor_class_json] = JSON.dump(armor_class_json)
      object[:str_minimum] = str_minimum
      object[:stealth_disadvantage] = stealth_disadvantage
    when 'Adventuring Gear'
      # Equipment
      gear_category = item['gear_category'] if item.key?('gear_category')
      desc = item['desc'].join(', ') if item.key?('desc')

      object[:gear_category] = gear_category
      object[:desc] = desc
    end
    Item.create(object)
  end
end

require 'open-uri'
require 'json'

url = 'https://api.open5e.com/spells/?format=json'

open(url) do |spells_request|
  spells_json = spells_request.read
  spells = JSON.parse(spells_json)
  
  next_url = spells['next']
  
  spells['results'].each do |spell|
    object = {}
    object['name'] =          spell['name'] if spell['name']
    object['description'] =   spell['desc'] if spell['desc']
    object['higher_level'] =  spell['higher_level'] if spell['higher_level']
    object['range'] =         spell['range'] if spell['range']
    object['components'] =    spell['components'] if spell['components']
    object['material'] =      spell['material'] if spell['material']
    object['ritual'] =        spell['ritual'] if spell['ritual']
    object['duration'] =      spell['duration'] if spell['duration']
    object['concentration'] = spell['concentration'] if spell['concentration']
    object['casting_time'] =  spell['casting_time'] if spell['casting_time']
    object['level_int'] =     spell['level_int'] if spell['level_int']
    object['school'] =        spell['school'] if spell['school']
    object['dnd_class'] =     spell['dnd_class'] if spell['dnd_class']
    object['archetype'] =     spell['archetype'] if spell['archetype']
    object['circles'] =       spell['circles'] if spell['circles']

    Spell.create!(object)
  end

  while next_url do
    open(next_url) do |spells_request|
      spells_json = spells_request.read
      spells = JSON.parse(spells_json)

      next_url = spells['next']

      spells['results'].each do |spell|
        object = {}
        object['name'] =          spell['name'] if spell['name']
        object['description'] =   spell['desc'] if spell['desc']
        object['higher_level'] =  spell['higher_level'] if spell['higher_level']
        object['range'] =         spell['range'] if spell['range']
        object['components'] =    spell['components'] if spell['components']
        object['material'] =      spell['material'] if spell['material']
        object['ritual'] =        spell['ritual'] if spell['ritual']
        object['duration'] =      spell['duration'] if spell['duration']
        object['concentration'] = spell['concentration'] if spell['concentration']
        object['casting_time'] =  spell['casting_time'] if spell['casting_time']
        object['level_int'] =     spell['level_int'] if spell['level_int']
        object['school'] =        spell['school'] if spell['school']
        object['dnd_class'] =     spell['dnd_class'] if spell['dnd_class']
        object['archetype'] =     spell['archetype'] if spell['archetype']
        object['circles'] =       spell['circles'] if spell['circles']

        Spell.create!(object)
      end
    end
  end

end

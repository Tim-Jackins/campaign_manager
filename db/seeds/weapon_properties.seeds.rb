require 'open-uri'
require 'json'

url = 'https://raw.githubusercontent.com/Tim-Jackins/5e-database/master/5e-SRD-Weapon-Properties.json'

open(url) do |weapon_properties_request|
  weapon_properties_json = weapon_properties_request.read
  weapon_properties = JSON.parse(weapon_properties_json)
  weapon_properties.each do |weapon_propertie|
    object = {
      name: weapon_propertie['name'],
      desc: weapon_propertie['desc'].join(', ')
    }
    WeaponProperty.create(object)
  end
end

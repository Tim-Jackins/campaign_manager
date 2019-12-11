require 'open-uri'
require 'json'

url = 'https://raw.githubusercontent.com/Tim-Jackins/5e-database/master/5e-SRD-Skills.json'

open(url) do |skills_request|
  skills_json = skills_request.read
  skills = JSON.parse(skills_json)
  skills.each do |skill|
    ability_score_name = skill['ability_score']['name']
    object = {
      name: skill['name'],
      desc: skill['desc'].join(', ')
    }
    ability_score = AbilityScore.find_by(name: ability_score_name)
    ability_score.skills.create(object)
  end
end
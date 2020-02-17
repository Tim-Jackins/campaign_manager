require 'open-uri'
require 'json'

url = 'https://raw.githubusercontent.com/Tim-Jackins/5e-database/master/src/5e-SRD-Ability-Scores.json'

open(url) do |ability_scores_request|
  ability_scores_json = ability_scores_request.read
  ability_scores = JSON.parse(ability_scores_json)
  ability_scores.each do |ability_score|
    object = {
      name: ability_score['name'],
      full_name: ability_score['full_name'],
      description: ability_score['desc'].join(', ')
    }
    AbilityScore.create(object)
  end
end

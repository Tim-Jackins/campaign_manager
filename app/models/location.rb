class Location < ApplicationRecord
  belongs_to :campaign

  has_many :quests, as: :questable, dependent: :destroy
  has_many :encounters, as: :encounterable, dependent: :destroy
  has_many :buildings, dependent: :destroy

  def encounter_progress
    total_encounters = encounters.size
    encounters_query = encounters.find_by(completed: true)
    completed_encounters  = if encounters_query.nil? # rubocop:disable Layout/ExtraSpacing, Layout/SpaceAroundOperators
                              0
                            elsif encounters_query.instance_of? Encounter
                              1
                            else
                              completed_encounters.size
                            end

    buildings.each do |building|
      completed_encounters += building.encounter_progress[0]
      # puts "#{building.encounter_progress[0]} / #{building.encounter_progress[1]}"
      total_encounters += building.encounter_progress[1]
    end

    [completed_encounters, total_encounters]
  end
end

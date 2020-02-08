class Building < ApplicationRecord
  belongs_to :location

  has_many :quests, as: :questable, dependent: :destroy
  has_many :encounters, as: :encounterable, dependent: :destroy

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

    [completed_encounters, total_encounters]
  end
end

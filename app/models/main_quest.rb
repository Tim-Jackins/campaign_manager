# frozen_string_literal: true

class MainQuest < ApplicationRecord
  belongs_to :campaign

  has_many :quests

  def quest_progress
    total_quests = quests.size
    quests_query = quests.where(completed: true)
    completed_quests  = if quests_query.nil? # rubocop:disable Layout/ExtraSpacing, Layout/SpaceAroundOperators
                          0
                        elsif quests_query.instance_of? Quest
                          1
                        else
                          quests_query.size
                        end

    [completed_quests, total_quests]
  end

  def quests_sorted
    quests.sort { |a, b| a.order <=> b.order }
  end
end

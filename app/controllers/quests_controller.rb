class QuestsController < ApplicationController
  def create
    puts params
    @main_quest = MainQuest.find(params[:main_quest_id])
    @campaign = @main_quest.campaign
    @quest = @main_quest.quests.create(quest_params)
    redirect_to campaign_path(@campaign)
  end

  def destroy
    @main_quest = MainQuest.find(params[:main_quest_id])
    @campaign = @main_quest.campaign
    @quest = @main_quest.quests.find(quest_params)
    @quest.destroy
    redirect_to campaign_path(@campaign)
  end

  private

  def quest_params
    params.require(:quest).permit(
      :name,
      :level,
      :description,
      :reward
    )
  end
end

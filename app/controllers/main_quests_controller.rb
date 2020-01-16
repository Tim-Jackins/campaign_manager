class MainQuestsController < ApplicationController
  def create
    @campaign = Campaign.find(params[:campaign_id])
    @main_quest = @campaign.main_quests.create(main_quest_params)
    redirect_to campaign_path(@campaign)
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @main_quest = @campaign.main_quests.find(params[:id])
    @main_quest.destroy
    redirect_to campaign_path(@campaign)
  end

  private

  def main_quest_params
    params.require(:main_quest).permit(
      :name,
      :short_description,
      :description
    )
  end
end

class MainQuestsController < ApplicationController
  def show
    @main_quest = MainQuest.find(params[:id])

    render json: @main_quest.to_json(
      only: %i[id name short_description description],
      include: [
        campaign: { only: %i[id name] },
        quests: { only: %i[id name description] }
      ]
    )
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @main_quest = @campaign.main_quests.create(main_quest_params)
    redirect_to campaign_path(@campaign)
  end

  def update
    @main_quest = MainQuest.find(params[:id])
    @campaign = @main_quest.campaign

    update_successful = @main_quest.update(main_quest_params)
    flash.alert = 'Main Quest edit failed.' unless update_successful

    redirect_to @campaign
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


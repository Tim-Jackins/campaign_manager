class DungeonsController < ApplicationController
  def show
    @dungeon = Dungeon.find(params[:id])

    render json: @quest.to_json(
      only: %i[id name rooms],
      include: [
        :encounter
      ]
    )
  end

  def create
    @dungeon = @encounter.dungeons.create(dungeon_params)
    @campaign = @dungeon.dungeonable.campaign
    redirect_to campaign_path(@campaign)
  end

  def update
    puts params
    @dungeon = Dungeon.find(params[:id])
    @campaign = Campaign.find(params[:campaign_id])

    update_successful = @dungeon.update(dungeon_params)
    flash.alert = 'Dungeon edit failed.' unless update_successful

    redirect_to @campaign
  end

  # def destroy
  #   @main_quest = MainQuest.find(params[:main_quest_id])
  #   @campaign = @main_quest.campaign
  #   @quest = @main_quest.quests.find(quest_params)
  #   @quest.destroy
  #   redirect_to campaign_path(@campaign)
  # end

  private

  def dungeon_params
    params.require(:dungeon).permit(
      :name,
      :rooms
    )
  end
end

class QuestsController < ApplicationController
  def show
    @quest = Quest.find(params[:id])

    # @this_shit = {
    #   id: 2,
    #   name: 'Trip to Sharp-peak mine',
    #   level: 1,
    #   description: 'There is work available at Sharp-peak mine. Meishir asks characters to meet Thelmond in Sharp-peak mine office. When characters have completed the task at Sharp-peak mine Meishir asks characters to meet him again in Farcross.',
    #   reward: '200 xp'
    # }

    # render json: @this_shit.to_json()

    render json: @quest.to_json(
      only: %i[id name level description reward],
      include: [
        :questable,
        :main_quest
      ]
    )
  end

  def create
    puts params
    @main_quest = MainQuest.find(params[:main_quest_id])
    @campaign = @main_quest.campaign
    @quest = @main_quest.quests.create(quest_params)
    redirect_to campaign_path(@campaign)
  end

  def update
    @quest = Quest.find(params[:id])
    @campaign = @quest.questable.campaign

    update_successful = @quest.update(quest_params)
    flash.alert = 'Quest edit failed.' unless update_successful

    redirect_to @campaign
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

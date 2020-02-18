class QuestsController < ApplicationController
  def show
    @quest = Quest.find(params[:id])

    render json: @quest.to_json(
      only: %i[id name level description reward],
      include: [
        :questable,
        :main_quest
      ]
    )
  end

  def edit
    @quest = Quest.find(params[:id])
    @dungeon = @quest.dungeon
    @campaign = @quest.main_quest.campaign

    render 'edit.html.erb'
  end

  def create
    puts params
    @main_quest = MainQuest.find(params[:main_quest_id])
    @campaign = @main_quest.campaign
    @quest = @main_quest.quests.create(quest_params)
    @dungeon = Dungeon.new(name: @quest.name, dungeonable: @quest)
    @dungeon.save
    redirect_to campaign_path(@campaign)
  end

  def update
    @quest = Quest.find(params[:id])
    @campaign = @quest.main_quest.campaign

    update_successful = @quest.update(quest_params)
    flash.alert = 'Quest edit failed.' unless update_successful

    redirect_to @campaign
  end

  def destroy
    @main_quest = MainQuest.find(params[:main_quest_id])
    @campaign = @main_quest.campaign
    @quest = Quest.find(params[:id])
    @quest.destroy
    redirect_to campaign_path(@campaign)
  end

  private

  def quest_params
    params.require(:quest).permit(
      :name,
      :level,
      :order,
      :description,
      :reward,
      :completed
    )
  end
end

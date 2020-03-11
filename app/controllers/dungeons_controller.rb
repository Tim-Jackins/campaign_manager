class DungeonsController < ApplicationController
  def show
    @dungeon = Dungeon.find(params[:id])

    render json: @dungeon.to_json(
      only: %i[id name rooms],
      include: [
        :dungeonable
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

  def simulate
    @dungeon = Dungeon.find(params[:dungeon_id])

    respond_to do |format|
      format.html { render 'dungeons/simulator' }
    end
  end

  private

  def dungeon_params
    params.require(:dungeon).permit(
      :name,
      :rooms
    )
  end
end

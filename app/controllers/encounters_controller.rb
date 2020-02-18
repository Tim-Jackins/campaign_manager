class EncountersController < ApplicationController
  def show
    @encounter = Encounter.find(params[:id])

    render json: @encounter.to_json(
      only: %i[id name level type reward description completed],
      include: [
        :campaign
      ]
    )
  end

  def edit
    @encounter = Encounter.find(params[:id])
    @dungeon = @encounter.dungeon
    @campaign = @encounter.campaign
  end

  def create
    puts params
    @campaign = Campaign.find(params[:campaign_id])
    @encounterable  = if params[:encounter][:location_or_building] == 'building' # rubocop:disable Layout/ExtraSpacing, Layout/SpaceAroundOperators
                        Building.find(params[:encounter][:encounterable_id])
                      else
                        Location.find(params[:encounter][:encounterable_id])
                      end
    @encounter = @campaign.encounters.create(encounter_params)
    @encounter.update(encounterable: @encounterable)
    @dungeon = Dungeon.new(name: @encounter.name, dungeonable: @encounter)
    @dungeon.save()
    redirect_to campaign_path(@campaign)
  end

  def update
    @encounter = Encounter.find(params[:id])
    @campaign = @encounter.campaign

    if @encounter.update(encounter_params)
      redirect_to @campaign
    else
      render 'edit'
    end
  end

  def destroy
    @encounter = Encounter.find(params[:id])
    @campaign = @encounter.campaign
    @encounter.destroy
    redirect_to campaign_path(@campaign)
  end

  private

  def encounter_params
    params.require(:encounter).permit(
      :name,
      :level,
      :type,
      :reward,
      :description,
      :completed
    )
  end
end

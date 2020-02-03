class BuildingsController < ApplicationController
  def show
    @building = Building.find(params[:id])

    render json: @building.to_json(
      only: %i[id name description],
      include: [
        location: { only: %i[id name] }
      ]
    )
  end

  def create
    puts params
    @location = Location.find(params[:location_id])
    @campaign = @location.campaign
    @building = @location.buildings.create(building_params)
    redirect_to campaign_path(@campaign)
  end

  def update
    @building = Building.find(params[:id])
    @campaign = @building.location.campaign

    update_successful = @building.update(building_params)
    flash.alert = 'Building edit failed.' unless update_successful

    redirect_to @campaign
  end

  def destroy
    @location = Location.find(params[:location_id])
    @campaign = @location.campaign
    @building = @location.buildings.find(params[:id])
    @building.destroy
    redirect_to campaign_path(@campaign)
  end

  private

  def building_params
    params.require(:building).permit(:name, :description)
  end
end

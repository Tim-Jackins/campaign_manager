class BuildingsController < ApplicationController
  def create
    puts params
    @location = Location.find(params[:location_id])
    @campaign = @location.campaign
    @building = @location.buildings.create(building_params)
    redirect_to campaign_path(@campaign)
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @building = @campaign.buildings.find(params[:id])
    @building.destroy
    redirect_to campaign_path(@campaign)
  end

  private

  def building_params
    params.require(:building).permit(:name, :description)
  end
end
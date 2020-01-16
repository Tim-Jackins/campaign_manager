class LocationsController < ApplicationController
  def create
    @campaign = Campaign.find(params[:campaign_id])
    @location = @campaign.locations.create(location_params)
    redirect_to campaign_path(@campaign)
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @location = @campaign.locations.find(params[:id])
    @location.destroy
    redirect_to campaign_path(@campaign)
  end

  private

  def location_params
    params.require(:location).permit(
      :name,
      :short_description,
      :description,
      :is_natural,
      :image_link
    )
  end
end

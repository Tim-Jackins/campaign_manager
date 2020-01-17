class LocationsController < ApplicationController
  # def index
  #   @locations = Location.all
  #   # render json: json_format(@locations)
  #   respond_to do |format|
  #     format.json
  #     render partial: 'locations/index.json'
  #   end
  # end

  def show
    @location = Location.find(params[:id])

    render json: @location.to_json(
      only: %i[id name short_description description image_link],
      include: [campaign: { only: %i[id name] }]
    )
  end

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
      :image_link
    )
  end
end

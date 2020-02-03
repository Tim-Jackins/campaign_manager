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
      include: [
        campaign: { only: %i[id name] },
        buildings: { only: %i[id name description] }
        # encounters: { only: %i[id name description] }
      ]
    )
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @location = @campaign.locations.create(location_params)
    redirect_to campaign_path(@campaign)
  end

  def update
    @location = Location.find(params[:id])
    @campaign = @location.campaign

    update_successful = @location.update(location_params)
    flash.alert = 'Location edit failed.' unless update_successful

    redirect_to @campaign
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

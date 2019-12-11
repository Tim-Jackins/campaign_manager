require 'json'

class CreaturesController < ApplicationController
  def index
    # @creatures = Creature.all
  end

  def show
    @creature = Creature.find(params[:id])
  end

  def new
    @creature = Creature.new
    @default_base_url = Rails.application.config.dnd_base_url
    @alignment_choices = AlignmentChoice.pluck('name')
    @damage_types = DamageType.pluck('name')
    @conditions = Condition.pluck('name')
    @languages = Language.pluck('name')
    @ability_scores = AbilityScore.pluck('full_name')
    @skills = Skill.pluck('name')

    challenge_ratings_json = ChallengeRating.all.to_json(only: [:rating, :xp])
    @challenge_ratings = JSON.parse(challenge_ratings_json)

    @default_path = 'monsters'
  end

  # def edit
  #   @campaign = Campaign.find(params[:id])
  # end

  def create
    puts params
    @creature = Creature.new(creature_params)
    # @creature.path = 'monsters/'

    # if @creature.save
    #   redirect_to @creature
    # else
    #   render 'new'
    # end
  end

  # def update
  #   @campaign = Campaign.find(params[:id])

  #   if @campaign.update(campaign_params)
  #     redirect_to @campaign
  #   else
  #     render 'edit'
  #   end
  # end

  # def destroy
  #   @campaign = Campaign.find(params[:id])
  #   @campaign.destroy

  #   redirect_to campaign_path
  # end

  # private

  def creature_params
    params.require(:creature).permit(
      :api_id,
      :api_index,
      :path,
      :base_url,
      :current_hp,
      :creature_info,
      :custom_creature_info,
      :fof
    )
  end
end

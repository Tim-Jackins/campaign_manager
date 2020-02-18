class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    # @ability_scores = JSON.parse(AbilityScore.all.to_json)
    # skill_to_ability_score = {}
    # Skill.all.each do |skill|
    #   skill_to_ability_score[skill.name] = skill.ability_score.name
    # end
    # @skill_to_ability_score = skill_to_ability_score

    # rating_to_xp = {}
    # ChallengeRating.all.each do |challenge_rating|
    #   rating_to_xp[challenge_rating.rating] = challenge_rating.xp
    # end
    # @rating_to_xp = rating_to_xp
  end

  def search
    puts params['name']
    @item = Item.find_by(name: params['name'])
    if @item
      render json: @item.to_json
    else
      render json: 'Nothing found'.to_json
    end
  end
end

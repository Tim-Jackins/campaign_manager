require 'json'

class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
  end

  def show
    @creature = Creature.find(params[:id])
    @ability_scores = JSON.parse(AbilityScore.all.to_json)
    skill_to_ability_score = {}
    Skill.all.each do |skill|
      skill_to_ability_score[skill.name] = skill.ability_score.name
    end
    @skill_to_ability_score = skill_to_ability_score

    rating_to_xp = {}
    ChallengeRating.all.each do |challenge_rating|
      rating_to_xp[challenge_rating.rating] = challenge_rating.xp
    end
    @rating_to_xp = rating_to_xp
  end

  def new
    @creature = Creature.new

    @default_base_url = Rails.application.config.dnd_base_url + 'monsters'
    @alignment_choices = AlignmentChoice.pluck('name')
    @damage_types = DamageType.pluck('name')
    @conditions = Condition.pluck('name')
    @languages = Language.pluck('name')
    @ability_scores = AbilityScore.pluck('full_name')
    @skills = Skill.pluck('name')

    challenge_ratings_json = ChallengeRating.all.to_json(only: [:rating, :xp])
    @challenge_ratings = JSON.parse(challenge_ratings_json)
  end

  def edit
    @creature = Creature.find(params[:id])

    @default_base_url = Rails.application.config.dnd_base_url + 'monsters'
    @alignment_choices = AlignmentChoice.pluck('name')
    @damage_types = DamageType.pluck('name')
    @conditions = Condition.pluck('name')
    @languages = Language.pluck('name')
    @ability_scores = AbilityScore.pluck('full_name')
    @skills = Skill.pluck('name')

    challenge_ratings_json = ChallengeRating.all.to_json(only: [:rating, :xp])
    @challenge_ratings = JSON.parse(challenge_ratings_json)
  end

  def create
    @creature = Creature.new(creature_params)
    @creature.languages = params['creature']['languages'][1..-1].join(', ')
    @creature.damage_vulnerabilities = params['creature']['damage_vulnerabilities'][1..-1].join(', ')
    @creature.damage_resistances = params['creature']['damage_resistances'][1..-1].join(', ')
    @creature.damage_immunities = params['creature']['damage_immunities'][1..-1].join(', ')
    @creature.condition_immunities = params['creature']['condition_immunities'][1..-1].join(', ')
    @creature.skills = params['creature']['skills'][1..-1].join(', ')

    if @creature.save
      redirect_to @creature
    else
      @default_base_url = Rails.application.config.dnd_base_url + 'monsters'
      @alignment_choices = AlignmentChoice.pluck('name')
      @damage_types = DamageType.pluck('name')
      @conditions = Condition.pluck('name')
      @languages = Language.pluck('name')
      @ability_scores = AbilityScore.pluck('full_name')
      @skills = Skill.pluck('name')

      challenge_ratings_json = ChallengeRating.all.to_json(only: [:rating, :xp])
      @challenge_ratings = JSON.parse(challenge_ratings_json)
      render 'new'
    end
  end

  def update
    @creature = Creature.find(params[:id])
    @creature.languages = params['creature']['languages'][1..-1].join(', ')
    @creature.damage_vulnerabilities = params['creature']['damage_vulnerabilities'][1..-1].join(', ')
    @creature.damage_resistances = params['creature']['damage_resistances'][1..-1].join(', ')
    @creature.damage_immunities = params['creature']['damage_immunities'][1..-1].join(', ')
    @creature.condition_immunities = params['creature']['condition_immunities'][1..-1].join(', ')
    @creature.skills = params['creature']['skills'][1..-1].join(', ')

    if @creature.update(creature_params)
      redirect_to @creature
    else
      @default_base_url = Rails.application.config.dnd_base_url + 'monsters'
      @alignment_choices = AlignmentChoice.pluck('name')
      @damage_types = DamageType.pluck('name')
      @conditions = Condition.pluck('name')
      @languages = Language.pluck('name')
      @ability_scores = AbilityScore.pluck('full_name')
      @skills = Skill.pluck('name')

      challenge_ratings_json = ChallengeRating.all.to_json(only: [:rating, :xp])
      @challenge_ratings = JSON.parse(challenge_ratings_json)
      render 'edit'
    end
  end

  def destroy
    @creature = Creature.find(params[:id])
    @creature.destroy

    redirect_to(creatures_path)
  end

  private

  def creature_params
    params.require(:creature).permit(
      :fof,
      :name,
      :size,
      :body_type,
      :tag,
      :alignment,

      :armor_class,
      :armor_name,
      :hit_points,
      :hit_dice,

      :speed,
      :burrow_speed,
      :climb_speed,
      :fly_speed,
      :swim_speed,

      :strength,
      :dexterity,
      :constitution,
      :intelligence,
      :wisdom,
      :charisma,

      :strength_save,
      :dexterity_save,
      :constitution_save,
      :intelligence_save,
      :wisdom_save,
      :charisma_save,

      :damage_vulnerabilities,
      :damage_resistances,
      :damage_immunities,
      :condition_immunities,

      :blindsight,
      :darkvision,
      :tremorsense,
      :truesight,
      :telepathy,

      :challenge_rating,

      :skills,
      :languages,

      :spells_json,
      :actions_json,
      :special_abilities_json,
      :reactions_json,
      :legendary_desc,
      :legendary_actions_json
    )
  end
end

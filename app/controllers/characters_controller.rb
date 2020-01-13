class CharactersController < ApplicationController
  def index
    @current_user = current_user
    if @current_user.nil?
      flash[:warning] = "You don't appear to be logged in."
      redirect '/'
    else
      @characters = @current_user.characters.all
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    puts params
  end

  private

  def character_params
    params.require(:character).permit(
      :name,
      # :classes
      :background,
      :player_name,
      :race,
      :alignment,
      :xp,
      :strength,
      :dexterity,
      :constitution,
      :wisdom,
      :intelligence,
      :charisma,
      :strength_save,
      :dexterity_save,
      :constitution_save,
      :wisdom_save,
      :intelligence_save,
      :charisma_save,
      :inspiration,
      :proficiency_bonus,
      :armor_class,
      :initiative,
      :speed,
      :hp_max,
      :current_hp,
      :temporary_hp,
      :hit_dice,
      :death_saves_success,
      :death_saves_failure,
      :attack_json,
      :attack_desc,
      :proficiency_language_desc,
      :copper_pieces,
      :silver_pieces,
      :electrum_pieces,
      :gold_pieces,
      :platinum_pieces,
      :features_traits,
      :features_traits_desc
      # t.integer :spells
    )
  end
end

require 'json'

proficiency_language_desc = <<HEREDOC
**Proficiencies:** simple melee weapons.

**Languages:** Common, Draconic.
HEREDOC

features_traits_desc = <<HEREDOC
These are some other features that I have.
HEREDOC

temp_user = User.find_by(username: 'tim_jackins')
temp_alignment = AlignmentChoice.find_by(name: 'True Neutral')

user_character = Character.create(
  creator: temp_user,
  name: 'Barakas Obamadaous',
  background: 'Wanderer',
  player_name: 'John Snow',
  race: 'Human',
  alignment: temp_alignment,
  xp: 200,
  strength: 14,
  dexterity: 16,
  constitution: 12,
  wisdom: 14,
  intelligence: 11,
  charisma: 8,
  strength_save: false,
  dexterity_save: false,
  constitution_save: true,
  wisdom_save: false,
  intelligence_save: false,
  charisma_save: true,
  inspiration: false,
  proficiency_bonus: 2,
  armor_class: 16,
  initiative: 2,
  speed: 30,
  hp_max: 16,
  current_hp: 9,
  temporary_hp: 0,
  hit_dice: '3d8',
  death_saves_success: 1,
  death_saves_failure: 0,
  attack_json: JSON.dump({ Parry: 'You can do a parry attack.' }),
  attack_desc: 'I make attacks',
  proficiency_language_desc: proficiency_language_desc,
  copper_pieces: 24,
  silver_pieces: 25,
  electrum_pieces: 23,
  gold_pieces: 34,
  platinum_pieces: 0,
  features_traits: JSON.dump({ Darkvision: '30ft' }),
  features_traits_desc: features_traits_desc
)

user_character.char_classes.create(name: 'Druid', level: 4)
user_character.char_classes.create(name: 'Rogue', level: 7)

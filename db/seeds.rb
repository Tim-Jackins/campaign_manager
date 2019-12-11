require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.delete_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

seed_path = File.join(Rails.root, 'db', 'seeds') + '/'

Skill.delete_all
AbilityScore.delete_all

ability_score_seed_path = seed_path + 'ability_scores.seeds.rb'
load ability_score_seed_path

skill_seed_path = seed_path + 'skills.seeds.rb'
load skill_seed_path

DamageType.delete_all

damage_types = %w[
  Acid
  Bludgeoning
  Cold
  Fire
  Force
  Lightning
  Necrotic
  Piercing
  Poison
  Psychic
  Radiant
  Slashing
  Thunder
]

damage_types.each do |type|
  DamageType.create!(name: type)
end

AlignmentChoice.delete_all

# CITATION
# Seed data from http://easydamus.com/alignment.html
alignment_choices = {
  'Lawful Good' => 'A lawful good character acts as a good person is expected or required to act. He combines a commitment to oppose evil with the discipline to fight relentlessly. He tells the truth, keeps his word, helps those in need, and speaks out against injustice. A lawful good character hates to see the guilty go unpunished.',
  'Neutral Good' => 'A neutral good character does the best that a good person can do. He is devoted to helping others. He works with kings and magistrates but does not feel beholden to them.',
  'Chaotic Good' => "A chaotic good character acts as his conscience directs him with little regard for what others expect of him. He makes his own way, but he's kind and benevolent. He believes in goodness and right but has little use for laws and regulations. He hates it when people try to intimidate others and tell them what to do. He follows his own moral compass, which, although good, may not agree with that of society.",
  'Lawful Neutral' => 'A lawful neutral character acts as law, tradition, or a personal code directs her. Order and organization are paramount to her. She may believe in personal order and live by a code or standard, or she may believe in order for all and favor a strong, organized government.',
  'True Neutral' => "A neutral character does what seems to be a good idea. She doesn't feel strongly one way or the other when it comes to good vs. evil or law vs. chaos. Most neutral characters exhibit a lack of conviction or bias rather than a commitment to neutrality. Such a character thinks of good as better than evil-after all, she would rather have good neighbors and rulers than evil ones. Still, she's not personally committed to upholding good in any abstract or universal way.",
  'Chaotic Neutral' => "A chaotic neutral character follows his whims. He is an individualist first and last. He values his own liberty but doesn't strive to protect others' freedom. He avoids authority, resents restrictions, and challenges traditions. A chaotic neutral character does not intentionally disrupt organizations as part of a campaign of anarchy. To do so, he would have to be motivated either by good (and a desire to liberate others) or evil (and a desire to make those different from himself suffer). A chaotic neutral character may be unpredictable, but his behavior is not totally random. He is not as likely to jump off a bridge as to cross it.",
  'Lawful Evil' => 'A lawful evil villain methodically takes what he wants within the limits of his code of conduct without regard for whom it hurts. He cares about tradition, loyalty, and order but not about freedom, dignity, or life. He plays by the rules but without mercy or compassion. He is comfortable in a hierarchy and would like to rule, but is willing to serve. He condemns others not according to their actions but according to race, religion, homeland, or social rank. He is loath to break laws or promises.',
  'Neutral Evil' => "A neutral evil villain does whatever she can get away with. She is out for herself, pure and simple. She sheds no tears for those she kills, whether for profit, sport, or convenience. She has no love of order and holds no illusion that following laws, traditions, or codes would make her any better or more noble. On the other hand, she doesn't have the restless nature or love of conflict that a chaotic evil villain has.",
  'Chaotic Evil' => 'A chaotic evil character does whatever his greed, hatred, and lust for destruction drive him to do. He is hot-tempered, vicious, arbitrarily violent, and unpredictable. If he is simply out for whatever he can get, he is ruthless and brutal. If he is committed to the spread of evil and chaos, he is even worse. Thankfully, his plans are haphazard, and any groups he joins or forms are poorly organized. Typically, chaotic evil people can be made to work together only by force, and their leader lasts only as long as he can thwart attempts to topple or assassinate him.'
}

alignment_choices.each do |name,desc|
  AlignmentChoice.create!(name: name, desc: desc)
end

Condition.delete_all

# CITATION
# Seed data from https://roll20.net/compendium/dnd5e/Conditions#content
conditions = {
  'Blinded' => "A blinded creature can't see and automatically fails any ability check that requires sight. Attack rolls against the creature have advantage, and the creature's Attack rolls have disadvantage.",
  'Charmed' => "A charmed creature can't Attack the charmer or target the charmer with harmful Abilities or magical Effects. The charmer has advantage on any ability check to interact socially with the creature.",
  'Deafened' => "A deafened creature can't hear and automatically fails any ability check that requires hearing.",
  'Fatigued' => 'See Exhaustion.',
  'Frightened' => "A frightened creature has disadvantage on Ability Checks and Attack rolls while the source of its fear is within line of sight. The creature can't willingly move closer to the source of its fear.",
  'Grappled' => "A grappled creature's speed becomes 0, and it can't benefit from any bonus to its speed. The condition ends if the Grappler is incapacitated (see the condition). The condition also ends if an effect removes the grappled creature from the reach of the Grappler or Grappling effect, such as when a creature is hurled away by the Thunderwave spell.",
  'Incapacitated' => "An incapacitated creature can't take Actions or reactions.",
  'Invisible' => "An invisible creature is impossible to see without the aid of magic or a Special sense. For the purpose of Hiding, the creature is heavily obscured. The creature's location can be detected by any noise it makes or any tracks it leaves. Attack rolls against the creature have disadvantage, and the creature's Attack rolls have advantage.",
  'Paralyzed' => "A paralyzed creature is incapacitated (see the condition) and can't move or speak. The creature automatically fails Strength and Dexterity Saving Throws. Attack rolls against the creature have advantage. Any Attack that hits the creature is a critical hit if the attacker is within 5 feet of the creature.",
  'Petrified' => "A petrified creature is transformed, along with any nonmagical object it is wearing or carrying, into a solid inanimate substance (usually stone). Its weight increases by a factor of ten, and it ceases aging. The creature is incapacitated (see the condition), can't move or speak, and is unaware of its surroundings. Attack rolls against the creature have advantage. The creature automatically fails Strength and Dexterity Saving Throws. The creature has Resistance to all damage. The creature is immune to poison and disease, although a poison or disease already in its system is suspended, not neutralized.",
  'Poisoned' => 'A poisoned creature has disadvantage on Attack rolls and Ability Checks.',
  'Prone' => "A prone creature's only Movement option is to crawl, unless it stands up and thereby ends the condition. The creature has disadvantage on Attack rolls. An Attack roll against the creature has advantage if the attacker is within 5 feet of the creature. Otherwise, the Attack roll has disadvantage.",
  'Restrained' => "A restrained creature's speed becomes 0, and it can't benefit from any bonus to its speed. Attack rolls against the creature have advantage, and the creature's Attack rolls have disadvantage. The creature has disadvantage on Dexterity Saving Throws.",
  'Stunned' => "A stunned creature is incapacitated (see the condition), can't move, and can speak only falteringly. The creature automatically fails Strength and Dexterity Saving Throws. Attack rolls against the creature have advantage.",
  'Unconscious' => "An unconscious creature is incapacitated (see the condition), can't move or speak, and is unaware of its surroundings. The creature drops whatever it's holding and falls prone. The creature automatically fails Strength and Dexterity Saving Throws. Attack rolls against the creature have advantage. Any Attack that hits the creature is a critical hit if the attacker is within 5 feet of the creature.",
  'Exhaustion' => "Some Special Abilities and environmental Hazards, such as starvation and the long-­term Effects of freezing or scorching temperatures, can lead to a Special condition called exhaustion. Exhaustion is measured in six levels. An effect can give a creature one or more levels of exhaustion, as specified in the effect's description.\nExhaustion Effects Level Effect\n1 	Disadvantage on Ability Checks\n2 	Speed halved\n3 	Disadvantage on Attack rolls and Saving Throws\n4 	Hit point maximum halved\n5 	Speed reduced to 0\n6 	Death\nIf an already exhausted creature suffers another effect that causes exhaustion, its current level of exhaustion increases by the amount specified in the effect's description. A creature suffers the effect of its current level of exhaustion as well as all lower levels. For example, a creature suffering level 2 exhaustion has its speed halved and has disadvantage on Ability Checks. An effect that removes exhaustion reduces its level as specified in the effect's description, with all exhaustion Effects ending if a creature's exhaustion level is reduced below 1. Finishing a Long Rest reduces a creature's exhaustion level by 1, provided that the creature has also ingested some food and drink."
}

conditions.each do |name, desc|
  Condition.create!(name: name, desc: desc)
end

Language.delete_all

# CITATION
# Seed data from https://5elanguages.com/
languages = [
  # Name           Script       Typical Speakers
  ['Abyssal',     'Infernal',  'Demons, chaotic evil outsiders'],
  ['Aquan',       'Elvish',    'Water-based creatures'],
  ['Auran',       'Draconic',  'Air-based creatures'],
  ['Celestial',   'Celestial', 'Celestials (angels, devas)'],
  ['Common',      'Common',    'Humans, halflings, half-elves, half-orcs'],
  ['Deep Speech', 'None',      'Mind flayers, beholders'],
  ['Draconic',    'Draconic',  'Kobolds, troglodytes, lizardfolk, dragons, dragonborn'],
  ['Druidic',     'Druidic',   'Druids (only)'],
  ['Dwarvish',    'Dwarvish',  'Dwarves'], # rubocop:disable Style/WordArray
  ['Elvish',      'Elvish',    'Elves'], # rubocop:disable Style/WordArray
  ['Giant',       'Dwarvish',  'Ogres, giants'],
  ['Gnomish',     'Dwarvish',  'Gnomes'], # rubocop:disable Style/WordArray
  ['Goblin',      'Dwarvish',  'Goblinoids, hobgoblins, bugbears'],
  ['Gnoll',       'Common',    'Gnolls'], # rubocop:disable Style/WordArray
  ['Halfling',    'Common',    'Halflings'], # rubocop:disable Style/WordArray
  ['Ignan',       'Draconic',  'Fire-based creatures'],
  ['Infernal',    'Infernal',  'Devils, Tieflings'],
  ['ORC',         'Dwarvish',  'Orcs'], # rubocop:disable Style/WordArray
  ['Primordial',  'Dwarvish',  'Elementals'], # rubocop:disable Style/WordArray
  ['Sylvan',      'Elvish',    'Fey creatures (dryads, brownies, leprechauns)'],
  ['Terran',      'Dwarven',   'Xorns and other earth-based creatures'],
  ['Undercommon', 'Elvish',    'Drow, Underdark traders']
]

languages.each do |language|
  Language.create!(name: language[0], script: language[1], typical_speakers: language[2])
end

ChallengeRating.delete_all

challenge_ratings = [
  ['0',   10],
  ['1/8', 25],
  ['1/4', 50],
  ['1/2', 100],
  ['1',   200],
  ['2',   450],
  ['3',   700],
  ['4',   1_100],
  ['5',   1_800],
  ['6',   2_300],
  ['7',   2_900],
  ['8',   3_900],
  ['9',   5_000],
  ['10',  5_900],
  ['17',  18_000]
]

challenge_ratings.each do |rating|
  ChallengeRating.create!(rating: rating[0], xp: rating[1])
end

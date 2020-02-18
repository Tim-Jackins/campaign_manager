require 'json'

temp_user = User.find_by(username: 'tim_jackins')

# Campaign has been created by Terhonator.

general_information = "
Guidelines for Frostglade Tundra campaign:

* Campaign uses mechanics of fifth edition of Dungeons & Dragons.
* Three people is needed for this campaign: Gamemaster and two players.
* Gamemaster and players need only this document and D&D Basic Rules. D&D Basic Rules document is available for free online.
* Campaign is designed and written as first adventure for two new players.
* Campaign can be played with more than two characters but gamemaster have to rescale combat encounters and quest rewards for more players.
* All quest locations are in Frostglade Tundra. (Location-based campaign)
* This questbook contains quests and dungeons for levels 1-4. All quests and dungeons can be scaled up or down by little changes.
* Campaign focuses heavily on combat encounters.
* Combat encounters are designed and written for two characters. XP thresholds are scaled between \"easy\" and \"medium\" difficulty on levels 1-3. On level 4 XP thresholds are scaled between \"medium\" and \"hard\".
* Map of Frostglade Tundra is updated with more locations when players learn more about the area.

**Copyright stuff:**

* Frostglade Tundra is unofficial Fan Content permitted under the Fan Content Policy. Not approved / endorsed by Wizards. Portions of the materials used are property of Wizards of the Coast. © Wizards of the Coast LLC.
* All texts are written by Terhonator using Homebrewery.
* Map of Frostglade Tundra is created by Terhonator using Inkarnate.
"

regional_information = "
> Campaign uses Forgotten Realms setting.

**Location and size:** Frostglade Tundra is located on planet of Toril on continent of Faerun. Frostglade Tundra is located in north part of Vaasa region between Tortured Land and Great Glacier.

**Environment:** Frostglade Tundra has arctic climate. Current season is winter and area is covered by snow. Frostglade Tundra is at 500 meters above sea level and there are no tall trees or forests. River at south is flowing but all lakes have thick layer of ice.

**Population:** Frostglade Tundra has about 4000 inhabitants. Most common races in Frostglade Tundra are dwarves, (42 %) humans, (38 %) orcs (12 %) and half-orcs. (6 %) Other races are minorities. (2 %) On Frostglade Tundra many orcs have adapted to live peacefully with other races.

**History:** 1460 DR was important year in history of Frostglade Tundra. Thousands of people traveled to frozen north when bloodstone and other gems were found in large quanities. Everyone wanted their share of gems and locals call that time \"diamond rush\". Town of Farcross was founded same year to serve miners and their families. Current year is 1479 DR.

**Commerce:** There are four important mining regions with many small mines at Frostglade Tundra. Farcross is only town in region. Main exports are gems, especially bloodstones. Most of the mining products are exported to city of Telos. Main imports are cereals, vegetables and mining equipment.

**Government:** Farcross serves as vassal of Telos. (Feudalism)

**Religion:** Local dwarves serve Dumathoin. A small temple is dedicated to Dumathoin in Farcross.

**Magic:** Frostglade Tundra is low-magic environment and most humanoids act as fighters or rangers in combat.
"

backstory = "
> Use this backstory to bind characters to Frostglade Tundra.

## Region related factions

**Vaasa Traders:** is group of businessmen who are improving trade in Vaasa region.

**Fist of Law:** is local militia that defends towns and mines of the region.

**Stone Axe Horde:** is group of bloodthirsty humanoids such as goblins, gnolls and ogres.

**Bulls Gang:** is organized criminal group of ruthless humans.

## Combat Tutorial for new players (Optional)

1. Each player chooses one of the premade characters. You find these from chapter 1.6 (Premade Characters) of this document.
2. Use event \"Training battle (Level 1)\" as part of this tutorial. Gamemaster finds it from chapter 3.3 (Events, Farcross) of this document. Characters can't die during tutorial quest.
# 3. After tutorial players can continue with selected character, modify current character, select another premade character or create new character. All earned XP is transfered to new character.

# ## Prologue (After tutorial)

# You have arrived to town of Farcross. Cold wind blows. You have come to Farcross to work for Vaasa Traders. Mining business is booming and workforce is needed on Frostglade Tundra. You should meet Meishir at Vaasa Traders office to begin your work.
"

rules = "
> These rules combine homebrew rules with original ones. Use of these rules is optional.

## Orcs

* On Frostglade Tundra many orcs have adapted to live peacefully with other races.

## Ability Score Increase variant

All non-human races without negative ability score modifiers can increase one ability score by 1 if one of the ability scores is decreased by 2. However, maximum total bonus is restricted to 2.

### Examples

1. Hill Dwarf can increase its Wisdom score by 1 if one of the ability scores is decreased by 2.
2. Mountain Dwarf can't increase its Strength score because maximum total bonus is restricted to 2.
3. High Elf can increase its Intelligence score by 1 if one of the ability scores is decreased by 2. However, High Elf can't increase its Dexterity score because maximum total bonus is restricted to 2.

Potion of Healing

* Characters find much more Potion of Healings than normal.
* Potion of Healing rarity is common.
* Potion of Healing heals 1d6+1 hitpoints per level of character.
* Characters can buy Potion of Healing from alchemy shops. Price is 1 gp per level of character.
* Example1: Level 3 character drinks a Potion of Healing. Potion heals 3d6+3 hit points.
* Example2: Level 3 character buys a Potion of Healing. Cost of potion is 3 gp.
"

notes = 'We are on the third campaign.'

frostglade_tundra = Campaign.create(
  creator: temp_user,
  name: 'Frostglade Tundra',
  general_information: general_information,
  regional_information: regional_information,
  backstory: backstory,
  rules: rules,
  notes: notes
)

farcross = Location.create(
  name: 'Farcross',
  short_description: 'A town of 3000 inhabited by Humans, Half-orcs, and Dwarves.',
  description: "Town of Farcross has has about 3000 inhabitants.\n\nFarcross is located on hill and is surrounded by natural cliffs. There are four guarded entrances to town.\n\nAll houses are recently built wooden houses.",
  campaign: frostglade_tundra
)
farcross_buildings = {
  'Marketplace' => 'is located in middle of town. Dunolynn (Dwarf, female) sells vegetables. Erbon (Human, male) sells cheese. Fosm (Human, female) sells bread. Gimdir (Dwarf, male) sells mining equipment. Hurani (Half-orc, female) sells fish. Kramrig (Dwarf, male) sells ale in barrels. Laslyn (Dwarf, female) sells meat.',
  'Trusted Tankard' => 'is tavern for lower class clients. Trusted Tankard is run by Huromira. (Half-orc, female)',
  'Pork & Fork' => 'is tavern for middle class clients. Most of the clients are dwarves. Pork & Fork is run by Nasmura (Dwarf, female)',
  'Salty Salmon' => 'is tavern for middle class clients. Most of the clients are humans. Salty Salmon is run by Digre. (Human, female)',
  'Friendly Fox' => 'is large inn with many types of rooms available. Friendly Fox is hosted by Hjoldor (Dwarf, male) and Ketmora. (Dwarf, female)',
  'Hammer & Sickle' => 'is a forge. Forge has all common metal equipment available and they can make individual items on order. Hammer & Sickle is run by Rufir. (Dwarf, male)',
  'Leather-Man' => 'is leatherworkers store. Store has all common leather equipment available and they can make individual items on order. Leather-Man is run by Gren. (Human, male)',
  'Book-Keeper' => 'is bookstore. Store has books and maps available. Book-Keeper is run by Marmyla. (Dwarf, female)',
  'Excellent Elixir' => 'is alchemy shop. Store has potions and spell ingredients for sale. Excellent Elixir is run by Zanbam (Gnome, male, alchemist)',
  'Balanced Scale' => 'is commodity exchange. Store weights, buys, sells and trades bullions, gems and currencies. Balanced Scale is run by Brayden. (Human, male)',
  'Temple' => 'is dedicated to Dumathoin. Temple offers healing services. Temple is run by Tisla. (Dwarf, female, paladin)',
  'Townhall' => 'of Farcross is administration building of Frostglade Tundra. Mayor of Farcross is Thurram Orehand. (Dwarf, male)',
  'Vaasa Traders' => 'office is run by Meishir. (Human, male, businessman)',
  'Barracks' => 'serves as headquarters for Fist of Law soldiers. Barracks is run by Gifford. (Human, male, officer)'
}
farcross_buildings.each do |name, description|
  raise 'Building failed to be save' unless Building.create(name: name, description: description, location: farcross)
end
sharppeak_mine = Location.create(
  name: 'Sharp-Peak Mine',
  short_description: 'A huge mine that yields gems.',
  description: 'Sharp-Peak Mine is huge mine that is located in north-west part of Frostglade Tundra. Sharp-Peak mine produces gems, especially bloodstones. Sharp-Peak mine office is run by Thelmond. (Dwarf, male)'
)
copperhill_mine = Location.create(
  name: 'Copperhill Mine',
  short_description: 'A small mine that yields copper.',
  description: 'Copperhill Mine is small mine that is located in north-east part of Frostglade Tundra. Copperhill mine produces copper. Copperhill mine office is run by Mashen. (Human, male)',
  campaign: frostglade_tundra
)
deeplake_mine = Location.create(
  name: 'Deeplake Mine',
  short_description: 'A recently dug mine that yields silver.',
  description: 'Deeplake Mine is recently established mine that is located in east part of Frostglade Tundra. Deeplake mine produces silver. Deeplake mine office is run by Thobek. (Dwarf, male)',
  campaign: frostglade_tundra
)
southmaw_mine = Location.create(
  name: 'Southmaw Mine',
  short_description: 'A large mine that yields gems.',
  description: 'Southmaw Mine is large mine that is located in south-west part of Frostglade Tundra. Southmaw mine produces gems. Southmaw mine office is run by Oragark. (Orc, male)',
  campaign: frostglade_tundra
)

vaasa_traders = MainQuest.create(
  name: 'Vaasa Traders',
  short_description: 'Vaasa Traders is main questline for Frostglade Tundra campaign.',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  campaign: frostglade_tundra
)

# potato_cellar = Building.find_by(name: 'Vaasa Traders').quests.create(
#   name: 'Potato cellar',
#   level: 1,
#   description: "Characters meet Meishir (Human, male, businessmen) first time at Vaasa Traders office.\n\nMeishir offers job for characters.\n\nVaasa Trader's potato cellar is infested by rats. There are some old potions in cellar and characters are allowed to take those.",
#   main_quest_id: vaasa_traders.id
# )
potato_cellar = Quest.create(
  name: 'Potato cellar',
  level: 1,
  order: 1,
  description: "Characters meet Meishir (Human, male, businessmen) first time at Vaasa Traders office.\n\nMeishir offers job for characters.\n\nVaasa Trader's potato cellar is infested by rats. There are some old potions in cellar and characters are allowed to take those.",
  reward: '10 gp and 200 xp',
  main_quest: vaasa_traders,
  completed: false,
  questable: Building.find_by(name: 'Vaasa Traders')
)
potato_cellar_rooms = [
  {
    'name' => 'Entrance',
    'environment' => 'Town, stairs down, door',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'First room',
    'environment' => 'Warehouse, two doors',
    'creatures' => [
      {
        'name' => 'Giant Rat',
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Second room',
    'environment' => 'Warehouse, shelf, potatoes',
    'creatures' => [
      {
        'name' => 'Rat',
        'count' => 4
      }
    ],
    'items' => [
      {
        'name' => 'Potion of Healing',
        'count' => 4
      }
    ],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Third room',
    'environment' => 'Warehouse, potatoes',
    'creatures' => [
      {
        'name' => 'Giant Rat',
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  }
]
Dungeon.create(
  name: 'Potato cellar',
  rooms: JSON.dump(potato_cellar_rooms),
  dungeonable: potato_cellar
)

trip_to_sharp_peak = Quest.create(
  name: 'Trip to Sharp-peak mine',
  level: 1,
  order: 2,
  description: 'There is work available at Sharp-peak mine. Meishir asks characters to meet Thelmond in Sharp-peak mine office. When characters have completed the task at Sharp-peak mine Meishir asks characters to meet him again in Farcross.',
  reward: '200 xp',
  main_quest: vaasa_traders,
  completed: false,
  questable: Building.find_by(name: 'Vaasa Traders')
)
trip_to_sharp_peak_rooms = [
  {
    'name' => 'First encounter',
    'environment' => 'Tundra, snow, road',
    'creatures' => [
      {
        'name' => 'Giant Weasel',
        'count' => 2
      }
    ],
    'items' => [],
    'notes' => ''
  },
  {
    'name' => 'Second encounter',
    'environment' => 'Tundra, snow, road',
    'creatures' => [
      {
        'name' => 'Wolf',
        'count' => 1
      }
    ],
    'items' => [],
    'notes' => ''
  },
  {
    'name' => 'Third encounter',
    'environment' => 'Tundra, snow, road',
    'creatures' => [
      {
        'name' => 'Giant Weasel',
        'count' => 2
      }
    ],
    'items' => [],
    'notes' => 'Characters receive XP reward when they arrive to Sharp-peak mine.'
  }
]
Dungeon.create(
  name: 'Trip to Sharp-peak mine',
  rooms: JSON.dump(trip_to_sharp_peak_rooms),
  dungeonable: trip_to_sharp_peak
)

training_battle = frostglade_tundra.encounters.create(
  name: 'Training battle',
  level: 1,
  description: "This is tutorial quest.\n\nGifford (Human, male, officer) has invited characters to barracks to practice combat skills with Fist of Law soldiers.",
  reward: '20gp',
  completed: false,
  encounterable: Building.find_by(name: 'Barracks')
)
training_battle_rooms = [
  {
    'name' => 'First encounter',
    'environment' => 'Town, barracks, training ground',
    'creatures' => [
      {
        'name' => 'Guard',
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Second encounter',
    'environment' => 'Town, barracks, training ground',
    'creatures' => [
      {
        'name' => 'Commoner',
        'count' => 4
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  }
]
Dungeon.create(
  name: 'Training Battle',
  rooms: JSON.dump(training_battle_rooms),
  dungeonable: training_battle
  # encounter_id: training_battle.id
)

MainQuest.first.quests.sort { |a, b| a.order <=> b.order }

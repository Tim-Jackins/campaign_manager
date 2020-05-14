require 'json'

temp_user = User.find_by(username: 'tim_jackins')

bandit = Creature.find_by(name: 'Bandit')
orc = Creature.find_by(name: 'Orc')
lizardfolk = Creature.find_by(name: 'Lizardfolk')
thug = Creature.find_by(name: 'Thug')
rat = Creature.find_by(name: 'Rat')
ogre = Creature.find_by(name: 'Ogre')
berserker = Creature.find_by(name: 'Berserker')

potion_of_healing = Item.find_by(name: 'Potion of healing')
silver_bar = Item.find_by(name: 'Silver Bar')
pike = Item.find_by(name: 'Pike')
whip = Item.find_by(name: 'Whip')

# Campaign has been created by Terhonator.

general_information = "
Guidelines for Clam Island campaign:

- Campaign uses mechanics of fifth edition of Dungeons & Dragons.
- Three people is needed for this campaign: Gamemaster and two players.
- Gamemaster and players need only this document and D&D Basic Rules. D&D Basic Rules document is available for free online.
- Campaign is designed and written as first adventure for two new players.
- Campaign can be played with more than two characters but gamemaster have to rescale combat encounters and quest rewards for more players.
- All quest locations are in Clam Island. (Location-based campaign)
- This questbook contains quests and dungeons for levels 1-4. All quests and dungeons can be scaled up or down by little changes.
- Campaign focuses heavily on combat encounters.
- Combat encounters are designed and written for two characters. XP thresholds are scaled between \"easy\" and \"medium\" difficulty on levels 1-3. On level 4 XP thresholds are scaled between \"medium\" and \"hard\".
- Map of Clam Island is updated with more locations when players learn more about the area.

**Copyright stuff:**

- Clam Island is unofficial Fan Content permitted under the Fan Content Policy. Not approved / endorsed by Wizards. Portions of the materials used are property of Wizards of the Coast. © Wizards of the Coast LLC.
- All texts are written by Terhonator using Homebrewery.
- Map of Clam Island is created by Terhonator using Inkarnate.
"
regional_information = "
> Clam Island campaign uses Forgotten Realms setting.

### Region related details

**Location and size:** Clam Island is located on planet of Toril on continent of Faerun. Clam Island is located in south-east part of Nelanther Isles. Trip from Baldur's Gate to Silverpearl takes 7 days by ship.

**Environment:** Clam Island has subtropical climate and most of the island is covered by jungle. Jungles are difficult terrain. North-west part of Clam Island is covered by swamps and mangrove forest. Clam Island has many lakes and rivers with sweet water. Clam Island has small mountains inland and cliffs along beaches. There is road between Whitestrand and Blackhollow. Characters can travel fast along beaches.

**Population:** Clam Island has about 6000 inhabitants. Most common races in Clam Island are humans, (50 %) lizardfolks, (24 %) orcs (16 %) and half-orcs. (8 %) Other races are minorities. (2 %) On Clam Island many lizardfolks and orcs have adapted to live peacefully with other races.

**History:** Clam Island has long history as an anarchy ruled by pirate lords. Silverpearl was founded 1381 DR by humans of the Sword Coast to serve as safe harbor for commercial searoutes that travel through Nelanther Isles. Current year is 1479 DR.

**Commerce:** Silverpearl is small but important harbor town between Sea of Swords and Shining Sea. Main exports are gem-quality pearls, rum and fruits. Main imports are cereals, spices and linen. Gambling and borrowing with interest are permitted and common in Clam Island.

**Government:** Clam Island serves as vassal of Baldur's Gate. (Feudalism)

**Religion:** Residents of Clam Island fear and respect Umberlee, goddess of the sea and are willing to pay tributes at Temple of Umberlee in Silverpearl.

**Magic:** Clam Island is low-magic environment and most humanoids act as fighters or rogues in combat.
"

backstory = "
Use this backstory to bind characters to Clam Island.

### Region related factions

**House of Mercenaries** is large network that conveys mercenaries all around Faerun. Most of their clients are local governments or wealthy businessmen who want to secure traderoutes.

**Bonecrushers** are organized group of ruthless bandits, pirates and barbarians of Clam Island. Bonecrushers are recognized by black bandana. Bonecrusher leaders are humans but large amounts goblins, wild orcs, wild lizardfolks and ogres serve Bonecrushers.

### Wanted-poster (Story hook)

**WANTED**

Dead or alive

Pirate captain known as \"One-eye\"

Description: Human, male, average size, dark brown skin, bald, short dark beard, black bandana, eyepatch

Member of the Bonecrushers

Wanted for multiple crimes

Contact House of Mercenaries office in Baldur's Gate

REWARD 1000 GOLD COINS

Characters have this poster in their inventory as starting equipment.

### Combat Tutorial for new players (Optional)

1. Each player chooses one of the premade characters. You find these from chapter 1.6 (Premade Characters) of this document.

2. Use event \"Training battle (Level 1)\" as part of this tutorial. Gamemaster finds it from chapter 3.4 (Events, Sea) of this document. Characters can't die during tutorial quest.

3. After tutorial players can continue with selected character, modify current character, select another premade character or create new character. All earned XP is transfered to new character.

### Prologue (After tutorial)

\"One week ago you and your companions started trip from Baldur's Gate and now you have arrived to the harbor of Silverpearl in Clam Island. Crew of the ship is preparing to extract cargo. To begin your work as a mercenary you should meet Trebirok at local House of Mercenaries office.\"
"

rules = "
> These rules combine homebrew rules with original ones. Use of these rules is optional.

## Lizardfolks and orcs

* On Clam Island many lizardfolks and orcs have adapted to live peacefully with other races.

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
clam_island = Campaign.create(
  creator: temp_user,
  name: 'Clam Island',
  general_information: general_information,
  regional_information: regional_information,
  backstory: backstory,
  rules: rules,
  notes: notes
)

# Locations

silverpearl = Location.create(
  name: 'Silverpearl',
  short_description: 'Town of Silverpearl is located in the southern part of Clam Island.',
  description: "Silverpearl has has about 3000 inhabitants. Most of the residents are humans. Houses in center of Silverpearl are upper class stone houses. Outside of of town center are lot of small wooden houses.",
  campaign: clam_island
)
silverpearl_buildings = {
  'Harbor of Silverpearl' => 'has three long piers and offers space for six large ships.',
  'Marketplace' => 'is located at middle of town. Birke (Human, female, old) sells bakery products., Duragar (Half-orc, male, butcher) sells meat., Grok (Lizardfolk, male) sells rum in barrels., Hoklah (Lizardfolk, female) sells oysters., Khelem (Human, male) sells cheese., Leilatha (Elf, female) sells linen and silk., Mart (Human, male) sells fish., Naneh (Human, female) sells fruits and vegetables., Posco (Halfling, male) sells wine.',
  'Happy Pig' => 'is tavern for lower class clients. Happy Pig is run by Onog. (Orc, male)',
  'Cracked Coconut' =>  'is tavern for middle class clients. Cracked Coconut is run by Paola. (Human, female)',
  'Red Lobster' =>  'is tavern for upper class clients. Red Lobster is run by Tisha. (Human, female)',
  'Tired Turtle' =>  'is large inn with many types of rooms available. Tired Turtle is hosted by Chasi (Human, female) and Sanrol. (Human, male)',
  'Heavy Metal' =>  'is blacksmith. Store has all common metal equipment available and individual items can be ordered. Heavy Metal is run by Opathu. (Orc, male)',
  'Leather & Lash' => 'is leatherworker. Store has all common leather equipment available and individual items can be ordered. Leather & Lash is run by Rhamed. (Human, male)',
  'Tales and Truths' => 'is bookstore. Store has books and maps available. Tales and Truths is run by Walmond. (Human, male, wizard)',
  'Poison & Remedy' => 'is alchemy shop. Store has potions and spell ingredients for sale. Poison & Remedy is run by Zesud. (Human, male)',
  'Shining Silver' => 'is jeweller. Store has silver jewelry available. Shining Silver is run by Grizzo. (Lizardfolk, male)',
  'Loan Shark' => 'is bank. Bank buys, sells, loans, changes and stores bullions, gems, currencies and other valuable items. Loan Shark is run by Marcellus. (Human, male)',
  'Temple' => 'is dedicated to Umberlee, goddess of the sea. Temple offers healing services. Temple is run by Turell (Human, male, paladin) and Darchelle. (Human, female, cleric) Will mention the lost temple of Semuanya.',
  'Townhall of Silverpearl' => 'is administration building of Clam Island. Mayor of Silverpearl is Malvin Stormbane. (Human, male)',
  'House of Mercenaries' => 'office is run by Trebirok. (Half-orc, male). There are 2 posters on the wall: 1 for the arrest dead or alive of Captain One-eye and 1 for the rescue of Sir Lorenzo (Human, male, businessman).'
}
silverpearl_buildings.each do |name, description|
  raise 'Building failed to be save' unless Building.create(name: name, description: description, location: silverpearl)
end
whitestrand = Location.create(
  name: 'Whitestrand',
  short_description: 'Village of Whitestrand is located in the western part of Clam Island.',
  description: 'Whitestrand has about 1000 inhabitants. Most of the residents are lizardfolks. Most of the houses in Whitestrand are wooden huts with palm leaf roofs.',
  campaign: clam_island
)
whitestrand_buildings = {
  'Free Wind' => 'is only tavern in village. Free Wind is run by Shraz. (Lizardfolk, female)',
  'Proud Parrot' => 'is inn with small amount of basic rooms available. Proud Parrot is run by Anekass (Lizardfolk, female) and Rhusk. (Lizardfolk, male)',
  "Sund's shop" => "Sund's shop is a general store run by Sund. (Lizardfolk, male)",
  'Wild Spirit' => 'A distillery produces rum. Wild Spirit is run by Rurza. (Lizardfolk, male)'
}
whitestrand_buildings.each do |name, description|
  raise 'Building failed to be save' unless Building.create(name: name, description: description, location: whitestrand)
end
blackhollow = Location.create(
  name: 'Blackhollow',
  short_description: 'Village of Blackhollow is located in the eastern part of Clam Island.',
  description: 'Blackhollow has about 1000 inhabitants. Most of the residents are orcs. Most of the houses in Blackhollow are wooden houses.',
  campaign: clam_island
)
blackhollow_buildings = {
  'Old Octopus' => 'is only tavern in village. Old Octopus is run by by Kurada. (Orc, female)',
  'Lucky Lantern' => 'is inn with small amount of basic rooms available. Lucky Lantern is run by Glasha (Orc, female) and Lordak. (Orc, male)',
  'Dozen Things' => 'is general store. Dozen Things is run by Maknok. (Half-orc, male)',
  'Saw & Plane' => 'is lumbermill. Lumbermill sells wooden construction materials. Saw & Plane is run by Jumag. (Orc, male)'  
}
blackhollow_buildings.each do |name, description|
  raise 'Building failed to be save' unless Building.create(name: name, description: description, location: blackhollow)
end

# Main Quests

house_of_mecenaries = MainQuest.create(
  name: 'The House of Mercenaries',
  short_description: 'House of Mercenaries is main questline for Clam Island campaign.',
  description: 'This main quest involves the characters doing quests for the house of mercenaries in order to track down one-eye the pirate.',
  campaign: clam_island
)
warehouse_at_silverpearl = Quest.create(
  name: 'Warehouse at Silverpearl',
  level: 1,
  order: 1,
  description: 'Characters meet Trebirok (Half-orc, male) first time at House of Mercenaries office. Government of Clam Island pays 2000 gold coins for House of Mercenaries when pirate captain "One-eye" is found - dead or alive. The reward is then split between the heroes who found the "One-eye" and House of Mercenaries. House of Mercenaries recruits bountyhunters to raid known Bonecrusher hideouts for small per-job rewards. Trebirok hires characters to raid a Bonecrusher warehouse in Silverpearl.',
  reward: '5 gp and 150 XP',
  main_quest: house_of_mecenaries,
  completed: false,
  questable: silverpearl
)
paper_note_from_connor = warehouse_at_silverpearl.items.create(
  name: 'Paper note from Connor',
  description: 'At table is a paper note with text "To Kelvor. Come to visit my house when you receive this message. Connor" Note is writen in common. Kelvor and Connor are human male names. Characters have to return this note to Trebirok.',
)
warehouse_at_silverpearl_rooms = [
  {
    'name' => 'Entrance',
    'environment' => 'Town, warehouse, door',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'First room, Combat',
    'environment' => 'Warehouse, wine barrels, door',
    'creatures' => [
      {
        'name' => bandit.name,
        'id' => bandit.id,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Second room',
    'environment' => 'Warehouse, wine barrels, door',
    'creatures' => [],
    'items' => [
      {
        'id' => potion_of_healing.id,
        'name' => potion_of_healing.name,
        'count' => 2,
      }
    ],
    'completed' => false,
    'notes' => 'Door to third room is locked. Roll Athletics (Strength) check, DC 10 if character tries to open the door by brute force. Roll Sleight of Hand (Dexterity) check, DC 10 if character tries to pick the lock.'
  },
  {
    'name' => 'Third room, Combat',
    'environment' => 'Warehouse, wine barrels, two doors',
    'creatures' => [
      {
        'id' => bandit.id,
        'name' => bandit.name,
        'count' => 2
      },
    ],
    'items' => [
      {
        'id' => potion_of_healing.id,
        'name' => potion_of_healing.name,
        'count' => 2,
      }
    ],
    'completed' => false,
    'notes' => 'One of the bandits prefers ranged comabat while the other prefers melee.'
  },
  {
    'name' => 'Fourth room, Combat',
    'environment' => 'Warehouse, wine barrels',
    'creatures' => [
      {
        'id' => bandit.id,
        'name' => bandit.name,
        'count' => 2
      },
    ],
    'items' => [],
    'completed' => false,
    'notes' => 'One of the bandits prefers ranged combat while the other prefers melee.'
  },
  {
    'name' => 'Fifth room',
    'environment' => 'Warehouse, table, chair',
    'creatures' => [],
    'items' => [
      {
        'id' => paper_note_from_connor.id,
        'name' => paper_note_from_connor.name,
        'count' => 1
      }
    ],
    'completed' => false,
    'notes' => 'One of the bandits prefers ranged comabat while the other prefers melee.'
  }
]
Dungeon.create(
  name: 'Warehouse at Silverpearl',
  rooms: JSON.dump(warehouse_at_silverpearl_rooms),
  dungeonable: warehouse_at_silverpearl
)
connors_house = Quest.create(
  name: "Connor's House",
  level: 1,
  order: 2,
  description: "Note contained information about Connor's house. Trebirok knows that Connor's house is located in Silverpearl. Trebirok hires characters to raid Connor's house.",
  reward: '5 gp and 150 XP',
  main_quest: house_of_mecenaries,
  completed: false,
  questable: silverpearl
)
connors_house_key = connors_house.items.create(
  name: "Connor's house key",
  description: "This key is need to progress to the fifth room in Connor's house. DC10 Perception to find.",
  quest: connors_house
)
bonecrushers_ledger = connors_house.items.create(
  name: "Bonecrusher's ledger",
  description: 'Ledger contains information about goods and deliveries. Characters have to return this ledger to Trebirok.',
  quest: connors_house
)
connors_house_rooms = [
  {
    'name' => 'Entrance',
    'environment' => 'Town, house, door',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'First room, Combat',
    'environment' => 'House, table, two benches, ale barrels, window, door',
    'creatures' => [
      {
        'name' => 'Bandit',
        'count' => 2
      }
    ],
    'items' => [
      {
        'id' => potion_of_healing.id,
        'name' => potion_of_healing.name,
        'conut' => 2
      }
    ],
    'completed' => false,
    'notes' => 'Bandits are sitting around table and drinking ale. Combat begins as an ambush. Enemies are surprised. Edge of the window is located at height of 1 meter. (3,3 feet)'
  },
  {
    'name' => 'Second room',
    'environment' => 'House, hallway, three doors',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => 'Door to fifth room is locked. Key required. Roll Sleight of Hand (Dexterity) check, DC 20 if character tries to pick the lock.'
  },
  {
    'name' => 'Third room, Combat',
    'environment' => 'House, fireplace, bed, trunk',
    'creatures' => [
      {
        'id' => bandit.id,
        'name' => bandit.name,
        'count' => 2
      }
    ],
    'items' => [
      {
        'id' => potion_of_healing.id,
        'name' => potion_of_healing.name,
        'conut' => 2
      }
    ],
    'completed' => false,
    'notes' => 'One of the bandits prefers ranged comabat while the other prefers melee.'
  },
  {
    'name' => 'Fourth room, Combat',
    'environment' => 'House, table, chair, cabinet',
    'creatures' => [
      {
        'id' => bandit.id,
        'name' => bandit.name,
        'count' => 2
      }
    ],
    'items' => [
      {
        'id' => bonecrushers_ledger.id,
        'name' => bonecrushers_ledger.name,
        'count' => 1
      },
      {
        'id' => connors_house_key.id,
        'name' => connors_house_key.name,
        'count' => 1
      }
    ],
    'completed' => false,
    'notes' => 'One of the bandits prefers ranged comabat while the other prefers melee.'
  },
  {
    'name' => 'Fifth room, Combat',
    'environment' => 'House, ale barrels, chest',
    'creatures' => [
      {
        'id' => bandit.id,
        'name' => bandit.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => 'One of the bandits prefers ranged comabat while the other prefers melee. Reward: 40 + 1d20 silver coins (4 - 6 gp)'
  }
]
Dungeon.create(
  name: "Connor's House",
  rooms: JSON.dump(connors_house_rooms),
  dungeonable: connors_house
)

bandit_house = Quest.create(
  name: 'Bandit House',
  level: 2,
  order: 3,
  description: 'The Ledger contained information about house where some Bonecrushers are hiding. Trebirok hires characters to raid a house that was recently invaded by Bonecrushers. House is located on beach 2 miles north from Whitestrand.',
  reward: '10 gp and 300 XP',
  main_quest: house_of_mecenaries,
  completed: false,
  questable: whitestrand
)
bandit_house_rooms = [
  {
    'name' => 'Entrance',
    'environment' => 'Beach, house, door',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'First room, Combat',
    'environment' => 'House, hallway, bench, two doors',
    'creatures' => [
      {
        'id' => orc.id,
        'name' => orc.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Second room',
    'environment' => 'House, outhouse',
    'creatures' => [
      {
        'id' => orc.id,
        'name' => orc.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Third room, Combat',
    'environment' => 'House, fireplace, table, two benches, window, two doors',
    'creatures' => [
      {
        'id' => bandit.id,
        'name' => bandit.name,
        'count' => 3
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => 'Edge of the window is located at height of 1 meter. (3,3 feet)'
  },
  {
    'name' => 'Fourth room',
    'environment' => 'House, barrel, cabinet, pile of vegetables',
    'creatures' => [],
    'items' => [
      {
        'id' => potion_of_healing.id,
        'name' => potion_of_healing.name,
        'conut' => 2
      }
    ],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Fifth room, Combat',
    'environment' => 'House, two beds, chest',
    'creatures' => [
      'id' => lizardfolk.id,
      'name' => lizardfolk.name,
      'count' => 2
    ],
    'items' => [
      {
        'id' => silver_bar.id,
        'name' => silver_bar.name,
        'conut' => 2
      }
    ],
    'completed' => false,
    'notes' => '10 + 1d20 Silver coins (1-3 gp)'
  }
]
Dungeon.create(
  name: 'Bandit House',
  rooms: JSON.dump(bandit_house_rooms),
  dungeonable: bandit_house
)

warehouse_at_blackhollow = Quest.create(
  name: 'Warehouse at Blackhollow',
  level: 2,
  order: 4,
  description: 'Trebirok hires characters to raid a Bonecrusher warehouse in Blackhollow. House is located on beach 2 miles north from Whitestrand.',
  reward: '10 gp and 300 XP',
  main_quest: house_of_mecenaries,
  completed: false,
  questable: blackhollow
)
warehouse_map = warehouse_at_blackhollow.items.create(
  name: 'warehouse_map',
  description: 'This map shows to location of a castle the Bonecrushers are planning on attacking.',
)
warehouse_at_blackhollow_rooms = [
  {
    'name' => 'Entrance',
    'environment' => 'Village, warehouse, door',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'First room, Combat',
    'environment' => 'Warehouse, grain sacks, door',
    'creatures' => [
      {
        'id' => bandit.id,
        'name' => bandit.name,
        'count' => 3
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Second room',
    'environment' => 'Warehouse, four beds, four trunks, door',
    'creatures' => [],
    'items' => [
      {
        'id' => potion_of_healing.id,
        'name' => potion_of_healing.name,
        'count' => 4
      }
    ],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Third room, Combat',
    'environment' => 'Warehouse, stairs, window, door',
    'creatures' => [
      {
        'id' => bandit.id,
        'name' => bandit.name,
        'count' => 3
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => 'Roll Perception (Wisdom, passive) check, DC 10. If check fails characters do not spot the trap. When character opens the door to fourth room to an arrow trap launches causing 1d8 damage. If characters have spotted the trap they can try to disable it. Roll Investigation (Intelligence) check, DC 10. If check fails the arrow trap launches causing 1d8 damage. Edge of the window is located at height of 1 meter. (3,3 feet)'
  },
  {
    'name' => 'Fourth room, Combat',
    'environment' => 'Warehouse, hallway, two doors',
    'creatures' => [
      {
        'id' => thug.id,
        'name' => thug.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => 'Hallway has an unlocked trapdoor near door to fifth room. If character steps on it they fall 3 meters (10 feet) to seventh room taking 1d6 falling damage. Trapdoor can be opened without danger.'
  },
  {
    'name' => 'Fifth room',
    'environment' => 'Warehouse, table, chair, window',
    'creatures' => [],
    'items' => [
      {
        'id' => warehouse_map.id,
        'name' => warehouse_map.name,
        'count' => 2
      },
      {
        'id' => silver_bar.id,
        'name' => silver_bar.name,
        'count' => 2
      }
    ],
    'completed' => false,
    'notes' => 'Edge of the window is located at height of 2 meters. (6,6 feet)'
  },
  {
    'name' => 'Sixth room, Combat',
    'environment' => 'Warehouse, ale barrels, door that leads out of dungeon',
    'creatures' => [
      {
        'id' => bandit.id,
        'name' => bandit.name,
        'count' => 3
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => 'Edge of the window is located at height of 2 meters. (6,6 feet)'
  },
  {
    'name' => 'Seventh room',
    'environment' => 'Warehouse, grain sacks, ladders',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => 'Character can climb up ladders to fourth room.'
  }
]
Dungeon.create(
  name: 'Warehouse at Blackhollow',
  rooms: JSON.dump(warehouse_at_blackhollow_rooms),
  dungeonable: warehouse_at_blackhollow
)

invaded_castle = Quest.create(
  name: 'Invaded Castle',
  level: 3,
  order: 5,
  description: 'Trebirok hires characters to raid a castle that was recently invaded by Bonecrushers. Castle is located near road between Whitestrand and Blackhollow.',
  reward: '15 gp and 450 XP',
  main_quest: house_of_mecenaries,
  completed: false,
  questable: blackhollow
)
invaded_castle_rooms = [
  {
    'name' => 'Entrance',
    'environment' => 'Jungle, castle, stairs up, door',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'First room, Combat',
    'environment' => 'Castle, table, chair, door',
    'creatures' => [
      {
        'id' => orc.id,
        'name' => orc.name,
        'count' => 1
      },
      {
        'id' => bandit.id,
        'name' => bandit.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Second room, Combat',
    'environment' => 'Castle, fireplace, door',
    'creatures' => [
      {
        'id' => bandit.id,
        'name' => bandit.name,
        'count' => 6
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => 'All bandits are sitting at a table eating.'
  },
  {
    'name' => 'Third room',
    'environment' => 'Castle, hallway, two doors',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Fourth room, Combat',
    'environment' => 'Castle, weapon rack',
    'creatures' => [
      {
        'id' => orc.id,
        'name' => orc.name,
        'count' => 2
      },
      {
        'id' => thug.id,
        'name' => thug.name,
        'count' => 2
      }
    ],
    'item' => [
      {
        'id' => pike.id,
        'name' => pike.name,
        'count' => 1
      }
    ],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Fifth room, Combat',
    'environment' => 'Castle, door',
    'creatures' => [
      {
        'id' => orc.id,
        'name' => orc.name,
        'count' => 6
      },
      {
        'id' => lizardfolk.id,
        'name' => lizardfolk.name,
        'count' => 6
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => 'All bandits are sitting at a table eating.'
  },
  {
    'name' => 'Sixth room',
    'environment' => 'Castle, cabinet, door',
    'creatures' => [],
    'items' => [
      {
        'id' => potion_of_healing.id,
        'name' => potion_of_healing.name,
        'count' => 2
      }
    ],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Seventh room, Combat',
    'environment' => 'Castle, table, door',
    'creatures' => [
      {
        'id' => orc.id,
        'name' => orc.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Eighth room',
    'environment' => 'Castle, chest',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => 'A sack of 50 + 1d100 Silver coins (5 - 15 gp). When the items are removed from the chest 4 gelatinous cubes appear and attempt to absorb the players.'
  }
]
Dungeon.create(
  name: 'Invaded Castle',
  rooms: JSON.dump(invaded_castle_rooms),
  dungeonable: invaded_castle
)

jail = Quest.create(
  name: 'jail',
  level: 3,
  order: 6,
  description: 'Sir Lorenzo (Human, male, businessman) has been kidnapped. He is being held as prisoner by Bonecrushers. Trebirok hires characters rescue Sir Lorenzo. Jail is located on mountain in south part of Clam Island.',
  reward: '15 gp and 450 XP',
  main_quest: house_of_mecenaries,
  completed: false,
  questable: silverpearl
)
cell_keys = jail.items.create(
  name: 'Cell Keys',
  description: 'Held by the thug, they unlock all the cells.'
)
jail_rooms = [
  {
    'name' => 'Entrance',
    'environment' => 'Mountain, prison, door',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'First room, Combat',
    'environment' => 'Prison, table, chair, bench, door',
    'creatures' => [
      {
        'id' => thug.id,
        'name' => thug.name,
        'count' => 1
      },
      {
        'id' => bandit.id,
        'name' => bandit.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Second room, Combat',
    'environment' => 'Prison, hallway, three doors',
    'creatures' => [
      {
        'id' => thug.id,
        'name' => thug.name,
        'count' => 1
      },
      {
        'id' => orc.id,
        'name' => orc.name,
        'count' => 1
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Third room',
    'environment' => 'Prison, torture table',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Fourth room, Combat',
    'environment' => 'Prison, barrels, grain sacks, shelf',
    'creatures' => [
      {
        'id' => rat.id,
        'name' => rat.name,
        'count' => 3
      }
    ],
    'items' => [
      {
        'id' => potion_of_healing.id,
        'name' => potion_of_healing.name,
        'count' => 2
      }
    ],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Fifth room, Combat',
    'environment' => 'Prison, stairs down, hallway, door',
    'creatures' => [
      {
        'id' => thug.id,
        'name' => thug.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Sixth room',
    'environment' => 'Prison, six cells, two doors',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => 'There are six tiny cells in this room. Each cell is divided by bars and door. Sir Lorenzo is held in one of the cells. Door is locked. Roll Athletics (Strength) check, DC 20 if character tries to open the lock by brute force. Roll Sleight of Hand (Dexterity) check, DC 15 if character tries to pick the lock. If one of these rolls succeeds, reward each character with 100 XP. If both checks fail only "Cell keys" can open the lock.'
  },
  {
    'name' => 'Seventh room',
    'environment' => 'Prison, three pairs of handcuffs on walls',
    'creatures' => [],
    'items' => [
      {
        'id' => whip.id,
        'name' => whip.name,
        'count' => 2
      }
    ],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Eighth room, Combat',
    'environment' => 'Prison, hallway, four cells',
    'creatures' => [
      {
        'id' => thug.id,
        'name' => thug.name,
        'count' => 2
      },
      {
        'id' => lizardfolk.id,
        'name' => lizardfolk.name,
        'count' => 2
      }
    ],
    'item' => [
      {
        'id' => cell_keys.id,
        'name' => cell_keys.name,
        'count' => 1
      }
    ],
    'completed' => false,
    'notes' => 'There are four tiny cells in this room. Each cell is divided by bars and door.'
  }
]
Dungeon.create(
  name: 'Jail',
  rooms: JSON.dump(jail_rooms),
  dungeonable: jail
)

warehouse_at_whitestrand = Quest.create(
  name: 'Warehouse at Whitestrand',
  level: 3,
  order: 7,
  description: 'Trebirok hires characters to raid a Bonecrusher warehouse in Whitestrand.',
  reward: '15 gp and 450 XP',
  main_quest: house_of_mecenaries,
  completed: false,
  questable: whitestrand
)
warehouse_at_whitestrand_rooms = [
  {
    'name' => 'Entrance',
    'environment' => 'Village, warehouse, door',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'First room, Combat',
    'environment' => 'Warehouse, crates, two doors',
    'creatures' => [
      {
        'id' => lizardfolk.id,
        'name' => lizardfolk.name,
        'count' => 1
      },
      {
        'id' => bandit.id,
        'name' => bandit.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Second room',
    'environment' => 'Warehouse, crates',
    'creatures' => [],
    'items' => [
      {
        'id' => potion_of_healing.id,
        'name' => potion_of_healing.name,
        'count' => 2
      }
    ],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Third room, Combat',
    'environment' => 'Warehouse, crates, window, door',
    'creatures' => [
      {
        'id' => lizardfolk.id,
        'name' => lizardfolk.name,
        'count' => 1
      },
      {
        'id' => orc.id,
        'name' => orc.name,
        'count' => 1
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => 'Edge of the window is located at height of 1 meter. (3,3 feet)'
  },
  {
    'name' => 'Fourth room',
    'environment' => 'Warehouse, crates, two doors',
    'creatures' => [],
    'items' => [
      {
        'id' => potion_of_healing.id,
        'name' => potion_of_healing.name,
        'count' => 1
      }
    ],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Fifth room, Combat',
    'environment' => 'Warehouse, crates, chest, two doors',
    'creatures' => [
      {
        'id' => lizardfolk.id,
        'name' => lizardfolk.name,
        'count' => 1
      },
      {
        'id' => thug.id,
        'name' => thug.name,
        'count' => 1
      }
    ],
    'items' => [
      {
        'id' => silver_bar.id,
        'name' => silver_bar.name,
        'count' => 1
      }
    ],
    'completed' => false,
    'notes' => '20 + 1d10 Silver coins (2-3 gp). First door leads to to sixth room. Second door leads out of the dungeon.'
  },
  {
    'name' => 'Sixth room, Combat',
    'environment' => 'Warehouse, barrels',
    'creatures' => [
      {
        'id' => lizardfolk.id,
        'name' => lizardfolk.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  }
]
Dungeon.create(
  name: 'Warehouse at Whitestrand',
  rooms: JSON.dump(warehouse_at_whitestrand_rooms),
  dungeonable: warehouse_at_whitestrand
)

ogre_cave = Quest.create(
  name: 'Ogre Cave',
  level: 4,
  order: 8,
  description: 'Trebirok hires characters to raid an ogre cave. Ogre cave is located deep in jungle in middle part of Clam Island.',
  reward: '20 gp and 600 XP',
  main_quest: house_of_mecenaries,
  completed: false,
  questable: silverpearl
)
ogre_cave_rooms = [
  {
    'name' => 'Entrance',
    'environment' => 'Jungle, natural cave, tunnel',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'First room, Combat',
    'environment' => 'Natural cave, plants, tunnel',
    'creatures' => [
      {
        'id' => ogre.id,
        'name' => ogre.name,
        'count' => 1
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Second room',
    'environment' => 'Warehouse, crates, two doors',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Third room, Combat',
    'environment' => 'Natural cave, plants, tunnel',
    'creatures' => [
      {
        'id' => orc.id,
        'name' => orc.name,
        'count' => 2
      },
      {
        'id' => thug.id,
        'name' => thug.name,
        'count' => 1
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Fourth room, Combat',
    'environment' => 'Natural cave, plants, large rock, tunnel',
    'creatures' => [
      {
        'id' => ogre.id,
        'name' => ogre.name,
        'count' => 1
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => 'As first action in combat the ogre grabs a large rock and throws it towards one of the characters. Roll Acrobatics (Dexterity) check, DC 10 to avoid damage. If check fails character takes 3d6+3 damage.'
  },
  {
    'name' => 'Fifth room',
    'environment' => 'Natural cave, oasis, plants, tunnel',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Sixth room, Combat',
    'environment' => 'Natural cave, plants, tunnel',
    'creatures' => [
      {
        'id' => ogre.id,
        'name' => ogre.name,
        'count' => 1
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Seventh room',
    'environment' => 'Natural cave, plants, campfire, backpack, dead end',
    'creatures' => [],
    'items' => [
      {
        'id' => potion_of_healing.id,
        'name' => potion_of_healing.name,
        'count' => 2
      }
    ],
    'completed' => false,
    'notes' => '1 + 1d4 Gold coins (2 - 5 gp)'
  },
  {
    'name' => 'Eighth room, Combat',
    'environment' => 'Natural cave, plants, tunnel',
    'creatures' => [
      {
        'id' => lizardfolk.id,
        'name' => lizardfolk.name,
        'count' => 2
      },
      {
        'id' => thug.id,
        'name' => thug.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Ninth room',
    'environment' => 'Natural cave, plants, tunnel',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Tenth room, Combat',
    'environment' => 'Natural cave, plants, dead end',
    'creatures' => [
      {
        'id' => ogre.id,
        'name' => ogre.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  }
]
Dungeon.create(
  name: 'Ogre Cave',
  rooms: JSON.dump(ogre_cave_rooms),
  dungeonable: ogre_cave
)

pirate_cove = Quest.create(
  name: 'Pirate Cove',
  level: 4,
  order: 9,
  description: 'Trebirok hires characters to raid a pirate cove. Bonecrusher Cove is located on beach at northernmost part of Clam Island.',
  reward: '1000 gp',
  main_quest: house_of_mecenaries,
  completed: false,
  questable: silverpearl
)
object = {}
object['name'] =                    'Pirate captain "One-eye"'
object['size'] =                    'Medium'
object['body_type'] =               'humanoid'
object['sub_body_type'] =           'human'
object['tag'] =                     ''
object['alignment'] =               'chaotic evil'
object['armor_class'] =             15
object['armor_name'] =              'studded leather'
object['hit_points'] =              65
object['hit_dice'] =                '10d8 + 20'
object['speed'] =                   '30 ft'
object['burrow_speed'] =            ''
object['climb_speed'] =             ''
object['fly_speed'] =               ''
object['swim_speed'] =              ''
object['strength'] =                11
object['dexterity'] =               16
object['constitution'] =            15
object['intelligence'] =            9
object['wisdom'] =                  13
object['charisma'] =                14
object['strength_save'] =           ''
object['dexterity_save'] =          ''
object['constitution_save'] =       ''
object['intelligence_save'] =       ''
object['wisdom_save'] =             ''
object['charisma_save'] =           ''
object['damage_vulnerabilities'] =  ''
object['damage_resistances'] =      ''
object['damage_immunities'] =       ''
object['condition_immunities'] =    ''
object['senses'] =                  'passive Perception 10'
object['challenge_rating'] =        '2'
object['languages'] =               'Common, draconic, orcish'
object['skills'] =                  ''
object['actions_json'] = [
  {
    'name' => 'Multi-attack',
    'desc' => 'Pirate captain "One-eye" makes two melee attacks.'
  },
  {
    'name' => 'Scimitar',
    'desc' => '*Melee Weapon Attack:* +5 to hit, reach 5ft., one target. *Hit:* 6 (1d6 + 3) slashing damage.'
  }
].to_json
object['special_abilities_json'] = [
  {
    'name' => 'Aggressive',
    'desc' => 'As a bonus action, pirate captain "One-eye" can move up to its speed toward a hostile creature that it can see.'
  }
].to_json
object['reactions_json'] =          ''
object['legendary_actions_json'] =  ''
object['legendary_desc'] =          ''
pirate_captain = Creature.create!(object)

pirate_cove_rooms = [
  {
    'name' => 'Entrance',
    'environment' => 'Beach, natural cave, tunnel',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'First room, Combat',
    'environment' => 'Natural cave, cliff, rope ladders',
    'creatures' => [
      {
        'id' => lizardfolk.id,
        'name' => lizardfolk.name,
        'count' => 1
      },
      {
        'id' => thug.id,
        'name' => thug.name,
        'count' => 1
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => 'Height of the cliff is 6 meters. (20 feet) Characters can climb up rope ladders to top of cliff.'
  },
  {
    'name' => 'Second room',
    'environment' => 'Natural cave, rocks, two tunnels',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Third room',
    'environment' => 'Natural cave, barrels, shelf, dead end',
    'creatures' => [],
    'items' => [
      {
        'id' => potion_of_healing.id,
        'name' => potion_of_healing.name,
        'count' => 1
      }
    ],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Fourth room, Combat',
    'environment' => 'Natural cave, boardwalk, door',
    'creatures' => [
      {
        'id' => berserker.id,
        'name' => berserker.name,
        'count' => 1
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Fifth room, Combat',
    'environment' => 'Natural cave, boardwalk, door',
    'creatures' => [
      {
        'id' => lizardfolk.id,
        'name' => lizardfolk.name,
        'count' => 1
      },
      {
        'id' => orc.id,
        'name' => orc.name,
        'count' => 1
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Sixth room',
    'environment' => 'Natural cave, boardwalk, water, door',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => 'Roll Perception (Wisdom, passive) check, DC 12. If check fails characters do not spot the trap. When character opens the door to seventh room to an arrow trap launches causing 3d8 damage. If characters have spotted the trap they can try to disable it. Roll Investigation (Intelligence) check, DC 10. If check fails the arrow trap launches causing 3d8 damage.'
  },
  {
    'name' => 'Seventh room, Combat',
    'environment' => 'Natural cave, boardwalk, two doors',
    'creatures' => [
      {
        'id' => lizardfolk.id,
        'name' => lizardfolk.name,
        'count' => 1
      },
      {
        'id' => thug.id,
        'name' => thug.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Eighth room, Combat',
    'environment' => 'Natural cave, boardwalk, barrels',
    'creatures' => [],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Ninth room, Combat',
    'environment' => 'Natural cave, boardwalk, barrels',
    'creatures' => [
      {
        'id' => orc.id,
        'name' => orc.name,
        'count' => 2
      },
      {
        'id' => lizardfolk.id,
        'name' => lizardfolk.name,
        'count' => 1
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Tenth room, Combat',
    'environment' => 'Natural cave, water, suspension bridge, door',
    'creatures' => [
      {
        'id' => orc.id,
        'name' => orc.name,
        'count' => 1
      },
      {
        'id' => thug.id,
        'name' => thug.name,
        'count' => 2
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Eleventh room, Combat',
    'environment' => 'Natural cave, boardwalk, stairs down, door',
    'creatures' => [
      {
        'id' => berserker.id,
        'name' => berserker.name,
        'count' => 1
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Twelveth room',
    'environment' => 'Natural cave, boardwalk, barrels, shelf, door',
    'creatures' => [],
    'items' => [
      {
        'id' => potion_of_healing.id,
        'name' => potion_of_healing.name,
        'count' => 1
      }
    ],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Thirteenth room, Combat',
    'environment' => 'Natural cave, rocks, tunnel',
    'creatures' => [
      {
        'id' => orc.id,
        'name' => orc.name,
        'count' => 2
      },
      {
        'id' => thug.id,
        'name' => thug.name,
        'count' => 1
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  },
  {
    'name' => 'Fourteenth room, Combat',
    'environment' => 'Natural cave, rocks, tunnel',
    'creatures' => [
      {
        'id' => pirate_captain.id,
        'name' => pirate_captain.name,
        'count' => 1
      }
    ],
    'items' => [],
    'completed' => false,
    'notes' => ''
  }
]
Dungeon.create(
  name: 'Pirate Cove',
  rooms: JSON.dump(pirate_cove_rooms),
  dungeonable: pirate_cove
)

object = {}
object['name'] =                    'Twig Blight'
object['size'] =                    'Small'
object['body_type'] =               'plant'
object['sub_body_type'] =           'human'
object['tag'] =                     ''
object['alignment'] =               'neutral evil'
object['armor_class'] =             13
object['armor_name'] =              'natural armor'
object['hit_points'] =              4
object['hit_dice'] =                '1d6 + 1'
object['speed'] =                   '20 ft'
object['burrow_speed'] =            ''
object['climb_speed'] =             ''
object['fly_speed'] =               ''
object['swim_speed'] =              ''
object['strength'] =                6
object['dexterity'] =               13
object['constitution'] =            12
object['intelligence'] =            4
object['wisdom'] =                  8
object['charisma'] =                3
object['strength_save'] =           ''
object['dexterity_save'] =          ''
object['constitution_save'] =       ''
object['intelligence_save'] =       ''
object['wisdom_save'] =             ''
object['charisma_save'] =           ''
object['damage_vulnerabilities'] =  'fire'
object['damage_resistances'] =      ''
object['damage_immunities'] =       ''
object['condition_immunities'] =    ''
object['senses'] =                  'passive Perception 10'
object['challenge_rating'] =        '1/8'
object['languages'] =               'Common understands but can’t speak'
object['skills'] =                  'Stealth +3'
object['actions_json'] = [
  {
    'name' => 'Claws',
    'desc' => 'Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 3 (1d4 + 1) piercing damage.'
  }
].to_json
object['special_abilities_json'] = [
  {
    'name' => 'False Appearance',
    'desc' => 'While the blight remains motionless, it is indistinguishable from a dead shrub'
  }
].to_json
object['reactions_json'] =          ''
object['legendary_actions_json'] =  ''
object['legendary_desc'] =          ''
twig_blight = Creature.create!(object)

the_blight = MainQuest.create(
  name: 'The Blight',
  short_description: 'The Blight is the secondary questline for Clam Island campaign.',
  description: 'The players will discover necromantic oddities that lead them to discover that a sect of the Cult of the Dragon is trying to resurrect an ancient red dragon.',
  campaign: clam_island
)

blighted_tree = Quest.create(
  name: 'Blighted Tree',
  level: 1,
  order: 1,
  description: "While travelling the party comes upon a blighted tree. Upon closer inspection they notice that it's moving.",
  reward: '100 XP',
  main_quest: the_blight,
  completed: false,
  questable: silverpearl
)
blighted_tree_rooms = [
  {
    'name' => 'Entrance',
    'environment' => 'A writhing tree, bushes, the stench of death.',
    'creatures' => [
      'id' => twig_blight.id,
      'name' => twig_blight.name,
      'count' => 4
    ],
    'items' => [],
    'completed' => false,
    'notes' => 'Every complete round of turns a new twig blight should appear from the tree. The tree must be chopped down (or burnt) with a strength check DC 10.'
  }
]
Dungeon.create(
  name: 'Blighted Tree',
  rooms: JSON.dump(blighted_tree_rooms),
  dungeonable: blighted_tree
)

# blighted_tree = Quest.create(
#   name: 'Blighted Cottage',
#   level: 1,
#   order: 2,
#   description: 'Upon consulting Zesud (Human, male) at **Poison & Remedy**. The explorers learn that blight is when nature being filled with necromantic energy. There is an intensity near mangrove forest. Zesud gives the adventures the location of a blighted cottage and asks the adventurers to bring back a twig blight "alive".',
#   reward: '250 XP',
#   main_quest: the_blight,
#   completed: false,
#   questable: silverpearl
# )
# circus_contortionist = Quest.create(
#   name: 'Circus Contortionist',
#   level: 1,
#   order: 2,
#   description: 'Parents in blackhollow have demanded the mayor do something about the epdiemic that has gripped the children of the town. The children have been finding delicious apples that cause bark to appear on the inside of their throats!',
#   reward: '100 XP',
#   main_quest: the_blight,
#   completed: false,
#   questable: blackhollow
# )

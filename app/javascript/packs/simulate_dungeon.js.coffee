React = require('react')
ReactDOM = require('react-dom')
axios = require('axios')
Draggable = require('react-draggable')
DraggableCore = Draggable.DraggableCore

e = React.createElement

class BattlingCreature
  constructor: (@name, @initiative, @ac, @current_health, @stats)->

  is_dead: () ->
    return @current_health <= 0

class InitiativeTable extends React.Component
  constructor: (props) ->
    dungeon_rooms = props['dungeon_rooms']
    dungeon_rooms_json = {}
    room_names = []

    for dungeon_room in dungeon_rooms
      room_names.push(dungeon_room['name'])
      dungeon_rooms_json[dungeon_room['name']] = dungeon_room

    @state = {
      room_names: room_names,
      dungeon_rooms: dungeon_rooms_json,
      active_room: room_names[0],
      battling_creatures: [],
      floating_statblocks: []
    }

    @handle_room_change = @handle_room_change.bind(@)
    @add_battling_creature = @add_battling_creature.bind(@)
    @remove_battling_creature = @remove_battling_creature.bind(@)
    @make_room_card_body = @make_room_card_body.bind(@)
    @make_initiative_rows = @make_initiative_rows.bind(@)
    @create_room_options = @create_room_options.bind(@)
    @add_player_creature = @add_player_creature.bind(@)
    @increase_creature_initiative = @increase_creature_initiative.bind(@)
    @decrease_creature_initiative = @decrease_creature_initiative.bind(@)
    @damage_creature = @damage_creature.bind(@)
    @heal_creature = @heal_creature.bind(@)
    @display_statblock = @display_statblock.bind(@)

  handle_room_change: () ->
    old_room_name = @room_name
    new_room_name = event.target.value

    @setState({ active_room: new_room_name })

  add_battling_creature: () ->
    list_of_parents = $(event.target).parentsUntil('tbody')
    name_p = $(list_of_parents[list_of_parents.length - 1]).find('p')[0]
    creature_name = $(name_p).html()
    search_url = "/creatures/search/?name=#{creature_name}"
    battling_creatures = @state.battling_creatures

    that = @

    axios.get(search_url)
      .then((response) ->
        data = response.data

        initiative = Math.floor(Math.random() * 20)
        ac = 10
        ac = data.armor_class if data.armor_class?
        current_health = data.hit_points
        new_creature = new BattlingCreature(creature_name, initiative, ac, current_health, data)
        battling_creatures.push(new_creature)
        battling_creatures.sort((a, b) ->
          a.initiative - b.initiative
        )

        that.setState({ battling_creatures: battling_creatures })
      )
      .catch((error) ->
        alert('No creature found')
      )

  remove_battling_creature: () ->
    list_of_parents = $(event.target).parentsUntil('tbody')
    table_row = list_of_parents[list_of_parents.length - 1]
    index_of_removed_creature = table_row.id

    battling_creatures = @state.battling_creatures
    battling_creatures.splice(index_of_removed_creature, 1)
    battling_creatures.sort((a, b) ->
      a.initiative - b.initiative
    )
    @setState({ battling_creatures: battling_creatures })

    # $(table_row).remove()

  make_room_card_body: (room_json) ->
    creatures_json = room_json['creatures']
    items_json = room_json['items']

    if creatures_json.length
      creature_table_rows = []
      for creature in creatures_json
        creature_table_rows.push( e 'tr', { key: creature['name'] },
                                    e 'td', null, e 'p', { className: 'mb-0', style: { fontSize: '1.5rem' } }, creature['name']
                                    e 'td', null, e 'p', { className: 'mb-0', style: { fontSize: '1.5rem' } }, creature['count']
                                    e 'td', null,
                                      e 'div', { className: 'btn-group', role: 'group' },
                                        e 'a', { type: 'button', className: 'btn btn-primary', href: "/creatures/#{creature['id']}/statblock", target: '_blank' },
                                          e 'i', { className: 'far fa-eye' }
                                        e 'button', { type: 'button', className: 'btn btn-success', onClick: @add_battling_creature },
                                          e 'i', { className: 'fas fa-plus' }
        )
      creature_table = e 'table', { className: 'table table-bordered' },
                              e 'thead', null,
                                e 'tr', null,
                                  e 'th', { className: 'col-sm-8', scope: 'col' }, null, 'Name'
                                  e 'th', { className: 'col-sm-2', scope: 'col' }, null, 'Count'
                                  e 'th', { className: 'col-sm-2', scope: 'col' }, null, 'Action'
                              e 'tbody', null,
                                creature_table_rows
    else
      creature_table = e 'h6', { className: 'card-subtitle mb-2 mt-2 text-muted' }, 'No creatures in the room!'

    if items_json.length
      item_table_rows = []
      for item in items_json
        item_table_rows.push( e 'tr', { key: item['name'] },
                                e 'td', null, e 'p', { className: 'mb-0', style: { fontSize: '1.5rem' } }, item['name']
                                e 'td', null, e 'p', { className: 'mb-0', style: { fontSize: '1.5rem' } }, item['count']
                                e 'td', null, e 'p', { className: 'mb-0', style: { fontSize: '1.5rem' } },
                                  e 'a', { type: 'button', className: 'btn btn-primary', href: "/creatures/#{item['id']}/statblock", target: '_blank' },
                                    e 'i', { className: 'far fa-eye' }
        )
      item_table =  e 'table', { className: 'table table-bordered' },
                      e 'thead', null,
                        e 'tr', null,
                          e 'th', { className: 'col-sm-8', scope: 'col' }, null, 'Name'
                          e 'th', { className: 'col-sm-2', scope: 'col' }, null, 'Count'
                          e 'th', { className: 'col-sm-2', scope: 'col' }, null, 'Action'
                      e 'tbody', null,
                        item_table_rows
    else
      item_table = e 'h6', { className: 'card-subtitle mb-2 mt-2 text-muted' }, 'No items in the room!'

    temp_room = e 'div', null,
                  e 'h4', { className: 'card-title' }, room_json['name']
                  e 'h6', { className: 'card-subtitle mb-2 text-muted' }, room_json['environment']
                  e 'p', null, room_json['notes']
                  e 'h5', { className: 'mt-3' }, 'Creatures'
                  creature_table
                  e 'hr'
                  e 'h5', { className: 'mt-3' }, 'Items'
                  item_table

    return temp_room

  make_initiative_rows: () ->
    battling_creatures = @state.battling_creatures
    initiative_rows = []
    key_index = 0

    for creature in battling_creatures
      initiative_rows.push(
        e 'tr', { key: key_index, id: key_index },
          e 'td', null, creature.name
          e 'td', null,
            e 'div', { className: 'input-group' },
              e 'div', { className: 'input-group-prepend' },
                e 'span', { className: 'input-group-text' },
                  creature.initiative
              e 'div', { className: 'input-group-append' },
                e 'button', { className: 'btn btn-secondary', type: 'button', onClick: @increase_creature_initiative },
                  e 'i', { className: 'fas fa-plus' }
                e 'button', { className: 'btn btn-secondary', type: 'button', onClick: @decrease_creature_initiative },
                  e 'i', { className: 'fas fa-minus' }
          e 'td', null, creature.ac
          e 'td', null,
            e 'div', { className: 'input-group' },
              e 'div', { className: 'input-group-prepend' },
                e 'span', { className: 'input-group-text' },
                  creature.current_health
              e 'div', { className: 'input-group-append' },
                e 'button', { className: 'btn btn-danger', type: 'button', onClick: @damage_creature },
                  e 'i', { className: 'fas fa-band-aid' }
                e 'button', { className: 'btn btn-success', type: 'button', onClick: @heal_creature },
                  e 'i', { className: 'far fa-heart' }
          e 'td', null,
            e 'button', { type: 'button', className: 'btn btn-danger', onClick: @remove_battling_creature },
              e 'i', { className: 'fas fa-times' }
      )
      key_index++
    
    return initiative_rows

  create_room_options: () ->
    options = []
    room_names = @state.room_names

    for room_name in room_names
      options.push(
        e 'option', { key: room_name }, room_name
      )
    return options

  add_player_creature: () ->
    character_name = $('#player_character_name').val()
    character_initiative = $('#player_character_initiative').val()
    character_ac = $('#player_character_ac').val()
    character_health = $('#player_character_health').val()

    $('#player_character_name').val('')
    $('#player_character_initiative').val('')
    $('#player_character_ac').val('')
    $('#player_character_health').val('')

    battling_creatures = @state.battling_creatures
    new_creature = new BattlingCreature(character_name, character_initiative, character_ac, character_health, {})
    battling_creatures.push(new_creature)
    battling_creatures.sort((a, b) ->
      a.initiative - b.initiative
    )
    @setState({ battling_creatures: battling_creatures })

    console.log(character_name)
    console.log(character_initiative)
    console.log(character_ac)
    console.log(character_health)

  increase_creature_initiative: () ->
    battling_creatures = Object.assign([], @state.battling_creatures)

    parent_row = $(event.target).closest('tr')
    creature_id = parent_row[0].id
    battling_creatures[creature_id].initiative++
    battling_creatures.sort((a, b) ->
      a.initiative - b.initiative
    )
    @setState({ battling_creatures: battling_creatures })

  decrease_creature_initiative: () ->
    battling_creatures = Object.assign([], @state.battling_creatures)

    parent_row = $(event.target).closest('tr')
    creature_id = parent_row[0].id
    battling_creatures[creature_id].initiative--
    battling_creatures.sort((a, b) ->
      a.initiative - b.initiative
    )
    @setState({ battling_creatures: battling_creatures })

  damage_creature: () ->
    battling_creatures = @state.battling_creatures
    inputted_increment = $('#creature_damage_increment').val()
    if inputted_increment
      increment = parseInt(inputted_increment)
    else
      increment = 0
    parent_row = $(event.target).closest('tr')
    creature_id = parent_row[0].id
    current_health = parseInt(battling_creatures[creature_id].current_health)
    current_health -= increment
    battling_creatures[creature_id].current_health = current_health
    @setState({ battling_creatures: battling_creatures })

  heal_creature: () ->
    battling_creatures = @state.battling_creatures
    inputted_increment = $('#creature_damage_increment').val()
    if inputted_increment
      increment = parseInt(inputted_increment)
    else
      increment = 0
    parent_row = $(event.target).closest('tr')
    creature_id = parent_row[0].id
    current_health = parseInt(battling_creatures[creature_id].current_health)
    current_health += increment
    battling_creatures[creature_id].current_health = current_health
    @setState({ battling_creatures: battling_creatures })

  display_statblock: () ->
    list_of_parents = $(event.target).parentsUntil('tbody')
    name_p = $(list_of_parents[list_of_parents.length - 1]).find('p')[0]
    creature_name = $(name_p).html()
    search_url = "/creatures/search/?name=#{creature_name}"

    that = @

    axios.get(search_url)
      .then((response) ->
        data = response.data

        creature_id = data.id
        creature_name = data.name
        statblock_url = "/creatures/#{creature_id}/statblock"
        
        statblock = 'There was an error'
        axios.get(statblock_url)
          .then((response) ->
            statblock = response.data

            temp_floating_statblocks = that.state.floating_statblocks
            temp_floating_statblocks.push(statblock)
            that.setState({ floating_statblocks: temp_floating_statblocks })

            # console.log(draggle_statblock)
            # # ReactDOM.createPortal(draggle_statblock, document.body)
            # # $('#simulator_app').attr({ class: 'hello' })
            # # document.body.appendChild('sapethg')
            # $(document.body).append('Hello')
            # $(document.body).append(statblock)
            # # ReactDOM.render(draggle_statblock, document.body)
          )
          # .catch((error) ->
          #   alert('No statblock found for creature!')
          # )
      )
      .catch((error) ->
        alert('No creature found!')
      )

  render: ->
    dungeon_room_options = @create_room_options()

    active_room_json = @state.dungeon_rooms[@state.active_room]
    active_room_info = @make_room_card_body(active_room_json)

    initiative_rows = @make_initiative_rows()

    return (
      e 'div', null,
        e 'table', { className: 'table table-bordered' },
          e 'thead', null,
            e 'tr', null,
              e 'th', { scope: 'col' },
                e 'span', null, 'Creature'
              e 'th', { scope: 'col' }, 'Initiative'
              e 'th', { scope: 'col' }, 'AC'
              e 'th', { scope: 'col' },
                e 'label', { htmlFor: 'creature_damage_increment', className: 'mr-2' }, 'Health'
                e 'input', { type: 'number', id: 'creature_damage_increment', placeholder: 'Increment' }
              e 'th', { scope: 'col' }, 'Remove'
          e 'tbody', null,
            initiative_rows
        e 'div', { className: 'input-group mb-3' },
          e 'div', { className: 'input-group-prepend' },
            e 'span', { className: 'input-group-text' },
              'Player Character'
          e 'input', { type: 'text', id: 'player_character_name', className: 'form-control', placeholder: 'Name' }
          e 'input', { type: 'number', id: 'player_character_initiative', className: 'form-control', placeholder: 'Initiative' }
          e 'input', { type: 'number', id: 'player_character_ac', className: 'form-control', placeholder: 'AC' }
          e 'input', { type: 'number', id: 'player_character_health', className: 'form-control', placeholder: 'Health' }
          e 'div', { className: 'input-group-append' },
            e 'button', { className: 'btn btn-success', type: 'button', onClick: @add_player_creature },
              e 'i', { className: 'fas fa-plus' }
        e 'div', { className: 'row' },
          e 'div', { className: 'col-2' },
            e 'select', { id: 'dungeon_room_select', className: 'custom-select', onChange: @handle_room_change },
              dungeon_room_options
          e 'div', { className: 'col-10' },
            e 'div', { className: 'card' },
              e 'div', { id: 'dungeon_room_info', className: 'card-body' },
                active_room_info
    )

$ ->
  $(document).ready ->
    dungeon_rooms = JSON.parse($('#dungeon_rooms').html())
    ReactDOM.render(React.createElement(InitiativeTable, { 'dungeon_rooms': dungeon_rooms }), $('#simulator_app')[0])

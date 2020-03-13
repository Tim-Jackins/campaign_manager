React = require('react')
ReactDOM = require('react-dom')
axios = require('axios')

e = React.createElement

class BattlingCreature
  constructor: (@name, @initiative, @ac, @current_health, @stats)->

  hurt: (hp) ->
    @health -= hp

  heal: (hp) ->
    @health += hp
  
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
      battling_creatures: []
    }

    @handle_room_change = @handle_room_change.bind(@)
    @add_battling_creature = @add_battling_creature.bind(@)
    @make_room_card_body = @make_room_card_body.bind(@)
    @make_initiative_rows = @make_initiative_rows.bind(@)
    @create_room_options = @create_room_options.bind(@)

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

        that.setState({ battling_creatures: battling_creatures })
      )
      .catch((error) ->
        alert('No creature found')
      )

  remove_battling_creature: () ->
    console.log('Remove this creature')

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
                                        e 'button', { type: 'button', className: 'btn btn-primary' },
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
                                  e 'button', { type: 'button', className: 'btn btn-primary' },
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
        e 'tr', { key: key_index },
          e 'td', null, creature.name
          e 'td', null, creature.initiative
          e 'td', null, creature.ac
          e 'td', null, creature.current_health
          e 'td', null,
            e 'button', { type: 'button', className: 'btn btn-success', onClick: @remove_battling_creature },
              e 'i', { className: 'fas fa-cross' }
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
              e 'th', { scope: 'col' }, 'Creature'
              e 'th', { scope: 'col' }, 'Initiative'
              e 'th', { scope: 'col' }, 'AC'
              e 'th', { scope: 'col' }, 'Health'
              e 'th', { scope: 'col' }, 'Remove'
          e 'tbody', null,
            initiative_rows
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

autosize = require('autosize')

prevent_defaults = (e) ->
  e.preventDefault()
  e.stopPropagation()

make_room = (room_json) ->
  temp_room = $("
    <div>
      <script type=\"application/json\">#{JSON.stringify(room_json)}</script>
      <div class=\"media text-muted pt-3\" id=\"2\">
        <svg class=\"bd-placeholder-img mr-2 rounded\" width=\"32\" height=\"32\" xmlns=\"http://www.w3.org/2000/svg\" preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\" role=\"img\" aria-label=\"Placeholder: 32x32\"><title>Placeholder</title><rect width=\"100%\" height=\"100%\" fill=\"#6f42c1\"></rect><text x=\"50%\" y=\"50%\" fill=\"#6f42c1\" dy=\".3em\">32x32</text></svg>
        <p class=\"media-body pb-3 mb-0 small lh-125\">
          <strong class=\"d-block text-gray-dark\">#{room_json['name']}</strong>
          #{room_json['environment']}
        </p>
        <div class=\"btn-group\" role=\"group\" aria-label=\"Basic example\">
          <button type=\"button\" class=\"btn btn-sm btn-outline-danger\" id=\"remove_room\">Remove</button>
          <button type=\"button\" class=\"btn btn-sm btn-outline-info\" id=\"edit_room\">Edit</button>
          <button class=\"btn btn-sm btn-outline-secondary\" type=\"button\" data-toggle=\"collapse\" data-target=\"#collapse_room_#{room_json['name']}\" aria-expanded=\"false\">
            Expand
          </button>
        </div>
      </div>

      <div class=\"collapse pb-3\" id=\"collapse_room_#{room_json['name']}\">
        <div class=\"card card-body\">
          <p class=\"mb-3\">#{room_json['notes']}</p>
          <h4>Creatures</h4>
          <p class=\"mb-3\">#{JSON.stringify(room_json['creatures'])}</p>
          <h4>Item</h4>
          <p class=\"mb-3\">#{JSON.stringify(room_json['items'])}</p>
        </div>
      </div>
    </div>
  ")
  return temp_room

$ ->
  $(document).ready ->
    for node in $('textarea')
      autosize(node)
    
    current_rooms = $('#dungeon_rooms').val()
    unless current_rooms == '' # If the dungeon has rooms
      rooms_json = JSON.parse(current_rooms)
      console.log(rooms_json)

      holder = $('#rooms_holder')

      for room_json in rooms_json
        temp_room = make_room(room_json)

        holder.append(temp_room)

  $(document).on 'focus', 'textarea', ->
    # console.log($(this))
    autosize($(this))


  $('#room_creature_add').click (event) ->
    prevent_defaults(event)
    creature_name = $('#room_creature').val()
    search_url = "/creatures/search/?name=#{creature_name}"
    
    $.ajax search_url, {
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        alert('Request unsuccessful.')
      success: (data, textStatus, jqXHR) ->
        unless data == 'Nothing found'
          creature_holder = $('#creature_holder')
          list_node = $("
            <li class=\"list-group-item\">
              <div class=\"row\">
                <label class=\"col-sm-2 col-form-label\" id=\"creature_name\">#{data['name']}</label>

                <div class=\"col-sm-2 input-group\">
                  <div class=\"input-group-prepend\">
                    <button class=\"btn btn-secondary\" id=\"creature_count_minus\"><i class=\"fas fa-minus\"></i></button>
                    <span type=\"number\" class=\"input-group-text\" id=\"creature_count\">1</span>
                  </div>
                  <div class=\"input-group-append\">
                    <button class=\"btn btn-secondary\" id=\"creature_count_plus\"><i class=\"fas fa-plus\"></i></button>
                  </div>
                </div>

                <div class=\"col-sm text-right\">
                  <button class=\"btn btn-danger\" id=\"creature_delete\"><i class=\"fas fa-trash-alt\"></i></button>
                </div>
              </div>
            </li>
          ")
          creature_holder.append(list_node)
        else
          alert('Creature not found.')
    }

    $('#room_creature').val('')

  $('#creature_holder').on 'click', 'button[id^="creature_delete"]', (e) ->
    prevent_defaults(e)
    parent_list = $(this).closest('li')
    parent_list.remove()
  
  $('#creature_holder').on 'click', 'button[id^="creature_count_minus"]', (e) ->
    prevent_defaults(e)
    count = $(this).parent().parent().find('span')
    count_value = parseInt(count.html())
    
    if (count_value - 1) < 1
      count.html(1)
    else
      count.html(count_value - 1)
  
  $('#creature_holder').on 'click', 'button[id^="creature_count_plus"]', (e) ->
    prevent_defaults(e)
    count = $(this).parent().parent().find('span')
    count_value = parseInt(count.html())
    
    count.html(count_value + 1)


  $('#room_item_add').click (event) ->
    prevent_defaults(event)
    item_name = $('#room_item').val()
    search_url = "/items/search/?name=#{item_name}"
    
    $.ajax search_url, {
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        alert('Request unsuccessful.')
      success: (data, textStatus, jqXHR) ->
        unless data == 'Nothing found'
          item_holder = $('#item_holder')
          list_node = $("
            <li class=\"list-group-item\">
              <div class=\"row\">
                <label class=\"col-sm-2 col-form-label\" id=\"item_name\">#{data['name']}</label>

                <div class=\"col-sm-2 input-group\">
                  <div class=\"input-group-prepend\">
                    <button class=\"btn btn-secondary\" id=\"item_count_minus\"><i class=\"fas fa-minus\"></i></button>
                    <span type=\"number\" class=\"input-group-text\" id=\"item_count\">1</span>
                  </div>
                  <div class=\"input-group-append\">
                    <button class=\"btn btn-secondary\" id=\"item_count_plus\"><i class=\"fas fa-plus\"></i></button>
                  </div>
                </div>

                <div class=\"col-sm text-right\">
                  <button class=\"btn btn-danger\" id=\"item_delete\"><i class=\"fas fa-trash-alt\"></i></button>
                </div>
              </div>
            </li>
          ")
          item_holder.append(list_node)
        else
          alert('Item not found.')
    }

    $('#room_item').val('')

  $('#item_holder').on 'click', 'button[id^="item_delete"]', (e) ->
    prevent_defaults(e)
    parent_list = $(this).closest('li')
    parent_list.remove()
  
  $('#item_holder').on 'click', 'button[id^="item_count_minus"]', (e) ->
    prevent_defaults(e)
    count = $(this).parent().parent().find('span')
    count_value = parseInt(count.html())
    
    if (count_value - 1) < 1
      count.html(1)
    else
      count.html(count_value - 1)
  
  $('#item_holder').on 'click', 'button[id^="item_count_plus"]', (e) ->
    prevent_defaults(e)
    count = $(this).parent().parent().find('span')
    count_value = parseInt(count.html())
    
    count.html(count_value + 1)


  $('#create_room').click (event) ->
    prevent_defaults(event)
    name = $('#room_name').val()
    environment = $('#room_environment').val()
    notes = $('#room_notes').val()

    creature_holder = $('#creature_holder')
    creatures = []
    for creature_li in creature_holder.children()
      temp_name = $(creature_li).find('label').html()
      temp_count = $(creature_li).find('span').html()
      creatures.push(
        {
          name: temp_name,
          count: temp_count
        }
      )
    
    item_holder = $('#item_holder')
    items = []
    for item_li in item_holder.children()
      temp_name = $(item_li).find('label').html()
      temp_count = $(item_li).find('span').html()
      items.push(
        {
          name: temp_name,
          count: temp_count
        }
      )
    
    if name
      holder = $('#rooms_holder')

      room_json = {
        name: name,
        environment: environment,
        notes: notes
        creatures: creatures,
        items: items,
        completed: false
      }

      temp_room = make_room(room_json)

      holder.append(temp_room)

      $('#room_name').val('')
      $('#room_environment').val('')
      $('#room_notes').val('')
      $('#creature_holder').empty()
      $('#item_holder').empty()

  $('#rooms_holder').on 'click', 'button[id="remove_room"]', (event) ->
    prevent_defaults(event)
    $(this).parent().parent().parent().remove()

  $('#rooms_holder').on 'click', 'button[id="edit_room"]', (e) ->
    prevent_defaults(e)
    
    room = $(this).parent().parent().parent()
    room_json = JSON.parse(room.find('script').html())
    
    $('#room_name').val(room_json['name'])
    $('#room_environment').val(room_json['environment'])
    $('#room_notes').val(room_json['notes'])

    creature_holder = $('#creature_holder')
    for creature in room_json['creatures']
      list_node = $("
        <li class=\"list-group-item\">
          <div class=\"row\">
            <label class=\"col-sm-2 col-form-label\" id=\"creature_name\">#{creature['name']}</label>

            <div class=\"col-sm-2 input-group\">
              <div class=\"input-group-prepend\">
                <button class=\"btn btn-secondary\" id=\"creature_count_minus\"><i class=\"fas fa-minus\"></i></button>
                <span type=\"number\" class=\"input-group-text\" id=\"creature_count\">#{creature['count']}</span>
              </div>
              <div class=\"input-group-append\">
                <button class=\"btn btn-secondary\" id=\"creature_count_plus\"><i class=\"fas fa-plus\"></i></button>
              </div>
            </div>

            <div class=\"col-sm text-right\">
              <button class=\"btn btn-danger\" id=\"creature_delete\"><i class=\"fas fa-trash-alt\"></i></button>
            </div>
          </div>
        </li>
      ")
      creature_holder.append(list_node)
    
    item_holder = $('#item_holder')
    for item in room_json['items']
      list_node = $("
        <li class=\"list-group-item\">
          <div class=\"row\">
            <label class=\"col-sm-2 col-form-label\" id=\"item_name\">#{item['name']}</label>

            <div class=\"col-sm-2 input-group\">
              <div class=\"input-group-prepend\">
                <button class=\"btn btn-secondary\" id=\"item_count_minus\"><i class=\"fas fa-minus\"></i></button>
                <span type=\"number\" class=\"input-group-text\" id=\"item_count\">#{item['count']}</span>
              </div>
              <div class=\"input-group-append\">
                <button class=\"btn btn-secondary\" id=\"item_count_plus\"><i class=\"fas fa-plus\"></i></button>
              </div>
            </div>

            <div class=\"col-sm text-right\">
              <button class=\"btn btn-danger\" id=\"item_delete\"><i class=\"fas fa-trash-alt\"></i></button>
            </div>
          </div>
        </li>
      ")
      item_holder.append(list_node)
    
    room.remove()

  $('#dungeon_update_form').submit (event) ->
    # dungeon_rooms
    rooms = []

    for room in $('#rooms_holder').children().slice(1)
      temp_raw_room_json = $(room).find('script').html()
      rooms.push(JSON.parse(temp_raw_room_json))
    
    console.log(rooms)
    $('#dungeon_rooms').val(JSON.stringify(rooms))

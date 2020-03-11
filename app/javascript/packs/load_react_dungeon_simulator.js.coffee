React = require('react')
ReactDOM = require('react-dom')

# prevent_defaults = (e) ->
#   e.preventDefault()
#   e.stopPropagation()

# <script type=\"application/json\"></script>

# <input type=\"text\" class=\"form-control\" value=\"#{room_json['creatures'][0]['name']}\" >

# make_room_card_body = (room_json) ->
#   table_rows = ''
#   for creature in room_json['creatures']
#     table_rows += "
#       <tr>
#         <td>#{creature['name']}</td>
#         <td>#{creature['count']}</td>
#         <td>
#         <div class=\"btn-group\" role=\"group\">
#           <button type=\"button\" class=\"btn btn-primary\"><i class=\"far fa-eye\"></i></button>
#           <button type=\"button\" class=\"btn btn-success\"><i class=\"fas fa-plus\"></i></button>
#         </td>
#       </tr>"

#   table_body = "<table class=\"table table-bordered\">
#     <thead>
#       <tr>
#         <th scope=\"col\">Name</th>
#         <th scope=\"col\">Count</th>
#         <th scope=\"col\">Action</th>
#       </tr>
#     </thead>
#     <tbody>
#       #{table_rows}
#     </tbody>
#   </table>"

#   temp_room = $("
#     <div>
      
#       <h4 class=\"card-title\">#{room_json['name']}</h4>
#       <h6 class=\"card-subtitle mb-2 text-muted\">#{room_json['environment']}</h6>

#       <h5 class=\"mt-3\">Creatures</h5>

#       #{table_body}
#     </div>
#   ")
#   return temp_room


# get_rooms = ->
#   return JSON.parse($('#dungeon_rooms').html())

$ ->
  $(document).ready ->
    ReactDOM.render(React.createElement(InitiativeTable), $('#simulator_app')[0])
    # rooms = get_rooms()
    # room_select = $('#dungeon_room_select')
    # room_select.empty()

    # for room_index in [1...rooms.length]
    #   room = rooms[room_index]
    #   room_select.append($("<option id=\"#{room_index}\">#{room['name']}</option>"))
    
    # room_select.trigger('change')

  # $('#dungeon_room_select').change ->
    

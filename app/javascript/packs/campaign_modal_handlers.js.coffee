autosize = require('autosize')

prevent_defaults = (e) ->
  e.preventDefault()
  e.stopPropagation()

$ ->
  # Handle new buildings
  $('button[id^="new_building_location_id_"]').click (e) ->
    prevent_defaults(e)
    # $('#new_building_modal_for_location_1').modal('show');
    campaign_id = $('#campaign_id').val()
    index_of_id = 'new_building_location_id_'.length
    full_id = this.id
    location_id = full_id.slice(index_of_id)
    action = "/campaigns/#{campaign_id}/locations/#{location_id}/buildings"

    modal = $('#new_building_modal')
    modal_form = $('#new_building_modal_form')
    modal_form.attr('action', action)
    modal.modal('show')

  # Handle edit locations
  $('button[id^="edit_location_id_"]').click (e) ->
    prevent_defaults(e)
    
    # Get location data
    campaign_id = $('#campaign_id').val()
    index_of_id = 'edit_location_id_'.length
    full_id = this.id
    location_id = full_id.slice(index_of_id)
    $('#active_location_id').val(location_id)
    location_url = "/campaigns/#{campaign_id}/locations/#{location_id}"

    $.ajax location_url, {
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        alert('Please reload the page.')
      success: (data, textStatus, jqXHR) ->
        location_json = data
        
        # Update modal appropriately
        edit_modal = $('#edit_location_modal')

        edit_modal_form = edit_modal.find('form')
        edit_modal_form.attr('action', location_url)
        edit_modal_form.attr('method', 'post')
        
        edit_modal.find('#edit_location_modal_title').html("Edit #{location_json['name']}")
        edit_modal.find('#location_name').val(location_json['name'])
        edit_modal.find('#location_short_description').val(location_json['short_description'])
        edit_modal.find('#location_description').val(location_json['description'])
        edit_modal.find('#location_image_link').val(location_json['image_link'])
        
        building_table_body = $('<tbody/>')

        # Build buildings panels
        for building, i in location_json['buildings']
          temp_row = $('<tr/>')
          
          # Name of building
          temp_row.append(
            $('<th/>', { scope: 'row' }).append("#{building.name}")
          )

          # Edit button for building
          temp_edit_button = $('<th/>').append(
            $('<button/>', {
              id: "edit_building_id_#{building.id}"
              type: 'button',
              class: 'btn btn-secondary'
            }).append('Edit')
          )

          # Delete button for building
          temp_delete_button = $('<th/>').append(
            $('<a/>', {
              id: "edit_building_id_#{building.id}"
              role: 'button',
              class: 'btn btn-danger',
              'data-confirm': "Are you sure?",
              rel: 'nofollow',
              'data-method': 'delete',
              href: "/campaigns/#{campaign_id}/locations/#{location_id}/buildings/#{building.id}"
            }).append('Delete')
          )
          
          temp_row.append(temp_edit_button)
          temp_row.append(temp_delete_button)

          building_table_body.append(temp_row)
        
        building_table = $('<table/>', { class: 'table table-bordered' })
        card_body = $('<div/>', { class: 'card card-body' })
        edit_buildings_collapse = $('#manage_buildings')
        edit_buildings_collapse.empty()

        building_table.append(building_table_body)
        card_body.append(building_table)
        edit_buildings_collapse.append(card_body)

        # Show modal
        edit_modal.modal('show')
    }

  # Handle edit buildings
  $('#manage_buildings').on 'click', 'button[id^="edit_building_id_"]', (e) ->
    prevent_defaults(e)
    
    campaign_id = $('#campaign_id').val()
    location_id = $('#active_location_id').val()
    index_of_id = 'edit_building_id_'.length
    full_id = this.id
    building_id = full_id.slice(index_of_id)
    building_url = "/campaigns/#{campaign_id}/locations/#{location_id}/buildings/#{building_id}"

    $.ajax building_url, {
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        alert('Please reload the page.')
      success: (data, textStatus, jqXHR) ->
        building_json = data
        # Update modal appropriately
        edit_modal = $('#edit_building_modal')

        edit_modal_form = edit_modal.find('form')
        edit_modal_form.attr('action', building_url)
        edit_modal_form.attr('method', 'post')
        
        edit_modal.find('#edit_building_modal_title').html("Edit #{building_json['name']}")
        edit_modal.find('#building_name').val(building_json['name'])
        edit_modal.find('#building_description').val(building_json['description'])

        # Show modal
        $('#edit_location_modal').modal('hide')
        edit_modal.modal('show')
    }

  $('a[id^="new_encounter_building_id_"]').click (e) ->
    prevent_defaults(e)

    campaign_id = $('#campaign_id').val()
    index_of_id = 'new_encounter_building_id_'.length
    full_id = this.id
    building_id = full_id.slice(index_of_id)
    action = "/campaigns/#{campaign_id}/encounters"

    modal = $('#new_encounter_modal')
    modal_form = $('#new_encounter_modal_form')
    modal_form.attr('action', action)
    modal.find('#encounter_location_or_building').val('building')
    modal.find('#encounter_encounterable_id').val(building_id)
    modal.modal('show')
  
  $('button[id^="new_encounter_location_id_"]').click (e) ->
    prevent_defaults(e)

    campaign_id = $('#campaign_id').val()
    index_of_id = 'new_encounter_location_id_'.length
    full_id = this.id
    location_id = full_id.slice(index_of_id)
    action = "/campaigns/#{campaign_id}/encounters"

    modal = $('#new_encounter_modal')
    modal_form = $('#new_encounter_modal_form')
    modal_form.attr('action', action)
    modal.find('#encounter_location_or_building').val('location')
    modal.find('#encounter_encounterable_id').val(location_id)
    modal.modal('show')

  # Handle new quests
  $('button[id^="new_quest_main_quest_id_"]').click (e) ->
    prevent_defaults(e)
    # $('#new_building_modal_for_location_1').modal('show');
    campaign_id = $('#campaign_id').val()
    index_of_id = 'new_quest_main_quest_id_'.length
    full_id = this.id
    main_quest_id = full_id.slice(index_of_id)
    action = "/campaigns/#{campaign_id}/main_quests/#{main_quest_id}/quests"

    modal = $('#new_quest_modal')
    modal_form = $('#new_quest_modal_form')
    modal_form.attr('action', action)
    modal.modal('show')

  # Handle edit main_quests
  $('button[id^="edit_main_quest_id_"]').click (e) ->
    prevent_defaults(e)
    
    # Get main_quest data
    campaign_id = $('#campaign_id').val()
    index_of_id = 'edit_main_quest_id_'.length
    full_id = this.id
    main_quest_id = full_id.slice(index_of_id)
    $('#active_main_quest_id').val(main_quest_id)
    main_quest_url = "/campaigns/#{campaign_id}/main_quests/#{main_quest_id}"
    
    $.ajax main_quest_url, {
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        alert('Please reload the page.')
      success: (data, textStatus, jqXHR) ->
        main_quest_json = data
        
        # Update modal appropriately
        edit_modal = $('#edit_main_quest_modal')

        edit_modal_form = edit_modal.find('form')
        edit_modal_form.attr('action', main_quest_url)
        edit_modal_form.attr('method', 'post')
        
        edit_modal.find('#edit_main_quest_modal_title').html("Edit #{main_quest_json['name']}")
        edit_modal.find('#main_quest_name').val(main_quest_json['name'])
        edit_modal.find('#main_quest_short_description').val(main_quest_json['short_description'])
        edit_modal.find('#main_quest_description').val(main_quest_json['description'])
        autosize(edit_modal.find('#main_quest_description'))
        
        # Show modal
        edit_modal.modal('show')
        console.log(edit_modal)
    }

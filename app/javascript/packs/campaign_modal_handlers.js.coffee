prevent_defaults = (e) ->
  e.preventDefault()
  e.stopPropagation()

$ ->
  # Handle edit locations
  $('button[id^="edit_location_id_"]').click (e) ->
    prevent_defaults(e)
    
    # Get location data
    campaign_id = $('#campaign_id').val()
    index_of_id = 'edit_location_id_'.length
    full_id = this.id
    location_id = full_id.slice(index_of_id)
    location_url = "/campaigns/#{campaign_id}/locations/#{location_id}"

    $.ajax location_url, {
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        alert('Please reload the page.')
      success: (data, textStatus, jqXHR) ->
        location_json = data
        # Update modal appropriately
        console.log location_json
        edit_modal = $('#edit_location_modal')

        edit_modal_form = edit_modal.find('form')
        edit_modal_form.attr('action', location_url)
        edit_modal_form.attr('method', 'post')
        
        edit_modal.find('#edit_location_modal_title').html("Edit #{location_json['name']}")
        edit_modal.find('#location_name').val(location_json['name'])
        edit_modal.find('#location_short_description').val(location_json['short_description'])
        edit_modal.find('#location_description').val(location_json['description'])
        edit_modal.find('#location_image_link').val(location_json['image_link'])
        # Show modal
        edit_modal.modal('show')

    }
        # unless data['name']
        #   alert('Received nothing from API...')
        #   return false

  # Handle edit main_quests
  $('button[id^="edit_main_quest_id_"]').click (e) ->
    prevent_defaults(e)
    
    # Get main_quest data
    campaign_id = $('#campaign_id').val()
    index_of_id = 'edit_main_quest_id_'.length
    full_id = this.id
    main_quest_id = full_id.slice(index_of_id)
    main_quest_url = "/campaigns/#{campaign_id}/main_quests/#{main_quest_id}"

    $.ajax main_quest_url, {
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        alert('Please reload the page.')
      success: (data, textStatus, jqXHR) ->
        main_quest_json = data
        # Update modal appropriately
        console.log main_quest_json
        edit_modal = $('#edit_main_quest_modal')

        edit_modal_form = edit_modal.find('form')
        edit_modal_form.attr('action', main_quest_url)
        edit_modal_form.attr('method', 'post')
        
        edit_modal.find('#edit_main_quest_modal_title').html("Edit #{main_quest_json['name']}")
        edit_modal.find('#main_quest_name').val(main_quest_json['name'])
        edit_modal.find('#main_quest_short_description').val(main_quest_json['short_description'])
        edit_modal.find('#main_quest_description').val(main_quest_json['description'])
        edit_modal.find('#main_quest_image_link').val(main_quest_json['image_link'])
        # Show modal
        edit_modal.modal('show')
    }
        # unless data['name']
        #   alert('Received nothing from API...')
        #   return false


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

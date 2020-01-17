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
        alert('Call failed (check api link)')
      success: (data, textStatus, jqXHR) ->
        location_json = data
        # Update modal appropriately
        location_name
        location_short_description
        location_description
        location_image_link
        
        console.log location_json
    }
        # unless data['name']
        #   alert('Received nothing from API...')
        #   return false

    

    # show modal

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

prevent_defaults = (e) ->
  e.preventDefault()
  e.stopPropagation()

$ ->
  $('#edit_quest_modal_form, #quest_level').on 'input', (e) ->
    # prevent_defaults(e)
    
    range_input = parseInt($(this).val())
    if Number.isInteger(range_input)
      $('#level_readout').text(range_input)

autosize = require('autosize')

$ ->
  # $(document).ready ->
  #   $('#encounter_level').text($('#level_readout').val())
  $(document).ready ->
    # console.log($(this))
    for node in $('textarea')
      autosize(node)

  $(document).on 'focus', 'textarea', ->
    # console.log($(this))
    autosize($(this))

  $('#encounter_level').on 'input', (e) ->
    # prevent_defaults(e)
    
    range_input = parseInt($(this).val())
    if Number.isInteger(range_input)
      $('#level_readout').text(range_input)
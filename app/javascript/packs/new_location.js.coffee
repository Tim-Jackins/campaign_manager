prevent_defaults = (e) ->
  e.preventDefault()
  e.stopPropagation()

add_image = (src) ->
  if src == ''
    alert('Please enter an image URL first.')
  else
    img = $('<img></img>')
    img.attr({ 'src', src })
    parentNode = $('#preview')
    parentNode.empty()
    parentNode.append(img)
    console.log('doing it')

$ ->
  $('#dropbox').on 'dragenter dragover', (e) ->
    preventDefaults(e)
    $('#dropbox').addClass('highlight')

  $('#dropbox').on 'dragleave drop', (e) ->
    preventDefaults(e)
    $('#dropbox').removeClass('highlight')

  $('#load_image').click (e) ->
    prevent_defaults(e)
    console.log 'Working'
    url = $('#location_image_link').val()
    add_image(url)

showdown = require('showdown')

$ ->
  # url_to_call = 'Current url: '
  # url_to_call += $('#creature_base_url').val()
  # url_to_call += $('#creature_path').val()
  # url_to_call += '/'
  # $('#url_preview').html(url_to_call)
  
  # $("form").on "change", ->
  #   url_to_call = 'Current url: '
  #   url_to_call += $('#creature_base_url').val()
  #   url_to_call += $('#creature_path').val()
  #   url_to_call += '/'
  #   url_to_call += $('#creature_api_index').val()
  #   url_to_call += '/'
  #   $('#url_preview').html(url_to_call)

  # $('#creature_creature_info').on 'click', ->
  #   api_index = parseInt( $('#creature_api_index').val() )

  #   console.log(api_index)
  #   console.log(Number.isInteger(api_index))
  #   console.log('--------')

  #   unless Number.isInteger(api_index)
  #     alert('No api index!')
  #     $('#creature_creature_info').val("No api index")
  #   else
  #     url_to_call = $('#creature_base_url').val()
  #     url_to_call += $('#creature_path').val()
  #     url_to_call += '/'
  #     url_to_call += api_index
  #     url_to_call += '/'

  #     $.ajax url_to_call,
  #       type: 'GET'
  #       dataType: 'json'

  #       beforeSend: ->
  #         $('#creature_creature_info').val('Loading')
  #       error: (jqXHR, textStatus, errorThrown) ->
  #         alert('Call failed (check id and index)')
  #         $('#creature_creature_info').val("Error: #{errorThrown}")
  #       success: (data, textStatus, jqXHR) ->
  #         console.log(data)
  #         $('#creature_creature_info').val(JSON.stringify(data))

  $(document).ready ->
    MutationObserver = window.MutationObserver || window.WebKitMutationObserver
    # aarl = Ability, Action, Reaction, and Legendary action
    target = $('#aarl_container')[0]
    config = {
      childList: true,
      subtree: true
    }
    
    zip = () ->
      lengthArray = (arr.length for arr in arguments)
      length = Math.min(lengthArray...)
      for i in [0...length]
        arr[i] for arr in arguments

    update_json = () ->
      # console.log mutations
      aarl_holders = $("#aarl_container div[id$='_holder'] ul")
      aarls_li = ( aarl_ul.children for aarl_ul in aarl_holders )
      console.log aarls_li
      # aarls_json = ( aarl_data[0][1] for aarl_data in aarls_li )
      # console.log aarl_data
      aarls_names = ( aarl_ul.id.slice(0, -12) for aarl_ul in aarl_holders )
      
      # for [aarl_type, aarl] in zip(aarls_names, aarls_json)
      #   console.log(aarl)
      #   aarl_json = {}
      #   aarl.children
      
      # aarl_holders = all_aarl_holder.children
      # aarl_json = {}
      # for aarl_list in aarl_holders
      #   for aarl in aarl_list
      #     console.log(aarl)

    observer = new MutationObserver update_json

    observer.observe(target, config)

  sort_items = (holder) ->
    list_container = $(holder)
    all_elements = list_container.children()
    
    all_elements.sort (a, b) ->
      a.id.localeCompare(b.id)
    
    list_container.empty()
    list_container.append(elem) for elem in all_elements

  $('#new_ability, #new_action, #new_reaction, #new_legendary_action').click (event) ->
    event.preventDefault()
    type_of_new = this.id.slice(4, )

    converter = new showdown.Converter()
    
    custom_json = {
      name: $('#creature_custom_name').val(),
      desc: $('#creature_custom_body').val()
    }
    
    html = converter.makeHtml(custom_json.name + ': ' + custom_json.desc)
    hidden_json = $('<input></input>')
    hidden_json.attr({ type: 'hidden' })
    hidden_json.val( JSON.stringify(custom_json) )

    container = $('<li></li>')
    container.attr({ id: custom_json.name })
    container.append(html)
    container.append(hidden_json)
    
    $('#' + type_of_new + '_holder_list').append(container)
    
    sort_items('#' + type_of_new + '_holder_list')

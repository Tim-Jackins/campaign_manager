showdown = require('showdown')

contains_char = (test_string) ->
  test_string = test_string
  for c in test_string
    return true if ((test_string.charCodeAt(c) < 48) || (test_string.charCodeAt(c) > 57))
  return false

zip = () ->
  lengthArray = (arr.length for arr in arguments)
  length = Math.min(lengthArray...)
  for i in [0...length]
    arr[i] for arr in arguments

update_json = () ->
  aarl_holders = $("#aarl_container div[id$='_holder'] ul")
  aarls_li = ( aarl_ul.children for aarl_ul in aarl_holders )
  aarls_names = ( aarl_ul.id.slice(0, -12) for aarl_ul in aarl_holders )
  
  for [aarl_type, aarl_li] in zip(aarls_names, aarls_li)
    aarl_array = []
    for aarl in aarl_li
      aarl_array.push( JSON.parse( aarl.children[aarl.children.length - 1].value ) )
    
    aarl_hidden = $('#creature_' + aarl_type + 's_json')
    aarl_hidden.val( JSON.stringify(aarl_array) )

make_holder = (aarl, aarl_json) ->
  type_of_new = aarl
  custom_json = aarl_json
  $('#creature_custom_name').val('')
  $('#creature_custom_body').val('')

  delete_button = $('<span></span>')
  delete_button.attr({
    id: 'aarl_delete',
    class: 'btn btn-danger',
    style: 'border-radius: 1rem 0px 0px 1rem !important;'
  })
  delete_icon = $('<i></i>')
  delete_icon.attr({
    class: 'fas fa-trash-alt',
    style: 'color: white !important;'
  })
  delete_button.append(delete_icon)
  up_button = $('<span></span>')
  up_button.attr({
    id: 'aarl_up',
    class: 'btn btn-secondary',
    style: 'border-radius: 0px !important;'
  })
  up_icon = $('<i></i>')
  up_icon.attr({
    class: 'fas fa-arrow-up',
    style: 'color: white !important;'
  })
  up_button.append(up_icon)
  down_button = $('<span></span>')
  down_button.attr({
    id: 'aarl_down',
    class: 'btn btn-info',
    style: 'border-radius: 0px !important;'
  })
  down_icon = $('<i></i>')
  down_icon.attr({
    class: 'fas fa-arrow-down',
    style: 'color: white !important;'
  })
  down_button.append(down_icon)
  edit_button = $('<span></span>')
  edit_button.attr({
    id: 'aarl_edit',
    class: 'btn btn-primary',
    style: 'border-radius: 0px 1rem 1rem 0px !important;'
  })
  edit_icon = $('<i></i>')
  edit_icon.attr({
    class: 'fas fa-edit',
    style: 'color: white !important;'
  })
  edit_button.append(edit_icon)
  
  converter = new showdown.Converter()

  html = converter.makeHtml('**' + custom_json['name'] + ':** ' + custom_json['desc'])
  hidden_json = $('<input></input>')
  hidden_json.attr({ type: 'hidden' })
  hidden_json.val( JSON.stringify(custom_json) )
  container = $('<li></li>')
  container.attr({ id: custom_json['name'] })
  container.append(delete_button)
  container.append(up_button)
  container.append(down_button)
  container.append(edit_button)
  container.append(html)
  container.append(hidden_json)
  
  $('#' + type_of_new + '_holder_list').append(container)

  sort_items('#' + type_of_new + '_holder_list')

update_holders_from_hidden_json = ->
  update_aarl = (aarl, aarls_json) ->
    aarl = aarl
    aarls_json = aarls_json
    for aarl_json in aarls_json
      make_holder(aarl, aarl_json)
  
  aarls_raw = $('#creature_special_abilities_json').val()
  aarl_name = 'special_abilitie'
  aarls_json = JSON.parse(aarls_raw)
  update_aarl(aarl_name, aarls_json)

  aarls_raw = $('#creature_actions_json').val()
  aarl_name = 'action'
  aarls_json = JSON.parse(aarls_raw)
  update_aarl(aarl_name, aarls_json)
  
  aarls_raw = $('#creature_reactions_json').val()
  aarl_name = 'reaction'
  aarls_json = JSON.parse(aarls_raw)
  update_aarl(aarl_name, aarls_json)
  
  aarls_raw = $('#creature_legendary_actions_json').val()
  aarl_name = 'legendary_action'
  aarls_json = JSON.parse(aarls_raw)
  update_aarl(aarl_name, aarls_json)

fill_selects_with_window_data = ->
  form_id_prefix = 'creature_'

  damage_vulnerabilities_db = window.damage_vulnerabilities
  if damage_vulnerabilities_db
    for damage_vulnerabilitie in damage_vulnerabilities_db.split(', ')
      elem = $('#' + form_id_prefix + 'damage_vulnerabilities option[value="' + damage_vulnerabilitie + '"]')
      elem.prop('selected', true)

  damage_resistances_db = window.damage_resistances
  if damage_resistances_db
    for damage_resistance in damage_resistances_db.split(', ')
      elem = $('#' + form_id_prefix + 'damage_resistances option[value="' + damage_resistance + '"]')
      elem.prop('selected', true)
  
  damage_immunities_db = window.damage_immunities
  if damage_immunities_db
    for damage_immunitie in damage_immunities_db.split(', ')
      elem = $('#' + form_id_prefix + 'damage_immunities option[value="' + damage_immunitie + '"]')
      elem.prop('selected', true)
  
  condition_immunities_db = window.condition_immunities
  if condition_immunities_db
    for condition_immunitie in condition_immunities_db.split(', ')
      elem = $('#' + form_id_prefix + 'condition_immunities option[value="' + condition_immunitie + '"]')
      elem.prop('selected', true)
  
  languages_db = window.languages
  if languages_db
    for language in languages_db.split(', ')
      elem = $('#' + form_id_prefix + 'languages option[value="' + language + '"]')
      elem.prop('selected', true)
  
  skills_db = window.skills
  if skills_db
    for skill in skills_db.split(', ')
      elem = $('#' + form_id_prefix + 'skills option[value="' + skill + '"]')
      elem.prop('selected', true)

sort_items = (holder) ->
  list_container = $(holder)
  all_elements = list_container.children()
  
  all_elements.sort (a, b) ->
    a.id.localeCompare(b.id)
  
  list_container.empty()
  list_container.append(elem) for elem in all_elements

$ ->
  $(document).ready ->
    if window.location.href.includes('edit')
      update_holders_from_hidden_json()
      fill_selects_with_window_data()
    # update_json()

    MutationObserver = window.MutationObserver || window.WebKitMutationObserver
    # aarl = Ability, Action, Reaction, and Legendary action
    target = $('#aarl_container')[0]
    config = {
      childList: true,
      subtree: true
    }
    
    observer = new MutationObserver update_json

    observer.observe(target, config)
  
  $(document).on('click', '#aarl_delete', ->
    $(this).closest('li').remove()
    update_json()
    return false
  )

  $(document).on('click', '#aarl_up', ->
    elem = $(this).closest('li')
    elem.prev().insertAfter(elem)
    update_json()
    return false
  )

  $(document).on('click', '#aarl_down', ->
    elem = $(this).closest('li')
    elem.next().insertBefore(elem)
    update_json()
    return false
  )
  
  $(document).on('click', '#aarl_edit', ->
    hidden_aarl = $(this).siblings('input')[0]
    hidden_aarl_json = JSON.parse($(hidden_aarl).val())
    $('#creature_custom_name').val(hidden_aarl_json['name'])
    $('#creature_custom_body').val(hidden_aarl_json['desc'])
    $(this).closest('li').remove()
    update_json()
    return false
  )

  $('#new_special_abilitie, #new_action, #new_reaction, #new_legendary_action').click (event) ->
    event.preventDefault()
    unless $('#creature_custom_name').val() || $('#creature_custom_body').val()
      alert('Please enter a name and description.')
      return false

    type_of_new = this.id.slice(4, )

    custom_json = {
      name: $('#creature_custom_name').val(),
      desc: $('#creature_custom_body').val()
    }

    make_holder(type_of_new, custom_json)

  $('#fill_with_api').click (event) ->
    event.preventDefault()

    api_link = $('#api_link').val()

    $.ajax api_link, {
      type: 'GET'
      dataType: 'json'

      # beforeSend: ->
      error: (jqXHR, textStatus, errorThrown) ->
        alert('Call failed (check api link)')
      success: (data, textStatus, jqXHR) ->
        api_json = data
        form_id_prefix = 'creature_'
        
        unless api_json['name']
          alert('Received nothing from API...')
          return false

        alert('Received ' + api_json['name'] + ' from API!')
        
        $('#special_abilitie_holder_list').empty()
        $('#action_holder_list').empty()
        $('#reaction_holder_list').empty()
        $('#legendary_action_holder_list').empty()

        $('#' + form_id_prefix + 'name').val(api_json['name']) if api_json['name']
        $('#' + form_id_prefix + 'size').val(api_json['size']) if api_json['size']
        $('#' + form_id_prefix + 'tag').val(api_json['tag']) if api_json['tag']
        $('#' + form_id_prefix + 'body_type').val(api_json['type']) if api_json['type']
        $('#' + form_id_prefix + 'sub_body_type').val(api_json['subtype']) if api_json['subtype']
        $('#' + form_id_prefix + 'armor_class').val(api_json['armor_class']) if api_json['armor_class']
        $('#' + form_id_prefix + 'armor_name').val(api_json['armor_desc']) if api_json['armor_desc']
        $('#' + form_id_prefix + 'hit_points').val(api_json['hit_points']) if api_json['hit_points']
        $('#' + form_id_prefix + 'hit_dice').val(api_json['hit_dice']) if api_json['hit_dice']
        
        alignment_api = api_json['alignment']
        $('#' + form_id_prefix + 'alignment').children().each ->
          alignment = $(this).val()
          if alignment
            alignment_lower = alignment.toLowerCase()
            if alignment_api.includes(alignment_lower)
              $(this).prop('selected', true)
              
        speeds = api_json['speed']

        $('#' + form_id_prefix + 'speed').val(speeds['walk']) if speeds['walk']
        $('#' + form_id_prefix + 'burrow_speed').val(speeds['burrow']) if speeds['burrow']
        $('#' + form_id_prefix + 'climb_speed').val(speeds['climb']) if speeds['climb']
        $('#' + form_id_prefix + 'fly_speed').val(speeds['fly']) if speeds['fly']
        $('#' + form_id_prefix + 'swim_speed').val(speeds['swim']) if speeds['swim']

        $('#' + form_id_prefix + 'senses').val(api_json['senses']) if api_json['senses']

        if api_json['strength']? then $('#' + form_id_prefix + 'strength').val(api_json['strength']) else $('#' + form_id_prefix + 'strength').val('0')
        if api_json['dexterity']? then $('#' + form_id_prefix + 'dexterity').val(api_json['dexterity']) else $('#' + form_id_prefix + 'dexterity').val('0')
        if api_json['constitution']? then $('#' + form_id_prefix + 'constitution').val(api_json['constitution']) else $('#' + form_id_prefix + 'constitution').val('0')
        if api_json['intelligence']? then $('#' + form_id_prefix + 'intelligence').val(api_json['intelligence']) else $('#' + form_id_prefix + 'intelligence').val('0')
        if api_json['wisdom']? then $('#' + form_id_prefix + 'wisdom').val(api_json['wisdom']) else $('#' + form_id_prefix + 'wisdom').val('0')
        if api_json['charisma']? then $('#' + form_id_prefix + 'charisma').val(api_json['charisma']) else $('#' + form_id_prefix + 'charisma').val('0')

        if api_json['strength_save']? then $('#' + form_id_prefix + 'strength_save').val(api_json['strength_save']) else $('#' + form_id_prefix + 'strength_save').val('0')
        if api_json['dexterity_save']? then $('#' + form_id_prefix + 'dexterity_save').val(api_json['dexterity_save']) else $('#' + form_id_prefix + 'dexterity_save').val('0')
        if api_json['constitution_save']? then $('#' + form_id_prefix + 'constitution_save').val(api_json['constitution_save']) else $('#' + form_id_prefix + 'constitution_save').val('0')
        if api_json['intelligence_save']? then $('#' + form_id_prefix + 'intelligence_save').val(api_json['intelligence_save']) else $('#' + form_id_prefix + 'intelligence_save').val('0')
        if api_json['wisdom_save']? then $('#' + form_id_prefix + 'wisdom_save').val(api_json['wisdom_save']) else $('#' + form_id_prefix + 'wisdom_save').val('0')
        if api_json['charisma_save']? then $('#' + form_id_prefix + 'charisma_save').val(api_json['charisma_save']) else $('#' + form_id_prefix + 'charisma_save').val('0')

        if api_json['legendary_desc']? then $('#' + form_id_prefix + 'legendary_desc').val(api_json['legendary_desc']) else $('#' + form_id_prefix + 'legendary_desc').val('')

        damage_vulnerabilities_api = api_json['damage_vulnerabilities']
        $('#' + form_id_prefix + 'damage_vulnerabilities').children().each ->
          damage_vulnerabilitie = $(this).val()
          $(this).prop('selected', false)
          if damage_vulnerabilitie
            damage_vulnerabilitie_lower = damage_vulnerabilitie[0].toLowerCase() + damage_vulnerabilitie.slice(1)
            if damage_vulnerabilities_api.includes(damage_vulnerabilitie) || damage_vulnerabilities_api.includes(damage_vulnerabilitie_lower)
              $(this).prop('selected', true)

        damage_resistances_api = api_json['damage_resistances']
        $('#' + form_id_prefix + 'damage_resistances').children().each ->
          damage_resistance = $(this).val()
          $(this).prop('selected', false)
          if damage_resistance
            damage_resistance_lower = damage_resistance[0].toLowerCase() + damage_resistance.slice(1)
            if damage_resistances_api.includes(damage_resistance) || damage_resistances_api.includes(damage_resistance_lower)
              $(this).prop('selected', true)
              
        damage_immunities_api = api_json['damage_immunities']
        $('#' + form_id_prefix + 'damage_immunities').children().each ->
          damage_immunitie = $(this).val()
          $(this).prop('selected', false)
          if damage_immunitie
            damage_immunitie_lower = damage_immunitie[0].toLowerCase() + damage_immunitie.slice(1)
            if damage_immunities_api.includes(damage_immunitie) || damage_immunities_api.includes(damage_immunitie_lower)
              $(this).prop('selected', true)
        
        condition_immunities_api = api_json['condition_immunities']
        $('#' + form_id_prefix + 'condition_immunities').children().each ->
          condition_immunitie = $(this).val()
          $(this).prop('selected', false)
          if condition_immunitie
            condition_immunitie_lower = condition_immunitie[0].toLowerCase() + condition_immunitie.slice(1)
            if condition_immunities_api.includes(condition_immunitie) || condition_immunities_api.includes(condition_immunitie_lower)
              $(this).prop('selected', true)

        if (parseFloat(api_json['challenge_rating']) % 1 == 0)
          $('#' + form_id_prefix + 'challenge_rating option[value=' + api_json['challenge_rating'].toString() + ']').prop('selected', true)
        else
          rating_dictionary = {
            0.125: '1/8',
            0.25: '1/4',
            0.5: '1/2'
          }
          rating = rating_dictionary[parseFloat(api_json['challenge_rating'])]
          if rating
            $('#' + form_id_prefix + 'challenge_rating option[value="' + rating + '"]').prop('selected', true)

        if api_json['languages']
          languages = []
          $('#' + form_id_prefix + 'languages').children().each ->
            languages.push($(this).val())
            $(this).prop('selected', false)
          languages = languages.slice(1)
          api_languages = api_json['languages'].split(', ')
          for language in api_languages
            language_value = language[0].toUpperCase() + language.slice(1)
            if languages.includes(language_value)
              $('#' + form_id_prefix + 'languages option[value=' + language_value + ']').prop('selected', true)
        else
          $('#' + form_id_prefix + 'languages option').each ->
            $(this).prop('selected', false)
        
        if $.isEmptyObject(api_json['skills'])
          $('#creature_skills option[value=""]').prop('selected', true)
        else
          skills = []
          $('#' + form_id_prefix + 'skills').children().each ->
            skills.push($(this).val())
            $(this).prop('selected', false)
          skills = skills.slice(1)
          for skill in skills
            api_skill = skill[0].toLowerCase() + skill.slice(1)
            skill_value = api_json['skills'][api_skill]
            if skill_value
              $('#' + form_id_prefix + 'skills option[value=' + skill + ']').prop('selected', true)
        
        if api_json['actions']
          $('#' + form_id_prefix + 'actions_json').val(JSON.stringify(api_json['actions']))
          for actions in api_json['actions']
            make_holder('action', actions)
        else
          $('#' + form_id_prefix + 'actions_json').val('')
        
        if api_json['special_abilities']
          $('#' + form_id_prefix + 'special_abilities_json').val(JSON.stringify(api_json['special_abilities']))
          for special_abilities in api_json['special_abilities']
            make_holder('special_abilitie', special_abilities)
        else
          $('#' + form_id_prefix + 'special_abilities_json').val('')
        
        if api_json['reactions']
          $('#' + form_id_prefix + 'reactions_json').val(JSON.stringify(api_json['reactions']))
          for actions in api_json['reactions']
            make_holder('reaction', actions)
        else
          $('#' + form_id_prefix + 'reactions_json').val('')
        
        if api_json['legendary_actions']
          $('#' + form_id_prefix + 'legendary_actions_json').val(JSON.stringify(api_json['legendary_actions']))
          for legendary_actions in api_json['legendary_actions']
            make_holder('legendary_action', legendary_actions)
        else
          $('#' + form_id_prefix + 'legendary_actions_json').val('')
    }

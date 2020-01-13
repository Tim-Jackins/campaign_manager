totalhd_clicked = () ->
  $("[name='remaininghd']").val($("[name='totalhd']").val())

$ ->
  $('.stat').bind 'input', ->
    inputName = $(this).attr('name')
    raw_val = $(this).val()
    mod = parseInt(raw_val) - 10
    
    if (mod % 2 == 0)
      mod = mod / 2
    else
      mod = (mod - 1) / 2

    if (isNaN(mod))
      mod = ""
    else if (mod >= 0)
      mod = "+" + mod

    scoreName = inputName.slice(0, inputName.indexOf("score"))
    modName = scoreName + "mod"
    
    $("[name='" + modName + "']").val(mod)
      
  $('.statmod').bind 'change', ->
    name = $(this).attr('name')
    name = "uses" + name.slice(0, name.indexOf('mod'))

  $("[name='classlevel']").bind 'input', ->
    classes = $(this).val()
    r = new RegExp(/\d+/g)
    total = 0
    result
    while ((result = r.exec(classes)) != null)
      lvl = parseInt(result)
      if (!isNaN(lvl))
        total += lvl
    
    prof = 2
    if (total > 0)
      total -= 1
      prof += Math.trunc(total / 4)
      prof = "+" + prof
    
    else
      prof = ''
    
    $("[name='proficiencybonus']").val(prof)


  $("[name='totalhd']").bind 'input', ->
    $("[name='remaininghd']").val($(this).val())

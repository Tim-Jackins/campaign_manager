# var ta = document.querySelector('textarea');
# ta.addEventListener('focus', function(){
#   autosize(ta);
# });
autosize = require('autosize')

$ ->
  $(document).ready ->
    # console.log($(this))
    for node in $('textarea')
      autosize(node)

  $(document).on 'focus', 'textarea', ->
    # console.log($(this))
    autosize($(this))
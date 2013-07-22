$ ->
  $(window).bind 'load resize', ->
    if $(window).height() < 580
      $('.intro').removeClass 'is-fixed'
    else
      $('.intro').addClass 'is-fixed'

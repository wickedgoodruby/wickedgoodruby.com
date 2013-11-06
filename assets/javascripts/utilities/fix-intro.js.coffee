$ ->
  $(window).bind 'load resize', ->
    if $(window).height() < 580
      $('.intro').removeClass 'intro-is-fixed'
    else
      $('.intro').addClass 'intro-is-fixed'

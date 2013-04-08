$ ->
  $(window).bind 'load resize', ->
    if $(window).height() < 580
      $('.intro').removeClass 'fix-intro'
    else
      $('.intro').addClass 'fix-intro'
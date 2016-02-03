jQuery ->
  $(document).on
    click: ->
      $('.header_option_container').slideUp('fast')
      if $(this).data('section') == "about"
        $("#about_section").slideDown('fast')
      else if $(this).data('section') == "more_info"
        $("#more_info_section").slideDown('fast')
  , ".header_option"
  $(document).on
    click: ->
      $('.header_option_container').slideUp('fast')
  , ".close_header_option_container"

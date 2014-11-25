$ = jQuery
$ ->
  displayLocation = (url) ->
    $.ajax(
      url: url
      success: (result) ->
        $('#alt-content').html result
    )

  findRover = (clicked) ->
    if ge?
      reLoadKml "#{clicked.data('url') }.kml"
    else
      displayLocation "#{clicked.data('url') }.html"
    true

  $('#rover-select').on('click','li>a', ->
    clicked = $(this)
    findRover(clicked)
    # remove active from all links
    clicked.parent().siblings().removeClass('active')
    # add active to the link clicked
    clicked.parent().addClass('active')
    null
  )


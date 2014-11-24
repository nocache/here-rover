$ = jQuery
$ ->
  $('#rover-select').on('click','li>a', ->
    clicked = $(this)
    reLoadKml(clicked.data('url'))
    # remove active from all links
    clicked.parent().siblings().removeClass('active')
    # add active to the link clicked
    clicked.parent().addClass('active')
    null
  )


$ = jQuery
$ ->
  $('#rover-select').on('click','li>a', ->
    clicked = $(this)
    console.log "#{clicked.data('vid')} clicked"
    # remove active from all links
    clicked.parent().siblings().removeClass('active')
    # add active to the link clicked
    clicked.parent().addClass('active')
    null
  )


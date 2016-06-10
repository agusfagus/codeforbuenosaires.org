$(document).ready ->
  $("nav a[href^=\"#\"]").on "click", (event) ->
    target = $($(this).attr("href"))
    if target.length
      event.preventDefault()
      $("html, body").animate
        scrollTop: target.offset().top
      , 1000
      $('.navbar-collapse').removeClass('in')

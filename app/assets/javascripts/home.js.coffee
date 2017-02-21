# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#map-button").click -> 
    if $("#location-map").length == 0
      $(this).parents("ul").append '<li id="location-map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6867.065532262262!2d-96.3377598509173!3d30.61893949607023!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xf8e9083618c9fe91!2sDepartment+of+Electrical+and+Computer+Engineering!5e0!3m2!1sen!2sus!4v1394444107133" width=100% height="450" frameborder="0" style="border:0"></iframe></li>'     
      $('#map-button').addClass('icon-as-hover')
      $('#map-button').attr('title', 'close map')
    else
      $("#location-map").remove()
      $('#map-button').removeClass('icon-as-hover')
      $('#map-button').attr('title', 'View location on Google Map')
  $('.top-list-about-me-panel').click ->
    $('.top-list').removeClass('active')      
    $(this).addClass('active')
  $('.top-list-publications-panel').click ->
    $('.top-list').removeClass('active')      
    $(this).addClass('active')
  $('.top-list-contacts-panel').click ->
    $('.top-list').removeClass('active')      
    $(this).addClass('active')
  $('.dropdown').click ->
    $('.top-list').removeClass('active')      
    $(this).children('.dropdown-content').css('visibility', 'visible' )
  $('body').click (e) ->
    if (not $(e.target).is('.dropdown-content') ) and (not $(e.target).parents().is('.dropdown-content')) and (not $(e.target).is('.dropdown') ) and (not $(e.target).parents().is('.dropdown') )
      $('.dropdown-content').css('visibility', 'hidden')
    if (not $(e.target).is('.top-list') and (not $(e.target).parents().is('.top-list')))
      $('.active').removeClass('active')
  $(window).scroll ->
    $('li.top-list').removeClass('active')
  $('.top-nav-left').click ->
    $('#home').height( $($(this).attr('href')).offset().top + $(window).height() - parseInt($('#home').css('padding-top'), 10) )
  $('.para-title').hover( 
    ->
      $(this).children('a.anchor').css('opacity', 1)
    ->
      $(this).children('a.anchor').css('opacity', 0)
  )
  $('a.anchor').click ->
    $('li.top-list').removeClass('active')
    $('#home').height( $($(this).attr('href')).offset().top + $(window).height() - parseInt($('#home').css('padding-top'), 10) )
    $('li.top-list-' + $(this).attr('href').substr(1)).addClass('active')
  $('.first-column').hover(
    ->
      $(this).children('.icon-link').css('opacity', 1)
    ->
      $(this).children('.icon-link').css('opacity', 0.3)
  )

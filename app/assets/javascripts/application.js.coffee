# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require turbolinks
#= require_tree .


$(document).ready ->

  content = $("#content")

  $.ajax
    url: "/albums"
    dataType: "JSON"
    beforeSend: ->
      content.addClass("preloader")
    success: (response) -> 
      content.removeClass("preloader")
      




  
  # $('body').on 'click', '.add_to_playlist', () ->
  #   button  = $(this)
  #   videoId = button.attr 'data-id'
  #   $.ajax(
  #     type: "POST"
  #     url: "/playlist/add/"
  #     dataType: "JSON"
  #     data:
  #       video_id: videoId
  #   ).done (response) ->
  #     unless response.error
  #       button.hide()
  #       FrontendNotifier.show response
  #     else
  #       FrontendNotifier.show response 



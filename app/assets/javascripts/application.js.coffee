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
#= require jquery_ujs
#= require twitter/bootstrap
#= require turbolinks
#= require jquery-tmpl
#= require_tree ./templates
#= require_tree .


$(document).ready ->

  content = $("#content")

  $.ajax
    url: "/albums"
    dataType: "JSON"
    beforeSend: ->
      content.addClass("preloader")
    success: (albums) -> 
      content.removeClass("preloader")

      $.each albums, (i) ->
        $.tmpl("templates/album", { thumb_src: albums[i].thumb_src, aid: albums[i].aid  })
         .hide().appendTo("#content").fadeIn()
      
  
  $('body').on 'click', '.album a', (e) ->
    e.preventDefault()
    $.ajax
      url: $(this).attr("href")
      dataType: "JSON"
      beforeSend: ->
        content.empty()
        content.addClass("preloader")
      success: (photos) -> 
        content.removeClass("preloader")
        
        $.each photos, (i) ->
          $.tmpl("templates/photo", { src_big: photos[i].src_big, text: photos[i].text  })
           .hide().appendTo("#content").fadeIn(1000)




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

  
content = $("#content")

$.ajax
  url: "/albums"
  dataType: "JSON"
  beforeSend: ->
    content.addClass("preloader")
  success: (albums) -> 
    content.removeClass("preloader")
    $.tmpl("templates/album", albums).hide().appendTo("#content").fadeIn(500)
  

$(document).on 'click', '.album a', (e) ->
  e.preventDefault()
  $.ajax
    url: $(this).attr("href")
    dataType: "JSON"
    beforeSend: ->
      content.empty()
      content.addClass("preloader")
    success: (photos) -> 
      content.removeClass("preloader")
      $("#user_name").wrapInner('<a href="/" />')
      $.tmpl("templates/photo", photos).hide().appendTo("#content").fadeIn(500)






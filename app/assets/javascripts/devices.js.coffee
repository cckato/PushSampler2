# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.btn-push').click ->
    data =
      "title": $('#title').val()
      "message": $('#message').val()
      "ticker": $('#ticker').val()
    url = "devices/#{$(@).data('deviceId')}/push"
    $.ajax({
      type:'POST',
      url:url,
      data:data,
      dataType:"html"
    })
    .done (response, success) ->
      alert "成功"
    .fail (response, success) ->
      alert "失敗"




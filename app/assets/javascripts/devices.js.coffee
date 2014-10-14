# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  $notice = $('#notice')
  if $notice.html() == ""
    $notice.hide()
  else
    setTimeout ->
      $notice.fadeOut(800)
    , 2000

  $('.btn-push').click ->
    data =
      "title": $('#title').val()
      "message": $('#message').val()
      "ticker": $('#ticker').val()
    url = "devices/#{$(@).data('deviceId')}/push"
    $.ajax
      type:'POST'
      url:url,
      data:data,
      dataType:"html"
    .done (response, success) ->
      console.log "成功"
      $('#notice').html("個別にPush通知を送ったよ").show()
      setTimeout ->
        $('#notice').fadeOut(800)
      , 2000
    .fail (response, success) ->
      console.log "失敗"





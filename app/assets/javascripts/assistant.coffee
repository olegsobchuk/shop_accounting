$(document).on 'turbolinks:load', ->
  $input = $('#search input')
  typingTimer = undefined
  doneTypingInterval = 800

  doneTyping = ->
    $.get '/assistant/things',
      uid: $input.val()
      format: 'js'

  $input.on 'keyup', ->
    clearTimeout typingTimer
    typingTimer = setTimeout(doneTyping, doneTypingInterval)

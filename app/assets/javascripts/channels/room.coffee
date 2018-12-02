document.addEventListener 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: $('#messages').data('room_id') },
  # App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # alert data['message']

      show_user = $('#show_user').data('show_user')
      console.log data['chat_user']
      console.log show_user
      if data['chat_user'] == show_user
        $('#messages').append data['message_right']
      else
        $('#messages').append data['message_left']    
    # $('#messages').append data['message']
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    @perform 'speak', message: message
    
  $(document).on 'keydown', '[data-behavior~=room_speaker]', (event) ->
    if event.ctrKey && event.keyCode is 13
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()
      
  $(document).on 'click', '.chat_submit', ->
    App.room.speak $('[data-behavior~=room_speaker]').val()
    $('[data-behavior~=room_speaker]').val('')
    event.preventDefault()      

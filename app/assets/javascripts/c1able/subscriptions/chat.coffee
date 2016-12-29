App.cable.subscriptions.create { channel: "MessagesChannel", room: "Best Room" },
  received: (data) ->
    @appendLine(data)
 
  appendLine: (data) ->
    html = @createLine(data)
    $("[data-chat-room='Best Room']").append(html)
 
  createLine: (data) ->
    """
    <article class="chat-line">
      <span class="speaker">#{data["sent_by"]}</span>
      <span class="body">#{data["body"]}</span>
    </article>
    """
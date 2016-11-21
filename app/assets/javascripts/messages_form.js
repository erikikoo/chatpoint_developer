function messageForm(){
  var shiftDown = false;
  var chatForm = $("#new_message");
  var messageBox = chatForm.children("textarea");
  $(document).keypress(function (e) {
      
        if(e.keyCode == 13) {
          if(messageBox.is(":focus") && !shiftDown) {
            e.preventDefault(); // prevent another \n from being entered
            chatForm.submit();
            $(chatForm).trigger('reset');
            $(".scroll").scrollTop($(".scroll")[0].scrollHeight);
          }
        }  
      
      
  });

  $('.btnEnviarMensagem').click(function (e) {
      
      
            e.preventDefault(); // prevent another \n from being entered
            chatForm.submit();
            $(chatForm).trigger('reset');
            $(".scroll").scrollTop($(".scroll")[0].scrollHeight);
      
  });

  $(document).keydown(function (e) {
      if(e.keyCode == 16) shiftDown = true;
  });

  $(document).keyup(function (e) {
      if(e.keyCode == 16) shiftDown = false;
  });
}

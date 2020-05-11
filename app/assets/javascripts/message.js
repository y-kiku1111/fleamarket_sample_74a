$(function(){
  
  $("#comment__btn--link").on('click', function(e){
    e.preventDefault();

        var formData = new FormData(this);
    // var url = $(this).attr('action');

    debugger

  })
  
//   $('#comment__btn--link').click(function(e){
//     e.preventDefault();

//     var formData = new FormData(this);
//     var url = $(this).attr('action');

//     debugger

//     $.ajax({
//       url: url,
//       type: "POST",
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })

//     .done(function(data){ 
//       var html = buildHTML(data);
//       $('.messages').append(html);
//       $('form')[0].reset();
//       $('.main-chat__footer--sendbtn').prop('disabled', false);
//       $('.messages').animate({ scrollTop: $('.messages')[0].scrollHeight});
//     })

//     .fail(function(){
//       alert("メッセージ送信に失敗しました");
//     })
//   })

})

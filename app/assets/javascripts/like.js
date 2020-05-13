// $(function(){

//   let cnt = 0
      
//   $("#like-btn").on('click', function(e){
//     e.preventDefault();

//     var likes = document.getElementById('numLike');

//     let numLike = $(`#numLike`).text()
//     numLike = Number(numLike)
//     numLike = numLike + 1
//     likes.textContent = numLike

//     var formData = {"like" :{ "like" :numLike}};
   
//     $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
//       var token;
//       if (!options.crossDomain) {
//       token = $('meta[name="csrf-token"]').attr('content');
//          if (token) {
//             return jqXHR.setRequestHeader('X-CSRF-Token', token);
//           }
//        }
//     });

//     $.ajax({
//       url: "/likes/1",
//       type: "PATCH",
//       data: formData,
//       dataType: 'json',
//     })

//     .done(function(data){ 
      
//     })

//     .fail(function(){
//       alert("メッセージ送信に失敗しました");
//     })
//   })
// })

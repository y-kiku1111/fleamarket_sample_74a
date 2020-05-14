$(function(){

  function buildHTML(comment) {
    
    var html = `<div class="comment__history--name">
                  <i class="fas fa-user"></i>
                    ${comment.nickname}
                  </div>
                  <div class="comment__history--content">
                    ${comment.text}
                  <div class="comment__history--content-date">
                    date:
                    ${comment.created_at}
                  </div>
                </div>`
    return html;
  }
      
  $("#comment__btn--link").on('click', function(e){
    e.preventDefault();


    var $dir = location.href.split("/");
    var dir2 = $dir[$dir.length -1];

    var content = $(`#comment__input`).val()

    var formData = {"comment" :{ "text" :content}};
   
    $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
      var token;
      if (!options.crossDomain) {
      token = $('meta[name="csrf-token"]').attr('content');
         if (token) {
            return jqXHR.setRequestHeader('X-CSRF-Token', token);
          }
       }
    });

    $.ajax({
      url: `/products/${dir2}/comments`,
      type: "POST",
      data: formData,
      dataType: 'json',
    })

    .done(function(data){ 
      var html = buildHTML(data);
      $('#comment__history').append(html);
      $('#comment__input').val('');
    })

    .fail(function(){
      alert("メッセージ送信に失敗しました");
    })
  })
})
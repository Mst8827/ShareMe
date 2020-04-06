$(function(){
  function buildHTML(comment){
    var html = `<div class="comment-box">
                  <strong>
                    <a class= "comment-name" href='/users/${comment.user_id}'>${comment.user_name}</a>
                    ：
                  </strong>
                  <div class="comment-text">
                    ${comment.text}
                  </div>
                  <div class="comment-date">
                    ${comment.date}
                  </div>
                </div>`
                
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments_all').append(html);
      $('.comments_all').animate({ scrollTop: $('.comments_all')[0].scrollHeight});
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});


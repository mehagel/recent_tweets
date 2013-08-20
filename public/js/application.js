$(document).ready(function(){
  $(document).on('click','#button', function(e){
    e.preventDefault();

    $('#spinner').show();
var data = {username: $('input[name="username"]').val()};
console.log(data)

    $.ajax ({
      type: 'post',
      url: '/username',
      data: data
      }).done(function(server_response){
      $("#spinner").hide();
      $('#tweets').html(server_response);
    }).fail(function(){
      });
    });

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
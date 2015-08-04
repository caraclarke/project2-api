// Projects

$("#project-create").on('click', function(){
  $.ajax({
    url: '/projects',
    method: 'POST',
    data: {
      movie: {
        title: $("#movie-title").val(),
        description: $("#movie-description").val(),
        release_year: Number($("#movie-year").val()),
        mpaa_rating: $("#movie-mpaa").val(),
        length: Number($("#movie-length").val())
      }
    }
  }).done(function(data){
    console.log("Created movie!");
  }).fail(function(data){
    console.error(data);
  });
});

$("#project-show").on('click', function(event){
  $.ajax({
    url: "/projects/" + $("#movie-id").val(),
  }).done(function(movie){
    $("#movies").html("<li>" + movie.title + ", about " + movie.description + " and released in " + movie.release_year + ". MPAA Rating " + movie.mpaa_rating + ", movie length " + movie.length + "</li>");
  }).fail(function(data){
    console.error(data);
  });
});

$("#project-index").on('click', function(event){
  $.ajax({
    url: "/projects",
  }).done(function(data){
    $("#movies").html('');
    data.forEach(function(movie){
      $("#movies").append("<li>" + movie.title + ", about " + movie.description + " and released in " + movie.release_year + ". MPAA Rating " + movie.mpaa_rating + ", movie length " + movie.length + "</li>");
    });
  }).fail(function(data){
    console.error(data);
  });
});

$("#project-update").on('click', function(){
  $.ajax({
    url: '/projects/' + $("#project-id").val(),
    method: 'PATCH',
    headers: {
        Authorization: 'Token token=' + $('#token').val()
    },
    data: {
      credentials: {
       email: $('#email').val(),
       username: $('#username').val(),
       password: $('#password').val(),
       password_confirmation: $('#password').val()
     }
   }
 }).done(function(data, textStatus, jqxhr){
   $('#result').val(JSON.stringify(data));
 }).fail(function(jqxhr, textStatus, errorThrown){
   $('#result').val('update failed');
 });
}); // end update

$("#project-destroy").on('click', function(){
  $.ajax({
    url: '/projects/' + $("#project-id").val(),
    method: 'DELETE',
    headers: {
        Authorization: 'Token token=' + $('#token').val()
    }, // is there a way to get it by user id?
  }).done(function(data){
    console.log("Deleted user!");
  }).fail(function(data){
    console.error(data);
  });
}); // end destroy

// end Projects

// headers: { Authorization: 'Token token=' + $('#token').val(cbb4ebd15c6f75836bb09584f9903e02) }
// ruby -run -e httpd . -p 5000

// {"user":{"id":1,"email":"cara@gmail.com"} pw: 'abc1234'}

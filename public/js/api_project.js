$(function() {
  'use strict';

  // Projects

$("#project-create").on('click', function(e){
  var projectReader = new FileReader();
  projectReader.onload = function(event) {
    var project_picture = event.target.result;
      $.ajax({
      url: '/projects',
      method: 'POST',
      headers: {
        Authorization: 'Token token=' + $('#token').val()
      },
      data: {
        credentials: {
          title: $('#project-title').val(),
          instructions: $('#project-instructions').val(),
          profile_id: $('profile_id').val(),
          project_image: project_picture
        }
      }
    }).done(function(data){
      console.log("Created project!");
      $('#result').val(JSON.stringify(data));
    }).fail(function(data){
      console.error(data);
    });
  }
  projectReader.readAsDataURL($('#project-picture')[0].files[0]);
}); // end project create

$("#project-show").on('click', function(event){
  $.ajax({
    url: "/projects/" + $("#movie-id").val(),
  }).done(function(movie){
    $("#movies").html("<li>" + movie.title + ", about " + movie.description + " and released in " + movie.release_year + ". MPAA Rating " + movie.mpaa_rating + ", movie length " + movie.length + "</li>");
  }).fail(function(data){
    console.error(data);
  });
}); // end project show

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
}); // end project index

$("#project-update").on('click', function(){
  $.ajax({
    url: '/projects/' + $("#project-id").val(),
    method: 'PATCH',
    headers: {
        Authorization: 'Token token=' + $('#token').val()
    },
    data: {
      credentials: {
        title: $('#project-title').val(),
        instructions: $('#project-instructions').val(),
        profile_id: $('profile_id').val()
     }
   }
 }).done(function(data, textStatus, jqxhr){
   $('#result').val(JSON.stringify(data));
 }).fail(function(jqxhr, textStatus, errorThrown){
   $('#result').val('update failed');
 });
}); // end project update

$("#project-destroy").on('click', function(){
  $.ajax({
    url: '/projects/' + $("#project-id").val(),
    method: 'DELETE',
    headers: {
        Authorization: 'Token token=' + $('#token').val()
    },
  }).done(function(data){
    console.log("Deleted project!");
  }).fail(function(data){
    console.error(data);
  });
}); // end project destroy

// end Projects

// headers: { Authorization: 'Token token=' + $('#token').val(cbb4ebd15c6f75836bb09584f9903e02) }
// ruby -run -e httpd . -p 5000

}); // end page

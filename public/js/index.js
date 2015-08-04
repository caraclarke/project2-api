$(function() {
  'use strict';
  // var gameWatcher;
  // var sa = 'localhost:3000';
  // var sa = '';

// User
$('#register').on('click', function(e){
 $.ajax({
   url: '/users',
       contentType: 'application/json',  // to send as JSON, must specify content type
       processData: false,
       data: JSON.stringify({
         credentials: {
           email: $('#email').val(),
           username: $('#username').val(),
           password: $('#password').val(),
           password_confirmation: $('#password').val()
         }
       }),
       dataType: 'json',
       method: 'POST'
     }).done(function(data, textStatus, jqxhr){
       $('#result').val(JSON.stringify(data));
     }).fail(function(jqxhr, textStatus, errorThrown){
       $('#result').val('registration failed');
     });
   }); // end register

$('#login').on('click', function(e){
 $.ajax({
  url: '/login',
  contentType: 'application/json',
  processData: false,
  data: JSON.stringify({
   credentials: {
     email: $('#email').val(),
     password: $('#password').val(),
   }
 }),
  dataType: 'json',
  method: 'POST'
}).done(function(data, textStatus, jqxhr){
 $('#token').val(data.token);
}).fail(function(jqxhr, textStatus, errorThrown){
 $('#result').val('login failed');
});
   }); // end login

$("#update").on('click', function(){
  $.ajax({
    url: '/users/' + $("#user-id").val(),
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

$("#destroy").on('click', function(){
  $.ajax({
    url: '/users/' + $("#user-id").val(),
    method: 'DELETE',
    headers: {
        Authorization: 'Token token=' + $('#token').val()
    },
  }).done(function(data){
    console.log("Deleted user!");
  }).fail(function(data){
    console.error(data);
  });
}); // end destroy

// end Users


// headers: { Authorization: 'Token token=' + $('#token').val(cbb4ebd15c6f75836bb09584f9903e02) }
// ruby -run -e httpd . -p 5000

// {"user":{"id":1,"email":"cara@gmail.com"} pw: 'abc1234'}

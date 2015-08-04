$(function() {
  'use strict';
  // var gameWatcher;
  // var sa = 'localhost:3000';
  // var sa = '';

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

  $('#list').on('click', function(e){
    $.ajax(sa + '/users', {
      dataType: 'json',
      method: 'GET',
      headers: {
        Authorization: 'Token token=' + $('#token').val()
      }
    }).done(function(data, textStatus, jqxhr){
     $('#result').val(JSON.stringify(data));
   }).fail(function(jqxhr, textStatus, errorThrown){
     $('#result').val('list failed');
   });
  }); // end list

  $('#create').on('click', function(e){
    $.ajax(sa + '/games', {
      contentType: 'application/json',  // to send as JSON, must specify content type
      processData: false,
      data: JSON.stringify({}),
      dataType: 'json',
      method: 'POST',
      headers: {
        Authorization: 'Token token=' + $('#token').val()
      }
    }).done(function(data, textStatus, jqxhr){
      $('#result').val(JSON.stringify(data));
    }).fail(function(jqxhr, textStatus, errorThrown){
      $('#result').val('create failed');
    });
  }); // end create

  $('#show').on('click', function(e){
    $.ajax(sa + '/games/' + $('#id').val(), {
      dataType: 'json',
      method: 'GET',
      headers: {
        Authorization: 'Token token=' + $('#token').val()
      }
    }).done(function(data, textStatus, jqxhr){
      $('#result').val(JSON.stringify(data));
    }).fail(function(jqxhr, textStatus, errorThrown){
      $('#result').val('show failed');
    });
  }); // end show

  $('#join').on('click', function(e){
    $.ajax(sa + '/games/' + $('#id').val(), {
      contentType: 'application/json',  // to send as JSON, must specify content type
      processData: false,
      data: JSON.stringify({}),
      dataType: 'json',
      method: 'PATCH',
      headers: {
        Authorization: 'Token token=' + $('#token').val()
      }
    }).done(function(data, textStatus, jqxhr){
      $('#result').val(JSON.stringify(data));
    }).fail(function(jqxhr, textStatus, errorThrown){
      $('#result').val('join failed');
    });
  }); // end join

  $('#move').on('click', function(e){
    $.ajax(sa + '/games/' + $('#id').val(), {
      contentType: 'application/json',  // to send as JSON, must specify content type
      processData: false,
      data: JSON.stringify({
        game: {
          cell: {
            index: +$('#index').val(),
            value: $('#value').val()
          } // end cell
        } // end game
      }), // end data
      dataType: 'json',
      method: 'PATCH',
      headers: {
        Authorization: 'Token token=' + $('#token').val()
      }
    }).done(function(data, textStatus, jqxhr){
      $('#result').val(JSON.stringify(data));
    }).fail(function(jqxhr, textStatus, errorThrown){
      $('#result').val('move failed');
    });
  }); // end move

  $('#watch').on('click', function(){
    gameWatcher = resourceWatcher(sa + '/games/' + $('#id').val() + '/watch', {
      Authorization: 'Token token=' + $('#token').val()
    });
    gameWatcher.on('change', function(data){
      // heroku routers report this as a 503
      // if (data.timeout) { //not an error
      // gameWatcher.close();
      // return console.warn(data.timeout);
      // }
      var parsedData = JSON.parse(data);
      var gameData = parsedData.game;
      var cell = gameData.cell;
      $('#index').val(cell.index);
      $('#value').val(cell.value);
    });
    gameWatcher.on('error', function(e){
      console.error('an error has occured witht the stream', e);
    });
  }); // end watch

}); // end function

// headers: { Authorization: 'Token token=' + $('#token').val(cbb4ebd15c6f75836bb09584f9903e02) }
// ruby -run -e httpd . -p 5000

// {"user":{"id":5,"email":"cclarke6@asu.edu"}}

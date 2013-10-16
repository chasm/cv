$(function() {
  $('#toggle-password-field').on('click', function(evt) {
    if ($(this).hasClass('btn-warning')) {
      $(this).html($(this).html().replace('Show', 'Hide'));
      
      $(this).removeClass('btn-warning');
      $(this).addClass('btn-success');
      
      $('#user_password').attr('type','text');
      $('#user_password_confirmation').attr('type','text');
    } else {
      $(this).html($(this).html().replace('Hide', 'Show'));
      
      $(this).removeClass('btn-success');
      $(this).addClass('btn-warning');
      
      $('#user_password').attr('type','password');
      $('#user_password_confirmation').attr('type','password');
    }
    
    $('#user_password').focus();
    return false;
  });
  
  var MIN_STRENGTH = 3;
  var BAR_TYPES = [
    '',
    'progress-bar-danger',
    'progress-bar-warning',
    'progress-bar-info',
    'progress-bar-success'
  ];
  
  var score = 0;
  
  var passwordsMatch = function() {
    return $('#user_password').val() === $('#user_password_confirmation').val();
  };
  
  var setMismatchDiv = function() {
    var div = $('#match-div');
    
    if (passwordsMatch()) {
      div.addClass('match');
      div.html('Match!');
    } else {
      div.removeClass('match');
      div.html('Mismatch!');
    }
  };
  
  var enableButton = function() {
    if (score >= MIN_STRENGTH) {
      $('#pw-quality').addClass('ok');
      $('#pw-quality').html('Password strength OK!');

      if (passwordsMatch()) {
        $('#save-password').removeAttr('disabled');
      } else {
        $('#save-password').attr('disabled', true);
      }
      
      return true;
    } else {
      $('#save-password').attr('disabled', true);
      $('#pw-quality').removeClass('ok');
      $('#pw-quality').html('Password too weak!');
      return false;
    }
  };
  
  $('#user_password').on('keyup', function(evt) {
    var strength = zxcvbn($(this).val());
    score = strength.score;
    
    setMismatchDiv();
    
    $('#strength-meter')
      .removeClass('w-0')
      .removeClass('w-1')
      .removeClass('w-2')
      .removeClass('w-3')
      .removeClass('w-4')
      .removeClass('progress-bar-success')
      .removeClass('progress-bar-info')
      .removeClass('progress-bar-warning')
      .removeClass('progress-bar-danger')
      .addClass(BAR_TYPES[score])
      .addClass('w-' + score);
    
    $('#time-to-crack').html(strength.crack_time_display);
    
    $('#hidden-strength').val(score);
    
    enableButton();
  });
  
  $('#user_password_confirmation').on('keyup', function(evt) {
    setMismatchDiv();
    enableButton();
  });
  
  $('#new_admin').on('submit', function() {
    console.log(enableButton());
    return enableButton();
  });
});

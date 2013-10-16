$(function() {
  $('.login-options a').on('click', function(event) {
    $('.login-options li').removeClass('active');
    $($(this)[0].parentNode).addClass('active');

    if ($(this)[0].id === 'login-pill') {
      $('#toggle-password-field').show();
      $('#user_password').show();
      $('#loginform legend').html('Please sign in');
    } else {
      $('#toggle-password-field').hide();
      $('#user_password').hide();
      if ($(this)[0].id === 'register-pill') {
        $('#loginform legend').html('Please register');
      } else {
        $('#loginform legend').html('Please submit your email address');
      }
    }
    
    event.preventDefault();
  });
});
$(function() {
  $('.login-options a').on('click', function(event) {
    $('.login-options li').removeClass('active');
    $($(this)[0].parentNode).addClass('active');

    if ($(this)[0].id === 'login-pill') {
      $('#toggle-password-field').show();
      $('#user_password').show();
      $('#loginform legend').html('Please sign in');
      $('#login-submit').val('Sign in');
    } else {
      $('#toggle-password-field').hide();
      $('#user_password').hide();
      $('#user_password').val('');
      if ($(this)[0].id === 'register-pill') {
        $('#login-submit').val('Register');
      } else {
        $('#login-submit').val('Reset password');
      }
      $('#loginform legend').html('Please enter your email address');
    }
    
    event.preventDefault();
  });
});
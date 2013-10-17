//= require jquery
//= require jquery_ujs
//= require password
//= require session
//= require bootstrap
//= require ./vendor/jquery.noty
//= require_tree ./vendor/layouts
//= require_tree ./vendor/themes
//= require ./vendor/numeral
//= require ./vendor/moment
//= require ./vendor/datetimepicker

$(function() {
  $('a.delete-link').click(function(event) {
    $('#delete-warning').html('Are you certain that you wish to delete your account? This action cannot be undone.');
    $('#delete-modal').modal('show');

    return false;
  });
  
  $.rails.confirmed = function(link) {
    link.removeAttr('data-confirm');
    link.trigger('click.rails');
  };
  
  $.rails.showConfirmDialog = function(link){
    var html = 
      '<div class="modal" id="confirmationDialog" role="dialog" aria-labelledby="delete-model-title" aria-hidden="true">' +
        '<div class="modal-dialog">' +
          '<div class="modal-content">' +
            '<div class="modal-header">' +
              '<a class="close" data-dismiss="modal">&times;</a>' +
              '<h3 id="delete-modal-title">Please confirm your account deletion</h3>' +
            '</div>' +
            '<div class="modal-body">' +
              '<p>Are you certain that you want to delete your account? This action cannot be undone.</p>' +
            '</div>' +
            '<div class="modal-footer">' +
              '<a data-dismiss="modal" class="btn btn-success">Cancel</a>' +
              '<a data-dismiss="modal" class="btn btn-danger confirm">Delete account</a>' +
            '</div>' +
          '</div>' +
        '</div>' +
      '</div>';
      
    $(html).modal();
    $('#confirmationDialog .confirm').on('click', function() {
      $.rails.confirmed(link);
    });
  };

  $.rails.allowAction = function(link) {
    if (!link.attr('data-confirm')) {
      return true;
    }
    
    $.rails.showConfirmDialog(link);
    
    return false;
  };
});
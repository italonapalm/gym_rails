$(document).ready(function() {
  $('#confirm_delete_modal').on('show', function() {
    var $submit = $(this).find('.confirm-delete-button');
    var $href = $submit.attr('href');
    $submit.attr('href', $href.replace('pony', $(this).data('id')));
  });

  $(document).on('click', '.call-confirm-delete', {}, function(e) {
    e.preventDefault();

    //Clean id submit
    var $submit = $('.confirm-delete-button');
    $submit.attr('href', '/backoffice/gyms/pony');

    var modal = $('#confirm_delete_modal');
    modal.data('id', $(this).data('id'));
    modal.modal('show');
    modal.trigger('show');
  });

  $('.call-confirm-delete').click(function(e) {
    e.preventDefault();

    var $submit = $('.confirm-delete-button');
    $submit.attr('href', '/backoffice/gyms/pony');

    var modal = $('#confirm_delete_modal');
    modal.data('id', $(this).data('id'));
    modal.modal('show');
    modal.trigger('show');

  });
});

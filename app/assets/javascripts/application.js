// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// require jquery

// require turbolinks
// require_tree .

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

//ohmyhealty

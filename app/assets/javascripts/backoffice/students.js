$(document).ready(function() {
  $(document).on('change', '#other_state_id', {}, function(e) {
    var state_id = $(this).val();

    $.ajax({
      type: 'GET',
      url: '/backoffice/states/'+state_id+'/cities',
      dataType: 'json',
      success:function(data) {
        $('#student_address_attributes_city_id').html('');
        //$('#student_address_attributes_city_id').append('<option>Selecione uma cidade</option>');
        $.each(data, function() {
          $('#student_address_attributes_city_id').append("<option value='"+this.id+"'>"+this.name+"</option>");
        });
        console.log(data);
      }
    });
  });

  $('#confirm_delete_modal').on('show', function() {
    var $submit = $(this).find('.confirm-delete-button');
    var $href = $submit.attr('href');
    $submit.attr('href', $href.replace('pony', $(this).data('id')));
  });

  $(document).on('click', '.call-confirm-delete', {}, function(e) {
    e.preventDefault();

    //Clean id submit
    var $submit = $('.confirm-delete-button');
    $submit.attr('href', '/backoffice/students/pony');

    var modal = $('#confirm_delete_modal');
    modal.data('id', $(this).data('id'));
    modal.modal('show');
    modal.trigger('show');
  });

  $('.call-confirm-delete').click(function(e) {
    e.preventDefault();

    var $submit = $('.confirm-delete-button');
    $submit.attr('href', '/backoffice/students/pony');

    var modal = $('#confirm_delete_modal');
    modal.data('id', $(this).data('id'));
    modal.modal('show');
    modal.trigger('show');
  });
});

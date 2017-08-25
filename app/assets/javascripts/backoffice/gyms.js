
$('form').bind('ajax:complete', function(){
  $('#gyms-table').html()//replaceWith(result.responseText);
  $('textarea').val("");
});

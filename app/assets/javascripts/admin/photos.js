$(document).on('ajax:success', '[data-behaviour~=accept-photo]', function(){
  $(this).remove()
})
$(document).on('ajax:success', '[data-behaviour~=delete-photo]', function(){
  $(this).closest('tr').remove()
})

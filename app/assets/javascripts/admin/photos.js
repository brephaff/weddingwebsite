$(document).on('ajax:send', '[data-behaviour~=accept-photo]', function(){
  $(this).remove()
})
$(document).on('ajax:send', '[data-behaviour~=delete-photo]', function(){
  $(this).closest('tr').remove()
})

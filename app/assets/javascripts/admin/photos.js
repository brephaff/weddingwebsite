$(document).on('ajax:send', '[data-behaviour~=accept-photo]', function(){
  $(this).remove()
})
$(document).on('ajax:send', '[data-behaviour~=delete-photo]', function(){
  $(this).closest('tr').remove()
})
$(document).on('click', '[data-behaviour~=accept-all-photos]', function(){
  var links = $.makeArray(('[data-behaviour~=accept-photo]'))

  function triggerNext() {
    current = $(links.shift())
    current.one('ajax:complete', triggerNext)
    current.click()
  }

  triggerNext()
})

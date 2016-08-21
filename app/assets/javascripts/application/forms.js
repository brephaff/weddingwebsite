$('[data-behaviour=on-value-show]').change(function(){
  var value = $(this).find(':input:checked').val()
  var target = $(this).data('show')
  var showValue = $(this).data('value').toString()
  if (showValue == value){
    $(target).show()
  } else {
    $(target).hide()
  }
}).change()

$('[data-behaviour~=submit-on-set]').change(function(){
  var input = event.target
  if (input.value) {
    input.form.submit()
    input.form.reset()

    disableWith = $(this).data('disable-with')
    if (disableWith){
      $(this).text(disableWith).find(':input').attr('disabled', 'disabled')
    }
  }
})

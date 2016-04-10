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

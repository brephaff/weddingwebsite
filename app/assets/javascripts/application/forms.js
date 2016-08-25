$('[data-behaviour=on-value-show]').change(function(){
  var value = $(this).find(':input:checked').val()
  var target = $(this).data('show')
  var showValue = $(this).data('value').toString()
  if (showValue == value){
    $(target).show()
  } else {
    $(target).hide()
  }
}).change();


(function($){
  var notifyPending = []
  var allStored = false

  $('#photos_upload_form')
    .S3Uploader({
      path: 'originals/',
      progress_bar_target: $('#photos_upload_form .upload_progress')
    })
    .on('s3_uploads_start', function(){
      $(this).find('[data-disable-with]').each(function(){
        $(this).text($(this).data('disable-with'))
      })
      $(this).css('pointerEvents', 'none')
    })
    .on('s3_upload_complete', function(){
      notifyPending.push(true)
    })
    .on('s3_uploads_complete', function(){
      allStored = true
    })
    .on('ajax:complete', function(){
      notifyPending.pop()
      if (allStored && !notifyPending.length) {
        window.location = '/photos/uploaded'
      }
    })

})($)

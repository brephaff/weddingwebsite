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

$('#photos_upload_form').S3Uploader({path: 'originals/'})
  .on('s3_uploads_start', function(){
    $(this).find('[data-disable-with]').each(function(){
      $(this).text($(this).data('disable-with'))
    })
    $(this).find(':input').attr('disabled', 'disabled')
  })
  .on('s3_uploads_complete', function(){
    window.location = '/photos/uploaded'
  })

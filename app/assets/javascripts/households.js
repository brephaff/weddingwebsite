# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$(function($){
  var form = $('#household_form')
  var flash = $('<div class="form-saved">').hide()
  // HELPER FUNCTIONS

  function flashNotification(text, options){
    options = $.extend(options)
    flash.html(text).prependTo(form).clearQueue().fadeIn(500)

    if (options.duration){
      flash.delay(options.duration).fadeOut(500)
    }
  }

  function saveHouseholdForm(form){
    var options = {}
    options.url = $(form).attr('action')
    options.method = 'patch'
    options.data = $(form).serialize()

    $.ajax(options).success(function(){
      flashNotification('<span class="glyphicon glyphicon-flash" />', {duration: 1000})
    })
  }

  // BEHAVIOUR

  form.on('click', ':radio', function(){
    setTimeout(function(){
      this.checked = !this.checked
      return false
    }, 100)
  })

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

  form.change(function(){ saveHouseholdForm(this) })
})

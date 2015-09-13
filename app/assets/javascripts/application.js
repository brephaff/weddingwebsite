// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


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

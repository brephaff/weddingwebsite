$(function($){
  var form = $('#household_form')


  // BEHAVIOUR

  form.change(function(){ saveHouseholdForm(this) })


  // HELPER FUNCTIONS

  function saveHouseholdForm(form){
    var options = {}
    options.url = $(form).attr('action')
    options.method = 'patch'
    options.data = $(form).serialize()

    $.ajax(options)
  }
})

$(function(){
  $('[data-behaviour=one-at-a-time-list]').each(function(){
    // Freeze height before absolute positioning list items
    list = $(this)
    list.height(list.find('li').height())

    list.addClass('one_at_a_time_list')

    var items = $(this).find('li')
    var index = 0

    start()

    function start(){
      showItem(index++)
      if (index == items.length)
        index = 0
      setTimeout(start, 4000 + Math.random() * 1000);
    }

    function showItem(index){
      $(items[index]).addClass('show')
      items.not(items[index]).removeClass('show')
    }
  })
})

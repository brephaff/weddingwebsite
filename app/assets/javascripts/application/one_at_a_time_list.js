$(function(){
  $('[data-behaviour=one-at-a-time-list]').each(function(){
    // Freeze height before absolute positioning list items
    list = $(this)
    list.height(list.find('li').height())

    var items = $(this).find('li')
    var index = 0

    // Don't immediately add the 'on' class or the browser won't see it as a separate from adding 'one_at_a_time_list'
    setTimeout(function(){
      list.addClass('on')
      start()
    }, 1)

    function start(){
      showItem(index++)
      if (index == items.length)
        index = 0
      setTimeout(start, 6000 + Math.random() * 1000);
    }

    function showItem(index){
      $(items[index]).addClass('visible')
      items.not(items[index]).removeClass('visible')
    }
  })
})

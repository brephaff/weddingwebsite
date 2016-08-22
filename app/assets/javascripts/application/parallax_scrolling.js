$(function(){
  $('[data-behaviour~="parallax-bg"]').each(function(){
      var $bgobj = $(this); // assigning the object
      var speed = $bgobj.data('speed')
      $window = $(window)
      $window.scroll(update)
      update();

      function update(){
        var yPos = -($window.scrollTop() / speed);

        // Put together our final background position
        var coords = '50% '+ yPos + 'px';

        // Move the background
        $bgobj.css({ backgroundPosition: coords });
      }
  });
});

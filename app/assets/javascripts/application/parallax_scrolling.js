//= require ./detect_mobile

if (!window.isMobile){
  $('[data-behaviour~="parallax-bg"]').each(function(){
      var $bgobj = $(this); // assigning the object
      var speed = $bgobj.data('speed')
      var offset = $bgobj.data('offset') || 0
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
}

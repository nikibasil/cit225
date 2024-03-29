document.addEventListener("DOMContentLoaded", function() {
    let lazyloadImages;
    if("IntersectionObserver" in window) {
      lazyloadImages = document.querySelectorAll(".lazy-load");
      let imageObserver = new IntersectionObserver(function(entries, observer) {
        entries.forEach(function(entry) {
          if(entry.isIntersecting) {
            let image = entry.target;
            image.src = image.dataset.src;
            image.classList.remove("lazy-load");
            imageObserver.unobserve(image);
          }
        });
      });
      lazyloadImages.forEach(function(image) {
        imageObserver.observe(image);
      });
    } else {
      let lazyloadThrottleTimeout;
      lazyloadImages = document.querySelectorAll(".lazy-load");

      function lazyload() {
        if(lazyloadThrottleTimeout) {
          clearTimeout(lazyloadThrottleTimeout);
        }
        lazyloadThrottleTimeout = setTimeout(function() {
          let scrollTop = window.pageYOffset;
          lazyloadImages.forEach(function(img) {
            if(img.offsetTop < (window.innerHeight + scrollTop)) {
              img.src = img.dataset.src;
              img.classList.remove('lazy-load');
            }
          });
          if(lazyloadImages.length == 0) {
            document.removeEventListener("scroll", lazyload);
            window.removeEventListener("resize", lazyload);
            window.removeEventListener("orientationChange", lazyload);
          }
        }, 20);
      }
      document.addEventListener("scroll", lazyload);
      window.addEventListener("resize", lazyload);
      window.addEventListener("orientationChange", lazyload);
    }
  })







// document.addEventListener('DOMContentLoaded', function() {


//     var lazyloadImages;    
  
  
//     if ('IntersectionObserver' in window) {
  
  
//       lazyloadImages = document.querySelectorAll('.lazy');
  
  
//       var imageObserver = new IntersectionObserver(function(entries, observer) {
  
  
//         entries.forEach(function(entry) {
  
  
//           if (entry.isIntersecting) {
  
  
//             var image = entry.target;
  
  
//             image.src = image.dataset.src;
  
  
//             image.classList.remove('lazy');
  
  
//             imageObserver.unobserve(image);
  
  
//           }
  
  
//         });
  
  
      });
  
    }
});
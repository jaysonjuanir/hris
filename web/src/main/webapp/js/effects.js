	// Initialize smooth scroll
	$(function() {
		smoothScroll.init({
		    speed: 800, // Integer. How fast to complete the scroll in milliseconds
		    easing: 'easeInOutCubic', // Easing pattern to use
		    offset: 30, // Integer. How far to offset the scrolling anchor location in pixels
		    updateURL: false, // Boolean. If true, update the URL hash on scroll
		    callback: function ( anchor, toggle ) {} // Function to run after scrolling
		});

		// Apply navbar effect
		$(window).scroll(function() {
		    if($(this).scrollTop() > 300) {
		        $('.navbar').addClass('opaque');
		    } else {
		        $('.navbar').removeClass('opaque');
		    }
		});
	});
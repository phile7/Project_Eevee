(function(){
	$(".fireQueen").each(function(){
		
		var $slides = $(this).find('.fire-01'),
			slideCount = $slides.length,
			currentIndex = 0;
		
		$slides.eq(currentIndex).fadeIn();
		
		setInterval(showNextSlide, 500);
		
		function showNextSlide() {
			var nextIndex = (currentIndex + 1) % slideCount;
			
			$slides.eq(currentIndex).fadeOut();
			$slides.eq(nextIndex).fadeIn();
			currentIndex = nextIndex;
		}
		
	});
	
})();
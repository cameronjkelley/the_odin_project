var $slides 	 = $('.slide'),
	$firstSlide  = $slides[0],
	$lastSlide   = $slides[$slides.length - 1],
	$dots 		 = $('.dot'),
	$firstDot 	 = $dots[0],
	$lastDot 	 = $dots[$dots.length - 1]
	timer        = function() { setInterval(nextSlide, 5000); };			
		
$(function() {		
	timer();		
});

$('.arrow').click(function() {
	clearInterval(timer);

	if ($(this).attr('id') == 'arrow-prev') {
		prevSlide();
	} else {
		nextSlide();
	}
})

function prevSlide() {
	changeSlide($firstSlide, $lastSlide, $lastDot, -1);
}

function nextSlide() {
	changeSlide($lastSlide, $firstSlide, $firstDot, 1);
}

function changeSlide(moveFrom, moveTo, dot, direction) {
	var $activeSlide = $('.active-slide')[0],
		$activeDot = $('.active-dot')[0];

	$activeSlide.className = 'slide';
	$activeDot.className = 'dot';

	if ($activeSlide == moveFrom) {
		moveTo.className = 'active-slide slide';
		dot.className = 'active-dot dot';
	} else {
		$slides[$slides.index($activeSlide) + direction].className = 'active-slide slide';
		$dots[$dots.index($activeDot) + direction].className = 'active-dot dot';
	}
}

$dots.click(function() {
	var idx = $dots.index($(this));
	
	$('.active-dot')[0].className = 'dot';
	$dots[idx].className = 'active-dot dot';

	$('.active-slide')[0].className = 'slide';
	$slides[idx].className = 'active-slide slide';
})
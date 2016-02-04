$(document).ready(function() {
	$("#home").show();
});

$(".nav-link").click(function() {
	$(".content-div").hide();
	var id = $(this).attr("id");
	if (id === "home-link") {
		$("#home").show();
	} else if (id === "menu-link") {
		$("#menu").show();
	} else if (id === "reviews-link") {
		$("#reviews").show();
	} else {
		$("#contact").show();
	}
});

var reviewImages = [
	"images/01_6.jpeg",
	"images/02_6.jpeg", 
	"images/03_6.jpeg", 
	"images/04_6.jpeg", 
	"images/05_6.jpeg", 
	"images/06_5.jpeg", 
	"images/07_5.jpeg", 
	"images/08_4.jpeg"
];

$(".arrow").click(function() {
	if ($(this).attr("id") === "prev-arrow") {
		changeSlide(-1);
	} else {
		changeSlide(1);
	}
});

$(document).keyup(function(event) {
	if (event.which == 37) {
		changeSlide(-1);
	} else if (event.which == 39) {
		changeSlide(1);	
	}
});

function changeSlide(value) {
	imgSrc = $("#review-image").attr("src");
	imgIndex = reviewImages.indexOf(imgSrc);
	$("#review-image").attr("src", reviewImages[imgIndex + value]);
};
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require comments

$(window).load(function() {
	commentsHeight();

	var generalHeight = $('.general-photo-border').height()
	var $img = $('.image-box-block img');
	var h = $img.height();
	console.log(h)
	$img.css('padding-top', (generalHeight - h) / 2 + "px");
	$img.css('padding-bottom', (generalHeight - h) / 2 + "px");
});

function commentsHeight() {
	var generalHt = $('.general-photo-border').height();
	var userBox = $('.heading-photo-block').outerHeight(true);
	var featuresBox = $('.features-photo-block').outerHeight(true);
	var $commentBox = $('.action-photo-block');

	$commentBox.css('height', generalHt - userBox - featuresBox + "px")
};


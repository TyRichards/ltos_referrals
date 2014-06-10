// Superfish Menu
jQuery(document).ready(function($){ 
	$('.menu-header .menu').superfish({
		animation: {opacity:'show',height:'show'}
	 })
});

// now run the pre-loader
jQuery(document).ready(function(){
    jQuery('.preload').preloadImages({
        showSpeed: 900  // length of fade-in animation, 500 is default
        //easing: 'easeOutQuad' optional easing, if you don't have any easing scripts - delete this option
    });
});
// Tabs
jQuery(document).ready(function($){
	$('.tabs a').click(function(){
		switch_tabs($(this));
	});
	switch_tabs($('.defaulttab'));
	function switch_tabs(obj) {
		$('.tab-content').hide();
		$('.tabs a').removeClass("selected");
		var id = obj.attr("rel");
		$('#'+id).show();
		obj.addClass("selected");
	}
});
// Content Toggle
jQuery(document).ready(function($){
    // Initial state of toggle (hide)
    $(".slide_toggle_content").hide();
    // Process Toggle click (http://api.jquery.com/toggle/)
    $("h4.slide_toggle").toggle(function(){
	    $(this).addClass("clicked");
	}, function () {
	    $(this).removeClass("clicked");
    });
    // Toggle animation (http://api.jquery.com/slideToggle/)
    $("h4.slide_toggle").click(function(){
	$(this).next(".slide_toggle_content").slideToggle();
    });
});
// Content Toggle
jQuery(document).ready(function($){
    // Initial state of toggle (hide)
    $(".slide_toggle_compact_content").hide();
    // Process Toggle click (http://api.jquery.com/toggle/)
    $("h4.slide_toggle_compact").toggle(function(){
	    $(this).addClass("clicked_compact");
	}, function () {
	    $(this).removeClass("clicked_compact");
    });
    // Toggle animation (http://api.jquery.com/slideToggle/)
    $("h4.slide_toggle_compact").click(function(){
	$(this).next(".slide_toggle_compact_content").slideToggle();
    });
});
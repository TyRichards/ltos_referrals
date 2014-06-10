<?php
// [testimonial]
function testimonial_shortcode( $atts, $content = null ) {
return '<ul id="testimonial">'. do_shortcode($content) .'</ul>';
}
add_shortcode('testimonial', 'testimonial_shortcode');

// [tentry]
function tentry_shortcode( $atts, $content = null ) {
	extract(shortcode_atts(array(
		'image' => '',
		'name' => '',
		'company' => ''
	), $atts));	
return '<li><blockquote><span>'. do_shortcode($content) .'</span></blockquote><img src="'.$image.'"/><h3>'.$name.'</h3><h4>'.$company.'</h4></li>';
}
add_shortcode('tentry', 'tentry_shortcode');
?>
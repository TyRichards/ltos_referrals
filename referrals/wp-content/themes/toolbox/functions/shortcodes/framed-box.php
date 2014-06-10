<?php
// [framedbox]
function framedbox_shortcode( $atts, $content = null ) {
return '<div class="framed-box">'. do_shortcode($content) .'</div>';
}
add_shortcode('framedbox', 'framedbox_shortcode');

// [fbox_title]
function fbox_title_shortcode( $atts, $content = null ) {
	extract(shortcode_atts(array(
		'color' => 'fire'
	), $atts));	
return '<div class="fbox-title tc tshadow '.$color.'">'. do_shortcode($content) .'</div>';
}
add_shortcode('fbox_title', 'fbox_title_shortcode');

function fbox_content_shortcode( $atts, $content = null ) {
return '<div class="framed-box-content">'. do_shortcode($content) .'</div>';
}
add_shortcode('fbox_content', 'fbox_content_shortcode');

// [imagebox]
function imagebox_shortcode( $atts, $content = null ) {
	extract(shortcode_atts(array(
		'size' => 'medium'
	), $atts));	
return '<div class="imagebox '.$size.'">'. do_shortcode($content) .'</div>';
}
add_shortcode('imagebox', 'imagebox_shortcode');
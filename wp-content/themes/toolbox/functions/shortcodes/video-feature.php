<?php

// [video_feature]
function video_feature_shortcode( $atts, $content = null ) {
return '<div class="video-feature-wide"><div class="shadow"></div><div id="video-feature-wrap">'. do_shortcode($content) .'</div></div>';
}
add_shortcode('video_feature', 'video_feature_shortcode');

// [video_code]
function video_code_shortcode( $atts, $content = null ) {
	extract(shortcode_atts(array(
		'align' => 'left'
	), $atts));
return '<div class="video-frame v'.$align.'">'. do_shortcode($content) .'</div>';
}
add_shortcode('video_code', 'video_code_shortcode');

// [video_details]
function video_details_shortcode( $atts, $content = null ) {
	extract(shortcode_atts(array(
		'title' => '',
		'text' => ''
	), $atts));
return '<div class="video-details"><h3>'.$title.'</h3><p>'.$text.'</p></div>';
}
add_shortcode('video_details', 'video_details_shortcode');

?>
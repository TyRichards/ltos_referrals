<?php
// [action]
function action_shortcode( $atts, $content = null ) {
	extract(shortcode_atts(array(
		'color' => 'blue'
	), $atts));	
return '<div id="actionS" class="actalt '.$color.'">'. do_shortcode($content) .'</div>';
}
add_shortcode('action', 'action_shortcode');

// [actiontext]
function actiontext_shortcode( $atts, $content = null ) {
return '<h3>'. do_shortcode($content) .'</h3>';
}
add_shortcode('actiontext', 'actiontext_shortcode');

// [actionbutton]
function actionbutton_shortcode( $atts, $content = null ) {
	extract(shortcode_atts(array(
		'url' => '#',
		'color' => ''
	), $atts));
return '<a class="action-buttonS '.$color.'" href="'.$url.'">'. do_shortcode($content) .'</a>';
}
add_shortcode('actionbutton', 'actionbutton_shortcode');
?>
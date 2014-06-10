<?php

// Shortcode: tab
// Usage: [tab title="title 1"]Your content goes here...[/tab]
function tab_func( $atts, $content = null ) {
    extract(shortcode_atts(array(
	    'title'      => '',
    ), $atts));
    global $single_tab_array;
    $single_tab_array[] = array('title' => $title, 'content' => trim(do_shortcode($content)));
    return $single_tab_array;
}
add_shortcode('tab', 'tab_func');

/* Shortcode: tabs
 * Usage:   [tabs]
 * 		[tab title="title 1"]Your content goes here...[/tab]
 * 		[tab title="title 2"]Your content goes here...[/tab]
 * 	    [/tabs]
 */
function tabs_func( $atts, $content = null ) {
    global $single_tab_array;
    $single_tab_array = array(); // clear the array

    $tabs_nav = '<div class="clear"></div>';
    $tabs_nav .= '<div class="tabs-wrapper">';
    $tabs_nav .= '<ul class="tabs">';
    do_shortcode($content); // execute the '[tab]' shortcode first to get the title and content
    foreach ($single_tab_array as $tab => $tab_attr_array) {
	$random_id = rand(1000,2000);
	$default = ( $tab == 0 ) ? ' class="defaulttab"' : '';
	$tabs_nav .= '<li><a href="javascript:void(0)"'.$default.' rel="tab'.$random_id.'"><span>'.$tab_attr_array['title'].'</span></a></li>';
	$tabs_content .= '<div class="tab-content" id="tab'.$random_id.'">'.$tab_attr_array['content'].'</div>';
    }
    $tabs_nav .= '</ul>';
    $tabs_output .= $tabs_nav . $tabs_content;
    $tabs_output .= '</div><!-- tabs-wrapper end -->';
    $tabs_output .= '<div class="clear"></div>';
    return $tabs_output;
}
add_shortcode('tabs', 'tabs_func');

// Shortcode: toggle_content
// Usage: [toggle_content title="Title"]Your content goes here...[/toggle_content]
function toggle_content_func( $atts, $content = null ) {
    extract(shortcode_atts(array(
	    'title'      => '',
    ), $atts));
    $html = '<h4 class="slide_toggle"><a href="#">' .$title. '</a></h4>';
    $html .= '<div class="slide_toggle_content" style="display: none;">'.do_shortcode($content).'</div>';
    return $html;
}
add_shortcode('toggle_content', 'toggle_content_func');

// Shortcode: toggle_content_compact
// Usage: [toggle_content_compact title="Title"]Your content goes here...[/toggle_content]
function toggle_content_compact_func( $atts, $content = null ) {
    extract(shortcode_atts(array(
	    'title'      => '',
    ), $atts));
    $html = '<h4 class="slide_toggle_compact"><a href="#">' .$title. '</a></h4>';
    $html .= '<div class="slide_toggle_compact_content" style="display: none;">'.do_shortcode($content).'</div>';
    return $html;
}
add_shortcode('toggle_content_compact', 'toggle_content_compact_func');

?>
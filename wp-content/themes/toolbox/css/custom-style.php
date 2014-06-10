<?php

// Get wp-load so we can call our theme options
$root = dirname(dirname(dirname(dirname(dirname(__FILE__)))));
if ( file_exists( $root.'/wp-load.php' ) ) {
    require_once( $root.'/wp-load.php' );
} elseif ( file_exists( $root.'/wp-config.php' ) ) {
    require_once( $root.'/wp-config.php' );
}

// set the content type header
header("Content-type: text/css");

// Custom CSS for boxed layout
if (get_option('of_wide_layout') == 'false') :
	include('boxed-layout.css');
endif;

// Custom CSS for Nivo Slider
if ($textcolor = get_option('of_tall_nivo_color')) :
	echo '#slider-wrapper-tall .nivo-caption p {color: '.$textcolor.'}';
endif;

if ($textlinkcolor = get_option('of_tall_nivo_links_color')) :
	echo '#slider-wrapper-tall .nivo-caption a {color: '.$textlinkcolor.'}';
endif;

if ($textlinkcolorhover = get_option('of_tall_nivo_link_hover_color')) :
	echo '#slider-wrapper-tall .nivo-caption a:hover {color: '.$textlinkcolorhover.'}';
endif;

/******************/
/*** TYPOGRAPHY ***/
/******************/

// Link color
if ($linkcolor = get_option('of_link_color')) :
	echo 'a {color: '.$linkcolor.'}';
endif;

// Link hover color
if ($linkhovercolor = get_option('of_link_hover_color')) :
	echo 'a:hover {color: '.$linkhovercolor.'}';
endif;

// Meta link color
if ($linkmetacolor = get_option('of_meta_link_color')) :
	echo 'a {color: '.$linkmetacolor.'}';
endif;

// Meta Link hover color
if ($linkmetahovercolor = get_option('of_meta_link_hover_color')) :
	echo 'a:hover {color: '.$linkmetahovercolor.'}';
endif;

// Title font
if ($titlefont = get_option('of_title_font')) :
	echo 'h1, h2, h3, h4, h5, h6 {font-family: '.$titlefont.'}';
endif;

// Title font style
if ($titlestyle = get_option('of_title_style')) :
	echo 'h1, h2, h3, h4, h5, h6 {font-style: '.$titlestyle.'}';
endif;

// Title font weight
if ($titleweight = get_option('of_title_weight')) :
	echo 'h1, h2, h3, h4, h5, h6 {font-weight: '.$titleweight.'}';
endif;

// Title color masthead
if ($titlemastcolor = get_option('of_title_color_masthead')) :
	echo '#content .masthead h3,#content .masthead h1, #entry-top h1 {color: '.$titlemastcolor.'}';
endif;

// Title color masthead sub
if ($titlemastcolorsub = get_option('of_title_color_masthead_sub')) :
	echo '#entry-top p,.masthead p {color: '.$titlemastcolorsub.'}';
endif;

// Copy font
if ($copyfont = get_option('of_copy_font')) :
	echo 'body {font-family: '.$copyfont.'}';
endif;
?>
<?php

add_action('init','of_options');

if (!function_exists('of_options')) {
function of_options(){
	
// VARIABLES
$themename = get_theme_data(STYLESHEETPATH . '/style.css');
$themename = 'Site Options';
$shortname = "of";

// Populate OptionsFramework option in array for use in theme
global $of_options;
$of_options = get_option('of_options');

$GLOBALS['template_path'] = OF_DIRECTORY;

//Access the WordPress Categories via an Array
$of_categories = array();  
$of_categories_obj = get_categories('hide_empty=0');
foreach ($of_categories_obj as $of_cat) {
    $of_categories[$of_cat->cat_ID] = $of_cat->cat_name;}
$categories_tmp = array_unshift($of_categories, "Select a category:");    
       
//Access the WordPress Pages via an Array
$of_pages = array();
$of_pages_obj = get_pages('sort_column=post_parent,menu_order');    
foreach ($of_pages_obj as $of_page) {
    $of_pages[$of_page->ID] = $of_page->post_name; }
$of_pages_tmp = array_unshift($of_pages, "Select a page:");       

// Image Alignment radio box
$options_thumb_align = array("alignleft" => "Left","alignright" => "Right","aligncenter" => "Center"); 

// Image Links to Options
$options_image_link_to = array("image" => "The Image","post" => "The Post"); 

//Testing 
$options_select = array("one","two","three","four","five"); 
$options_radio = array("one" => "One","two" => "Two","three" => "Three","four" => "Four","five" => "Five"); 

// Nivo Slider Options
$options_slide_time = array("3000","4000","5000","6000","7000","8000");
$options_slide_speed = array("300","400","500","600","700","800");
$options_slide_eff = array("sliceDown","sliceDownLeft","sliceUp","sliceUpLeft","sliceUpDown","sliceUpDownLeft","fold","fade","random");
$options_slide_slices = array("5","10","15","20","30");

// Typography Options
$option_title_font = array("","Arial, \"Helvetica Neue\", Helvetica, sans-serif","\"Georgia\", Times, Times New Roman, serif","Palatino, Palatino Linotype, Hoefler Text, Times, Times New Roman, serif","Tahoma, Verdana, Geneva","Trebuchet, Tahoma, Arial, sans-serif","Verdana, Tahoma, Geneva, sans-serif","\"Century Gothic\", \"Apple Gothic\", sans-serif");

$option_copy_font = array("","\"Georgia\", Times, Times New Roman, serif","Arial, \"Helvetica Neue\", Helvetica, sans-serif","Baskerville, Times, Times New Roman","\"Century Gothic\", \"Apple Gothic\", sans-serif","Georgia, Times, \"Times New Roman\", serif","Helvetica, \"Helvetica Neue\", Arial, sans-serif","\"Lucida Sans\", \"Lucida Grande\", \"Lucida Sans Unicode\", sans-serif","Palatino, \"Palatino Linotype\", \"Hoefler Text\", Times, \"Times New Roman\", serif","Trebuchet, Tahoma, Arial, sans-serif","Verdana, Tahoma, Geneva, sans-serif");

$alt_cufon = array("Bergamo","Diavlo","Droid-Serif","Forelle","Gentium-Basic","Liberation-Sans","Nilland","Sansation","Tangerine");

$option_title_style = array("","italic","normal");
$option_title_weight = array("","bold","normal");

//Stylesheets Reader
$alt_stylesheet_path = OF_FILEPATH . '/css/colors/';
$alt_stylesheets = array();

if ( is_dir($alt_stylesheet_path) ) {
    if ($alt_stylesheet_dir = opendir($alt_stylesheet_path) ) { 
        while ( ($alt_stylesheet_file = readdir($alt_stylesheet_dir)) !== false ) {
            if(stristr($alt_stylesheet_file, ".css") !== false) {
                $alt_stylesheets[] = $alt_stylesheet_file;
            }
        }    
    }
}

//More Options
$uploads_arr = wp_upload_dir();
$all_uploads_path = $uploads_arr['path'];
$all_uploads = get_option('of_uploads');
$other_entries = array("Select a number:","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19");
$body_repeat = array("no-repeat","repeat-x","repeat-y","repeat");
$body_pos = array("top left","top center","top right","center left","center center","center right","bottom left","bottom center","bottom right");

// Set the Options Array
$options = array();

// General Options
$options[] = array( "name" => "General Settings",
                    "type" => "heading");

$options[] = array( "name" => "Custom Logo",
					"desc" => "Upload a logo for your theme, or specify the image address of your online logo. (http://yoursite.com/logo.png)",
					"id" => $shortname."_logo",
					"std" => "",
					"type" => "upload"); 

$options[] = array( "name" => "Custom Favicon",
					"desc" => "Upload a 16px x 16px Png/Gif image that will represent your website's favicon.",
					"id" => $shortname."_custom_favicon",
					"std" => "",
					"type" => "upload"); 
                                               
$options[] = array( "name" => "Tracking Code",
					"desc" => "Paste your Google Analytics (or other) tracking code here. This will be added into the footer template of your theme.",
					"id" => $shortname."_google_analytics",
					"std" => "",
					"type" => "textarea"); 

$options[] = array( "name" => "Use Wide Layout",
					"desc" => "Use wide layout. Yay!",
					"id" => $shortname."_wide_layout",
					"std" => "false",
					"type" => "checkbox"); 

$options[] = array( "name" => "Latest Tweet Area",
					"desc" => "Enter your Twitter name and this latest tweet will show above the footer across the entire site.",
					"id" => $shortname."_tweet_tweet_name",
					"std" => "",
					"type" => "text"); 

$url =  OF_DIRECTORY . '/functions/digipanel/images/';
$options[] = array( "name" => "Left or Right Sidebar",
					"desc" => "Choose a sidebar location.",
					"id" => $shortname."_sidebar_location",
					"std" => "",
					"type" => "images",
					"options" => array(
						'cl' => $url . '2cl.png',
						'cr' => $url . '2cr.png',
						'big-grid' => $url . 'big-grid.png'
					));

$options[] = array( "name" => "Top Bar Phone Number",
					"desc" => "Enter your phone number displayed in the header.",
					"id" => $shortname."_top_phone",
					"std" => "",
					"type" => "text"); 

$options[] = array( "name" => "Top Bar Email",
					"desc" => "Enter your email and text displayed in the header.",
					"id" => $shortname."_top_email",
					"std" => "",
					"type" => "text"); 

// Color Settings
$options[] = array( "name" => "Color Settings",
                    "type" => "heading");

//$options[] = array( "name" => "Theme Stylesheet",
//					"desc" => "Select your themes alternative color scheme.",
//					"id" => $shortname."_alt_stylesheet",
//					"std" => "red.css",
//					"type" => "select",
//					"options" => $alt_stylesheets);

$url =  OF_DIRECTORY . '/images/colors/';
$options[] = array( "name" => "Theme Color",
					"desc" => "Choose a color style.",
					"id" => $shortname."_alt_stylesheet",
					"std" => "",
					"type" => "images",
					"options" => array(
						'black' => $url . 'black.jpg',
						'blue' => $url . 'blue.jpg',
						'clean-white' => $url . 'clean-white.jpg',
						'coffee' => $url . 'coffee.jpg',
						'gray' => $url . 'gray.jpg',
						'green' => $url . 'green.jpg',
						'light-rays' => $url . 'light-rays.jpg',
						'orange' => $url . 'orange.jpg',
						'red' => $url . 'red.jpg'
					));

// Typography
$options[] = array( "name" => "Typography",
					"type" => "heading");

$options[] = array( "name" => "Body Copy Font",
					"desc" => "Select your prefered site text font stack. Default: Arial",
					"id" => $shortname."_copy_font",
					"std" => "",
					"type" => "select",
					"options" => $option_copy_font);

$options[] = array( "name" => "Link Color",
					"desc" => "Select your prefered link color. This goes site wide. Default: #046E9F",
					"id" => $shortname."_link_color",
					"std" => "",
					"type" => "color");

$options[] = array( "name" => "Link Hover Color",
					"desc" => "Select your prefered link hover color. This goes site wide. Default: #000000",
					"id" => $shortname."_link_hover_color",
					"std" => "",
					"type" => "color");

$options[] = array( "name" => "Use cufon Fonts For Headings",
					"desc" => "If you want to use the cufon replaced font, check this box.",
					"id" => $shortname."_do_cufon",
					"std" => "false",
					"type" => "checkbox"); 

$options[] = array( "name" => "Select Cufon Font",
					"desc" => "Select the Cufon font you would liek to use. Only works if above option is checked. This replaces any title font below.",
					"id" => $shortname."_alt_cufon",
					"std" => "Droid-Serif",
					"type" => "select",
					"options" => $alt_cufon);

$options[] = array( "name" => "Title Font",
					"desc" => "Select your prefered title font stack. Default: Georgia",
					"id" => $shortname."_title_font",
					"std" => "",
					"type" => "select",
					"options" => $option_title_font);

$options[] = array( "name" => "Title Font Style",
					"desc" => "Select to have the title in Italic or Normal. Default: Italic",
					"id" => $shortname."_title_style",
					"std" => "",
					"type" => "select",
					"options" => $option_title_style);

$options[] = array( "name" => "Title Font Weight",
					"desc" => "Select to have the title in Bold or Normal. Default: normal",
					"id" => $shortname."_title_weight",
					"std" => "",
					"type" => "select",
					"options" => $option_title_weight);

$options[] = array( "name" => "Page/Post Title Font Color",
                    "desc" => "The title color for the fonts that are on pages and posts in the default gray area. Default #1B1B1B",
                    "id" => $shortname."_title_color_masthead",
                    "std" => "",
                    "type" => "color");

$options[] = array( "name" => "Page/Post Sub Title/Post Meta Font Color",
                    "desc" => "The title color for the fonts that are on pages and posts in the default gray area below the main title. Description and post meta. Default #1B1B1B",
                    "id" => $shortname."_title_color_masthead_sub",
                    "std" => "",
                    "type" => "color");

$options[] = array( "name" => "Post Meta Link Color",
					"desc" => "Select your prefered link color for the post meta on the single post page. Default: #046E9F",
					"id" => $shortname."_meta_link_color",
					"std" => "",
					"type" => "color");

$options[] = array( "name" => "Post Meta Link Hover Color",
					"desc" => "Select your prefered link hover color for the post meta on the single post page. Default: #000000",
					"id" => $shortname."_meta_link_hover_color",
					"std" => "",
					"type" => "color");

// Footer Settings
$options[] = array( "name" => "Footer Settings",
                    "type" => "heading");

$url =  OF_DIRECTORY . '/functions/digipanel/images/footer/';
$options[] = array( "name" => "Footer Widget Column Layout",
					"desc" => "Choose from 3, 4, or 5 columns.",
					"id" => $shortname."_footer_widget_columns",
					"std" => "five-column",
					"type" => "images",
					"options" => array(
						'three-column' => $url . '3column.png',
						'four-column' => $url . '4column.png',
						'five-column' => $url . '5column.png'
					));

$options[] = array( "name" => "Show Logo in footer",
					"desc" => "If you want to show your logo, check this box.",
					"id" => $shortname."_show_footer_logo",
					"std" => "false",
					"type" => "checkbox"); 

$options[] = array( "name" => "Custom Footer Logo",
					"desc" => "Upload a logo for your theme, or specify the image address of your online logo. (http://yoursite.com/logo.png)",
					"id" => $shortname."_foot_logo",
					"std" => "",
					"type" => "upload");

$options[] = array( "name" => "Copyright text",
					"desc" => "Enter your custom copyright text.",
					"id" => $shortname."_foot_copy",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Facebook URL",
					"desc" => "Enter the full url to your facebook profile.",
					"id" => $shortname."_foot_facebook",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Twitter User Name",
					"desc" => "Enter you twitter user name.",
					"id" => $shortname."_foot_twitter",
					"std" => "",
					"type" => "text"); 

$options[] = array( "name" => "Dribbble User Name",
					"desc" => "Enter you dribbble user name.",
					"id" => $shortname."_foot_dribbble",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Flickr URL",
					"desc" => "Enter the full URL to your flickr page.",
					"id" => $shortname."_foot_flickr",
					"std" => "",
					"type" => "text"); 

$options[] = array( "name" => "LinkedIn URL",
					"desc" => "Enter the full URL to your LinkedIn account.",
					"id" => $shortname."_foot_linkedin",
					"std" => "",
					"type" => "text"); 

$options[] = array( "name" => "URL To RSS Feed",
					"desc" => "Enter the full URL to your RSS feed.",
					"id" => $shortname."_rss_name",
					"std" => "",
					"type" => "text");

// Sliders
$options[] = array( "name" => "Sliders",
					"type" => "heading");

$options[] = array( "name" => "Use Nivo Slider",
					"desc" => "Would you like to use the Nivo Slider on the Home page?",
					"id" => $shortname."_show_nivo_slider",
					"std" => "false",
					"type" => "checkbox");

$options[] = array( "name" => "Use Digi Slider",
					"desc" => "Would you like to use the Digi Slider on the Home page?",
					"id" => $shortname."_show_digi_slider",
					"std" => "false",
					"type" => "checkbox");

$options[] = array( "name" => "Use Fancy Wood shelf",
					"desc" => "Would you like to use the fancy wood shelf within your slider.?",
					"id" => $shortname."_show_wood",
					"std" => "false",
					"type" => "checkbox");

$options[] = array( "name" => "Display Time",
					"desc" => "The time that a slide is displayed. EX: 7000 is 7 seconds.",
					"id" => $shortname."_nivo_slider_time",
					"std" => "5000",
					"type" => "select",
					"options" => $options_slide_time);

$options[] = array( "name" => "Transition Speed",
					"desc" => "The time between slides.",
					"id" => $shortname."_nivo_slider_speed",
					"std" => "5000",
					"type" => "select",
					"options" => $options_slide_speed);

$options[] = array( "name" => "Transition Effect",
					"desc" => "The time between slides.",
					"id" => $shortname."_nivo_slider_eff",
					"std" => "5000",
					"type" => "select",
					"options" => $options_slide_eff);

$options[] = array( "name" => "Slice Count",
					"desc" => "How many slices?",
					"id" => $shortname."_nivo_slider_slices",
					"std" => "15",
					"type" => "select",
					"options" => $options_slide_slices);

$options[] = array( "name" => "Text Color",
                    "desc" => "Choose a font color for the text that displays above the slider. Default #1B1B1B",
                    "id" => $shortname."_tall_nivo_color",
                    "std" => "",
                    "type" => "color");

$options[] = array( "name" => "Link Color",
                    "desc" => "Choose a link color. Default #046E9F",
                    "id" => $shortname."_tall_nivo_links_color",
                    "std" => "",
                    "type" => "color");

$options[] = array( "name" => "Link Hover Color",
                    "desc" => "Choose a link color when hovered. Default #000000",
                    "id" => $shortname."_tall_nivo_link_hover_color",
                    "std" => "",
                    "type" => "color");

$options[] = array( "name" => "Pull Slides From a Post Category",
					"desc" => "Would you like to fill the slider with posts from a category of your choice? Images pulled from the post Featured Image. ",
					"id" => $shortname."_nivo_tall_slider_cats",
					"std" => "false",
					"type" => "checkbox");

$options[] = array( "name" => "Select a Category",
					"desc" => "Choose the category you would like this slider to pull posts from.",
					"id" => $shortname."_nivo_tall_home_cat_choice",
					"std" => "Select a category:",
					"type" => "select",
					"options" => $of_categories);

$options[] = array( "name" => "Choose Your Slides",
					"desc" => "Check this if you want to choose your own slides using the inputs below. ",
					"id" => $shortname."_nivo_tall_slider_mychoice",
					"std" => "false",
					"type" => "checkbox");

$options[] = array( "name" => "Slider Image 1",
					"desc" => "Upload and select and image, or paste the url to an image you want to use. ",
					"id" => $shortname."_nivo_tall_slider_image_1",
					"std" => "",
					"type" => "upload");

$options[] = array( "name" => "Slider Image 1 Title",
					"desc" => "The title that displays over the image. (This is optional)",
					"id" => $shortname."_nivo_tall_slider_image_1_title",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Slider Image 1 URL",
					"desc" => "The url this image links to.",
					"id" => $shortname."_nivo_tall_slider_image_1_url",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Slider Image 2",
					"desc" => "Upload and select and image, or paste the url to an image you want to use. ",
					"id" => $shortname."_nivo_tall_slider_image_2",
					"std" => "",
					"type" => "upload");

$options[] = array( "name" => "Slider Image 2 Title",
					"desc" => "The title that displays over the image. (This is optional)",
					"id" => $shortname."_nivo_tall_slider_image_2_title",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Slider Image 2 URL",
					"desc" => "The url this image links to.",
					"id" => $shortname."_nivo_tall_slider_image_2_url",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Slider Image 3",
					"desc" => "Upload and select and image, or paste the url to an image you want to use. ",
					"id" => $shortname."_nivo_tall_slider_image_3",
					"std" => "",
					"type" => "upload");


$options[] = array( "name" => "Slider Image 3 Title",
					"desc" => "The title that displays over the image. (This is optional)",
					"id" => $shortname."_nivo_tall_slider_image_3_title",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Slider Image 3 URL",
					"desc" => "The url this image links to.",
					"id" => $shortname."_nivo_tall_slider_image_3_url",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Slider Image 4",
					"desc" => "Upload and select and image, or paste the url to an image you want to use. ",
					"id" => $shortname."_nivo_tall_slider_image_4",
					"std" => "",
					"type" => "upload");

$options[] = array( "name" => "Slider Image 4 Title",
					"desc" => "The title that displays over the image. (This is optional)",
					"id" => $shortname."_nivo_tall_slider_image_4_title",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Slider Image 4 URL",
					"desc" => "The url this image links to.",
					"id" => $shortname."_nivo_tall_slider_image_4_url",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Slider Image 5",
					"desc" => "Upload and select and image, or paste the url to an image you want to use. ",
					"id" => $shortname."_nivo_tall_slider_image_5",
					"std" => "",
					"type" => "upload");

$options[] = array( "name" => "Slider Image 5 Title",
					"desc" => "The title that displays over the image. (This is optional)",
					"id" => $shortname."_nivo_tall_slider_image_5_title",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Slider Image 5 URL",
					"desc" => "The url this image links to.",
					"id" => $shortname."_nivo_tall_slider_image_5_url",
					"std" => "",
					"type" => "text");

// Home Page Template Options
$options[] = array( "name" => "Home Page",
					"type" => "heading"); 

$options[] = array( "name" => "Show Call to Action",
					"desc" => "Do you want to show the call to action with intro and button?",
					"id" => $shortname."_home_action",
					"std" => "false",
					"type" => "checkbox");

$options[] = array( "name" => "Intro Text",
					"desc" => "Enter the text you would like to greet your visitor with.",
					"id" => $shortname."_home_intro_text",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Intro Sub Text",
					"desc" => "Enter the sub text you would like to greet your visitor with.",
					"id" => $shortname."_home_intro_subtext",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Button Text",
					"desc" => "Enter the text you would like for the button to say.",
					"id" => $shortname."_home_button_text",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Button URL",
					"desc" => "Enter the url where the button takes you.",
					"id" => $shortname."_home_button_url",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Show home Blog Section",
					"desc" => "Do you want to use the latest blog posts section on the home page?",
					"id" => $shortname."_home_service_boxes_blog",
					"std" => "false",
					"type" => "checkbox");

$options[] = array( "name" => "Select a Category",
					"desc" => "Choose the category you would like the home page blog section to pull posts from.",
					"id" => $shortname."_homblog_home_cat_choice",
					"std" => "Select a category:",
					"type" => "select",
					"options" => $of_categories);

$options[] = array( "name" => "Description Box More Link",
					"desc" => "Title of more link for the services intro box.",
					"id" => $shortname."_home_blog_box_one_more_text",
					"std" => "Learn More",
					"type" => "text");

$options[] = array( "name" => "Description Box Title",
					"desc" => "Enter the title text for the first box that introduces this section.",
					"id" => $shortname."_home_blog_dbox_title",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Description Box Text",
					"desc" => "Enter the text for this box. You can use HTML.",
					"id" => $shortname."_home_blog_dbox_text",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Description Box URL",
					"desc" => "URL where the link takes you.",
					"id" => $shortname."_home_blog_dbox_url",
					"std" => "",
					"type" => "text");

// Home service boxes
$options[] = array( "name" => "Home Service Boxes",
					"type" => "heading"); 

$options[] = array( "name" => "Show Service Box Section",
					"desc" => "Do you want to use the Service information box section on the home page?",
					"id" => $shortname."_home_service_boxes",
					"std" => "false",
					"type" => "checkbox");

$options[] = array( "name" => "Description Box More Link",
					"desc" => "Title of more link for the services intro box.",
					"id" => $shortname."_home_service_box_one_more_text",
					"std" => "Learn More",
					"type" => "text");

$options[] = array( "name" => "Description Box Title",
					"desc" => "Enter the title text for the first box that introduces this section.",
					"id" => $shortname."_home_service_dbox_title",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Description Box Text",
					"desc" => "Enter the text for this box. You can use HTML.",
					"id" => $shortname."_home_service_dbox_text",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Description Box URL",
					"desc" => "URL where the link takes you.",
					"id" => $shortname."_home_service_dbox_url",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "More Link Text",
					"desc" => "Place a title for the Read more link at the bottom of each box. This is used for all 6 boxes. If this area is left blank it will read Learn More by default.",
					"id" => $shortname."_home_service_box_more_text",
					"std" => "Learn More",
					"type" => "text");

$url =  OF_DIRECTORY . '/images/icons/';
$options[] = array( "name" => "Box 1 Icon",
					"desc" => "Choose an icon that displays next to the title for box 1.",
					"id" => $shortname."_home_service_box_1_icon",
					"std" => "",
					"type" => "images",
					"options" => array(
						'alarm' => $url . 'alarm.png',
						'appearance' => $url . 'appearance.png',
						'barchart' => $url . 'barchart.png',
						'cart' => $url . 'cart.png',
						'coffee' => $url . 'coffee.png',
						'color' => $url . 'color.png',
						'database' => $url . 'database.png',
						'decrypted' => $url . 'decrypted.png',
						'demo' => $url . 'demo.png',
						'edit' => $url . 'edit.png',
						'encrypted' => $url . 'encrypted.png',
						'gear' => $url . 'gear.png',
						'headphones' => $url . 'headphones.png',
						'home' => $url . 'home.png',
						'log' => $url . 'log.png',
						'mail' => $url . 'mail.png',
						'money' => $url . 'money.png',
						'playertime' => $url . 'playertime.png',
						'reload' => $url . 'reload.png',
						'star' => $url . 'star.png',
						'support' => $url . 'support.png',
						'thumbnail' => $url . 'thumbnail.png',
						'users' => $url . 'users.png',
						'video' => $url . 'video.png',
						'virus' => $url . 'virus.png',
						'wand' => $url . 'wand.png',
						'warning' => $url . 'warning.png',
						'wireless' => $url . 'wireless.png',
						'wizard' => $url . 'wizard.png',
						'wrench' => $url . 'wrench.png'
					));

$options[] = array( "name" => "Box 1 Title",
					"desc" => "Enter the title text for the first.",
					"id" => $shortname."_home_service_box_1_title",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Box 1 Text",
					"desc" => "Enter the text for this box. You can use HTML.",
					"id" => $shortname."_home_service_box_1_text",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Box 1 URL",
					"desc" => "URL where the link takes you.",
					"id" => $shortname."_home_service_box_1_url",
					"std" => "",
					"type" => "text");

$url =  OF_DIRECTORY . '/images/icons/';
$options[] = array( "name" => "Box 2 Icon",
					"desc" => "Choose an icon that displays next to the title for box 2.",
					"id" => $shortname."_home_service_box_2_icon",
					"std" => "",
					"type" => "images",
					"options" => array(
						'alarm' => $url . 'alarm.png',
						'appearance' => $url . 'appearance.png',
						'barchart' => $url . 'barchart.png',
						'cart' => $url . 'cart.png',
						'coffee' => $url . 'coffee.png',
						'color' => $url . 'color.png',
						'database' => $url . 'database.png',
						'decrypted' => $url . 'decrypted.png',
						'demo' => $url . 'demo.png',
						'edit' => $url . 'edit.png',
						'encrypted' => $url . 'encrypted.png',
						'gear' => $url . 'gear.png',
						'headphones' => $url . 'headphones.png',
						'home' => $url . 'home.png',
						'log' => $url . 'log.png',
						'mail' => $url . 'mail.png',
						'money' => $url . 'money.png',
						'playertime' => $url . 'playertime.png',
						'reload' => $url . 'reload.png',
						'star' => $url . 'star.png',
						'support' => $url . 'support.png',
						'thumbnail' => $url . 'thumbnail.png',
						'users' => $url . 'users.png',
						'video' => $url . 'video.png',
						'virus' => $url . 'virus.png',
						'wand' => $url . 'wand.png',
						'warning' => $url . 'warning.png',
						'wireless' => $url . 'wireless.png',
						'wizard' => $url . 'wizard.png',
						'wrench' => $url . 'wrench.png'
					));

$options[] = array( "name" => "Box 2 Title",
					"desc" => "Enter the title text.",
					"id" => $shortname."_home_service_box_2_title",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Box 2 Text",
					"desc" => "Enter the text for this box. You can use HTML.",
					"id" => $shortname."_home_service_box_2_text",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Box 2 URL",
					"desc" => "URL where the link takes you.",
					"id" => $shortname."_home_service_box_2_url",
					"std" => "",
					"type" => "text");

$url =  OF_DIRECTORY . '/images/icons/';
$options[] = array( "name" => "Box 3 Icon",
					"desc" => "Choose an icon that displays next to the title for box 3.",
					"id" => $shortname."_home_service_box_3_icon",
					"std" => "",
					"type" => "images",
					"options" => array(
						'alarm' => $url . 'alarm.png',
						'appearance' => $url . 'appearance.png',
						'barchart' => $url . 'barchart.png',
						'cart' => $url . 'cart.png',
						'coffee' => $url . 'coffee.png',
						'color' => $url . 'color.png',
						'database' => $url . 'database.png',
						'decrypted' => $url . 'decrypted.png',
						'demo' => $url . 'demo.png',
						'edit' => $url . 'edit.png',
						'encrypted' => $url . 'encrypted.png',
						'gear' => $url . 'gear.png',
						'headphones' => $url . 'headphones.png',
						'home' => $url . 'home.png',
						'log' => $url . 'log.png',
						'mail' => $url . 'mail.png',
						'money' => $url . 'money.png',
						'playertime' => $url . 'playertime.png',
						'reload' => $url . 'reload.png',
						'star' => $url . 'star.png',
						'support' => $url . 'support.png',
						'thumbnail' => $url . 'thumbnail.png',
						'users' => $url . 'users.png',
						'video' => $url . 'video.png',
						'virus' => $url . 'virus.png',
						'wand' => $url . 'wand.png',
						'warning' => $url . 'warning.png',
						'wireless' => $url . 'wireless.png',
						'wizard' => $url . 'wizard.png',
						'wrench' => $url . 'wrench.png'
					));

$options[] = array( "name" => "Box 3 Title",
					"desc" => "Enter the title text.",
					"id" => $shortname."_home_service_box_3_title",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Box 3 Text",
					"desc" => "Enter the text for this box. You can use HTML.",
					"id" => $shortname."_home_service_box_3_text",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Box 3 URL",
					"desc" => "URL where the link takes you.",
					"id" => $shortname."_home_service_box_3_url",
					"std" => "",
					"type" => "text");

$url =  OF_DIRECTORY . '/images/icons/';
$options[] = array( "name" => "Box 4 Icon",
					"desc" => "Choose an icon that displays next to the title for box 4.",
					"id" => $shortname."_home_service_box_4_icon",
					"std" => "",
					"type" => "images",
					"options" => array(
						'alarm' => $url . 'alarm.png',
						'appearance' => $url . 'appearance.png',
						'barchart' => $url . 'barchart.png',
						'cart' => $url . 'cart.png',
						'coffee' => $url . 'coffee.png',
						'color' => $url . 'color.png',
						'database' => $url . 'database.png',
						'decrypted' => $url . 'decrypted.png',
						'demo' => $url . 'demo.png',
						'edit' => $url . 'edit.png',
						'encrypted' => $url . 'encrypted.png',
						'gear' => $url . 'gear.png',
						'headphones' => $url . 'headphones.png',
						'home' => $url . 'home.png',
						'log' => $url . 'log.png',
						'mail' => $url . 'mail.png',
						'money' => $url . 'money.png',
						'playertime' => $url . 'playertime.png',
						'reload' => $url . 'reload.png',
						'star' => $url . 'star.png',
						'support' => $url . 'support.png',
						'thumbnail' => $url . 'thumbnail.png',
						'users' => $url . 'users.png',
						'video' => $url . 'video.png',
						'virus' => $url . 'virus.png',
						'wand' => $url . 'wand.png',
						'warning' => $url . 'warning.png',
						'wireless' => $url . 'wireless.png',
						'wizard' => $url . 'wizard.png',
						'wrench' => $url . 'wrench.png'
					));

$options[] = array( "name" => "Box 4 Title",
					"desc" => "Enter the title text.",
					"id" => $shortname."_home_service_box_4_title",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Box 4 Text",
					"desc" => "Enter the text for this box. You can use HTML.",
					"id" => $shortname."_home_service_box_4_text",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Box 4 URL",
					"desc" => "URL where the link takes you.",
					"id" => $shortname."_home_service_box_4_url",
					"std" => "",
					"type" => "text");

$url =  OF_DIRECTORY . '/images/icons/';
$options[] = array( "name" => "Box 5 Icon",
					"desc" => "Choose an icon that displays next to the title for box 5.",
					"id" => $shortname."_home_service_box_5_icon",
					"std" => "",
					"type" => "images",
					"options" => array(
						'alarm' => $url . 'alarm.png',
						'appearance' => $url . 'appearance.png',
						'barchart' => $url . 'barchart.png',
						'cart' => $url . 'cart.png',
						'coffee' => $url . 'coffee.png',
						'color' => $url . 'color.png',
						'database' => $url . 'database.png',
						'decrypted' => $url . 'decrypted.png',
						'demo' => $url . 'demo.png',
						'edit' => $url . 'edit.png',
						'encrypted' => $url . 'encrypted.png',
						'gear' => $url . 'gear.png',
						'headphones' => $url . 'headphones.png',
						'home' => $url . 'home.png',
						'log' => $url . 'log.png',
						'mail' => $url . 'mail.png',
						'money' => $url . 'money.png',
						'playertime' => $url . 'playertime.png',
						'reload' => $url . 'reload.png',
						'star' => $url . 'star.png',
						'support' => $url . 'support.png',
						'thumbnail' => $url . 'thumbnail.png',
						'users' => $url . 'users.png',
						'video' => $url . 'video.png',
						'virus' => $url . 'virus.png',
						'wand' => $url . 'wand.png',
						'warning' => $url . 'warning.png',
						'wireless' => $url . 'wireless.png',
						'wizard' => $url . 'wizard.png',
						'wrench' => $url . 'wrench.png'
					));

$options[] = array( "name" => "Box 5 Title",
					"desc" => "Enter the title text for the first.",
					"id" => $shortname."_home_service_box_5_title",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Box 5 Text",
					"desc" => "Enter the text for this box. You can use HTML.",
					"id" => $shortname."_home_service_box_5_text",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Box 5 URL",
					"desc" => "URL where the link takes you.",
					"id" => $shortname."_home_service_box_5_url",
					"std" => "",
					"type" => "text");

$url =  OF_DIRECTORY . '/images/icons/';
$options[] = array( "name" => "Box 6 Icon",
					"desc" => "Choose an icon that displays next to the title for box 6.",
					"id" => $shortname."_home_service_box_6_icon",
					"std" => "",
					"type" => "images",
					"options" => array(
						'alarm' => $url . 'alarm.png',
						'appearance' => $url . 'appearance.png',
						'barchart' => $url . 'barchart.png',
						'cart' => $url . 'cart.png',
						'coffee' => $url . 'coffee.png',
						'color' => $url . 'color.png',
						'database' => $url . 'database.png',
						'decrypted' => $url . 'decrypted.png',
						'demo' => $url . 'demo.png',
						'edit' => $url . 'edit.png',
						'encrypted' => $url . 'encrypted.png',
						'gear' => $url . 'gear.png',
						'headphones' => $url . 'headphones.png',
						'home' => $url . 'home.png',
						'log' => $url . 'log.png',
						'mail' => $url . 'mail.png',
						'money' => $url . 'money.png',
						'playertime' => $url . 'playertime.png',
						'reload' => $url . 'reload.png',
						'star' => $url . 'star.png',
						'support' => $url . 'support.png',
						'thumbnail' => $url . 'thumbnail.png',
						'users' => $url . 'users.png',
						'video' => $url . 'video.png',
						'virus' => $url . 'virus.png',
						'wand' => $url . 'wand.png',
						'warning' => $url . 'warning.png',
						'wireless' => $url . 'wireless.png',
						'wizard' => $url . 'wizard.png',
						'wrench' => $url . 'wrench.png'
					));

$options[] = array( "name" => "Box 6 Title",
					"desc" => "Enter the title text for the first.",
					"id" => $shortname."_home_service_box_6_title",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Box 6 Text",
					"desc" => "Enter the text for this box. You can use HTML.",
					"id" => $shortname."_home_service_box_6_text",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Box 6 URL",
					"desc" => "URL where the link takes you.",
					"id" => $shortname."_home_service_box_6_url",
					"std" => "",
					"type" => "text");


// Blog Options
$options[] = array( "name" => "Blog Options",
					"type" => "heading");

$options[] = array( "name" => "Exclude Categories From Blog",
					"desc" => "Input the category id's that you want to exclude from showing on your blog. Use the id with a &ndash; minus before it followed by a comma for multiple. EX: -5,-81,-26",
					"id" => $shortname."_blog_excats",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Show Blog Masthead",
					"desc" => "Do you want to show the masthead intro on your blog page?",
					"id" => $shortname."_blog_masthead",
					"std" => "false",
					"type" => "checkbox");

$options[] = array( "name" => "Masthead Intro Large Text",

					"desc" => "Enter the text you want that will be large. ",
					"id" => $shortname."_blog_masthead_large",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "Masthead Intro Small Text",
					"desc" => "Enter the text you would like as your masthead intro.",
					"id" => $shortname."_blog_masthead_small",
					"std" => "",
					"type" => "textarea");

$options[] = array( "name" => "Show Post Tags",
					"desc" => "Do you want to show the post tags on the single post page?",
					"id" => $shortname."_show_post_tags",
					"std" => "false",
					"type" => "checkbox");

$options[] = array( "name" => "Show Author Bio",
					"desc" => "Do you want to show the author bio on the single post page?",
					"id" => $shortname."_show_author_bio",
					"std" => "false",
					"type" => "checkbox");

$options[] = array( "name" => "Show Related Posts",
					"desc" => "Do you want to show related posts on the single post page?",
					"id" => $shortname."_show_related_posts",
					"std" => "false",
					"type" => "checkbox");

$options[] = array( "name" => "Show Sharebox",
					"desc" => "Do you want to show the sharebox on the single post?",
					"id" => $shortname."_show_share_posts",
					"std" => "false",
					"type" => "checkbox");

// Portfolio/Gallery
$options[] = array( "name" => "Portfolio/Gallery",
					"type" => "heading");

$options[] = array( "name" => "Show Navigation",
					"desc" => "Would you like to use a menu for your portfolio pages? Edit the menu from the WP Menu options.",
					"id" => $shortname."_show_work_nav",
					"std" => "false",
					"type" => "checkbox");

$options[] = array( "name" => "1 Column Post Count",
					"desc" => "Enter the number of items you want to show per page.",
					"id" => $shortname."_pcount_1column",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "2 Column Post Count",
					"desc" => "Enter the number of items you want to show per page. Best in increments of 2. EX: 2,4,6...",
					"id" => $shortname."_pcount_2column",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "3 Column Post Count",
					"desc" => "Enter the number of items you want to show per page. Best in increments of 3. EX: 3,6,9...",
					"id" => $shortname."_pcount_3column",
					"std" => "",
					"type" => "text");

$options[] = array( "name" => "4 Column Post Count",
					"desc" => "Enter the number of items you want to show per page. Best in increments of 4. EX: 4,8,12...",
					"id" => $shortname."_pcount_4column",
					"std" => "",
					"type" => "text");


// Update the options
update_option('of_template',$options); 					  
update_option('of_themename',$themename);   
update_option('of_shortname',$shortname);

}
}
?>

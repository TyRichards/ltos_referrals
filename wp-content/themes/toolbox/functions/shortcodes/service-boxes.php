<?php
// [serviceboxes]
function serviceboxes_shortcode( $atts, $content = null ) {
return '<div class="service-boxes short">'. do_shortcode($content) .'</div>';
}
add_shortcode('serviceboxes', 'serviceboxes_shortcode');

// [serviceboxes_home]
function serviceboxes_home_shortcode( $atts, $content = null ) {
return '<div>'. do_shortcode($content) .'</div>';
}
add_shortcode('serviceboxes_home', 'serviceboxes_home_shortcode');

// [serviceboxes_rw]
function serviceboxes_rw_shortcode( $atts, $content = null ) {
return '<div class="recent-work">'. do_shortcode($content) .'</div>';
}
add_shortcode('serviceboxes_rw', 'serviceboxes_rw_shortcode');

// [sbox_one]
function sbox_one_shortcode( $atts, $content = null ) {
return '<div class="box box-one"><div class="text-area">'. do_shortcode($content) .'</div></div>';
}
add_shortcode('sbox_one', 'sbox_one_shortcode');

// [sbox]
function sbox_shortcode( $atts, $content = null ) {
return '<div class="box"><div class="text-area">'. do_shortcode($content) .'</div></div>';
}
add_shortcode('sbox', 'sbox_shortcode');

// [sbox_last]
function sbox_last_shortcode( $atts, $content = null ) {
return '<div class="box last"><div class="text-area">'. do_shortcode($content) .'</div></div>'; 
}
add_shortcode('sbox_last', 'sbox_last_shortcode');

// [sbox_title]
function sbox_title_shortcode( $atts, $content = null ) {
return '<h3>'. do_shortcode($content) .'</h3>';
}
add_shortcode('sbox_title', 'sbox_title_shortcode');

// [sbox_text]
function sbox_text_shortcode( $atts, $content = null ) {
return '<p>'. do_shortcode($content) .'</p>';
}
add_shortcode('sbox_text', 'sbox_text_shortcode');

// [sbox_button]
function sbox_button_shortcode($atts, $content = null) {
	extract(shortcode_atts(array(
		'link' => '#'
	), $atts));

	return '<a href="'.$link.'" class="home-box-more blink"><span>'. do_shortcode($content) .'</span></a>';
}
add_shortcode('sbox_button', 'sbox_button_shortcode');

// [sbox_link]
function sbox_link_shortcode($atts, $content = null) {
	extract(shortcode_atts(array(
		'link' => '#'
	), $atts));

	return '<a href="'.$link.'" class="more-link"><span>'. do_shortcode($content) .'</span></a>';
}
add_shortcode('sbox_link', 'sbox_link_shortcode');

	/////////////////////////////////////////////////////////////////
	//// THIS WILL HANDLE THE SHORTCODES FOR THE SERVICES ICON IMAGE
	/////////////////////////////////////////////////////////////////
	
	add_shortcode('sbox_icon', 'sbox_icon_shortcode');
	
	// Function
	function sbox_icon_shortcode($atts, $content = null) {
		
		//extracts our attrs . if not set set default
		extract(shortcode_atts(array(
		
			'icon' => 'alarm'
		
		), $atts));
		
		//decide icon
		switch($icon) {
			
			case 'alarm':
				$sbicon = 'alarm';
				break;
			
			case 'appearance':
				$sbicon = 'appearance';
				break;
				
			case 'barchart':
				$sbicon = 'barchart';
				break;

			case 'cart':
				$sbicon = 'cart';
				break;
				
			case 'coffee':
				$sbicon = 'coffee';
				break;
				
			case 'color':
				$sbicon = 'color';
				break;
				
			case 'cart':
				$sbicon = 'cart';
				break;
				
			case 'database':
				$sbicon = 'database';
				break;
				
			case 'decrypted':
				$sbicon = 'decrypted';
				break;
				
			case 'demo':
				$sbicon = 'demo';
				break;	
			
			case 'edit':
				$sbicon = 'edit';
				break;
				
			case 'encrypted':
				$sbicon = 'encrypted';
				break;	
			
			case 'gear':
				$sbicon = 'gear';
				break;
				
			case 'headphones':
				$sbicon = 'headphones';
				break;
			
			case 'home':
				$sbicon = 'home';
				break;
			
			case 'log':
				$sbicon = 'log';
				break;
				
			case 'mail':
				$sbicon = 'mail';
				break;
			
			case 'money':
				$sbicon = 'money';
				break;
				
			case 'playertime':
				$sbicon = 'playertime';
				break;
			
			case 'reload':
				$sbicon = 'reload';
				break;
			
			case 'star':
				$sbicon = 'star';
				break;
				
			case 'support':
				$sbicon = 'support';
				break;
				
			case 'thumbnail':
				$sbicon = 'thumbnail';
				break;
			
			case 'users':
				$sbicon = 'users';
				break;
			
			case 'video':
				$sbicon = 'virus';
				break;
			
			case 'virus':
				$sbicon = 'virus';
				break;
			
			case 'wand':
				$sbicon = 'wand';
				break;
				
			case 'warning':
				$sbicon = 'warning';
				break;
				
			case 'wireless':
				$sbicon = 'wireless';
				break;
			
			case 'wizard':
				$sbicon = 'wizard';
				break;
			
			case 'wrench':
				$sbicon = 'wrench';
				break;
		}
		
		$turl = get_bloginfo('template_directory');
		
		return '<img height="32" width="32" src="'.$turl.'/images/icons/'.$sbicon.'.png" class="icon">';
		
	}
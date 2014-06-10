<?php
// Allow shortcodes in widgets
add_filter('widget_text', 'do_shortcode');

// [content]
function content_shortcode( $atts, $content = null ) {
return '<div id="content">'. do_shortcode($content) .'';
}
add_shortcode('content', 'content_shortcode');

// [shadow]
function shadow_shortcode( $atts, $content = null ) {
return '<div class="shadow"></div>'. do_shortcode($content) .'';
}
add_shortcode('shadow', 'shadow_shortcode');

// [clear]
function clear_shortcode( $atts, $content = null ) {
return '<div class="clear">'. do_shortcode($content) .'</div>';
}
add_shortcode('clear', 'clear_shortcode');

// [line]
function line_shortcode( $atts, $content = null ) {
return '<div class="line">'. do_shortcode($content) .'</div>';
}
add_shortcode('line', 'line_shortcode');

// [linealt]
function linealt_shortcode( $atts, $content = null ) {
return '<div class="linealt">'. do_shortcode($content) .'</div>';
}
add_shortcode('linealt', 'linealt_shortcode');

//Slider
function cs_slider($atts, $content = null) {
extract(shortcode_atts(array(
'width' => '909px',
'height' => '419px'
), $atts));
return '<div id="slider-wrapper-wide" style="width:'.$width.'; height:'.$height.';"><div id="slider" class="nivoSlider" style="width:'.$width.'; height:'.$height.';">
'.do_shortcode($content).'
</div></div>';	
}
add_shortcode('slider', 'cs_slider');
	
//Small Slider
function cs_slider_small($atts, $content = null) {
extract(shortcode_atts(array(
'width' => '589px',
'height' => '237px'
), $atts));
return '<div id="slider-wrapper-small" style="width:'.$width.'; height:'.$height.';"><div id="slider" class="nivoSlider" style="width:'.$width.'; height:'.$height.';">
'.do_shortcode($content).'
</div></div>';	
}
add_shortcode('slider_small', 'cs_slider_small');
	
//Slide Image
function cs_slide($atts, $content = null) {
extract(shortcode_atts(array(
'title' => 'enter a title if you like'
), $atts));
return '<img src="'.$content.'" title="'.$title.'" alt="'.$title.'"/>';	
}
add_shortcode('slide', 'cs_slide');

// [dropcap]
function dropcap_shortcode( $atts, $content = null ) {
return '<span class="drop-cap docufon">'. do_shortcode($content) .'</span>';
}
add_shortcode('dropcap', 'dropcap_shortcode');

// [download]
function download_shortcode( $atts, $content = null ) {
return '<div class="download-box short-box"><div class="downloadboxinner">'. do_shortcode($content) .'</div></div>';
}
add_shortcode('download', 'download_shortcode');

// [warning]
function warning_shortcode( $atts, $content = null ) {
return '<div class="warning-box short-box"><div class="warningboxinner">'. do_shortcode($content) .'</div></div>';
}
add_shortcode('warning', 'warning_shortcode');

// [info]
function info_shortcode( $atts, $content = null ) {
return '<div class="info-box short-box"><div class="infoboxinner">'. do_shortcode($content) .'</div></div>';
}
add_shortcode('info', 'info_shortcode');

// [note]
function note_shortcode( $atts, $content = null ) {
return '<div class="note-box short-box"><div class="noteboxinner">'. do_shortcode($content) .'</div></div>';
}
add_shortcode('note', 'note_shortcode');

// Columns
add_shortcode('one_half', 'column_one_half');
add_shortcode('one_third', 'column_one_third');
add_shortcode('two_thirds', 'column_two_thirds');
add_shortcode('one_fourth', 'column_one_fourth');
add_shortcode('three_fourths', 'column_three_fourths');

//One-half
function column_one_half($atts, $content = null) {
extract(shortcode_atts(array(
'last' => ''
), $atts));
return '<div class="one-half'.ifLast($last).'">'.do_shortcode($content).'</div>'.ifLastC($last).'';
}
	
//One-third
function column_one_third($atts, $content = null) {
extract(shortcode_atts(array(
'last' => ''
), $atts));
return '<div class="one-third'.ifLast($last).'">'.do_shortcode($content).'</div>'.ifLastC($last).'';
}
	
//Two-thirds
function column_two_thirds($atts, $content = null) {
extract(shortcode_atts(array(
'last' => ''
), $atts));
return '<div class="two-thirds'.ifLast($last).'">'.do_shortcode($content).'</div>'.ifLastC($last).'';
}
	
//one-fourth
function column_one_fourth($atts, $content = null) {
extract(shortcode_atts(array(
'last' => ''
), $atts));
return '<div class="one-fourth'.ifLast($last).'">'.do_shortcode($content).'</div>'.ifLastC($last).'';
}
	
//three-fourth Function
function column_three_fourths($atts, $content = null) {
extract(shortcode_atts(array(
'last' => ''
), $atts));
return '<div class="three-fourths'.ifLast($last).'">'.do_shortcode($content).'</div>'.ifLastC($last).'';
}
	
//if last
function ifLast($last) {
	if($last == 'last') {
	return ' last';
	}
}

//if last
function ifLastC($last) {
	if($last == 'last') {
	return '<div class="clear"></div>';
	}
}

///// Text Highlighting /////
add_shortcode('highlight', 'highlight_shortcode');
	function highlight_shortcode($atts, $content = null) {
		extract(shortcode_atts(array(
			'color' => 'light'
		), $atts));
		
		switch($color) {
			
			case 'blue':
				$class = 'highlight-blue';
				break;
			
			case 'orange':
				$class = 'highlight-orange';
				break;
			
			case 'green':
				$class = 'highlight-green';
				break;
			
			case 'purple':
				$class = 'highlight-purple';
				break;
			
			case 'pink':
				$class = 'highlight-pink';
				break;
			
			case 'red':
				$class = 'highlight-red';
				break;
			
			case 'grey':
				$class = 'highlight-grey';
				break;
			
			case 'light':
				$class = 'highlight-light';
				break;
			
			case 'black':
				$class = 'highlight-black';
				break;
				
			case 'yellow':
				$class = 'highlight-yellow';
				break;
			
		}
		
		return '<span class="highlight '.$class.'">'.do_shortcode($content).'</span>';
		
	}

// Tooltips
add_shortcode('tooltip', 'skshort_tooltip');
	function skshort_tooltip($atts, $content = null) {
		extract(shortcode_atts(array(
			'text' => 'You have forgotten to include your "text" attribute to display your tooltip.',
			'color' => 'light'
		), $atts));
		
		switch($color) {
			
			case 'blue':
				$class = 'tooltip-blue';
				break;
			
			case 'orange':
				$class = 'tooltip-orange';
				break;
			
			case 'green':
				$class = 'tooltip-green';
				break;
			
			case 'purple':
				$class = 'tooltip-purple';
				break;
			
			case 'pink':
				$class = 'tooltip-pink';
				break;
			
			case 'red':
				$class = 'tooltip-red';
				break;
			
			case 'grey':
				$class = 'tooltip-grey';
				break;
			
			case 'light':
				$class = 'tooltip-light';
				break;
			
			case 'black':
				$class = 'tooltip-black';
				break;
			
		}
		return '<span class="tip_trigger">'.do_shortcode($content).'<span class="tip '.$class.'">'.$text.'</span></span>';
		
	}

//Protected content
add_shortcode('protected','digi_protected');
function digi_protected($atts, $content = null){

	if ( is_user_logged_in() ) {
		//$content = sk_delete_htmltags($content);	
		$content = do_shortcode($content);
		$output = $content;
	} else {
		$output = "<div id='digi-protected'>
				<p class='digi-registration'>The following content is for our members only</p>
					<div class='digi-protected-form'>
					<form action='" . get_option('home') . "/wp-login.php' method='post'>
						<p><label>Username: <input type='text' name='log' id='log' value='" . wp_specialchars(stripslashes($user_login), 1) . "' size='20' /></label></p>
						<p><label>Password: <input type='password' name='pwd' id='pwd' size='20' /></label></p>
						<input type='submit' name='submit' value='Login' id='sklogin-button' />
					</form> 
					</div> <!-- .digi-protected-form -->
				<p class='digi-registration'>Not a member? <a href='".site_url('wp-login.php?action=register', 'login_post')."'>Register today!</a></p>
				</div> <!-- .digi-protected -->";
	}
				
	return $output;
}	
?>
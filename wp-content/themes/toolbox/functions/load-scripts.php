<?php
if ( !is_admin() ) :

//Main Scripts
wp_enqueue_script('scripts', get_bloginfo('template_url') . '/inc/js/scripts.js',array('jquery'),'1.0',true);

wp_enqueue_script('scripts-nivo', get_bloginfo('template_url') . '/inc/js/nivo.js',array('jquery'),'1.0',true);

wp_enqueue_script('scripts-testimonial', get_bloginfo('template_url') . '/inc/js/testimonial.js',array('jquery'),'3.0',true);

wp_enqueue_script('scripts-active', get_bloginfo('template_url') . '/inc/js/scripts-active.js',array('jquery'),'1.0',true);

// PrettyPhoto
wp_enqueue_style('css-prettyphoto', get_bloginfo('template_url') . '/inc/js/prettyphoto/css/prettyPhoto.css',false,'1.1','all');
wp_enqueue_script('scripts-prettyphoto', get_bloginfo('template_url') . '/inc/js/prettyphoto/js/jquery.prettyPhoto.js',array('jquery'),'1.0',true);

wp_enqueue_script('scripts-cufon', get_bloginfo('template_url') . '/inc/js/cufon/cufon-yui.js',array('jquery'),'1.9',true);

endif;
?>
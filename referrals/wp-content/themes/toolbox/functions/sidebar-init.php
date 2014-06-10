<?php
/**
 * Register widgetized areas, including two sidebars and four widget-ready columns in the footer.
 *
 * To override toolbox_widgets_init() in a child theme, remove the action hook and add your own
 * function tied to the init hook.
 *
 * @since toolbox 1.0
 * @uses register_sidebar
 */
function toolbox_widgets_init() {
	// Area 1, located at the top of the sidebar.
	register_sidebar( array(
		'name' => __( 'Primary Widget Area' ),
		'id' => 'primary-widget-area',
		'description' => __( 'The primary widget area' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );

	// Area 2, located in the footer. Empty by default.
	register_sidebar( array(
		'name' => __( 'Footer Widget Area' ),
		'id' => 'footer-widget-area',
		'description' => __( 'The footer widget area' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );
	
	// Area 7, located in the contact template. Empty by default.
	register_sidebar( array(
		'name' => __( 'Contact Widget Area' ),
		'id' => 'contact-widget-area',
		'description' => __( 'The widget area in the Contact page template' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );
	
	// Area 8, located in the contact template. Empty by default.
	register_sidebar( array(
		'name' => __( 'Pages Widget Area' ),
		'id' => 'pages-widget-area',
		'description' => __( 'The widget area for pages' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );	
	
	// Area 9, located in the home template. Empty by default.
	register_sidebar( array(
		'name' => __( 'Home Widget Area' ),
		'id' => 'home-widget-area',
		'description' => __( 'The widget area for the home page template' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );
	
}
/** Register sidebars by running toolbox_widgets_init() on the widgets_init hook. */
add_action( 'widgets_init', 'toolbox_widgets_init' );
?>
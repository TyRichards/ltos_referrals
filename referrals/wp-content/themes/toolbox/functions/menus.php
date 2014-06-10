<?php
// This theme uses wp_nav_menu() in three locations.
add_action( 'init', 'register_navmenus' );
	function register_navmenus() {
		register_nav_menus( array(
			'primary' => __( 'Primary Navigation' ),
			'workgallery' => __( 'Gallery/Work Navigation' ),
			)
		);
	}

// Fallback if no navigation is selected from the Menus admin for the header
function digi_no_nav() {
	echo '<div class="no-nav-main tshadow"><p>Please create and select a menu from the WordPress "Appearance &raquo; Menus" option.</p></div>';
}

// Fallback if no navigation is selected from the Menus admin for the work/gallery pages
function digi_no_nav_work() {
	echo '<div class="no-nav-work"><p>Please create and select a menu from the WordPress "Appearance &raquo; Menus" option.</p></div>';
}
?>
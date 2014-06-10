<?php
// Disables the theme update checking and notification system because there is a WP theme in the directory named Toolbox. :(
																															
# 2.8 to 3.0:
remove_action( 'load-themes.php', 'wp_update_themes' );
remove_action( 'load-update.php', 'wp_update_themes' );
remove_action( 'admin_init', '_maybe_update_themes' );
remove_action( 'wp_update_themes', 'wp_update_themes' );
add_filter( 'pre_transient_update_themes', create_function( '$a', "return null;" ) );

# 3.0:
remove_action( 'load-update-core.php', 'wp_update_themes' );
add_filter( 'pre_site_transient_update_themes', create_function( '$a', "return null;" ) );
?>
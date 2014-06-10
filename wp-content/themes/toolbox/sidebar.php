<?php
/**
 * The Sidebar containing the primary and secondary widget areas.
 */
?>

<div id="swrap" <?php if ($sbar = get_option('of_sidebar_location')) : ?>class="<?php echo $sbar ?>"<?php endif; ?>>

<div class="sidebar-top <?php if ($sbar = get_option('of_sidebar_location')) : ?><?php echo $sbar ?><?php endif; ?>"></div>

<div id="sidebar" <?php if ($sbar = get_option('of_sidebar_location')) : ?>class="<?php echo $sbar ?>"<?php endif; ?>>  
    
<ul class="xoxo">

<?php
	/* When we call the dynamic_sidebar() function, it'll spit out
	 * the widgets for that widget area. If it instead returns false,
	 * then the sidebar simply doesn't exist, so we'll hard-code in
	 * some default sidebar stuff just in case.
	 */
	if ( ! dynamic_sidebar( 'primary-widget-area' ) ) : ?>
	
			<li class="widget-container">
				<h3 class="widget-title">Primary Widget Area</h3>
				<div class="textwidget">
					<p>Control the widgets from your WP admin.</p>
				</div>
			</li>

		<?php endif; // end primary widget area ?>
</ul>

</div>

<div class="sidebar-bottom <?php if ($sbar = get_option('of_sidebar_location')) : ?><?php echo $sbar ?><?php endif; ?>"></div>

</div>
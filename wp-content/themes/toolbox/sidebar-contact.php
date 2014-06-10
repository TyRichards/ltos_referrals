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
	// A second sidebar for widgets, just because.
	if ( ! dynamic_sidebar( 'contact-widget-area' ) ) : ?>
			<li class="widget-container">
				<h3 class="widget-title">Contact Page Widget Area</h3>
				<div class="textwidget">
					<p>Control the widgets from your WP admin.</p>
				</div>
			</li>
<?php endif; ?>
</ul>

</div>

<div class="sidebar-bottom <?php if ($sbar = get_option('of_sidebar_location')) : ?><?php echo $sbar ?><?php endif; ?>"></div>

</div>
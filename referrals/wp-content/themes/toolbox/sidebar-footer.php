<?php
/**
 * The Footer widget areas.
 */
?>

<?php
	/* The footer widget area is triggered if any of the areas
	 * have widgets. So let's check that first.
	 *
	 * If none of the sidebars have widgets, then let's bail early.
	 */
	if (   ! is_active_sidebar( 'footer-widget-area'  )
	)
		return;
	// If we get this far, we have widgets. Let do this.
?>

<div id="footer">

<?php if ($fcolumn = get_option('of_footer_widget_columns')) : ?>

<?php if ( is_active_sidebar( 'footer-widget-area' ) ) : ?>
<ul class="xoxo <?php echo $fcolumn ?>">
<?php dynamic_sidebar( 'footer-widget-area' ); ?>
</ul>
<?php endif; ?>

<?php endif; ?>

</div>


<?php
/**
 * The template for displaying 404 pages (Not Found).
 */

get_header(); ?>

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="masthead-wide">
<div class="shadow"></div>
<?php endif; ?>
    <div id="masthead" class="tshadow docufon">
    <h1><span><?php _e( 'Not Found', 'percivale' ); ?></span></h1>
    </div>
<?php if( get_option('of_wide_layout') == 'true') : ?>
</div> <!--end .masthead-wide-->
<?php endif; ?>

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="content-wide">
<div class="shadow"></div>
<?php endif; ?>

<!---------- Begin Regular content ---------->
<div id="content">

<?php if (function_exists('digi_breadcrumbs')) digi_breadcrumbs(); ?>

<div class="post-wrap">

<div class="col-left">

<p><?php _e( 'Apologies, but the page you requested could not be found. Perhaps searching will help.', 'percivale' ); ?></p>
				
<?php get_search_form(); ?>

	<script type="text/javascript">
		// focus on search field after it has loaded
		document.getElementById('s') && document.getElementById('s').focus();
	</script>

</div><!--END COL-LEFT -->                 

<?php get_sidebar(); ?>

</div>

<?php get_footer(); ?>
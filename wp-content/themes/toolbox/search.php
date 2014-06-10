<?php
/**
 * The template for displaying Search Results pages.
 */

get_header(); ?>

<div class="masthead-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>
<div id="masthead" class="tshadow">
<h1><span><?php printf( __( 'Search Results for: %s', 'percivale' ), '' . get_search_query() . '' ); ?></span></h1>
</div>

</div> <!--end .masthead-wide-->

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="content-wide">
<div class="shadow"></div>
<?php endif; ?>

<!---------- Begin Regular content ---------->
<div id="content">

<?php if (function_exists('digi_breadcrumbs')) digi_breadcrumbs(); ?>

<div class="post-wrap">

<div class="col-left <?php if ($sbar = get_option('of_sidebar_location')) : ?>col-<?php echo $sbar ?><?php endif; ?>">

<?php if ( have_posts() ) : ?>
				<?php
				/* Run the loop for the search to output the results.
				 */
				 get_template_part( 'loop' );
				?>
<?php else : ?>
					<h2><?php _e( 'Nothing Found', 'percivale' ); ?></h2>
					<p><?php _e( 'Sorry, but nothing matched your search criteria. Please try again with some different keywords.', 'percivale' ); ?></p>
					<?php get_search_form(); ?>
<?php endif; ?>

</div><!--END COL-LEFT -->                 

<?php get_sidebar(); ?>

</div>

<?php get_footer(); ?>

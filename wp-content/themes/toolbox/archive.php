<?php
/**
 * The template for displaying Archive pages.
 *
 * Used to display archive-type pages if nothing more specific matches a query.
 * For example, puts together date-based pages if no date.php file exists.
 */

get_header(); ?>

<div class="masthead-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>
    <div id="masthead" class="tshadow docufon">
    <h1><span>
    <?php if ( is_day() ) : ?>
                    <?php printf( __( 'Daily Archives: %s', 'percivale' ), get_the_date() ); ?>
    <?php elseif ( is_month() ) : ?>
                    <?php printf( __( 'Monthly Archives: %s', 'percivale' ), get_the_date('F Y') ); ?>
    <?php elseif ( is_year() ) : ?>
                    <?php printf( __( 'Yearly Archives: %s', 'percivale' ), get_the_date('Y') ); ?>
    <?php else : ?>
                    <?php _e( 'Blog Archives', 'percivale' ); ?>
    <?php endif; ?>
    </span></h1>
    </div>

</div> <!--end .masthead-wide-->

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="content-wide">
<div class="shadow"></div>
<?php endif; ?>

<!---------- Begin Regular content ---------->
<div id="content">

<?php
	/* Queue the first post, that way we know
	 * what date we're dealing with (if that is the case).
	 *
	 * We reset this later so we can run the loop
	 * properly with a call to rewind_posts().
	 */
	if ( have_posts() )
		the_post();
?>

<?php if (function_exists('digi_breadcrumbs')) digi_breadcrumbs(); ?>

<div class="post-wrap">

<div class="col-left <?php if ($sbar = get_option('of_sidebar_location')) : ?>col-<?php echo $sbar ?><?php endif; ?>">

<?php
	/* Since we called the_post() above, we need to
	 * rewind the loop back to the beginning that way
	 * we can run the loop properly, in full.
	 */
	rewind_posts();

	/* Run the loop for the archives page to output the posts.
	 * If you want to overload this in a child theme then include a file
	 * called loop-archives.php and that will be used instead.
	 */
	 get_template_part( 'loop' );
?>

</div>

<?php get_sidebar(); ?>

</div>

<?php get_footer(); ?>
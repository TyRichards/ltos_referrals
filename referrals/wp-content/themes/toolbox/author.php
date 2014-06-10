<?php
/**
 * The template for displaying Author Archive pages.
 */

get_header(); ?>

<?php
	/* Queue the first post, that way we know who
	 * the author is when we try to get their name,
	 * URL, description, avatar, etc.
	 *
	 * We reset this later so we can run the loop
	 * properly with a call to rewind_posts().
	 */
	if ( have_posts() )
		the_post();
?>
<div class="masthead-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>
<div id="masthead" class="tshadow">
<h1><span><?php printf( __( 'About: %s', 'percivale' ), get_the_author() ); ?></span></h1>
<p class="docufon"><?php the_author_meta( 'description' ); ?></p>
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

<?php
// If a user has filled out their description, show a bio on their entries.
if ( get_the_author_meta( 'description' ) ) : ?>                           

<?php endif; ?>

<?php
	/* Since we called the_post() above, we need to
	 * rewind the loop back to the beginning that way
	 * we can run the loop properly, in full.
	 */
	rewind_posts();

	get_template_part( 'loop' );
?>

</div>

<?php get_sidebar(); ?>

</div>

<?php get_footer(); ?>
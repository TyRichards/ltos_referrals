<?php
/**
 * The main template file.
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query. 
 * E.g., it puts together the home page when no home.php file exists.
 * Learn more: http://codex.wordpress.org/Template_Hierarchy
 *
 */

get_header(); ?>

<?php if (is_front_page('')) : ?>
<?php if( get_option('of_show_digi_slider') == 'true') : ?>
	<?php include(TEMPLATEPATH . '/inc/digi-slider-2.php'); ?>
<?php endif; ?>

<?php if( get_option('of_show_nivo_slider') == 'true') : ?>
	<?php include(TEMPLATEPATH . '/inc/digi-slider.php'); ?>
<?php endif; ?>
<?php endif; ?>

<div class="masthead-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>
	<?php  if (get_option('of_blog_masthead') == 'true' ) : ?>
        <div id="masthead">
        <?php  if ($bmastlg = stripslashes(get_option('of_blog_masthead_large'))) : ?><h1 class="docufon"><span><?php echo $bmastlg ?></span></h1><?php endif; ?>  
        <?php  if ($bmastsm = stripslashes(get_option('of_blog_masthead_small'))) : ?><p class="tshadow docufon"><?php echo $bmastsm ?></p><?php endif; ?> 
        </div>    
    <?php endif; ?>

</div> <!--end .masthead-wide-->

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="content-wide">
<div class="shadow"></div>
<?php endif; ?>

<!---------- Begin Regular content ---------->
<div id="content">

<div class="post-wrap">

<div class="col-left <?php if ($sbar = get_option('of_sidebar_location')) : ?>col-<?php echo $sbar ?><?php endif; ?>">

<?php if (function_exists('digi_breadcrumbs')) digi_breadcrumbs(); ?>

			<?php
			/* Run the loop to output the posts.
			 * If you want to overload this in a child theme then include a file
			 * called loop-index.php and that will be used instead.
			 */
			 get_template_part( 'loop' );
			?>

</div><!--END COL-LEFT -->                 

<?php get_sidebar(); ?>

</div>

<?php get_footer(); ?>
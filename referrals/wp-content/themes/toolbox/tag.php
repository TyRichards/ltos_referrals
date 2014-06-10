<?php
/**
 * The template for displaying Tag Archive pages.
 */

get_header(); ?>

<div class="masthead-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>
<div id="masthead" class="tshadow">
<h1><span><?php printf( __( 'Tag Archives: %s', 'percivale' ), '' . single_tag_title( '', false ) . '' ); ?></span></h1>
<div class="docufon">
<?php
	$tag_description = tag_description();
	if ( ! empty( $tag_description ) )
	echo '' . $tag_description . '';
?>
</div>
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
/* Run the loop for the tag archive to output the posts
 * If you want to overload this in a child theme then include a file
 * called loop-tag.php and that will be used instead.
 */
 get_template_part( 'loop' );
?>

</div><!--END COL-LEFT -->   

<?php get_sidebar(); ?>

</div>

<?php get_footer(); ?>
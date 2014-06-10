<?php
/**
 * The template for displaying all pages.
 *
 * This is the template that displays all pages by default.
 * Please note that this is the wordpress construct of pages
 * and that other 'pages' on your wordpress site will use a
 * different template.
 */

get_header(); ?>

<!-- <div class="masthead-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>

<?php if ( have_posts() ) while ( have_posts() ) : the_post(); ?>

<?php 
$data = get_post_meta( $post->ID, 'seostuffkey', true );
if( $data[ 'seodescription' ] ) : ?>
<div id="masthead" class="tshadow">
<h1><span><?php the_title(); ?></span></h1>
<p class="docufon"><?php echo $data[ 'seodescription' ] ?></p>
</div>
<?php endif; ?>

</div> -->
<!--end .masthead-wide-->

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="content-wide">
<div class="shadow"></div>
<?php endif; ?>

<!---------- Begin Regular content ---------->
<div id="content">

<div class="post-wrap">

<div class="col-left <?php if ($sbar = get_option('of_sidebar_location')) : ?>col-<?php echo $sbar ?><?php endif; ?>">

<!--<?php if (function_exists('digi_breadcrumbs')) digi_breadcrumbs(); ?>-->

<div id="post-<?php the_ID(); ?>" <?php post_class(); ?>>    
<?php 
if( ! $data[ 'seodescription' ] ) : ?>
<!--<h1><?php the_title(); ?></h1>-->
<?php endif; ?>

<?php the_content(); ?>
<?php wp_link_pages( array( 'before' => '<div class="page-link">' . __( '<span class="pages">Pages:</span>', 'percivale' ), 'after' => '</div>' ) ); ?>
<?php edit_post_link( __( 'Edit', 'percivale' ), '<span class="edit">', '</span>' ); ?>

<?php /*comments_template( '', true );*/ ?>

<?php endwhile; ?>
</div><!--END POST--> 

</div><!--END COL-LEFT -->                 

<?php get_sidebar('page'); ?>

</div>

<?php get_footer(); ?>
<?php
/**
 * Template Name: Portfolio 2 Column/No Description
 *
 * A custom page template for a portfolio or showcase.
 *
**/

get_header(); ?>

<div class="masthead-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>
<div id="masthead" class="tshadow">
<h1><?php 
$data = get_post_meta( $post->ID, 'seostuffkey', true );
if( $data[ 'seotitle' ] ) : ?>
	<span><?php echo $data[ 'seotitle' ] ?></span>
    <?php else : ?>
    <span><?php the_title(); ?></span>
<?php endif; ?></h1>
<?php 
$data = get_post_meta( $post->ID, 'seostuffkey', true );
if( $data[ 'seodescription' ] ) : ?>
<p class="docufon"><?php echo $data[ 'seodescription' ] ?></p>
<?php endif; ?>
</div>

</div> <!--end .masthead-wide-->

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="content-wide">
<div class="shadow"></div>
<?php endif; ?>

<!---------- Begin Regular content ---------->
<div id="content">

<?php if (function_exists('digi_breadcrumbs')) digi_breadcrumbs(); ?>

<?php  if ( get_option( 'of_show_work_nav') == 'true' ) : ?>
<div class="work-nav-wrap">
<div class="show tshadow"><?php _e('Show', 'percivale'); ?></div>
<?php
	wp_nav_menu( array( 'container_class' => 'menu-work', 'menu_class' => 'menu-work-nav', 'theme_location' => 'workgallery', 'fallback_cb' => 'digi_no_nav_work' ) ); ?>
</div>    
<?php endif; ?>

<!-- check if category has been entered and display this if not -->
<?php if (! get_post_meta($post->ID, 'pcat', true)) : ?>
<div class="masthead">
   <h1 class="the-title"><?php _e('Please use the custom field of "pcat" and type in the category slug for the items you would like this page to display. See an example in the image below.', 'percivale'); ?></h1>
   <p style="text-align: center"><img src="<?php bloginfo('template_directory'); ?>/images/help/pcat-help.png" /></p>
   <p><em><?php _e('This only works for one category.', 'percivale'); ?></em></p>
</div>     
<?php endif; ?>

<div id="gallery-2-boxes-wrap">
<ul id="gallery-2-boxes">
<!-- Run loop to get all posts from desired category input through custom field -->
<?php

if(get_post_meta($post->ID, 'pcat', true)) :

$pcount = get_option('of_pcount_2column');

$paged = (get_query_var('paged')) ? get_query_var('paged') : 1;

    $args=array(
	'showposts' => $pcount,
    'paged' => $paged,	
    'category_name' => get_post_meta($post->ID, 'pcat', true)
);
	$temp = $wp_query;
	$wp_query = null;
    $wp_query = new WP_Query($args);
	$count = 1;
    if ( $wp_query->have_posts() ) { while ( $wp_query->have_posts() ) : $wp_query->the_post();
?>	
<?php
	$thumb = get_post_thumbnail_id(); 
	$postimage = vt_resize($thumb, '', 456, 240, true );
?>
<li class="box column-<?php echo $count; ?> <?php if($count  % 2 == 0) echo 'last' ?>">
<?php $key="VideoZoom"; if(get_post_meta($post->ID, $key, true)): ?> 
	<a class="gallery-zoom-video preload" rel="prettyPhoto[pp_gal]" href="<?php echo get_post_meta($post->ID, $key, true); ?>"><img src="<?php echo $postimage[url]; ?>" width="<?php echo $postimage[width]; ?>" height="<?php echo $postimage[height]; ?>" /><span></span></a>

<?php else : ?>

	<a class="gallery-zoom preload" rel="prettyPhoto[pp_gal]" href="<?php $thumbnail_id=get_the_post_thumbnail($post->ID); preg_match ('/src="(.*)" class/',$thumbnail_id,$link); echo $link[1]; ?>"><img src="<?php echo $postimage[url]; ?>" width="<?php echo $postimage[width]; ?>" height="<?php echo $postimage[height]; ?>" title="<?php the_title(); ?>" /><span></span></a> 
    <?php endif; ?>   
</li>
<?php if($count  % 2 == 0) echo '<div class="wide-clear"></div>' ?>
<?php $count++;  ?>
<?php 
endwhile;  } endif;
?>
</ul>
</div>
<div class="pwrap"><?php if (function_exists("pagination")) { pagination($additional_loop->max_num_pages); } ?></div>
<?php 
$wp_query = null;
$wp_query = $temp;
wp_reset_query(); 
?>
<?php get_footer(); ?>
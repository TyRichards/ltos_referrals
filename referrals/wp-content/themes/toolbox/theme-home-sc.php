<?php
/**
 * Template Name: Home Page With Shortcodes
 */
get_header(); ?>

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="content-wide">
<?php endif; ?>

<?php 
// Loop for page content
if ( have_posts() ) while ( have_posts() ) : the_post(); ?>
<?php the_content(); ?>
<?php endwhile; ?>

<?php get_footer(); ?>
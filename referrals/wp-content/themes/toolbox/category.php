<?php
/**
 * The template for displaying Category Archive pages.
 */

get_header(); ?>

<div class="masthead-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>

    <div id="masthead" class="tshadow">
    <h1><span><?php printf( __( '%s' ), '' . single_cat_title( '', false ) . '' ); ?></span></h1>
    <div class="docufon">
    <?php
        $category_description = category_description();
        if ( ! empty( $category_description ) )
        echo '' . $category_description . '';
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

<?php get_template_part( 'loop' ); ?>
                
</div><!--END COL-LEFT -->                 

<?php get_sidebar(); ?>

</div>

<?php get_footer(); ?>
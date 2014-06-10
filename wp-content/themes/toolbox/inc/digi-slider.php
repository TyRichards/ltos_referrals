<div class="feature-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>

<div id="tall-nivo-featured-wrap" <?php if( get_option('of_wide_layout') == 'true') : ?>class="wide"<?php endif; ?>>

<div id="slider-wrapper-tall">
        
<div id="slider" class="nivoSlider">

<?php if(get_option('of_nivo_tall_slider_cats') == 'true') : ?>
<?php 
$nivoslidecat = get_option('of_nivo_tall_home_cat_choice' );
query_posts('category_name='.$nivoslidecat.'&showposts=5'); ?>
<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
<?php
$thumb = get_post_thumbnail_id(); 
$bigimage = vt_resize($thumb, '', 980, 308, true );
?>

<img src="<?php echo $bigimage[url]; ?>" width="<?php echo $bigimage[width]; ?>" height="<?php echo $bigimage[height]; ?>" title="<?php the_title(); ?>" />
        
<?php endwhile; endif; ?>
<?php wp_reset_query(); ?>
<?php endif; ?>

<?php  if (get_option('of_nivo_tall_slider_mychoice') == 'true') : ?>

<?php // First slide
if ($img1image = get_option('of_nivo_tall_slider_image_1')) : ?>
<?php if ($img1url = get_option('of_nivo_tall_slider_image_1_url')) : ?><a href="<?php echo $img1url ?>"><?php endif; ?> <img src="<?php echo $img1image ?>" <?php if (get_option('of_nivo_tall_slider_image_1_title')) : ?>title="#caption-1"<?php endif; ?> width="980" height="308"/><?php if ($img1url = get_option('of_nivo_tall_slider_image_1_url')) : ?></a><?php endif; ?> 
<?php endif; ?> 

<?php // Second slide
if ($img2image = get_option('of_nivo_tall_slider_image_2')) : ?>
<?php if ($img2url = get_option('of_nivo_tall_slider_image_2_url')) : ?><a href="<?php echo $img2url ?>"><?php endif; ?> <img src="<?php echo $img2image ?>" <?php if (get_option('of_nivo_tall_slider_image_2_title')) : ?>title="#caption-2"<?php endif; ?> width="980" height="308"/><?php if ($img2url = get_option('of_nivo_tall_slider_image_2_url')) : ?></a><?php endif; ?>
<?php endif; ?> 

<?php // Third slide
if ($img3image = get_option('of_nivo_tall_slider_image_3')) : ?>
<?php if ($img3url = get_option('of_nivo_tall_slider_image_3_url')) : ?><a href="<?php echo $img3url ?>"><?php endif; ?> <img src="<?php echo $img3image ?>" <?php if (get_option('of_nivo_tall_slider_image_3_title')) : ?>title="#caption-3"<?php endif; ?> width="980" height="308"/><?php if ($img3url = get_option('of_nivo_tall_slider_image_3_url')) : ?></a><?php endif; ?>
<?php endif; ?> 

<?php // Fourth slide
if ($img4image =get_option('of_nivo_tall_slider_image_4')) : ?>
<?php if ($img4url = get_option('of_nivo_tall_slider_image_4_url')) : ?><a href="<?php echo $img4url ?>"><?php endif; ?> <img src="<?php echo $img4image ?>" <?php if (get_option('of_nivo_tall_slider_image_4_title')) : ?>title="#caption-4"<?php endif; ?> width="980" height="408"/><?php if ($img4url = get_option('of_nivo_tall_slider_image_4_url')) : ?></a><?php endif; ?>
<?php endif; ?>

<?php // Fourth slide
if ($img5image =get_option('of_nivo_tall_slider_image_5')) : ?>
<?php if ($img5url = get_option('of_nivo_tall_slider_image_5_url')) : ?><a href="<?php echo $img5url ?>"><?php endif; ?> <img src="<?php echo $img5image ?>" <?php if (get_option('of_nivo_tall_slider_image_5_title')) : ?>title="#caption-5"<?php endif; ?> width="980" height="508"/><?php if ($img5url = get_option('of_nivo_tall_slider_image_5_url')) : ?></a><?php endif; ?>
<?php endif; ?>  

<?php endif; ?>

</div>

<?php if ($img1title = stripslashes(get_option('of_nivo_tall_slider_image_1_title'))) : ?>
<div id="caption-1" class="nivo-caption">
	<p><?php echo $img1title ?></p>
</div>
<?php endif; ?>

<?php if ($img2title = stripslashes(get_option('of_nivo_tall_slider_image_2_title'))) : ?>
<div id="caption-2" class="nivo-caption">
	<p><?php echo $img2title ?></p>
</div>
<?php endif; ?>

<?php if ($img3title = stripslashes(get_option('of_nivo_tall_slider_image_3_title'))) : ?>
<div id="caption-3" class="nivo-caption">
	<p><?php echo $img3title ?></p>
</div>
<?php endif; ?>

<?php if ($img4title = stripslashes(get_option('of_nivo_tall_slider_image_4_title'))) : ?>
<div id="caption-4" class="nivo-caption">
	<p><?php echo $img4title ?></p>
</div>
<?php endif; ?>

<?php if ($img5title = stripslashes(get_option('of_nivo_tall_slider_image_5_title'))) : ?>
<div id="caption-5" class="nivo-caption">
	<p><?php echo $img5title ?></p>
</div>
<?php endif; ?>
        
</div>

</div>

<?php if( get_option('of_show_wood') == 'true') : ?>
<div class="feature-wood"></div>
<?php endif; ?>

</div> <!--end .feature-wide-->
<script type="text/javascript">
jQuery(document).ready(function($){
        var slider = $('#digislider2').bxSlider({
			auto: true,
            pager: true,
			pause: <?php if ($nivotime = get_option('of_nivo_slider_time')) : ?><?php echo $nivotime ?><?php else : ?>5000<?php endif; ?>,
            autoHover: true
		});
    });
</script>

<div class="feature-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>

<div id="digislider2-feature-wrap">

<ul id="digislider2">

<?php if(get_option('of_nivo_tall_slider_cats') == 'true') : ?>
<?php 
$nivoslidecat = get_option('of_nivo_tall_home_cat_choice' );
query_posts('category_name='.$nivoslidecat.'&showposts=5'); ?>
<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
<?php
$thumb = get_post_thumbnail_id(); 
$bigimage = vt_resize($thumb, '', 980, 363, true );
?>

<li><a href="<?php the_permalink(); ?>"><img src="<?php echo $bigimage[url]; ?>" width="<?php echo $bigimage[width]; ?>" height="<?php echo $bigimage[height]; ?>" /></a></li>
        
<?php endwhile; endif; ?>
<?php wp_reset_query(); ?>
<?php endif; ?>

<?php  if (get_option('of_nivo_tall_slider_mychoice') == 'true') : ?>

<?php // First slide
if ($img1image = get_option('of_nivo_tall_slider_image_1')) : ?>
<li><?php if ($img1url = get_option('of_nivo_tall_slider_image_1_url')) : ?><a href="<?php echo $img1url ?>"><?php endif; ?><img src="<?php echo $img1image ?>" width="980" height="363"/><?php if ($img1url = get_option('of_nivo_tall_slider_image_1_url')) : ?></a><?php endif; ?>
<?php endif; ?> 

<?php // second slide
if ($img2image = get_option('of_nivo_tall_slider_image_2')) : ?>
<li><?php if ($img2url = get_option('of_nivo_tall_slider_image_2_url')) : ?><a href="<?php echo $img2url ?>"><?php endif; ?><img src="<?php echo $img2image ?>" width="980" height="363"/><?php if ($img2url = get_option('of_nivo_tall_slider_image_2_url')) : ?></a><?php endif; ?>
<?php endif; ?> 

<?php // third slide
if ($img3image = get_option('of_nivo_tall_slider_image_3')) : ?>
<li><?php if ($img3url = get_option('of_nivo_tall_slider_image_3_url')) : ?><a href="<?php echo $img3url ?>"><?php endif; ?><img src="<?php echo $img3image ?>" width="980" height="363"/><?php if ($img3url = get_option('of_nivo_tall_slider_image_3_url')) : ?></a><?php endif; ?>
<?php endif; ?> 

<?php // fourth slide
if ($img4image = get_option('of_nivo_tall_slider_image_4')) : ?>
<li><?php if ($img4url = get_option('of_nivo_tall_slider_image_4_url')) : ?><a href="<?php echo $img4url ?>"><?php endif; ?><img src="<?php echo $img4image ?>" width="980" height="363"/><?php if ($img4url = get_option('of_nivo_tall_slider_image_4_url')) : ?></a><?php endif; ?>
<?php endif; ?> 

<?php // fifth slide
if ($img5image = get_option('of_nivo_tall_slider_image_5')) : ?>
<li><?php if ($img5url = get_option('of_nivo_tall_slider_image_5_url')) : ?><a href="<?php echo $img5url ?>"><?php endif; ?><img src="<?php echo $img5image ?>" width="980" height="363"/><?php if ($img5url = get_option('of_nivo_tall_slider_image_5_url')) : ?></a><?php endif; ?>
<?php endif; ?> 

<?php endif; ?> 
 
</ul>
</li>

</div>

<?php if( get_option('of_show_wood') == 'true') : ?>
<div class="feature-wood"></div>
<?php endif; ?>

</div>
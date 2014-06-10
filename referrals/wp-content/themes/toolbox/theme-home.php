<?php
/**
 * Template Name: Home Page 
 */
get_header(); ?>

<?php if( get_option('of_show_digi_slider') == 'true') : ?>
	<?php include(TEMPLATEPATH . '/inc/digi-slider-2.php'); ?>
<?php endif; ?>

<?php if( get_option('of_show_nivo_slider') == 'true') : ?>
	<?php include(TEMPLATEPATH . '/inc/digi-slider.php'); ?>
<?php endif; ?>

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="content-wide">
<div class="shadow"></div>
<?php endif; ?>

<?php 
// Loop for page content
if ( have_posts() ) while ( have_posts() ) : the_post(); ?>
<?php the_content(); ?>
<?php endwhile; ?>

<!--Begin Regular content-->
<div id="content">

<?php if( get_option('of_home_action') == 'true') : ?>
<div id="actionS" class="actalt">
	<?php if ($introtxt = stripslashes(get_option('of_home_intro_text'))) : ?>
    <?php if (! $btntxt = get_option('of_home_button_text')) : ?><h3 class="text-full"><?php else : ?><h3><?php endif; ?><?php echo $introtxt ?><?php if ($introsubtxt = stripslashes(get_option('of_home_intro_subtext'))) : ?><span><?php echo $introsubtxt ?></span><?php endif; ?></h3><?php endif; ?>
    <?php if ($btntxt = get_option('of_home_button_text')) : ?>
    <a href="<?php echo get_option('of_home_button_url'); ?>" class="action-button"><?php echo $btntxt ?></a>
	<?php endif; ?>
</div>
<?php endif; ?>

<div class="home-left">

<?php if( get_option('of_home_service_boxes') == 'true') : ?>
<div class="service-boxes recent-work">
	
    <div class="box box-title">
        <div class="text-area">
        <?php if ($dbxtitle = stripslashes(get_option('of_home_service_dbox_title'))) : ?><h3><?php echo $dbxtitle ?></h3><?php endif; ?>
        <?php if ($dbxdtxt = get_option('of_home_service_dbox_text')) : ?><?php echo $dbxdtxt ?><?php endif; ?>
        <?php if ($dbxdurl = get_option('of_home_service_dbox_url')) : ?><a class="home-box-more blink" href="<?php echo $dbxurl ?>"><span><?php if ($dbxmoretxt = get_option('of_home_service_box_one_more_text')) : ?><?php echo $dbxmoretxt ?><?php endif; ?></span></a><?php endif; ?>
        </div>
    </div>
    
    <?php if ($bx1title = get_option('of_home_service_box_1_title')) : ?>
    <div class="box">
        <div class="text-area">
        <?php if ($bx1icon = get_option('of_home_service_box_1_icon')) : ?><img class="icon" src="<?php bloginfo('template_url'); ?>/images/icons/<?php echo $bx1icon ?>.png" width="32" height="32" /><?php endif; ?>
        <h3><?php echo $bx1title ?></h3>
        <?php if ($bx1txt = get_option('of_home_service_box_1_text')) : ?><p><?php echo $bx1txt ?></p><?php endif; ?>
        <?php if ($bx1url = get_option('of_home_service_box_1_url')) : ?><a class="more-link" href="<?php echo $bx1url ?>"><?php if ($bxmoretxt = get_option('of_home_service_box_more_text')) : ?><span><?php echo $bxmoretxt ?></span><?php endif; ?></a><?php endif; ?>
        </div>
    </div>
    <?php endif; ?>
    
    <?php if ($bx2title = stripslashes(get_option('of_home_service_box_2_title'))) : ?>
    <div class="box">
        <div class="text-area">
        <?php if ($bx2icon = get_option('of_home_service_box_2_icon')) : ?><img class="icon" src="<?php bloginfo('template_url'); ?>/images/icons/<?php echo $bx2icon ?>.png" width="32" height="32" /><?php endif; ?>
        <h3><?php echo $bx2title ?></h3>
        <?php if ($bx2txt = get_option('of_home_service_box_2_text')) : ?><p><?php echo $bx2txt ?></p><?php endif; ?>
        <?php if ($bx2url = get_option('of_home_service_box_2_url')) : ?><a class="more-link" href="<?php echo $bx2url ?>"><?php if ($bxmoretxt = get_option('of_home_service_box_more_text')) : ?><span><?php echo $bxmoretxt ?></span><?php endif; ?></a><?php endif; ?>
        </div>
    </div>
    <?php endif; ?>
    
    <?php if ($bx3title = stripslashes(get_option('of_home_service_box_3_title'))) : ?>
    <div class="box last">
        <div class="text-area">
        <?php if ($bx3icon = get_option('of_home_service_box_3_icon')) : ?><img class="icon" src="<?php bloginfo('template_url'); ?>/images/icons/<?php echo $bx3icon ?>.png" width="32" height="32" /><?php endif; ?>
        <h3><?php echo $bx3title ?></h3>
        <?php if ($bx3txt = get_option('of_home_service_box_3_text')) : ?><p><?php echo $bx3txt ?></p><?php endif; ?>
        <?php if ($bx3url = get_option('of_home_service_box_3_url')) : ?><a class="more-link" href="<?php echo $bx3url ?>"><?php if ($bxmoretxt = get_option('of_home_service_box_more_text')) : ?><span><?php echo $bxmoretxt ?></span><?php endif; ?></a><?php endif; ?>
        </div>
    </div>     
    <?php endif; ?>
    
    <?php if ($bx4title = get_option('of_home_service_box_4_title')) : ?>
    <div class="box">
        <div class="text-area">
        <?php if ($bx4icon = get_option('of_home_service_box_4_icon')) : ?><img class="icon" src="<?php bloginfo('template_url'); ?>/images/icons/<?php echo $bx4icon ?>.png" width="32" height="32" /><?php endif; ?>
        <h3><?php echo $bx4title ?></h3>
        <?php if ($bx4txt = get_option('of_home_service_box_4_text')) : ?><p><?php echo $bx4txt ?></p><?php endif; ?>
        <?php if ($bx4url = get_option('of_home_service_box_4_url')) : ?><a class="more-link" href="<?php echo $bx4url ?>"><?php if ($bxmoretxt = get_option('of_home_service_box_more_text')) : ?><span><?php echo $bxmoretxt ?></span><?php endif; ?></a><?php endif; ?>
        </div>
    </div>
    <?php endif; ?>
    
    <?php if ($bx5title = get_option('of_home_service_box_5_title')) : ?>
    <div class="box">
        <div class="text-area">
        <?php if ($bx5icon = get_option('of_home_service_box_5_icon')) : ?><img class="icon" src="<?php bloginfo('template_url'); ?>/images/icons/<?php echo $bx5icon ?>.png" width="32" height="32" /><?php endif; ?>
        <h3><?php echo $bx5title ?></h3>
        <?php if ($bx5txt = get_option('of_home_service_box_5_text')) : ?><p><?php echo $bx5txt ?></p><?php endif; ?>
        <?php if ($bx5url = get_option('of_home_service_box_5_url')) : ?><a class="more-link" href="<?php echo $bx5url ?>"><?php if ($bxmoretxt = get_option('of_home_service_box_more_text')) : ?><span><?php echo $bxmoretxt ?></span><?php endif; ?></a><?php endif; ?>
        </div>
    </div>
    <?php endif; ?>
    
    <?php if ($bx6title = stripslashes(get_option('of_home_service_box_6_title'))) : ?>
    <div class="box last">
        <div class="text-area">
        <?php if ($bx6icon = get_option('of_home_service_box_6_icon')) : ?><img class="icon" src="<?php bloginfo('template_url'); ?>/images/icons/<?php echo $bx6icon ?>.png" width="32" height="32" /><?php endif; ?>
        <h3><?php echo $bx6title ?></h3>
        <?php if ($bx6txt = get_option('of_home_service_box_6_text')) : ?><p><?php echo $bx6txt ?></p><?php endif; ?>
        <?php if ($bx6url = get_option('of_home_service_box_6_url')) : ?><a class="more-link" href="<?php echo $bx6url ?>"><?php if ($bxmoretxt = get_option('of_home_service_box_more_text')) : ?><span><?php echo $bxmoretxt ?></span><?php endif; ?></a><?php endif; ?>
        </div>
    </div>     
    <?php endif; ?>
    
</div><!--end of service boxes-->
<?php endif; ?>

<?php if( get_option('of_home_service_boxes_blog') == 'true') : ?>
<div class="service-boxes">

<div class="box box-title">
    <div class="text-area">
        <?php if ($bxbtitle = stripslashes(get_option('of_home_blog_dbox_title'))) : ?><h3><?php echo $bxbtitle ?></h3><?php endif; ?>
        <?php if ($bxbtxt = get_option('of_home_blog_dbox_text')) : ?><?php echo $bxbtxt ?><?php endif; ?>
        <?php if ($bxburl = get_option('of_home_blog_dbox_url')) : ?><a class="home-box-more blink" href="<?php echo $bxburl ?>"><span><?php if ($bxbmoretxt = get_option('of_home_blog_box_one_more_text')) : ?><?php echo $bxbmoretxt ?><?php endif; ?></span></a><?php endif; ?>
    </div>
</div>

<?php
	$homeblogcat = get_option('of_homblog_home_cat_choice');
    $args=array(
    'showposts' => 3,
	'category_name'  => $homeblogcat
);
    $my_query = new WP_Query($args);
?>

<?php $count = 0; ?>

<?php if($my_query->have_posts() ) { while ($my_query->have_posts()) : $my_query->the_post(); ?>      

<?php
if ($count == 2) {
    echo "<div class=\"box last\">";
} else {
    echo "<div class=\"box\">";
}
?> 

    <?php if (has_post_thumbnail()) : // If the post has a Featured Image ?>
	<?php
    $thumb = get_post_thumbnail_id(); 
    $postimage = vt_resize($thumb, '', 186, 130, true );
    ?>    
    <div class="comdisp-home">
    <?php $key="VideoZoom"; if(get_post_meta($post->ID, $key, true)): ?>
	<a class="preload" rel="prettyPhoto[pp_gal]" href="<?php echo get_post_meta($post->ID, $key, true); ?>"><img src="<?php echo $postimage[url]; ?>" width="<?php echo $postimage[width]; ?>" height="<?php echo $postimage[height]; ?>" alt="<?php the_title(); ?>" /><span class="video"></span></a>
    <?php else : ?>

	<a class="preload" rel="prettyPhoto[pp_gal]" href="<?php $thumbnail_id=get_the_post_thumbnail($post->ID); preg_match ('/src="(.*)" class/',$thumbnail_id,$link); echo $link[1]; ?>"><img src="<?php echo $postimage[url]; ?>" width="<?php echo $postimage[width]; ?>" height="<?php echo $postimage[height]; ?>" alt="<?php the_title(); ?>" /><span></span></a> 
    <?php endif; ?> 
    </div>
    <?php endif; ?> 
       
    <div class="text-area">
    <h3><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
    <?php the_excerpt('homeblog_excerpt_length'); ?>
    </div>
</div>
<?php $count++;  ?>
<?php endwhile; } //while ($my_query) ?>
<?php wp_reset_query() ?>
    
</div>
<?php endif; ?>

</div><!--end home left-->

<div id="home-asides-wrap">
<div class="sidebar-top"></div>
<div id="sidebar" class="home-asides">
<ul class="xoxo">
 
 <?php
	/* When we call the dynamic_sidebar() function, it'll spit out
	 * the widgets for that widget area. If it instead returns false,
	 * then the sidebar simply doesn't exist, so we'll hard-code in
	 * some default sidebar stuff just in case.
	 */
	if ( ! dynamic_sidebar( 'home-widget-area' ) ) : ?>
	
			<li class="widget-container">
				<h3 class="widget-title">Home Widget Area</h3>
				<div class="textwidget">
					<p>Control the widgets from your WP admin.</p>
				</div>
			</li>

		<?php endif; // end primary widget area ?>
</ul>
        
</div> <!--end home asides-->        
<div class="sidebar-bottom"></div> 
</div>

<?php get_footer(); ?>
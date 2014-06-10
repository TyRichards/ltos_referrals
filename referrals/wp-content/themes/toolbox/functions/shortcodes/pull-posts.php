<?php
function myLoop($atts, $content = null) {
	extract(shortcode_atts(array(
		"query" => '',
		"category" => '',
	), $atts));
	global $wp_query,$paged,$post;
	$temp = $wp_query;
	$wp_query= null;
	$wp_query = new WP_Query();
	if(!empty($category)){
		$query .= '&showposts=3&cat='.$category;
	}
	if(!empty($query)){
		$query .= $query;
	}
	$wp_query->query($query);
	ob_start();
	?>
    
    <?php $count = 0; ?>
    
    <?php while ($wp_query->have_posts()) : $wp_query->the_post(); ?>

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
    $postimage = vt_resize($thumb, '', 207, 160, true );
    ?>    
    <div class="comdisp-home">
	<a class="preload" href="<?php the_permalink(); ?>"><img src="<?php echo $postimage[url]; ?>" width="<?php echo $postimage[width]; ?>" height="<?php echo $postimage[height]; ?>" alt="<?php the_title(); ?>" /><span></span></a>
    </div>
    <?php endif; ?> 
       
    <div class="text-area">
    <h3><?php the_title(); ?></h3>
    <?php the_excerpt('homeblog_excerpt_length'); ?>
    <a class="more-link" href="<?php the_permalink(); ?>">View Project</a>
    </div>
</div>
<?php $count++;  ?>
<?php endwhile; //while ($my_query) ?>

	<?php $wp_query = null; $wp_query = $temp;
	$content = ob_get_contents();
	ob_end_clean();
	return $content;
}
add_shortcode("loop", "myLoop");
?>
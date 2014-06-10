<div id="related-posts">
<h3><?php _e( 'Related Articles', 'percivale' ); ?></h3>
<?php  //for use in the loop, list 5 post titles related to first tag on current post
$backup = $post;  // backup the current object
$tags = wp_get_post_tags($post->ID);
$tagIDs = array();
if ($tags) {
$tagcount = count($tags);
for ($i = 0; $i < $tagcount; $i++) {
$tagIDs[$i] = $tags[$i]->term_id;
}
$args=array(
'tag__in' => $tagIDs,
'post__not_in' => array($post->ID),
'showposts'=>4,
'caller_get_posts'=>1
);
$my_query = new WP_Query($args);

$count = 1;

if ( $my_query->have_posts() ) {
while ($my_query->have_posts()) : $my_query->the_post();
$thumb = get_post_thumbnail_id(); 
$postimage = vt_resize($thumb, '', 125, 90, true );
?> 
<div class="related-entry <?php if($count  % 4 == 0) echo 'last' ?>">

<?php if (has_post_thumbnail()) : // If the post has a Featured Image then use .post-left ?>
<div class="iwrap">
<a class="read-tiny" href="<?php the_permalink(); ?>"><img src="<?php echo $postimage[url]; ?>" width="<?php echo $postimage[width]; ?>" height="<?php echo $postimage[height]; ?>" alt="<?php the_title(); ?>" class="wp-post-image-pop"/><span></span></a>
</div>
<?php else : ?>
<div class="iwrap">
<a class="read-tiny" href="<?php the_permalink(); ?>"><img src="<?php bloginfo('template_url'); ?>/images/noimg.png" width="<?php echo $postimage[width]; ?>" height="<?php echo $postimage[height]; ?>" alt="<?php the_title(); ?>" class="wp-post-image-pop"/></a>
</div>
<?php endif; ?>

<h2><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title(); ?>"><?php the_title(); ?></a></h2>
</div>

<?php $count++; ?>

<?php endwhile; } else { ?>
<h2><?php _e( 'No related posts found!', 'percivale' ); ?></h2>
<?php }
}
$post = $backup;  // copy it back
wp_reset_query(); // to use the original query again
?>
</div>
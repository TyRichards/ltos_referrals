<?php
/**
 * The loop that displays posts.
 *
 * The loop displays the posts and the post content.  See
 * http://codex.wordpress.org/The_Loop to understand it and
 * http://codex.wordpress.org/Template_Tags to understand
 * the tags used in it.
 *
 */
?>

<?php if (is_home('')) : // Excludes entered categories if on home page only
	$paged = (get_query_var('paged')) ? get_query_var('paged') : 1;
	$excat = get_option('of_blog_excats');
	query_posts($query_string . '&paged='.$paged.'&cat='.$excat.''); 
endif; ?>

<?php /* If there are no posts to display, such as an empty archive page */ ?>
<?php if ( ! have_posts() ) : ?>
		<h1><?php _e( 'Not Found', 'percivale' ); ?></h1>
		<p><?php _e( 'Apologies, but no results were found for the requested archive. Perhaps searching will help find a related post.', 'percivale' ); ?></p>
		<?php get_search_form(); ?>

<?php endif; ?>

<?php while ( have_posts() ) : the_post(); ?>

<div id="post-<?php the_ID(); ?>" class="arcpost">
    
    <div class="ptitle-wrap">
    <h2><a href="<?php the_permalink(); ?>" title="<?php printf( esc_attr__( 'Permalink to %s', 'percivale' ), the_title_attribute( 'echo=0' ) ); ?>" rel="bookmark"><?php the_title(); ?></a></h2>
    <p class="entry-meta"><?php _e('on', 'percivale'); ?> <span><?php echo get_the_date(); ?></span> <?php _e('By', 'percivale'); ?> <?php the_author_posts_link(); ?> <?php _e('In', 'percivale'); ?> <?php the_category(', '); ?> <span class="arccom"><?php comments_popup_link( __( 'Leave a comment', 'percivale' ), __( '1 Comment', 'percivale' ), __( '% Comments', 'percivale' ) ); ?></span>
    </div>
    
    <?php if (has_post_thumbnail()) : ?>
	<?php
    $thumb = get_post_thumbnail_id(); 
    $postimage = vt_resize($thumb, '', 586, 236, true );
    ?>    
    <div class="comdisp">
	<a class="preload" href="<?php the_permalink(); ?>"><img src="<?php echo $postimage[url]; ?>" width="<?php echo $postimage[width]; ?>" height="<?php echo $postimage[height]; ?>" alt="<?php the_title(); ?>" class="wp-post-image"/><span></span></a>
    </div>
    <?php endif; ?>

	<?php the_content( __( '<span>Continue reading</span>', 'percivale' ) ); ?>
    
</div>

<?php endwhile; // End the loop. Whew. ?>

<?php if (function_exists("pagination")) { pagination($additional_loop->max_num_pages); } ?>
<?php 
/**
 * The Template for displaying all single posts.
 */
 
get_header(); 
?>

<?php if ( have_posts() ) while ( have_posts() ) : the_post(); ?>

<div class="masthead-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>

	<?php  if (get_option('of_blog_masthead') == 'true' ) : ?>
        <div id="masthead" class="<?php if( get_option('of_wide_layout') == 'false') : ?>boxed<?php endif; ?>">
        <?php  if ($bmastlg = stripslashes(get_option('of_blog_masthead_large'))) : ?><h1 class="docufon"><span><?php echo $bmastlg ?></span></h1><?php endif; ?>  
        <?php  if ($bmastsm = stripslashes(get_option('of_blog_masthead_small'))) : ?><p class="tshadow docufon"><?php echo $bmastsm ?></p><?php endif; ?> 
        </div>    
    <?php endif; ?>
    
</div> <!--end .masthead-wide-->

<?php if( get_option('of_wide_layout') == 'true') : ?>    
<div class="content-wide">
<div class="shadow"></div>
<?php endif; ?>

<!--Begin Regular content-->
<div id="content">

<div class="post-wrap">

<div class="col-left <?php if ($sbar = get_option('of_sidebar_location')) : ?>col-<?php echo $sbar ?><?php endif; ?>">

<?php if (function_exists('digi_breadcrumbs')) digi_breadcrumbs(); ?>

<div id="post-<?php the_ID(); ?>" <?php post_class(); ?>>

    <div class="ptitle-wrap">
    <h2><a href="<?php the_permalink(); ?>" title="<?php printf( esc_attr__( 'Permalink to %s', 'percivale' ), the_title_attribute( 'echo=0' ) ); ?>" rel="bookmark"><?php the_title(); ?></a></h2>
    <div id="pvnxt">				
<div class="previous"><?php previous_post_link( '%link', '' . _x( '', 'Previous post link' ) . 'Previous post' ); ?></div>
<div class="next"><?php next_post_link( '%link', 'Next post' . _x( '', 'Next post link' ) . '' ); ?></div>
</div> 
    <p class="entry-meta"><?php _e('on', 'percivale'); ?> <span><?php echo get_the_date(); ?></span> <?php _e('By', 'percivale'); ?> <?php the_author_posts_link(); ?> <?php _e('In', 'percivale'); ?> <?php the_category(', '); ?> <span class="arccom"><?php comments_popup_link( __( 'Leave a comment', 'percivale' ), __( '1 Comment', 'percivale' ), __( '% Comments', 'percivale' ) ); ?></span>
    </div>

<?php $key="Video"; if(get_post_meta($post->ID, $key, true)): ?>
<div class="post-video"><?php echo get_post_meta($post->ID, $key, true); ?></div>
<?php endif;?>  

    <?php if (has_post_thumbnail()) : ?>
	<?php
    $thumb = get_post_thumbnail_id(); 
    $postimage = vt_resize($thumb, '', 586, 236, true );
    ?> 
    <div class="comdisp">
	<a class="preload" rel="prettyPhoto" href="<?php $thumbnail_id=get_the_post_thumbnail($post->ID); preg_match ('/src="(.*)" class/',$thumbnail_id,$link); echo $link[1]; ?>"><img src="<?php echo $postimage[url]; ?>" width="<?php echo $postimage[width]; ?>" height="<?php echo $postimage[height]; ?>" alt="<?php the_title(); ?>" class="wp-post-image"/><span class="full-image"></span></a>
    </div>
    <?php endif; ?>
    
    <?php  if (get_option('of_show_share_posts') == 'true' ) : ?>       
    <?php include(TEMPLATEPATH . '/inc/sharebox.php'); ?>
    <?php endif; ?>

<?php the_content(); ?>

<?php wp_link_pages( array( 'before' => '<div class="page-link">' . __( '<span class="pages">Pages:</span>', 'percivale' ), 'after' => '</div>' ) ); ?>

<?php  if (get_option('of_show_post_tags') == 'true' ) : ?>                         
<p class="post-tags docufon"><?php the_tags(__('Tags: ',', ', 'percivale')); ?></p>
<?php endif; ?>

<?php  if (get_option('of_show_related_posts') == 'true' ) : ?>                
<?php include(TEMPLATEPATH . '/inc/related.php'); ?>
<?php endif; ?>
                
<?php  if (get_option('of_show_author_bio') == 'true' ) : ?> 
<div class="clear"></div>
<div id="author-info-single">
<?php echo get_avatar( get_the_author_meta( 'user_email' ), apply_filters( 'author_bio_avatar_size', 80 ) ); ?>
<h5><?php _e('About the Author:', 'percivale'); ?><a href="<?php echo get_author_posts_url( get_the_author_meta( 'ID' ) ); ?>"><?php printf( esc_attr__( '%s' ), get_the_author() ); ?></a></h5>
<p><?php the_author_meta( 'description' ); ?></p>
</div>
<div class="clear"></div>                            
<?php endif; ?>

<?php comments_template( '', true ); ?>

<?php endwhile; // end of the loop. ?>

	</div><!--END POST-->   

</div><!--END COL-LEFT -->   

<?php get_sidebar(); ?>

</div><!-- END POST-WRAP-->

<?php get_footer(); ?>
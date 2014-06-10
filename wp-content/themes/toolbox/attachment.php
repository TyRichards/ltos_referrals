<?php
/**
 * The template for displaying attachments.
 */

get_header(); ?>

<?php if ( have_posts() ) while ( have_posts() ) : the_post(); ?>

<div class="masthead-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>

	<?php  if (get_option('of_blog_masthead') == 'true' ) : ?>
        <div id="masthead" class="docufon">
        <?php  if ($bmastlg = stripslashes(get_option('of_blog_masthead_large'))) : ?><h1><span><?php echo $bmastlg ?></span></h1><?php endif; ?>  
        <?php  if ($bmastsm = stripslashes(get_option('of_blog_masthead_small'))) : ?><p class="tshadow"><?php echo $bmastsm ?></p><?php endif; ?> 
        </div>    
    <?php endif; ?>
</div> <!--end .masthead-wide-->

</div> <!--end .masthead-wide-->

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="content-wide">
<div class="shadow"></div>
<?php endif; ?>

<!--Begin Regular content-->

<!---------- Begin Regular content ---------->
<div id="content">


<div class="post-wrap">

<div class="col-left <?php if ($sbar = get_option('of_sidebar_location')) : ?>col-<?php echo $sbar ?><?php endif; ?>">

<?php if (function_exists('digi_breadcrumbs')) digi_breadcrumbs(); ?>

<div id="post-<?php the_ID(); ?>" <?php post_class(); ?>>

   <div class="ptitle-wrap">
    <h2><a href="<?php the_permalink(); ?>" title="<?php printf( esc_attr__( 'Permalink to %s', 'percivale' ), the_title_attribute( 'echo=0' ) ); ?>" rel="bookmark"><?php the_title(); ?></a></h2>
    <p class="entry-meta"><?php _e('on', 'percivale'); ?> <span><?php echo get_the_date(); ?></span><span class="arccom"><?php comments_popup_link( __( 'Leave a comment', 'percivale' ), __( '1 Comment', 'percivale' ), __( '% Comments', 'percivale' ) ); ?></span>
    </div>
    
				<p><a href="<?php echo get_permalink( $post->post_parent ); ?>" title="<?php esc_attr( printf( __( 'Return to %s', 'percivale' ), get_the_title( $post->post_parent ) ) ); ?>" rel="gallery"><?php
					/* translators: %s - title of parent post */
					printf( __( '<span>&larr;</span> %s' ), get_the_title( $post->post_parent ) );
				?></a></p>

<?php if ( wp_attachment_is_image() ) :
	$attachments = array_values( get_children( array( 'post_parent' => $post->post_parent, 'post_status' => 'inherit', 'post_type' => 'attachment', 'post_mime_type' => 'image', 'order' => 'ASC', 'orderby' => 'menu_order ID' ) ) );
	foreach ( $attachments as $k => $attachment ) {
		if ( $attachment->ID == $post->ID )
			break;
	}
	$k++;
	// If there is more than 1 image attachment in a gallery
	if ( count( $attachments ) > 1 ) {
		if ( isset( $attachments[ $k ] ) )
			// get the URL of the next image attachment
			$next_attachment_url = get_attachment_link( $attachments[ $k ]->ID );
		else
			// or get the URL of the first image attachment
			$next_attachment_url = get_attachment_link( $attachments[ 0 ]->ID );
	} else {
		// or, if there's only 1 image attachment, get the URL of the image
		$next_attachment_url = wp_get_attachment_url();
	}
?>
						<p><a href="<?php echo $next_attachment_url; ?>" title="<?php echo esc_attr( get_the_title() ); ?>" rel="attachment"><?php
							$attachment_size = apply_filters( 'attachment_size', 600 );
							echo wp_get_attachment_image( $post->ID, array( $attachment_size, 9999 ) ); // filterable image width with, essentially, no limit for image height.
						?></a></p>
                        
 <div class="previous alignleft"><?php previous_image_link( false ); ?></div>
 <div class="next alignright"><?php next_image_link( false ); ?></div>

<?php else : ?>
						<a href="<?php echo wp_get_attachment_url(); ?>" title="<?php echo esc_attr( get_the_title() ); ?>" rel="attachment"><?php echo basename( get_permalink() ); ?></a>
<?php endif; ?>
						<?php if ( !empty( $post->post_excerpt ) ) the_excerpt(); ?>

<?php the_content( __( 'Continue reading &rarr;', 'percivale' ) ); ?>

<?php wp_link_pages( array( 'before' => '<div class="page-link">' . __( '<span class="pages">Pages:</span>', 'percivale' ), 'after' => '</div>' ) ); ?>

<?php comments_template( '', true ); ?>

<?php endwhile; ?>

</div><!--END POST-->

</div><!--END COL-LEFT -->                 

<?php get_sidebar(); ?>

</div>

<?php get_footer(); ?>
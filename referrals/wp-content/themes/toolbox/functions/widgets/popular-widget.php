<?php

/**
 * PopularWidget Class
 */
 
class PopularWidget extends WP_Widget {
    /** constructor */
    function PopularWidget() {
        parent::WP_Widget(false, $name = 'Digi- PopularWidget');	
    }

    /** @see WP_Widget::widget */
    function widget($args, $instance) {		
        extract( $args );
        $title = apply_filters('widget_title', $instance['title']);
        ?>
              <?php echo $before_widget; ?>
                  <?php if ( $title )
                        echo $before_title . $title . $after_title; ?>
                  
                  
                  <div id="popular">
                  <?php
					$pc = new WP_Query('orderby=comment_count&posts_per_page=3'); ?>
					
					<?php while ($pc->have_posts()) : $pc->the_post(); ?>
					<?php
					$thumb = get_post_thumbnail_id(); 
					$postimage = vt_resize($thumb, '', 58, 58, true );
					?> 
					<div class="pop-wrap">
					
					<?php if (has_post_thumbnail()) : // If the post has a Featured Image then use .post-left ?>
					<div class="iwrap">
					<a class="read-tiny" href="<?php the_permalink(); ?>"><img src="<?php echo $postimage[url]; ?>" width="<?php echo $postimage[width]; ?>" height="<?php echo $postimage[height]; ?>" alt="<?php the_title(); ?>" class="wp-post-image-pop"/><span></span></a>
					</div>
					<?php else : ?>
					<div class="iwrap">
					<a class="read-tiny" href="<?php the_permalink(); ?>"><img src="<?php bloginfo('template_url'); ?>/images/noimg60.png" width="<?php echo $postimage[width]; ?>" height="<?php echo $postimage[height]; ?>" alt="<?php the_title(); ?>" class="wp-post-image-pop"/></a>
					</div>
					<?php endif; ?>
					
					<h3><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
					<p class="entry-meta">on <span><?php echo get_the_date(); ?></span></p>
					<p class="entry-meta">with <span class="arccom"><?php comments_popup_link( __('No Comments', '1 Comment', '% Comments') ); ?></span></p>
					
					</div>
					<?php endwhile; ?>
					</div>
                  
              <?php echo $after_widget; ?>
        <?php
    }

    /** @see WP_Widget::update */
    function update($new_instance, $old_instance) {				
	$instance = $old_instance;
	$instance['title'] = strip_tags($new_instance['title']);
        return $instance;
    }

    /** @see WP_Widget::form */
    function form($instance) {				
        $title = esc_attr($instance['title']);
        ?>
         <p>
          <label for="<?php echo $this->get_field_id('title'); ?>"><?php _e('Title:'); ?></label> 
          <input class="widefat" id="<?php echo $this->get_field_id('title'); ?>" name="<?php echo $this->get_field_name('title'); ?>" type="text" value="<?php echo $title; ?>" />
        </p>
        <?php 
    }

} // class PopularWidget

// register PopularWidget widget
add_action('widgets_init', create_function('', 'return register_widget("PopularWidget");'));

?>

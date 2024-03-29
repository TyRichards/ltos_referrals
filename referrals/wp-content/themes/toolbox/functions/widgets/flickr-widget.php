<?php
/*---------------------------------------------------------------------------------*/
/* Flickr widget */
/*---------------------------------------------------------------------------------*/
if (class_exists('WP_Widget')) {
	class Digi_flickr extends WP_Widget {
	
		function Digi_flickr() {
			$widget_ops = array('description' => 'This Flickr widget populates photos from a Flickr ID.' );
			parent::WP_Widget(false, __('Digi - Flickr'),$widget_ops);      
		}
	
		function widget($args, $instance) {  
			extract( $args );
			$id = $instance['id'];
			$number = $instance['number'];
			$type = $instance['type'];
			$sorting = $instance['sorting'];
			
			echo $before_widget;
			echo $before_title; ?>
			<?php _e('Photos on <span>flick<span>r</span></span>'); ?>
			<?php echo $after_title; ?>
				
			<div class="flickrwrap">
				<div class="fix"></div>
				<script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count=<?php echo $number; ?>&amp;display=<?php echo $sorting; ?>&amp;size=s&amp;layout=x&amp;source=<?php echo $type; ?>&amp;<?php echo $type; ?>=<?php echo $id; ?>"></script>        
				<div class="fix"></div>
			</div>
	
		   <?php			
		   echo $after_widget;
	   }
	
	   function update($new_instance, $old_instance) {                
		   return $new_instance;
	   }
	
	   function form($instance) {        
			$id = esc_attr($instance['id']);
			$number = esc_attr($instance['number']);
			$type = esc_attr($instance['type']);
			$sorting = esc_attr($instance['sorting']);
			?>
			<p>
				<label for="<?php echo $this->get_field_id('id'); ?>"><?php _e('Flickr ID (<a href="http://www.idgettr.com">idGettr</a>):','woothemes'); ?></label>
				<input type="text" name="<?php echo $this->get_field_name('id'); ?>" value="<?php echo $id; ?>" class="widefat" id="<?php echo $this->get_field_id('id'); ?>" />
			</p>
			<p>
				<label for="<?php echo $this->get_field_id('number'); ?>"><?php _e('Number:'); ?></label>
				<select name="<?php echo $this->get_field_name('number'); ?>" class="widefat" id="<?php echo $this->get_field_id('number'); ?>">
					<?php for ( $i = 1; $i < 10; $i += 1) { ?>
					<option value="<?php echo $i; ?>" <?php if($number == $i){ echo "selected='selected'";} ?>><?php echo $i; ?></option>
					<?php } ?>
				</select>
			</p>
			<p>
				<label for="<?php echo $this->get_field_id('type'); ?>"><?php _e('Type:'); ?></label>
				<select name="<?php echo $this->get_field_name('type'); ?>" class="widefat" id="<?php echo $this->get_field_id('type'); ?>">
					<option value="user" <?php if($type == "user"){ echo "selected='selected'";} ?>><?php _e('User'); ?></option>
					<option value="group" <?php if($type == "group"){ echo "selected='selected'";} ?>><?php _e('Group'); ?></option>            
				</select>
			</p>
			<p>
				<label for="<?php echo $this->get_field_id('sorting'); ?>"><?php _e('Sorting:'); ?></label>
				<select name="<?php echo $this->get_field_name('sorting'); ?>" class="widefat" id="<?php echo $this->get_field_id('sorting'); ?>">
					<option value="latest" <?php if($sorting == "latest"){ echo "selected='selected'";} ?>><?php _e('Latest'); ?></option>
					<option value="random" <?php if($sorting == "random"){ echo "selected='selected'";} ?>><?php _e('Random'); ?></option>            
				</select>
			</p>
			<?php
		}
	} 
	register_widget('Digi_flickr');
}
?>
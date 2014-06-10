<script type="text/javascript">
// Nivo Slider
jQuery(document).ready(function($){
	$('#slider').nivoSlider({
		effect:'<?php if ($nivoeff = get_option('of_nivo_slider_eff')) : ?><?php echo $nivoeff ?><?php else : ?>random<?php endif; ?>', //Specify sets like: 'fold,fade,sliceDown'
		slices:<?php if ($nivoslices = get_option('of_nivo_slider_slices')) : ?><?php echo $nivoslices ?><?php else : ?>15<?php endif; ?>,
		animSpeed:<?php if ($nivospeed = get_option('of_nivo_slider_speed')) : ?><?php echo $nivospeed ?><?php else : ?>500<?php endif; ?>, //Slide transition speed
		pauseTime:<?php if ($nivotime = get_option('of_nivo_slider_time')) : ?><?php echo $nivotime ?><?php else : ?>5000<?php endif; ?>,
		directionNavHide:false,
		pauseOnHover:true,
		captionOpacity:1.0
	});
});	
</script>

<script type="text/javascript">
// Testimonial shortcode
jQuery(document).ready(function($){
        var slider = $('#testimonial').bxSlider({
			auto: true,
            pager: true,
			pause: <?php if ($nivotime = get_option('of_nivo_slider_time')) : ?><?php echo $nivotime ?><?php else : ?>5000<?php endif; ?>,
            autoHover: true
		});
    });
</script>

<?php if( get_option('of_do_cufon') == 'true') : ?>
<script src="<?php bloginfo('template_directory'); ?>/inc/js/cufon/<?php if ($thecufon = get_option('of_alt_cufon')) : ?><?php echo $thecufon ?><?php endif; ?>.js" type="text/javascript"></script>
<script type="text/javascript">
	Cufon.replace('h1,h2,h3,h4,h5,h6, .docufon', {
	hover: true
}); // Works without a selector engine
</script>
<?php endif; ?>
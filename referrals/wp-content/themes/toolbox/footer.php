<?php
/**
 * The template for displaying the footer.
 *
 */
?>

<?php if( get_option('of_wide_layout') == 'true') : ?>
</div> <!--end .content-wide-->
<?php endif; ?>

</div><!--END REGULAR CONTENT-->

<div class="clear"></div>

<?php if ($twtnm = get_option('of_tweet_tweet_name')) : ?>
<div class="tweet-tweet-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>    
<div class="shadow"></div>
<?php endif; ?>
<div id="tweet-tweet">
	<img src="<?php bloginfo('template_url'); ?>/images/tweet-tweet.png" />
	<h3 id="twitter_update_list"></h3>
    <div class="tweet-tweet-pointer"></div>
</div>
<script type="text/javascript" src="http://twitter.com/javascripts/blogger.js">
</script>
<script type="text/javascript" src="http://twitter.com/statuses/user_timeline/<?php echo $twtnm ?>.json?callback=twitterCallback2&amp;count=1">
</script>

</div> <!--end .tweet-tweet-wide-->
<?php endif; ?>


<div class="footer-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>
<?php
	/* A sidebar in the footer? Yep. You can can customize
	 * your footer with up to five columns of widgets.
	 */
	get_sidebar( 'footer' );
?>

</div> <!--end .footer-wide-->
    
<div class="clear"></div> 

<div class="footer-bottom-wide">

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="shadow"></div>
<?php endif; ?>
      
<div id="footer-bottom">

<div class="copyright">

<?php if (get_option('of_show_footer_logo') == 'true') : ?>
    <?php if ($flogo = get_option('of_foot_logo')) : ?>
    <img src="<?php echo $flogo; ?>" alt="<?php bloginfo('name'); ?>" />
    <?php else : ?>
    <img class="branding" src="<?php bloginfo('template_url'); ?>/images/branding.png" alt="<?php bloginfo( 'name' ); ?>"/>
    <?php endif; ?>
<?php endif; ?>

	<p>
    <?php if ($footcopy = get_option('of_foot_copy')) : ?>
    <?php echo $footcopy ?>
    <?php else : ?>
    <?php _e( 'Copyright &copy;', 'percivale' ); ?> <?php echo date('Y'); ?> <?php bloginfo('name'); ?> <?php _e( 'All rights reserved.', 'percivale' ); ?>
    <?php endif; ?>
    </p>
    
</div>

 <div id="footer-social">
    	<?php if ($footfb = get_option('of_foot_facebook')) : ?><a class="icon facebook" href="<?php echo $footfb ?>">Facebook</a><?php endif; ?>
        <?php if ($foottw = get_option('of_foot_twitter')) : ?><a class="icon twitter" href="http://www.twitter.com/<?php echo $foottw ?>">Twitter</a><?php endif; ?>
        <?php if ($footdr = get_option('of_foot_dribbble')) : ?><a class="icon dribbble" href="http://www.dribbble.com/<?php echo footdr ?>">dribbble</a><?php endif; ?>
        <?php if ($footfl = get_option('of_foot_flickr')) : ?><a class="icon flickr" href="<?php echo $footfl ?>">flickr</a><?php endif; ?>
        <?php if ($footli = get_option('of_foot_linkedin')) : ?><a class="icon linkedin" href="<?php echo $footli ?>">LinkedIn</a><?php endif; ?>
        <?php if ($footrss = get_option('of_rss_name')) : ?><a class="icon rss" href="<?php echo $footrss ?>">rss</a><?php endif; ?>
    </div>

</div>

</div> <!--end .footer-bottom-wide-->

<?php if(get_option('of_wide_layout') == 'false') : ?>
</div><!-- /SITE WRAP OPENED IN HEADER --> 
<?php endif; ?>

<?php
	/* Always have wp_footer() just before the closing </body>
	 * tag of your theme, or you will break many plugins, which
	 * generally use this hook to reference JavaScript files.
	 */

	wp_footer();
?>

<script type="text/javascript">
jQuery(document).ready(function($){
	$("a[rel^='prettyPhoto']").prettyPhoto();
});
</script>
<?php include('inc/js/js-options.php'); ?>

</body>
</html>
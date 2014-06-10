<?php
/**
 * The Template for displaying comments.
 */
?> 
<?php
// Do not delete these lines
	if (!empty($_SERVER['SCRIPT_FILENAME']) && 'comments.php' == basename($_SERVER['SCRIPT_FILENAME']))
		die ('Please do not load this page directly. Thanks!');

	if ( post_password_required() ) { ?>
		<p class="alert">><?php _e( 'This post is password protected. Enter the password to view any comments.', 'percivale' ); ?></p>
	<?php
		return;
	}
?>

<!-- You can start editing here. -->
<div class="clear"></div>
<div id="comments">
<?php if ( have_comments() ) : ?> <!-- Let's Seperate the comments from Trackbacks -->
<?php if ( ! empty($comments_by_type['comment']) ) : ?>
	<h3><?php
			printf( _n( 'One Response to %2$s', '%1$s Responses to %2$s', get_comments_number(), 'percivale' ),
			number_format_i18n( get_comments_number() ), '<em>' . get_the_title() . '</em>' );
			?></h3>

	<ol class="commentlist">
	<?php wp_list_comments('type=comment&callback=digitonik_comment'); ?>
	</ol>
	<?php endif; ?>
    <?php if ( ! empty($comments_by_type['pings']) ) : ?>
    <h3>Trackbacks/Pingbacks</h3>
    <ol class="pinglist">
    <?php wp_list_comments('type=pings'); ?>
    </ol>
    <?php endif; ?>

<div class="navigation">
<div class="alignleft"><?php previous_comments_link() ?></div>
<div class="alignright"><?php next_comments_link() ?></div>
</div>

<?php else : // this is displayed if there are no comments so far ?>

	<?php if ( comments_open() ) : ?>
		<!-- If comments are open, but there are no comments. -->

	 <?php else : // comments are closed ?>
		<!-- If comments are closed. -->
		<p class="nocomments"><?php _e( 'Comments are closed.', 'percivale' ); ?></p>

	<?php endif; ?>
<?php endif; ?>


<?php if ( comments_open() ) : ?>
<div class="clear"></div>
<div id="respond">

	<h3><?php comment_form_title(__( 'Leave a Reply', 'percivale' )); ?></h3>
	<p class="cancel-comment-reply"><?php cancel_comment_reply_link(); ?></p>

	<?php if ( get_option('comment_registration') && !is_user_logged_in() ) : ?>
	<p><?php _e('You must be', 'percivale'); ?> <a href="<?php echo wp_login_url( get_permalink() ); ?>"><?php _e('logged in', 'percivale'); ?></a> <?php _e('to post a comment', 'percivale'); ?>.</p>
	<?php else : ?>

	<form action="<?php echo get_option('siteurl'); ?>/wp-comments-post.php" method="post" id="commentform">

		<?php if ( is_user_logged_in() ) : ?>

		<p><?php _e('Logged in as'); ?> <a href="<?php echo get_option('siteurl'); ?>/wp-admin/profile.php"><?php echo $user_identity; ?></a>. <a href="<?php echo wp_logout_url(get_permalink()); ?>" title="Log out of this account"><?php _e('Log out &raquo;', 'percivale'); ?></a></p>

		<?php else : ?>
		<div class="left">
		<p><input type="text" name="author" id="commentauthor" class="txt" value="<?php echo esc_attr($comment_author); ?>" size="22" tabindex="1" <?php if ($req) echo "aria-required='true'"; ?> />
        <label for="url"><small><?php _e('Name', 'percivale'); ?> <?php if ($req) echo "<span class=\"red\">*</span>"; ?></small></label></p>

		<p><input type="text" name="email" id="email" class="txt" value="<?php echo esc_attr($comment_author_email); ?>" size="22" tabindex="2" <?php if ($req) echo "aria-required='true'"; ?> />
        <label for="url"><small><?php _e('Email', 'percivale'); ?> <?php if ($req) echo "<span class=\"red\">*</span>"; ?> (not published)</small></label></p>

		<p><input type="text" name="url" id="url" class="txt" value="<?php echo esc_attr($comment_author_url); ?>" size="22" tabindex="3" />
        <label for="url"><small><?php _e('Website', 'percivale'); ?></small></label></p>
        </div>

		<?php endif; ?>
		<div class="right">

		<textarea name="comment" id="comment" cols="100%" rows="10" tabindex="4"></textarea>

		<input name="submit" type="submit" id="submit" tabindex="5" value="Submit Comment" />
		<?php comment_id_fields(); ?>
		<?php do_action('comment_form', $post->ID); ?>
        <p><input type="checkbox" style="width: auto;" value="subscribe" id="subscribe" name="subscribe"/> <label for="subscribe"><?php _e('Notify me of followup comments via e-mail', 'percivale'); ?></label></p>
		</div>
	</form>

	<?php endif; // If registration required and not logged in ?>

</div>

<?php endif; // if you delete this the sky will fall on your head ?>
</div>
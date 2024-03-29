<?php
/*
	wp_update_user only attempts to clear and reset cookies if it's updating the password.
	The php function setcookie(), used in both the cookie-clearing and cookie-resetting functions,
	adds to the page headers and therefore must be called within the first php tag on the page, and 
	before the WordPress get_header() function. Since wp_update_user needs this, it must be at the 
	beginning of the page as well.
*/
$wppb_saved_pass = false;
$wppb_error_pass = false;

function wppb_save_the_password(){
	global $wppb_saved_pass;
	global $wppb_error_pass;
	/* Load registration file. */
	require_once(ABSPATH . WPINC . '/registration.php');
	/* Get user info. */
	global $current_user;	
	if ( 'POST' == $_SERVER['REQUEST_METHOD'] && !empty( $_POST['action'] ) && $_POST['action'] == 'update-user' && wp_verify_nonce($_POST['edit_nonce_field'],'verify_edit_user') ) { 
		/* Update user password. */
		if ( !empty($_POST['pass1'] ) && !empty( $_POST['pass2'] ) ) {
			if ( $_POST['pass1'] == $_POST['pass2'] )
			{
				wp_update_user( array( 'ID' => $current_user->id, 'user_pass' => esc_attr( $_POST['pass1'] ) ) );
				$wppb_saved_pass = true;
			} else {
				$wppb_error_pass = true;
			}
		}	
	}
}
add_action('init', 'wppb_save_the_password');

/* the shortcode function */
function wppb_front_end_profile_info() {
	global $wppb_saved_pass;
	global $wppb_error_pass;
	
	ob_start();
	get_currentuserinfo();
	$wppb_defaultOptions = get_option('wppb_default_settings');
	$changesSaved = 'no';

	/* Load registration file. */
		require_once(ABSPATH . WPINC . '/registration.php');
	/* Get user info. */
		global $current_user;
	/* If profile was saved, update profile. */
	if ( 'POST' == $_SERVER['REQUEST_METHOD'] && !empty( $_POST['action'] ) && $_POST['action'] == 'update-user' && wp_verify_nonce($_POST['edit_nonce_field'],'verify_edit_user') ) { 
	
		if (email_exists( $_POST['email'] ) !=  FALSE)
			$thisEmail = email_exists( $_POST['email'] );
		else $thisEmail = $current_user->id;

		/* Update user password. */
		if ($wppb_saved_pass == true){
			$changesSaved = 'yes';
		}
		if ($wppb_error_pass == true){
			$error = __('The passwords you entered didn\'t match.  Your password was not updated.', 'profilebuilder');
		}
		
		
		if ( !empty( $_POST['email'] ) &&  is_email( $_POST['email'] )){                  				// if the user entered a valid email address
			if (($thisEmail ==  $current_user->id)){            										// if the entered email address is not already registered to some other user
				wp_update_user( array( 'ID' => $current_user->id, 'user_email' => esc_attr( $_POST['email'] )));	
				$changesSaved = 'yes';
			}else 
				$error = __('The e-mail address you entered is already registered to a different user. Your e-mail address was not updated.', 'profilebuilder');
		}else
			$error = __('The e-mail address you entered is not a valid one. Your e-mail address was not updated.', 'profilebuilder');
		
		

		/* Update user information. */
		if ($wppb_defaultOptions['firstname'] == 'show'){
			wp_update_user( array( 'ID' => $current_user->id, 'first_name' => esc_attr( $_POST['first_name'] )));
			$changesSaved = 'yes';
		}	
		if ($wppb_defaultOptions['lastname'] == 'show'){
			wp_update_user( array( 'ID' => $current_user->id, 'last_name' => esc_attr( $_POST['last_name'] )));
			$changesSaved = 'yes';
		}
			
		if ($wppb_defaultOptions['nickname'] == 'show'){
			wp_update_user( array( 'ID' => $current_user->id, 'nickname' => esc_attr( $_POST['nickname'] )));
			$changesSaved = 'yes';
		}
			
		if ($wppb_defaultOptions['dispname'] == 'show'){
			wp_update_user( array( 'ID' => $current_user->id, 'display_name' => esc_attr( $_POST['display_name'] )));
			$changesSaved = 'yes';
		}
			
		if ($wppb_defaultOptions['website'] == 'show'){
			$wppbPos = strpos($_POST['website'], 'http://');
			if($wppbPos !== FALSE){
				wp_update_user( array( 'ID' => $current_user->id, 'user_url' => esc_attr( $_POST['website'] )));
				$changesSaved = 'yes';
			}else{
				wp_update_user( array( 'ID' => $current_user->id, 'user_url' => 'http://'.esc_attr( $_POST['website'] )));
				$changesSaved = 'yes';
			}
		}
		
		if ($wppb_defaultOptions['aim'] == 'show'){	
			update_user_meta( $current_user->id, 'aim', esc_attr( $_POST['aim'] ) );
			$changesSaved = 'yes';
		}
			
		if ($wppb_defaultOptions['yahoo'] == 'show'){	
			update_user_meta( $current_user->id, 'yim', esc_attr( $_POST['yim'] ) );
			$changesSaved = 'yes';
		}
			
		if ($wppb_defaultOptions['jabber'] == 'show'){	
			update_user_meta( $current_user->id, 'jabber', esc_attr( $_POST['jabber'] ) );
			$changesSaved = 'yes';
		}
			
		if ($wppb_defaultOptions['bio'] == 'show'){	
			update_user_meta( $current_user->id, 'description', esc_attr( $_POST['description'] ) );
			$changesSaved = 'yes';
		}
		
	}
	
	





?>
	<div class="wppb_holder" id="wppb_modify">
	<?php if ( !is_user_logged_in() ) : ?>
 
				<p class="warning">
					<?php _e('You must be logged in to edit your profile.', 'profilebuilder'); ?>
				</p><!-- .warning -->
 
			<?php else : ?>
 
				<?php if ( $error ) echo '<p class="error">' . $error . '</p>'; ?>
				<?php 
					if ($changesSaved == 'yes'){
						echo '<p class="changes-saved">';
						_e('The changes made have been successfully saved.', 'profilebuilder'); 
						echo'</p><!-- .changes-saved -->';
					}
				?>
 
				<form method="post" id="edituser" class="user-forms" action="<?php the_permalink(); ?>">
				
                <li id="name" class="gfield  gsection">
				<h2 class="gsection_title">Name</h2>
				</li>
                
				<p class="username">
					<label for="user_login">Username</label>
					<p class="disabled"> <?php
					global $current_user;
					if ( isset($current_user) ) {
   					echo $current_user->user_login;
					} ?>
                    </p><p class="sublabel">Usernames cannot be changed.</p></label>
				</p>
				
				<?php 
				if ($wppb_defaultOptions['firstname'] == 'show'){ echo'
				<p class="first_name">
					<label for="first_name">'; _e('First Name', 'profilebuilder'); echo'</label>
					<input class="text-input" name="first_name" type="text" id="first_name" value="'; the_author_meta( 'first_name', $current_user->id ); echo '" />
				</p><!-- .first_name -->';
				}
				?>
				
				<?php 
				if ($wppb_defaultOptions['lastname'] == 'show'){ echo'
				<p class="last_name">
					<label for="last_name">'; _e('Last Name', 'profilebuilder'); echo'</label>
					<input class="text-input" name="last_name" type="text" id="last_name" value="'; the_author_meta( 'last_name', $current_user->id ); echo '" />
				</p><!-- .last_name -->';
				}
				?>
				
				<?php 
				if ($wppb_defaultOptions['nickname'] == 'show'){ echo'
				<p class="nickname">
					<label for="nickname">'; _e('Nickname', 'profilebuilder'); echo'<i>'; _e(' (required)', 'profilebuilder');echo'</i></label>
					<input class="text-input" name="nickname" type="text" id="nickname" value="'; the_author_meta( 'nickname', $current_user->id ); echo'" />
				</p><!-- .nickname -->';
				}
				?>
				
				<?php 
				if ($wppb_defaultOptions['dispname'] == 'show'){ echo'
				<p class="display_name">
					<label for="display_name">'; _e('Display name publicly as', 'profilebuilder'); echo'</label>
					<select name="display_name" id="display_name">';
						$public_display = array();
						$public_display['display_username']  = get_the_author_meta('user_login', $current_user->id);
						$thisFirstName = get_the_author_meta('first_name', $current_user->id);
						if ( !empty($thisFirstName))
							$public_display['display_firstname'] = get_the_author_meta('first_name', $current_user->id);
						$thisLastName = get_the_author_meta('last_name', $current_user->id);
						if ( !empty($thisLastName))
							$public_display['display_lastname'] = get_the_author_meta('last_name', $current_user->id);
						$public_display['display_nickname']  = get_the_author_meta('nickname', $current_user->id);
						if ( !empty($thisFirstName) && !empty($thisLastName) ) {
							$public_display['display_firstlast'] = $thisFirstName . ' ' . $thisLastName;
							$public_display['display_lastfirst'] = $thisLastName . ' ' . $thisFirstName;
						}
						$thisDisplayName = get_the_author_meta('display_name', $current_user->id);
						if ( !in_array( $thisDisplayName, $public_display ) )               // Only add this if it isn't duplicated elsewhere
							$public_display = array( 'display_displayname' => $thisDisplayName ) + $public_display;
						$public_display = array_map( 'trim', $public_display );
						foreach ( $public_display as $id => $item ) {
							echo '<option id="'.$id.'" value="'.$item.'"'; selected( $thisDisplayName, $item ); echo'>'.$item.'</option>';
						}
					echo'</select>
				</p><!-- .display_name -->';
				}
				?>
                
                <p class="form-submit">
					<input name="updateuser" type="submit" id="updateuser" class="submit button" value="<?php _e('Update', 'profilebuilder'); ?>" />
					<?php// wp_nonce_field( 'update-user' ) ?>
					<input name="action" type="hidden" id="action" value="update-user" />
				</p><!-- .form-submit -->

				<li id="contact" class="gfield  gsection">
				<h2 class="gsection_title">Contact Info</h2>
				</li>
				
				<?php 
				if ($wppb_defaultOptions['email'] == 'show'){ echo'
				<p class="form-email">
					<label for="email">'; _e('E-mail', 'profilebuilder');echo'<i>'; _e(' (required)', 'profilebuilder');echo'</i></label>
					<input class="text-input" name="email" type="text" id="email" value="'; the_author_meta( 'user_email', $current_user->id ); echo'" />
				</p>';
				}
				?>
				
                
				<?php 
				if ($wppb_defaultOptions['website'] == 'show'){ echo'
				<p class="form-website">
					<label for="website">'; _e('Website', 'profilebuilder'); echo'</label>
					<input class="text-input" name="website" type="text" id="website" value="'; the_author_meta( 'user_url', $current_user->id ); echo'" />
				</p>';
				}
				?>
				
				<?php 
				if ($wppb_defaultOptions['aim'] == 'show'){ echo'
				<p class="form-aim">
					<label for="aim">'; _e('AIM', 'profilebuilder'); echo'</label>
					<input class="text-input" name="aim" type="text" id="aim" value="'; the_author_meta( 'aim', $current_user->id ); echo'" />
				</p><!-- .form-aim -->';
				}
				?>
				
				<?php 
				if ($wppb_defaultOptions['yahoo'] == 'show'){ echo'
				<p class="form-yim">
					<label for="yim">'; _e('Yahoo IM', 'profilebuilder'); echo'</label>
					<input class="text-input" name="yim" type="text" id="yim" value="'; the_author_meta( 'yim', $current_user->id ); echo'" />
				</p><!-- .form-yim -->';
				}
				?>
 
				<?php 
				if ($wppb_defaultOptions['jabber'] == 'show'){ echo'
				<p class="form-jabber">
					<label for="jabber">'; _e('Jabber / Google Talk', 'profilebuilder'); echo'</label>
					<input class="text-input" name="jabber" type="text" id="jabber" value="'; the_author_meta( 'jabber', $current_user->id ); echo'" />
				</p><!-- .form-jabber -->';
				}
				?>
                
                <p class="form-submit">
					<input name="updateuser" type="submit" id="updateuser" class="submit button" value="<?php _e('Update', 'profilebuilder'); ?>" />
					<?php// wp_nonce_field( 'update-user' ) ?>
					<input name="action" type="hidden" id="action" value="update-user" />
				</p><!-- .form-submit -->
                
                
				<!--<li id="about" class="gfield  gsection">
				<h2 class="gsection_title">About Yourself</h2>
				</li>-->
				
				<?php 
				if ($wppb_defaultOptions['bio'] == 'show'){ echo'
				<p class="form-description">
					<label for="description">'; _e('Biographical Info', 'profilebuilder'); echo'</label>
					<textarea class="text-input" name="description" id="description" rows="5" cols="30">'; the_author_meta( 'description', $current_user->id ); echo'</textarea>
				</p>
				<!-- .form-description -->';
				}
				?>
                
                <p class="form-submit">
					<input name="updateuser" type="submit" id="updateuser" class="submit button" value="<?php _e('Update', 'profilebuilder'); ?>" />
					<?php// wp_nonce_field( 'update-user' ) ?>
					<input name="action" type="hidden" id="action" value="update-user" />
				</p><!-- .form-submit -->
                
				<li id="password" class="gfield  gsection">
				<h2 class="gsection_title">Reset Password</h2>
				</li>
				
				<?php 
				if ($wppb_defaultOptions['password'] == 'show'){ echo'
				<p class="form-password">
					<label for="pass1">'; _e('New Password', 'profilebuilder'); echo'</label>
					<input class="text-input" name="pass1" type="password" id="pass1" />
				</p><!-- .form-password -->
 
				<p class="form-password">
					<label for="pass2">'; _e('Repeat Password', 'profilebuilder'); echo'</label>
					<input class="text-input" name="pass2" type="password" id="pass2" />
				</p><!-- .form-password -->';
				}
				?>
				

				<p class="form-submit">
					<input name="updateuser" type="submit" id="updateuser" class="submit button" value="<?php _e('Update', 'profilebuilder'); ?>" />
					<?php// wp_nonce_field( 'update-user' ) ?>
					<input name="action" type="hidden" id="action" value="update-user" />
				</p><!-- .form-submit -->
				<?php wp_nonce_field('verify_edit_user','edit_nonce_field'); ?>
				</form><!-- #edituser -->

			<?php endif; ?>
	</div>	
<?php
	$output = ob_get_contents();
    ob_end_clean();
    return $output;
}

?>
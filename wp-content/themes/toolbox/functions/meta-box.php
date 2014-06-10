<?php
$key = "seostuffkey";
$meta_boxes = array(
"seotitle" => array(
"name" => "seotitle",
"title" => "Page Title",
"description" => "Type your custom page title here. This will overwrite the page title written in your post editor and also for the title in search engines."),
"seodescription" => array(
"name" => "seodescription",
"title" => "Page Description",
"description" => "Type your custom page description here. This will be used for the description in search engines and show below the title.")
);
 
function create_meta_box() {
global $key;
 
if( function_exists( 'add_meta_box' ) ) {
add_meta_box( 'page-meta-boxes','Custom Page Title and Description', 'display_meta_box', 'page', 'normal', 'high' );
}
}
 
function display_meta_box() {
global $post, $meta_boxes, $key;
?>
 
<div class="form-wrap">
 
<?php
wp_nonce_field( plugin_basename( __FILE__ ), $key . '_wpnonce', false, true );
 
foreach($meta_boxes as $meta_box) {
$data = get_post_meta($post->ID, $key, true);
?>
 
<div class="form-field form-required">
<label for="<?php echo $meta_box[ 'name' ]; ?>"><?php echo $meta_box[ 'title' ]; ?></label>
<input type="text" name="<?php echo $meta_box[ 'name' ]; ?>" value="<?php echo htmlspecialchars( $data[ $meta_box[ 'name' ] ] ); ?>" />
<p><?php echo $meta_box[ 'description' ]; ?></p>
</div>
 
<?php } ?>
 
</div>
<?php
}
 
function save_meta_box( $post_id ) {
global $post, $meta_boxes, $key;
 
foreach( $meta_boxes as $meta_box ) {
$data[ $meta_box[ 'name' ] ] = $_POST[ $meta_box[ 'name' ] ];
}
 
if ( !wp_verify_nonce( $_POST[ $key . '_wpnonce' ], plugin_basename(__FILE__) ) )
return $post_id;
 
if ( !current_user_can( 'edit_post', $post_id ))
return $post_id;
 
update_post_meta( $post_id, $key, $data );
}
 
add_action( 'admin_menu', 'create_meta_box' );
add_action( 'save_post', 'save_meta_box' );
?>
<?php

/************************************
Smart Jquery Inclusion
************************************/
if(!is_admin()){
wp_enqueue_script('jquery-form-validation', 'http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.pack.js', '' , '1.7', true);
}

/************************************
Contact Form shortcode

form_name - name of form, also used as subject of email. DEFAULT is Contact Us
to - email(s) the message will be sent to.  Multiple emails can be used; separate each email with a comma. DEFAULT is the Administrator's email address
************************************/
function ua_form($atts){
if(($_SESSION['contact_form_success'])){
$contact_form_success = '<p id="form_success">Thank you for your inquiry. We will contact you shortly to answer your questions.</p>';
unset($_SESSION['contact_form_success']);
}

$admin_email = get_bloginfo('admin_email');

extract(shortcode_atts(array(
'form_name' => 'Contact Us',
'to' => $admin_email
), $atts));

$_SESSION['ua_form_subject'] = $form_name;
$_SESSION['ua_form_to'] = $to;

$output .= $contact_form_success . '<form method="post" action="' . get_permalink() . '" id="contactform" class="uaform">
<fieldset>
<div class="formname">
<h3>' . $form_name . '</h3>
</div>
<ul>
<li>
<label>Name <span>*</span></label><input type="text" name="name" maxlength="100" id="name" />
</li>
<li class="dept">
<label>Department/Organization</label><input type="text" name="department" maxlength="150" id="dept" />
</li>
<li class="tel">
<label>Telephone Number</label><input type="text" name="phone" maxlength="50" id="phone" />
</li>
<li>
<label>E-mail <span>*</span></label><input type="text" name="email" maxlength="150" id="email" />
</li>
<li>
<label>Questions and comments <span>*</span></label><textarea name="question" id="question"></textarea>
</li>
<li>
<label>Enter two digits <strong>no</strong> spaces (Ex: 12) <span>*</span></label><input type="text" name="secret" id="secret" />
</li>
<div style="display:none;">
<li>
<label for="spam">This box is for spam protection - <strong>please leave it blank</strong>:</label><input name="spam" id="spam" />
</li>
</div>
<li>
<input type="submit" name="submit" value="Submit" id="sendmail" />
</li>
<input type="hidden" name="contact_form_submitted" value="true">
</ul>
</fieldset>
</form>';
return $output;
}
add_shortcode('uaform', 'ua_form');

function ua_form_process() {
session_start();

if(!isset($_POST['contact_form_submitted'])) return;

foreach($_POST as $key=>$value){
$key = strtolower(str_replace('_', ' ', $key));
$form_fields[$key] = $value;

$value = strip_tags(htmlentities($value));

if($key == "spam" || $key == "secret" || $key == "submit" || $key == "contact form submitted"){
//do nothing
}
else{
$message .= ucwords($key) . ": $value\n";
}
}

//Test for spam and verification, then email
//"secret" is a REQUIRED field name in order for this script to work
if($form_fields["spam"] == '' && is_numeric($form_fields["secret"]) && strlen($form_fields["secret"]) == 2){
$to = $_SESSION['ua_form_to'];
$subject = $_SESSION['ua_form_subject'];

$mail_sent = mail($to, $subject, $message, "From: " . $form_fields["name"] . "<" . $form_fields["email"] . ">");
}

if(!$mail_sent) wp_die("Error: <strong>verification failed</strong>.  Your form was not submitted due to an incorrect answer for the verification question. Please be sure to enter the answer carefully.", "Verification Failed");

$_SESSION['contact_form_success'] = 1;

header('Location: ' . $_SERVER['HTTP_REFERER']);
exit();
}
add_action('init', 'ua_form_process');

function ua_form_validation(){
echo '<script>
jQuery(document).ready(function(){
jQuery("#contactform").validate({
rules:{
secret:{
maxlength:2
}
},
errorPlacement: function(error, element) {
if(element.is(":radio") || element.is(":checkbox")){
error.appendTo(element.parent().parent());
}
else{
error.insertAfter(element);
}
}
});
});
</script>';
}
add_action('wp_footer', 'ua_form_validation');

?>
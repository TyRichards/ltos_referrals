<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>

<!--[if lte IE 6]>
<meta http-equiv="refresh" content="0; url=../referrals/upgrade.html" />
<script type="text/javascript">
/* <![CDATA[ */
window.top.location = '../referrals/upgrade.html';
/* ]]> */
</script>
<![endif]-->
            
<link rel="icon" type="image/ico" href="../referrals/wp-content/uploads/2011/06/favicon.ico"></link> 
<link rel="shortcut icon" href="../referrals/wp-content/uploads/2011/06/favicon.ico"></link>

<meta charset="<?php bloginfo( 'charset' ); ?>" />
<title><?php 	/* 	 * Print the <title> tag based on what is being viewed. 	 * We filter the output of wp_title() a bit -- see 	 * digi_filter_wp_title() in functions.php. 	 */ 	wp_title( '|', true, 'right' );  	?></title>
<link rel="profile" href="http://gmpg.org/xfn/11" />
<link rel="stylesheet" type="text/css" media="all" href="<?php bloginfo( 'stylesheet_url' ); ?>" />
<link rel="stylesheet" href="<?php bloginfo( 'stylesheet_directory' ); ?>/css/custom-style.php" media="screen"> 
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />

<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />

<?php wp_enqueue_script('jquery'); // Load jQuery ?>
    
<?php // Comment threading
	if ( is_singular() && get_option( 'thread_comments' ) )
		wp_enqueue_script( 'comment-reply' );
	// wp_head Do not remove.
	wp_head();
?>

<!--[if !IE]><!-->
<script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/inc/js/no-ie.js"></script>
<!--<![endif]-->
<!--[if IE]>
<link rel="stylesheet" type="text/css" href="<?php bloginfo( 'stylesheet_directory' ); ?>/css/ie.css" />
<![endif]-->



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head>

<body <?php body_class(); ?>>

<?php if(get_option('of_wide_layout') == 'false') : ?>
<div class="sitewrap">
<?php endif; ?>



<!-- OLD PLACE FOR COLOR BAR -->

<?php if( get_option('of_wide_layout') == 'true') : ?>
<div class="wide-top">
<div class="shadow"></div>
<?php endif; ?>

<div id="header">
	<div id="logo">
	<a href="<?php echo home_url( '/' ); ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>" rel="home">
    <?php if ( $logo = get_option('of_logo') ) : ?>
    <img src="<?php echo $logo; ?>" alt="<?php bloginfo('name'); ?>" />
    <?php else : ?>
    <img src="<?php bloginfo('template_directory'); ?>/images/logo.png" alt="<?php bloginfo( 'name' ); ?>" />
    <?php endif; ?>
    </a>
	</div>  
<!-- Site Description -->
    <!--<h1 class="description-big"><?php bloginfo( 'description' ); ?></h1>-->
    
	<!--<?php /* Our navigation menu. If one isn't filled out, wp_nav_menu falls back to digi_no_nav_selected. */ ?>    
    <?php wp_nav_menu( array( 'container_class' => 'menu-header', 'theme_location' => 'primary', 'fallback_cb' => 'digi_no_nav', 'walker' => new description_walker() ) ); ?>
	-->
</div><!--END HEADER-->

<?php if( get_option('of_wide_layout') == 'true') : ?>
</div> <!--end .wide-top-->
<?php endif; ?>



<!-- COLOR BAR -->


<div class="colorbar">
	<div class="inner">
    
    <h2 class="description">Lake Travis Oral & Maxillofacial Surgery</h2>
   
    
    <ul id="dropdown-menu">
                <div id="user-menu">
                <li><a href="home-page"><div class="top-button">Sign In</div></a></li>
                <li><div class="division"></div></li>
                <li><a href="sign-up"><div class="top-button-right">Sign Up</div></a></li>
                </div>
            </ul>
    <!--
	<p class="description"> <?php /* Our navigation menu. If one isn't filled out, wp_nav_menu falls back to digi_no_nav_selected. */ ?>    
    <?php wp_nav_menu( array( 'container_class' => 'menu-header', 'theme_location' => 'primary', 'fallback_cb' => 'digi_no_nav', 'walker' => new description_walker() ) ); ?>		</p>
    -->
    
    <!--
    <div class="description-alt"><?php if ($tp = get_option('of_top_phone')) : ?><span class="phone"><?php echo $tp ?></span><?php endif; ?> <?php if ($eml = get_option('of_top_email')) : ?><span class="email"><?php echo $eml ?></span><?php endif; ?></div>
    -->
    </div>
    
</div>
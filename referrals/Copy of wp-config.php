<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('WP_CACHE', true); //Added by WP-Cache Manager
define('DB_NAME', 'ty_wdps1');

/** MySQL database username */
define('DB_USER', 'ty_wdps1');

/** MySQL database password */
define('DB_PASSWORD', 'q945ugviylagtydY');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'V636!jmw@GxJ#??n(2^yan@66LdKOo0nVA7/yG*):-:|It>;qnfV5W)@^x0mUu6o');
define('SECURE_AUTH_KEY',  'L<,mo1^*3/qwVvc=:p$2`J32RI<Jkw`i*ugp%(AmQ&moJ(11?(|rd_2T$K4#A-*Z');
define('LOGGED_IN_KEY',    'h]8:aX-9q|%+Z|%sU*>o0.r[K)22&cSPFLx1ag7nMsdk6{!cgGnvIdX7J$[_dHM3');
define('NONCE_KEY',        '+zDUBh|5=1q+*Vu/8nie=b_n3bJLXh^#C|Htp8csC[jL`w[e{dll~az2Ga)|c(52');
define('AUTH_SALT',        'vMcJ7oIl+-NKy1/ RC[8(R(VZ0gxDAIW3L-i;WUr8*gR3+F(*ustrRy7-fht}6S9');
define('SECURE_AUTH_SALT', '+0V $y0+v!Ytiir8jI;^2#Wv)!Z?[h8z+dA$M}SGG%f[|z/E.P(6OHNX9b`kf28s');
define('LOGGED_IN_SALT',   'E-epui36jMk!4H]o#EaAwe?,C-Yu|,+ZOmmH:?YAgn5>+{.V%P<x<}F&+c8ste:K');
define('NONCE_SALT',       'T$^1**,C.soFUHhQm+lo-&)o:T=|fY7c!j8{y*~:6hkw_$fIz[pnu6rk>SJWZqyx');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

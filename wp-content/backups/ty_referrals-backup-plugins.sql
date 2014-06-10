-- WordPress Backup to Dropbox SQL Dump
-- Version 1.2.2
-- http://wpb2d.com
-- Generation Time: January 9, 2014 at 12:36

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Create and use the backed up database
--

CREATE DATABASE IF NOT EXISTS ty_referrals;
USE ty_referrals;

--
-- Table structure for table `wp_bp_activity`
--

CREATE TABLE `wp_bp_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `component` varchar(75) NOT NULL,
  `type` varchar(75) NOT NULL,
  `action` text NOT NULL,
  `content` longtext NOT NULL,
  `primary_link` varchar(150) NOT NULL,
  `item_id` varchar(75) NOT NULL,
  `secondary_item_id` varchar(75) DEFAULT NULL,
  `date_recorded` datetime NOT NULL,
  `hide_sitewide` tinyint(1) DEFAULT '0',
  `mptt_left` int(11) NOT NULL DEFAULT '0',
  `mptt_right` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_recorded` (`date_recorded`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `component` (`component`),
  KEY `type` (`type`),
  KEY `mptt_left` (`mptt_left`),
  KEY `mptt_right` (`mptt_right`),
  KEY `hide_sitewide` (`hide_sitewide`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table `wp_bp_activity` is empty
--

--
-- Table structure for table `wp_bp_activity_meta`
--

CREATE TABLE `wp_bp_activity_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table `wp_bp_activity_meta` is empty
--

--
-- Table structure for table `wp_bp_friends`
--

CREATE TABLE `wp_bp_friends` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initiator_user_id` bigint(20) NOT NULL,
  `friend_user_id` bigint(20) NOT NULL,
  `is_confirmed` tinyint(1) DEFAULT '0',
  `is_limited` tinyint(1) DEFAULT '0',
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `friend_user_id` (`friend_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table `wp_bp_friends` is empty
--

--
-- Table structure for table `wp_bp_groups`
--

CREATE TABLE `wp_bp_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'public',
  `enable_forum` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_id` (`creator_id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table `wp_bp_groups` is empty
--

--
-- Table structure for table `wp_bp_groups_groupmeta`
--

CREATE TABLE `wp_bp_groups_groupmeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table `wp_bp_groups_groupmeta` is empty
--

--
-- Table structure for table `wp_bp_groups_members`
--

CREATE TABLE `wp_bp_groups_members` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `inviter_id` bigint(20) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_mod` tinyint(1) NOT NULL DEFAULT '0',
  `user_title` varchar(100) NOT NULL,
  `date_modified` datetime NOT NULL,
  `comments` longtext NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `invite_sent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `is_admin` (`is_admin`),
  KEY `is_mod` (`is_mod`),
  KEY `user_id` (`user_id`),
  KEY `inviter_id` (`inviter_id`),
  KEY `is_confirmed` (`is_confirmed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table `wp_bp_groups_members` is empty
--

--
-- Table structure for table `wp_bp_messages_messages`
--

CREATE TABLE `wp_bp_messages_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `thread_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `date_sent` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table `wp_bp_messages_messages` is empty
--

--
-- Table structure for table `wp_bp_messages_notices`
--

CREATE TABLE `wp_bp_messages_notices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `date_sent` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_active` (`is_active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table `wp_bp_messages_notices` is empty
--

--
-- Table structure for table `wp_bp_messages_recipients`
--

CREATE TABLE `wp_bp_messages_recipients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `thread_id` bigint(20) NOT NULL,
  `unread_count` int(10) NOT NULL DEFAULT '0',
  `sender_only` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `thread_id` (`thread_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `sender_only` (`sender_only`),
  KEY `unread_count` (`unread_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table `wp_bp_messages_recipients` is empty
--

--
-- Table structure for table `wp_bp_notifications`
--

CREATE TABLE `wp_bp_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `component_name` varchar(75) NOT NULL,
  `component_action` varchar(75) NOT NULL,
  `date_notified` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `user_id` (`user_id`),
  KEY `is_new` (`is_new`),
  KEY `component_name` (`component_name`),
  KEY `component_action` (`component_action`),
  KEY `useritem` (`user_id`,`is_new`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table `wp_bp_notifications` is empty
--

--
-- Table structure for table `wp_bp_xprofile_data`
--

CREATE TABLE `wp_bp_xprofile_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_bp_xprofile_data`
--

INSERT INTO `wp_bp_xprofile_data` (`id`, `field_id`, `user_id`, `value`, `last_updated`) VALUES
('1', '1', '1', 'admin', '2011-05-09 19:28:42'),
('2', '1', '2', 'tyrichards@me.com', '2011-05-09 20:15:08');

--
-- Table structure for table `wp_bp_xprofile_fields`
--

CREATE TABLE `wp_bp_xprofile_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `type` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_default_option` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` bigint(20) NOT NULL DEFAULT '0',
  `option_order` bigint(20) NOT NULL DEFAULT '0',
  `order_by` varchar(15) NOT NULL,
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `parent_id` (`parent_id`),
  KEY `field_order` (`field_order`),
  KEY `can_delete` (`can_delete`),
  KEY `is_required` (`is_required`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_bp_xprofile_fields`
--

INSERT INTO `wp_bp_xprofile_fields` (`id`, `group_id`, `parent_id`, `type`, `name`, `description`, `is_required`, `is_default_option`, `field_order`, `option_order`, `order_by`, `can_delete`) VALUES
('1', '1', '0', 'textbox', 'Name', '', '1', '0', '0', '0', '', '0');

--
-- Table structure for table `wp_bp_xprofile_groups`
--

CREATE TABLE `wp_bp_xprofile_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` mediumtext NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `can_delete` (`can_delete`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_bp_xprofile_groups`
--

INSERT INTO `wp_bp_xprofile_groups` (`id`, `name`, `description`, `can_delete`) VALUES
('1', 'Base', '', '0');

--
-- Table structure for table `wp_contact_form_7`
--

CREATE TABLE `wp_contact_form_7` (
  `cf7_unit_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `form` text NOT NULL,
  `mail` text NOT NULL,
  `mail_2` text NOT NULL,
  `messages` text NOT NULL,
  `additional_settings` text NOT NULL,
  PRIMARY KEY (`cf7_unit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_contact_form_7`
--

INSERT INTO `wp_contact_form_7` (`cf7_unit_id`, `title`, `form`, `mail`, `mail_2`, `messages`, `additional_settings`) VALUES
('1', 'Contact form 1', '<h1>REFERRING PHYSICIAN </h1>\r\n\r\n<p class=\"tys\">Physician Name (required)<br />\r\n    [text* sender-name] </p>\r\n\r\n<p>Practice Name (required)<br />\r\n    [text* sender-office] </p>\r\n\r\n<p>Email (required)<br />\r\n    [email* sender-email] </p>\r\n\r\n<p>Phone Number (required)<br />\r\n    [text* sender-phone] </p>\r\n\r\n<p>Remember Me &nbsp&nbsp[checkbox remember label_first]</p>\r\n\r\n<h1>PATIENT INFORMATION</h1>\r\n\r\n<p>Patient Name (required)<br />\r\n    [text* patient-name] </p>\r\n\r\n<p>Email (required)<br />\r\n    [email* patient-email] </p>\r\n\r\n<p>Phone Number (required)<br />\r\n    [text* patient-phone] </p>\r\n\r\n<p>Issue (required)<br/>\r\n[select* Issue \"--- Select One ---\" \"Wisdom Teeth Removal\" \"Jaw Surgery\" \"Consultation\" \"Other\"]</p>\r\n\r\n<p>Additional Notes (optional)<br />\r\n    [textarea patient-notes] </p>\r\n\r\n<p>[submit \"Send\"]</p>', 'a:7:{s:7:\"subject\";s:12:\"New Referral\";s:6:\"sender\";s:30:\"[sender-name] <[sender-email]>\";s:4:\"body\";s:455:\"You have just received a new referral. Details are below.\r\n\r\nA promotional email was automatically sent to:\r\nPotential Client:  [patient-name]\r\nEmail:  [patient-email]\r\nPhone:  [patient-phone]\r\nIssue:  [Issue]\r\nNotes:  [patient-notes]\r\n\r\n\r\nThis referral was sent to you by:\r\nName:  [sender-name] \r\nPractice:  [sender-office]\r\nEmail:  <[sender-email]>\r\nPhone:  [sender-phone]\r\n\r\n------------ This message was sent through your Referral system. ------------\";s:9:\"recipient\";s:17:\"me@tyrichards.com\";s:18:\"additional_headers\";s:0:\"\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";s:0:\"\";}', 'a:8:{s:6:\"active\";s:0:\"\";s:7:\"subject\";s:48:\"You\'ve been referred to Lake Travis Oral Surgery\";s:6:\"sender\";s:38:\"Jeff Alford D.D.S. <me@tyrichards.com>\";s:4:\"body\";s:392:\"Hi [patient-name],\r\n\r\nYou\'ve requested more information about Lake Travis Oral Surgery from [sender-office]. Please visit us online at laketravisoralsurgery.com. And feel free to contact us anytime by phone or email to set up an appointment. Thank you for your interest.\r\n\r\nSincerely,\r\nJeff Alford D.D.S.\r\nLake Travis Oral & Maxillofacial Surgery\r\n512.261.6900\r\ninfo@laketravisoralsurgery.com\";s:9:\"recipient\";s:15:\"[patient-email]\";s:18:\"additional_headers\";s:0:\"\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";s:0:\"\";}', 'a:13:{s:12:\"mail_sent_ok\";s:43:\"Your message was sent successfully. Thanks.\";s:12:\"mail_sent_ng\";s:84:\"Failed to send your message. Please try later or contact administrator by other way.\";s:17:\"akismet_says_spam\";s:84:\"Failed to send your message. Please try later or contact administrator by other way.\";s:16:\"validation_error\";s:74:\"Validation errors occurred. Please confirm the fields and submit it again.\";s:12:\"accept_terms\";s:35:\"Please accept the terms to proceed.\";s:13:\"invalid_email\";s:28:\"Email address seems invalid.\";s:16:\"invalid_required\";s:31:\"Please fill the required field.\";s:17:\"captcha_not_match\";s:31:\"Your entered code is incorrect.\";s:13:\"upload_failed\";s:22:\"Failed to upload file.\";s:24:\"upload_file_type_invalid\";s:30:\"This file type is not allowed.\";s:21:\"upload_file_too_large\";s:23:\"This file is too large.\";s:23:\"upload_failed_php_error\";s:38:\"Failed to upload file. Error occurred.\";s:23:\"quiz_answer_not_correct\";s:27:\"Your answer is not correct.\";}', '');

--
-- Table structure for table `wp_customcontactforms_field_options`
--

CREATE TABLE `wp_customcontactforms_field_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_slug` varchar(100) NOT NULL,
  `option_label` varchar(200) NOT NULL,
  `option_value` varchar(100) NOT NULL,
  `option_dead` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_customcontactforms_field_options`
--

INSERT INTO `wp_customcontactforms_field_options` (`id`, `option_slug`, `option_label`, `option_value`, `option_dead`) VALUES
('1', 'ccf_email', 'By Email', '', '0'),
('2', 'ccf_phone', 'By Phone', '', '0'),
('3', 'ccf_no_contact', 'Do Not Contact Me', '', '0');

--
-- Table structure for table `wp_customcontactforms_fields`
--

CREATE TABLE `wp_customcontactforms_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_slug` varchar(50) NOT NULL,
  `field_label` text NOT NULL,
  `field_type` varchar(25) NOT NULL,
  `field_value` text NOT NULL,
  `field_maxlength` int(5) NOT NULL DEFAULT '0',
  `user_field` int(1) NOT NULL DEFAULT '1',
  `field_instructions` text NOT NULL,
  `field_options` text NOT NULL,
  `field_required` int(1) NOT NULL DEFAULT '0',
  `field_class` varchar(50) NOT NULL,
  `field_error` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_customcontactforms_fields`
--

INSERT INTO `wp_customcontactforms_fields` (`id`, `field_slug`, `field_label`, `field_type`, `field_value`, `field_maxlength`, `user_field`, `field_instructions`, `field_options`, `field_required`, `field_class`, `field_error`) VALUES
('1', 'captcha', 'Type the numbers.', 'Text', '', '100', '0', 'Type the numbers displayed in the image above.', '', '0', '', ''),
('2', 'usaStates', 'Select a State', 'Dropdown', '', '0', '0', '', '', '0', '', ''),
('3', 'allCountries', 'Select a Country', 'Dropdown', '', '0', '0', '', '', '0', '', ''),
('4', 'ishuman', 'Check if you are human.', 'Checkbox', '1', '0', '0', 'This helps us prevent spam.', '', '0', '', ''),
('5', 'fixedEmail', 'Your Email', 'Text', '', '100', '0', 'Please enter your email address.', '', '1', '', ''),
('6', 'fixedWebsite', 'Your Website', 'Text', '', '200', '0', 'Please enter your website.', '', '1', '', ''),
('7', 'emailSubject', 'Email Subject', 'Text', '', '200', '0', 'Please enter a subject for the email.', '', '1', '', ''),
('8', 'resetButton', '', 'Reset', 'Reset Form', '0', '0', '', '', '0', '', ''),
('9', 'ccf_name', 'Your Name:', 'Text', '', '100', '1', 'Please enter your full name.', '', '1', '', ''),
('10', 'ccf_message', 'Your Message:', 'Textarea', '', '0', '1', 'Enter any message or comment.', '', '0', '', '');

INSERT INTO `wp_customcontactforms_fields` (`id`, `field_slug`, `field_label`, `field_type`, `field_value`, `field_maxlength`, `user_field`, `field_instructions`, `field_options`, `field_required`, `field_class`, `field_error`) VALUES
('11', 'ccf_phone', 'Your Phone Number:', 'Text', '', '30', '1', 'Please enter your phone number.', '', '0', '', ''),
('12', 'ccf_google', 'Did you find my website through Google?', 'Checkbox', 'Yes', '0', '1', 'If you found my website through Google, check this box.', '', '0', '', ''),
('13', 'ccf_contact_method', 'How should we contact you?', 'Dropdown', '', '0', '1', 'By which method we should contact you?', 'a:2:{i:0;i:1;i:1;i:2;}', '1', '', '');

--
-- Table structure for table `wp_customcontactforms_forms`
--

CREATE TABLE `wp_customcontactforms_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_slug` varchar(100) NOT NULL,
  `form_title` varchar(200) NOT NULL,
  `form_action` text NOT NULL,
  `form_method` varchar(4) NOT NULL,
  `form_fields` text NOT NULL,
  `submit_button_text` varchar(200) NOT NULL,
  `custom_code` text NOT NULL,
  `form_style` int(10) NOT NULL DEFAULT '0',
  `form_email` text NOT NULL,
  `form_success_message` text NOT NULL,
  `form_thank_you_page` varchar(200) NOT NULL,
  `form_success_title` varchar(150) NOT NULL DEFAULT 'Form Success!',
  `form_access` text NOT NULL,
  `form_email_subject` varchar(250) NOT NULL,
  `form_email_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_customcontactforms_forms`
--

INSERT INTO `wp_customcontactforms_forms` (`id`, `form_slug`, `form_title`, `form_action`, `form_method`, `form_fields`, `submit_button_text`, `custom_code`, `form_style`, `form_email`, `form_success_message`, `form_thank_you_page`, `form_success_title`, `form_access`, `form_email_subject`, `form_email_name`) VALUES
('1', 'ccf_contact_form', '', '', 'Post', 'a:7:{i:0;i:9;i:1;s:1:\"6\";i:2;s:1:\"5\";i:3;i:11;i:5;i:13;i:6;i:10;i:8;s:1:\"8\";}', 'Send', '', '1', 'me@tyrichards.com', 'Thank you for filling out our contact form. We will contact you very soon by the way you specified.', '', 'Thank You!', 'a:6:{i:0;s:13:\"Administrator\";i:1;s:6:\"Editor\";i:2;s:6:\"Author\";i:3;s:11:\"Contributor\";i:4;s:10:\"Subscriber\";i:5;s:19:\"Non-Registered User\";}', 'Referral', 'Ty Richards');

--
-- Table structure for table `wp_customcontactforms_styles`
--

CREATE TABLE `wp_customcontactforms_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style_slug` varchar(30) NOT NULL,
  `input_width` varchar(10) NOT NULL DEFAULT '200px',
  `textarea_width` varchar(10) NOT NULL DEFAULT '200px',
  `textarea_height` varchar(10) NOT NULL DEFAULT '100px',
  `form_borderwidth` varchar(10) NOT NULL DEFAULT '0px',
  `label_width` varchar(10) NOT NULL DEFAULT '200px',
  `form_width` varchar(10) NOT NULL DEFAULT '100%',
  `submit_width` varchar(10) NOT NULL DEFAULT 'auto',
  `submit_height` varchar(10) NOT NULL DEFAULT '40px',
  `label_fontsize` varchar(10) NOT NULL DEFAULT '1em',
  `title_fontsize` varchar(10) NOT NULL DEFAULT '1.2em',
  `field_fontsize` varchar(10) NOT NULL DEFAULT '1.3em',
  `submit_fontsize` varchar(10) NOT NULL DEFAULT '1.1em',
  `field_bordercolor` varchar(10) NOT NULL DEFAULT '999999',
  `form_borderstyle` varchar(30) NOT NULL DEFAULT 'none',
  `form_bordercolor` varchar(20) NOT NULL DEFAULT '',
  `field_fontcolor` varchar(20) NOT NULL DEFAULT '333333',
  `label_fontcolor` varchar(20) NOT NULL DEFAULT '333333',
  `title_fontcolor` varchar(20) NOT NULL DEFAULT '333333',
  `submit_fontcolor` varchar(20) NOT NULL DEFAULT '333333',
  `form_fontfamily` varchar(150) NOT NULL DEFAULT 'Tahoma, Verdana, Arial',
  `field_backgroundcolor` varchar(20) NOT NULL DEFAULT 'f5f5f5',
  `field_borderstyle` varchar(20) NOT NULL DEFAULT 'solid',
  `form_padding` varchar(20) NOT NULL DEFAULT '8px',
  `form_margin` varchar(20) NOT NULL DEFAULT '7px',
  `title_margin` varchar(20) NOT NULL DEFAULT '4px',
  `label_margin` varchar(20) NOT NULL DEFAULT '6px',
  `textarea_backgroundcolor` varchar(20) NOT NULL DEFAULT 'f5f5f5',
  `success_popover_bordercolor` varchar(20) NOT NULL DEFAULT 'efefef',
  `dropdown_width` varchar(20) NOT NULL DEFAULT 'auto',
  `success_popover_fontsize` varchar(20) NOT NULL DEFAULT '12px',
  `success_popover_title_fontsize` varchar(20) NOT NULL DEFAULT '1.3em',
  `success_popover_height` varchar(20) NOT NULL DEFAULT '200px',
  `success_popover_fontcolor` varchar(20) NOT NULL DEFAULT '333333',
  `success_popover_title_fontcolor` varchar(20) NOT NULL DEFAULT '333333',
  `form_backgroundcolor` varchar(20) NOT NULL DEFAULT 'ffffff',
  `field_borderround` varchar(20) NOT NULL DEFAULT '6px',
  `tooltip_backgroundcolor` varchar(20) NOT NULL DEFAULT '000000',
  `tooltip_fontsize` varchar(20) NOT NULL DEFAULT '12px',
  `tooltip_fontcolor` varchar(20) NOT NULL DEFAULT 'ffffff',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_customcontactforms_styles`
--

INSERT INTO `wp_customcontactforms_styles` (`id`, `style_slug`, `input_width`, `textarea_width`, `textarea_height`, `form_borderwidth`, `label_width`, `form_width`, `submit_width`, `submit_height`, `label_fontsize`, `title_fontsize`, `field_fontsize`, `submit_fontsize`, `field_bordercolor`, `form_borderstyle`, `form_bordercolor`, `field_fontcolor`, `label_fontcolor`, `title_fontcolor`, `submit_fontcolor`, `form_fontfamily`, `field_backgroundcolor`, `field_borderstyle`, `form_padding`, `form_margin`, `title_margin`, `label_margin`, `textarea_backgroundcolor`, `success_popover_bordercolor`, `dropdown_width`, `success_popover_fontsize`, `success_popover_title_fontsize`, `success_popover_height`, `success_popover_fontcolor`, `success_popover_title_fontcolor`, `form_backgroundcolor`, `field_borderround`, `tooltip_backgroundcolor`, `tooltip_fontsize`, `tooltip_fontcolor`) VALUES
('1', 'mail_chimp_style', '450px', '450px', '90px', '', '450px', '100%', '211px', '50px', '10px', '25px', '17px', '13px', '', 'none', '', '333333', '000000', '000000', '333333', 'Georgia, Times New Roman, Serif', 'ffffff', 'inset', '8px', '20px', '5px', '10px', 'ffffff', '333333', '450px', '10px', '25px', '200px', 'ffffff', '333333', 'ffffff', '6px', '000000', '10px', 'ffffff');

--
-- Table structure for table `wp_customcontactforms_user_data`
--

CREATE TABLE `wp_customcontactforms_user_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_time` int(11) NOT NULL DEFAULT '0',
  `data_formid` int(11) NOT NULL,
  `data_formpage` varchar(250) NOT NULL,
  `data_value` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_customcontactforms_user_data`
--

INSERT INTO `wp_customcontactforms_user_data` (`id`, `data_time`, `data_formid`, `data_formpage`, `data_value`) VALUES
('1', '1304722479', '1', 'www.tyrichards.com/test1/', 's:8:\"ccf_name\";s:8:\"fadsfads\";s:12:\"fixedWebsite\";s:25:\"http://www.tyrichards.com\";s:10:\"fixedEmail\";s:17:\"tyrichards@me.com\";s:9:\"ccf_phone\";s:10:\"8172912608\";s:18:\"ccf_contact_method\";s:8:\"By Phone\";s:11:\"ccf_message\";s:4:\"fdas\";s:10:\"ccf_google\";s:11:\"Not Checked\";'),
('2', '1304955189', '1', 'www.tyrichards.com/test1/', 's:8:\"ccf_name\";s:3:\"Bob\";s:12:\"fixedWebsite\";s:25:\"http://www.tyrichards.com\";s:10:\"fixedEmail\";s:15:\"bob@dentist.com\";s:9:\"ccf_phone\";s:10:\"8172912608\";s:18:\"ccf_contact_method\";s:8:\"By Email\";s:11:\"ccf_message\";s:8:\"fdsafdsf\";s:10:\"ccf_google\";s:11:\"Not Checked\";'),
('3', '1304956144', '1', 'www.tyrichards.com/test1/', 's:8:\"ccf_name\";s:9:\"Bob McGee\";s:12:\"fixedWebsite\";s:28:\"http://www.bobthedentist.com\";s:10:\"fixedEmail\";s:15:\"bob@dentist.com\";s:9:\"ccf_phone\";s:10:\"8172912608\";s:18:\"ccf_contact_method\";s:8:\"By Email\";s:11:\"ccf_message\";s:17:\"afdsfsdfsdfdsfsdf\";s:10:\"ccf_google\";s:11:\"Not Checked\";');

--
-- Table structure for table `wp_rg_form`
--

CREATE TABLE `wp_rg_form` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `date_created` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_rg_form`
--

INSERT INTO `wp_rg_form` (`id`, `title`, `date_created`, `is_active`) VALUES
('1', 'Send a referral', '2011-05-09 17:39:28', '1'),
('2', 'Sign Up', '2011-05-09 18:36:39', '1');

--
-- Table structure for table `wp_rg_form_meta`
--

CREATE TABLE `wp_rg_form_meta` (
  `form_id` mediumint(8) unsigned NOT NULL,
  `display_meta` longtext,
  `entries_grid_meta` longtext,
  KEY `form_id` (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_rg_form_meta`
--

INSERT INTO `wp_rg_form_meta` (`form_id`, `display_meta`, `entries_grid_meta`) VALUES
('1', 'a:34:{s:2:\"id\";i:1;s:5:\"title\";s:15:\"Send a referral\";s:11:\"description\";s:74:\"We appreciate your referrals. Thank you for entrusting your patient to us.\";s:14:\"labelPlacement\";s:9:\"top_label\";s:17:\"maxEntriesMessage\";s:0:\"\";s:12:\"confirmation\";a:6:{s:4:\"type\";s:7:\"message\";s:7:\"message\";s:172:\"<h3 class=\"gform_title\">Thank You</h3><p>Your referral has been sent.</p><a href=\"home-page\"><button class=\"message-button\" type=\"button\">Send Another Referral</button></a>\";s:3:\"url\";s:0:\"\";s:6:\"pageId\";s:0:\"\";s:11:\"queryString\";s:0:\"\";s:17:\"disableAutoformat\";b:0;}s:6:\"button\";a:3:{s:4:\"type\";s:4:\"text\";s:4:\"text\";s:4:\"Send\";s:8:\"imageUrl\";s:0:\"\";}s:6:\"fields\";a:22:{i:0;a:53:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:2;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:1;s:5:\"label\";s:12:\"Patient Name\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:4:\"name\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";a:2:{i:0;a:3:{s:2:\"id\";d:2.29999999999999982236431605997495353221893310546875;s:5:\"label\";s:5:\"First\";s:4:\"name\";s:0:\"\";}i:1;a:3:{s:2:\"id\";d:2.600000000000000088817841970012523233890533447265625;s:5:\"label\";s:4:\"Last\";s:4:\"name\";s:0:\"\";}}s:10:\"nameFormat\";s:6:\"normal\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:1;a:56:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:20;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:14:\"Minor or Adult\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:8:\"checkbox\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";a:1:{i:0;a:3:{s:2:\"id\";s:4:\"20.1\";s:5:\"label\";s:18:\"Patient is a minor\";s:4:\"name\";s:0:\"\";}}s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:7:\"choices\";a:1:{i:0;a:4:{s:4:\"text\";s:18:\"Patient is a minor\";s:5:\"value\";s:18:\"Patient is a minor\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}}s:15:\"disableQuantity\";b:0;s:17:\"enableChoiceValue\";b:0;s:16:\"conditionalLogic\";s:0:\"\";s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:2;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:21;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:13:\"Guardian Name\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:4:\"name\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";a:2:{i:0;a:3:{s:2:\"id\";d:21.300000000000000710542735760100185871124267578125;s:5:\"label\";s:5:\"First\";s:4:\"name\";s:0:\"\";}i:1;a:3:{s:2:\"id\";d:21.60000000000000142108547152020037174224853515625;s:5:\"label\";s:4:\"Last\";s:4:\"name\";s:0:\"\";}}s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:16:\"conditionalLogic\";a:3:{s:10:\"actionType\";s:4:\"show\";s:9:\"logicType\";s:3:\"any\";s:5:\"rules\";a:1:{i:0;a:3:{s:7:\"fieldId\";s:2:\"20\";s:8:\"operator\";s:2:\"is\";s:5:\"value\";s:18:\"Patient is a minor\";}}}s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:3;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:3;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:13:\"Contact Email\";s:12:\"noDuplicates\";b:0;s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:5:\"email\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;s:16:\"conditionalLogic\";s:0:\"\";}i:4;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:4;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:13:\"Contact Phone\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:5:\"phone\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:8:\"standard\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;s:16:\"conditionalLogic\";s:0:\"\";}i:5;a:55:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:24;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:18:\"Contact Preference\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:6:\"select\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:7:\"choices\";a:4:{i:0;a:4:{s:4:\"text\";s:18:\"--- Select One ---\";s:5:\"value\";s:18:\"--- Select One ---\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:1;a:4:{s:4:\"text\";s:42:\"Patient would like you to call to schedule\";s:5:\"value\";s:42:\"Patient would like you to call to schedule\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:2;a:4:{s:4:\"text\";s:43:\"Patient would like you to email to schedule\";s:5:\"value\";s:43:\"Patient would like you to email to schedule\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:3;a:4:{s:4:\"text\";s:37:\"Patient does not want to be contacted\";s:5:\"value\";s:37:\"Patient does not want to be contacted\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}}s:15:\"disableQuantity\";b:0;s:16:\"conditionalLogic\";a:3:{s:10:\"actionType\";s:4:\"hide\";s:9:\"logicType\";s:3:\"all\";s:5:\"rules\";a:1:{i:0;a:3:{s:7:\"fieldId\";s:2:\"20\";s:8:\"operator\";s:2:\"is\";s:5:\"value\";s:18:\"Patient is a minor\";}}}s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:6;a:55:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:25;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:27:\"Guardian Contact Preference\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:6:\"select\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:7:\"choices\";a:4:{i:0;a:4:{s:4:\"text\";s:18:\"--- Select One ---\";s:5:\"value\";s:18:\"--- Select One ---\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:1;a:4:{s:4:\"text\";s:43:\"Guardian would like you to call to schedule\";s:5:\"value\";s:43:\"Guardian would like you to call to schedule\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:2;a:4:{s:4:\"text\";s:44:\"Guardian would like you to email to schedule\";s:5:\"value\";s:44:\"Guardian would like you to email to schedule\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:3;a:4:{s:4:\"text\";s:38:\"Guardian does not want to be contacted\";s:5:\"value\";s:38:\"Guardian does not want to be contacted\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}}s:15:\"disableQuantity\";b:0;s:16:\"conditionalLogic\";a:3:{s:10:\"actionType\";s:4:\"show\";s:9:\"logicType\";s:3:\"all\";s:5:\"rules\";a:1:{i:0;a:3:{s:7:\"fieldId\";s:2:\"20\";s:8:\"operator\";s:2:\"is\";s:5:\"value\";s:18:\"Patient is a minor\";}}}s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:7;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:26;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:1;s:5:\"label\";s:16:\"Patient Issue(s)\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:8:\"checkbox\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";a:9:{i:0;a:3:{s:2:\"id\";s:4:\"26.1\";s:5:\"label\";s:10:\"Extraction\";s:4:\"name\";s:0:\"\";}i:1;a:3:{s:2:\"id\";s:4:\"26.2\";s:5:\"label\";s:13:\"Expose & Bond\";s:4:\"name\";s:0:\"\";}i:2;a:3:{s:2:\"id\";s:4:\"26.3\";s:5:\"label\";s:12:\"Third Molars\";s:4:\"name\";s:0:\"\";}i:3;a:3:{s:2:\"id\";s:4:\"26.4\";s:5:\"label\";s:7:\"Implant\";s:4:\"name\";s:0:\"\";}i:4;a:3:{s:2:\"id\";s:4:\"26.5\";s:5:\"label\";s:11:\"All-On-4™\";s:4:\"name\";s:0:\"\";}i:5;a:3:{s:2:\"id\";s:4:\"26.6\";s:5:\"label\";s:12:\"Orthognathic\";s:4:\"name\";s:0:\"\";}i:6;a:3:{s:2:\"id\";s:4:\"26.7\";s:5:\"label\";s:9:\"Pathology\";s:4:\"name\";s:0:\"\";}i:7;a:3:{s:2:\"id\";s:4:\"26.8\";s:5:\"label\";s:3:\"TMJ\";s:4:\"name\";s:0:\"\";}i:8;a:3:{s:2:\"id\";s:4:\"26.9\";s:5:\"label\";s:5:\"Other\";s:4:\"name\";s:0:\"\";}}s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:7:\"choices\";a:9:{i:0;a:4:{s:4:\"text\";s:10:\"Extraction\";s:5:\"value\";s:10:\"Extraction\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:1;a:4:{s:4:\"text\";s:13:\"Expose & Bond\";s:5:\"value\";s:13:\"Expose & Bond\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:2;a:4:{s:4:\"text\";s:12:\"Third Molars\";s:5:\"value\";s:12:\"Third Molars\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:3;a:4:{s:4:\"text\";s:7:\"Implant\";s:5:\"value\";s:7:\"Implant\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:4;a:4:{s:4:\"text\";s:11:\"All-On-4™\";s:5:\"value\";s:11:\"All-On-4™\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:5;a:4:{s:4:\"text\";s:12:\"Orthognathic\";s:5:\"value\";s:12:\"Orthognathic\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:6;a:4:{s:4:\"text\";s:9:\"Pathology\";s:5:\"value\";s:9:\"Pathology\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:7;a:4:{s:4:\"text\";s:3:\"TMJ\";s:5:\"value\";s:3:\"TMJ\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:8;a:4:{s:4:\"text\";s:5:\"Other\";s:5:\"value\";s:5:\"Other\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}}s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:8;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:6;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:1;s:5:\"label\";s:11:\"Other Issue\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:4:\"text\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:16:\"conditionalLogic\";a:3:{s:10:\"actionType\";s:4:\"show\";s:9:\"logicType\";s:3:\"any\";s:5:\"rules\";a:1:{i:0;a:3:{s:7:\"fieldId\";s:2:\"26\";s:8:\"operator\";s:2:\"is\";s:5:\"value\";s:5:\"Other\";}}}s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:9;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:12;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:0:\"\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:7:\"section\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:11:\"displayOnly\";b:1;s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:10;a:55:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:8;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:17:\"Primary Teeth (1)\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:8:\"checkbox\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";a:10:{i:0;a:3:{s:2:\"id\";s:3:\"8.1\";s:5:\"label\";s:1:\"A\";s:4:\"name\";s:0:\"\";}i:1;a:3:{s:2:\"id\";s:3:\"8.2\";s:5:\"label\";s:1:\"B\";s:4:\"name\";s:0:\"\";}i:2;a:3:{s:2:\"id\";s:3:\"8.3\";s:5:\"label\";s:1:\"C\";s:4:\"name\";s:0:\"\";}i:3;a:3:{s:2:\"id\";s:3:\"8.4\";s:5:\"label\";s:1:\"D\";s:4:\"name\";s:0:\"\";}i:4;a:3:{s:2:\"id\";s:3:\"8.5\";s:5:\"label\";s:1:\"E\";s:4:\"name\";s:0:\"\";}i:5;a:3:{s:2:\"id\";s:3:\"8.6\";s:5:\"label\";s:1:\"F\";s:4:\"name\";s:0:\"\";}i:6;a:3:{s:2:\"id\";s:3:\"8.7\";s:5:\"label\";s:1:\"G\";s:4:\"name\";s:0:\"\";}i:7;a:3:{s:2:\"id\";s:3:\"8.8\";s:5:\"label\";s:1:\"H\";s:4:\"name\";s:0:\"\";}i:8;a:3:{s:2:\"id\";s:3:\"8.9\";s:5:\"label\";s:1:\"I\";s:4:\"name\";s:0:\"\";}i:9;a:3:{s:2:\"id\";s:4:\"8.11\";s:5:\"label\";s:1:\"J\";s:4:\"name\";s:0:\"\";}}s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:7:\"choices\";a:10:{i:0;a:4:{s:4:\"text\";s:1:\"A\";s:5:\"value\";s:1:\"A\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:1;a:4:{s:4:\"text\";s:1:\"B\";s:5:\"value\";s:1:\"B\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:2;a:4:{s:4:\"text\";s:1:\"C\";s:5:\"value\";s:1:\"C\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:3;a:4:{s:4:\"text\";s:1:\"D\";s:5:\"value\";s:1:\"D\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:4;a:4:{s:4:\"text\";s:1:\"E\";s:5:\"value\";s:1:\"E\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:5;a:4:{s:4:\"text\";s:1:\"F\";s:5:\"value\";s:1:\"F\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:6;a:4:{s:4:\"text\";s:1:\"G\";s:5:\"value\";s:1:\"G\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:7;a:4:{s:4:\"text\";s:1:\"H\";s:5:\"value\";s:1:\"H\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:8;a:4:{s:4:\"text\";s:1:\"I\";s:5:\"value\";s:1:\"I\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:9;a:4:{s:4:\"text\";s:1:\"J\";s:5:\"value\";s:1:\"J\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}}s:15:\"disableQuantity\";b:0;s:17:\"enableChoiceValue\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:11;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:9;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:17:\"Primary Teeth (2)\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:8:\"checkbox\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";a:10:{i:0;a:3:{s:2:\"id\";s:3:\"9.1\";s:5:\"label\";s:1:\"T\";s:4:\"name\";s:0:\"\";}i:1;a:3:{s:2:\"id\";s:3:\"9.2\";s:5:\"label\";s:1:\"S\";s:4:\"name\";s:0:\"\";}i:2;a:3:{s:2:\"id\";s:3:\"9.3\";s:5:\"label\";s:1:\"R\";s:4:\"name\";s:0:\"\";}i:3;a:3:{s:2:\"id\";s:3:\"9.4\";s:5:\"label\";s:1:\"Q\";s:4:\"name\";s:0:\"\";}i:4;a:3:{s:2:\"id\";s:3:\"9.5\";s:5:\"label\";s:1:\"P\";s:4:\"name\";s:0:\"\";}i:5;a:3:{s:2:\"id\";s:3:\"9.6\";s:5:\"label\";s:1:\"O\";s:4:\"name\";s:0:\"\";}i:6;a:3:{s:2:\"id\";s:3:\"9.7\";s:5:\"label\";s:1:\"N\";s:4:\"name\";s:0:\"\";}i:7;a:3:{s:2:\"id\";s:3:\"9.8\";s:5:\"label\";s:1:\"M\";s:4:\"name\";s:0:\"\";}i:8;a:3:{s:2:\"id\";s:3:\"9.9\";s:5:\"label\";s:1:\"L\";s:4:\"name\";s:0:\"\";}i:9;a:3:{s:2:\"id\";s:4:\"9.11\";s:5:\"label\";s:1:\"K\";s:4:\"name\";s:0:\"\";}}s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:7:\"choices\";a:10:{i:0;a:4:{s:4:\"text\";s:1:\"T\";s:5:\"value\";s:1:\"T\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:1;a:4:{s:4:\"text\";s:1:\"S\";s:5:\"value\";s:1:\"S\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:2;a:4:{s:4:\"text\";s:1:\"R\";s:5:\"value\";s:1:\"R\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:3;a:4:{s:4:\"text\";s:1:\"Q\";s:5:\"value\";s:1:\"Q\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:4;a:4:{s:4:\"text\";s:1:\"P\";s:5:\"value\";s:1:\"P\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:5;a:4:{s:4:\"text\";s:1:\"O\";s:5:\"value\";s:1:\"O\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:6;a:4:{s:4:\"text\";s:1:\"N\";s:5:\"value\";s:1:\"N\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:7;a:4:{s:4:\"text\";s:1:\"M\";s:5:\"value\";s:1:\"M\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:8;a:4:{s:4:\"text\";s:1:\"L\";s:5:\"value\";s:1:\"L\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:9;a:4:{s:4:\"text\";s:1:\"K\";s:5:\"value\";s:1:\"K\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}}s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:12;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:13;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:0:\"\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:7:\"section\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:11:\"displayOnly\";b:1;s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:13;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:10;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:19:\"Secondary Teeth (1)\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:8:\"checkbox\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";a:16:{i:0;a:3:{s:2:\"id\";s:4:\"10.1\";s:5:\"label\";s:1:\"1\";s:4:\"name\";s:0:\"\";}i:1;a:3:{s:2:\"id\";s:4:\"10.2\";s:5:\"label\";s:1:\"2\";s:4:\"name\";s:0:\"\";}i:2;a:3:{s:2:\"id\";s:4:\"10.3\";s:5:\"label\";s:1:\"3\";s:4:\"name\";s:0:\"\";}i:3;a:3:{s:2:\"id\";s:4:\"10.4\";s:5:\"label\";s:1:\"4\";s:4:\"name\";s:0:\"\";}i:4;a:3:{s:2:\"id\";s:4:\"10.5\";s:5:\"label\";s:1:\"5\";s:4:\"name\";s:0:\"\";}i:5;a:3:{s:2:\"id\";s:4:\"10.6\";s:5:\"label\";s:1:\"6\";s:4:\"name\";s:0:\"\";}i:6;a:3:{s:2:\"id\";s:4:\"10.7\";s:5:\"label\";s:1:\"7\";s:4:\"name\";s:0:\"\";}i:7;a:3:{s:2:\"id\";s:4:\"10.8\";s:5:\"label\";s:1:\"8\";s:4:\"name\";s:0:\"\";}i:8;a:3:{s:2:\"id\";s:4:\"10.9\";s:5:\"label\";s:1:\"9\";s:4:\"name\";s:0:\"\";}i:9;a:3:{s:2:\"id\";s:5:\"10.11\";s:5:\"label\";s:2:\"10\";s:4:\"name\";s:0:\"\";}i:10;a:3:{s:2:\"id\";s:5:\"10.12\";s:5:\"label\";s:2:\"11\";s:4:\"name\";s:0:\"\";}i:11;a:3:{s:2:\"id\";s:5:\"10.13\";s:5:\"label\";s:2:\"12\";s:4:\"name\";s:0:\"\";}i:12;a:3:{s:2:\"id\";s:5:\"10.14\";s:5:\"label\";s:2:\"13\";s:4:\"name\";s:0:\"\";}i:13;a:3:{s:2:\"id\";s:5:\"10.15\";s:5:\"label\";s:2:\"14\";s:4:\"name\";s:0:\"\";}i:14;a:3:{s:2:\"id\";s:5:\"10.16\";s:5:\"label\";s:2:\"15\";s:4:\"name\";s:0:\"\";}i:15;a:3:{s:2:\"id\";s:5:\"10.17\";s:5:\"label\";s:2:\"16\";s:4:\"name\";s:0:\"\";}}s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:7:\"choices\";a:16:{i:0;a:4:{s:4:\"text\";s:1:\"1\";s:5:\"value\";s:1:\"1\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:1;a:4:{s:4:\"text\";s:1:\"2\";s:5:\"value\";s:1:\"2\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:2;a:4:{s:4:\"text\";s:1:\"3\";s:5:\"value\";s:1:\"3\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:3;a:4:{s:4:\"text\";s:1:\"4\";s:5:\"value\";s:1:\"4\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:4;a:4:{s:4:\"text\";s:1:\"5\";s:5:\"value\";s:1:\"5\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:5;a:4:{s:4:\"text\";s:1:\"6\";s:5:\"value\";s:1:\"6\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:6;a:4:{s:4:\"text\";s:1:\"7\";s:5:\"value\";s:1:\"7\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:7;a:4:{s:4:\"text\";s:1:\"8\";s:5:\"value\";s:1:\"8\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:8;a:4:{s:4:\"text\";s:1:\"9\";s:5:\"value\";s:1:\"9\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:9;a:4:{s:4:\"text\";s:2:\"10\";s:5:\"value\";s:2:\"10\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:10;a:4:{s:4:\"text\";s:2:\"11\";s:5:\"value\";s:2:\"11\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:11;a:4:{s:4:\"text\";s:2:\"12\";s:5:\"value\";s:2:\"12\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:12;a:4:{s:4:\"text\";s:2:\"13\";s:5:\"value\";s:2:\"13\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:13;a:4:{s:4:\"text\";s:2:\"14\";s:5:\"value\";s:2:\"14\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:14;a:4:{s:4:\"text\";s:2:\"15\";s:5:\"value\";s:2:\"15\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:15;a:4:{s:4:\"text\";s:2:\"16\";s:5:\"value\";s:2:\"16\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}}s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:14;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:11;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:19:\"Secondary Teeth (2)\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:8:\"checkbox\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";a:16:{i:0;a:3:{s:2:\"id\";s:4:\"11.1\";s:5:\"label\";s:2:\"32\";s:4:\"name\";s:0:\"\";}i:1;a:3:{s:2:\"id\";s:4:\"11.2\";s:5:\"label\";s:2:\"31\";s:4:\"name\";s:0:\"\";}i:2;a:3:{s:2:\"id\";s:4:\"11.3\";s:5:\"label\";s:2:\"30\";s:4:\"name\";s:0:\"\";}i:3;a:3:{s:2:\"id\";s:4:\"11.4\";s:5:\"label\";s:2:\"29\";s:4:\"name\";s:0:\"\";}i:4;a:3:{s:2:\"id\";s:4:\"11.5\";s:5:\"label\";s:2:\"28\";s:4:\"name\";s:0:\"\";}i:5;a:3:{s:2:\"id\";s:4:\"11.6\";s:5:\"label\";s:2:\"27\";s:4:\"name\";s:0:\"\";}i:6;a:3:{s:2:\"id\";s:4:\"11.7\";s:5:\"label\";s:2:\"26\";s:4:\"name\";s:0:\"\";}i:7;a:3:{s:2:\"id\";s:4:\"11.8\";s:5:\"label\";s:2:\"25\";s:4:\"name\";s:0:\"\";}i:8;a:3:{s:2:\"id\";s:4:\"11.9\";s:5:\"label\";s:2:\"24\";s:4:\"name\";s:0:\"\";}i:9;a:3:{s:2:\"id\";s:5:\"11.11\";s:5:\"label\";s:2:\"23\";s:4:\"name\";s:0:\"\";}i:10;a:3:{s:2:\"id\";s:5:\"11.12\";s:5:\"label\";s:2:\"22\";s:4:\"name\";s:0:\"\";}i:11;a:3:{s:2:\"id\";s:5:\"11.13\";s:5:\"label\";s:2:\"21\";s:4:\"name\";s:0:\"\";}i:12;a:3:{s:2:\"id\";s:5:\"11.14\";s:5:\"label\";s:2:\"20\";s:4:\"name\";s:0:\"\";}i:13;a:3:{s:2:\"id\";s:5:\"11.15\";s:5:\"label\";s:2:\"19\";s:4:\"name\";s:0:\"\";}i:14;a:3:{s:2:\"id\";s:5:\"11.16\";s:5:\"label\";s:2:\"18\";s:4:\"name\";s:0:\"\";}i:15;a:3:{s:2:\"id\";s:5:\"11.17\";s:5:\"label\";s:2:\"17\";s:4:\"name\";s:0:\"\";}}s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:7:\"choices\";a:16:{i:0;a:4:{s:4:\"text\";s:2:\"32\";s:5:\"value\";s:2:\"32\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:1;a:4:{s:4:\"text\";s:2:\"31\";s:5:\"value\";s:2:\"31\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:2;a:4:{s:4:\"text\";s:2:\"30\";s:5:\"value\";s:2:\"30\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:3;a:4:{s:4:\"text\";s:2:\"29\";s:5:\"value\";s:2:\"29\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:4;a:4:{s:4:\"text\";s:2:\"28\";s:5:\"value\";s:2:\"28\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:5;a:4:{s:4:\"text\";s:2:\"27\";s:5:\"value\";s:2:\"27\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:6;a:4:{s:4:\"text\";s:2:\"26\";s:5:\"value\";s:2:\"26\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:7;a:4:{s:4:\"text\";s:2:\"25\";s:5:\"value\";s:2:\"25\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:8;a:4:{s:4:\"text\";s:2:\"24\";s:5:\"value\";s:2:\"24\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:9;a:4:{s:4:\"text\";s:2:\"23\";s:5:\"value\";s:2:\"23\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:10;a:4:{s:4:\"text\";s:2:\"22\";s:5:\"value\";s:2:\"22\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:11;a:4:{s:4:\"text\";s:2:\"21\";s:5:\"value\";s:2:\"21\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:12;a:4:{s:4:\"text\";s:2:\"20\";s:5:\"value\";s:2:\"20\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:13;a:4:{s:4:\"text\";s:2:\"19\";s:5:\"value\";s:2:\"19\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:14;a:4:{s:4:\"text\";s:2:\"18\";s:5:\"value\";s:2:\"18\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}i:15;a:4:{s:4:\"text\";s:2:\"17\";s:5:\"value\";s:2:\"17\";s:10:\"isSelected\";b:0;s:5:\"price\";s:0:\"\";}}s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:15;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:14;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:0:\"\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:7:\"section\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:11:\"displayOnly\";b:1;s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:16;a:53:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:15;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:14:\"Upload File(s)\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:10:\"fileupload\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:17;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:16;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:0:\"\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:10:\"fileupload\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;s:16:\"conditionalLogic\";s:0:\"\";}i:18;a:53:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:17;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:0:\"\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:10:\"fileupload\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:19;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:18;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:0:\"\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:10:\"fileupload\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:16:\"conditionalLogic\";s:0:\"\";s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:20;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:19;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:0:\"\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:7:\"section\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:11:\"displayOnly\";b:1;s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}i:21;a:53:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:7;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:18:\"Remarks (optional)\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:5:\"small\";s:4:\"type\";s:8:\"textarea\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:1;s:10:\"pageNumber\";i:1;}}s:22:\"useCurrentUserAsAuthor\";b:1;s:8:\"cssClass\";s:13:\"gform_heading\";s:14:\"enableHoneypot\";b:0;s:15:\"enableAnimation\";b:0;s:26:\"postContentTemplateEnabled\";b:0;s:24:\"postTitleTemplateEnabled\";b:0;s:17:\"postTitleTemplate\";s:0:\"\";s:19:\"postContentTemplate\";s:0:\"\";s:14:\"lastPageButton\";N;s:10:\"pagination\";N;s:17:\"firstPageCssClass\";N;s:12:\"limitEntries\";b:0;s:17:\"limitEntriesCount\";s:0:\"\";s:19:\"limitEntriesMessage\";s:0:\"\";s:12:\"scheduleForm\";b:0;s:13:\"scheduleStart\";s:0:\"\";s:17:\"scheduleStartHour\";s:0:\"\";s:19:\"scheduleStartMinute\";s:0:\"\";s:17:\"scheduleStartAmpm\";s:0:\"\";s:11:\"scheduleEnd\";s:0:\"\";s:15:\"scheduleEndHour\";s:0:\"\";s:17:\"scheduleEndMinute\";s:0:\"\";s:15:\"scheduleEndAmpm\";s:0:\"\";s:15:\"scheduleMessage\";s:0:\"\";s:12:\"notification\";a:12:{s:2:\"to\";s:30:\"info@laketravisoralsurgery.com\";s:7:\"subject\";s:42:\"New referral sent from {user:display_name}\";s:7:\"message\";s:226:\"You have received a new referral from {user:user_login}.\r\n\r\nInformation is below:\r\n\r\n<div stye=\"width: 600px; background-color: #eeeeee;\">\r\n{all_fields}\r\n</div>\r\n\r\n\r\n— This message was sent to you from your Referrals account\";s:3:\"bcc\";s:0:\"\";s:4:\"from\";s:30:\"info@laketravisoralsurgery.com\";s:9:\"fromField\";s:0:\"\";s:8:\"fromName\";s:9:\"Referrals\";s:13:\"fromNameField\";s:0:\"\";s:7:\"replyTo\";s:0:\"\";s:12:\"replyToField\";s:0:\"\";s:7:\"routing\";N;s:17:\"disableAutoformat\";s:0:\"\";}s:13:\"autoResponder\";a:8:{s:7:\"toField\";s:1:\"3\";s:3:\"bcc\";s:0:\"\";s:8:\"fromName\";s:24:\"Lake Travis Oral Surgery\";s:4:\"from\";s:30:\"info@laketravisoralsurgery.com\";s:7:\"replyTo\";s:0:\"\";s:7:\"subject\";s:51:\"Welcome to Lake Travis Oral & Maxillofacial Surgery\";s:7:\"message\";s:39546:\"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html>\r\n    <head>\r\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n        \r\n        <!-- Facebook sharing information tags -->\r\n        <meta property=\"og:title\" content=\"*|MC:SUBJECT|*\">\r\n        \r\n        <title>Welcome to Lake Travis Oral & Maxillofacial Surgery</title>\r\n		\r\n	<style type=\"text/css\">\r\n		#outlook a{\r\n			padding:0;\r\n		}\r\n		body{\r\n			width:100% !important;\r\n		}\r\n		.ReadMsgBody{\r\n			width:100%;\r\n		}\r\n		.ExternalClass{\r\n			width:100%;\r\n		}\r\n		body{\r\n			-webkit-text-size-adjust:none;\r\n		}\r\n		body{\r\n			margin:0;\r\n			padding:0;\r\n		}\r\n		img{\r\n			border:0;\r\n			height:auto;\r\n			line-height:100%;\r\n			outline:none;\r\n			text-decoration:none;\r\n		}\r\n		table td{\r\n			border-collapse:collapse;\r\n		}\r\n		#backgroundTable{\r\n			height:100% !important;\r\n			margin:0;\r\n			padding:0;\r\n			width:100% !important;\r\n		}\r\n	/*\r\n	@tab Page\r\n	@section background color\r\n	@tip Set the background color for your email. You may want to choose one that matches your company\'s branding.\r\n	@theme page\r\n	*/\r\n		body,#backgroundTable{\r\n			/*@editable*/background-color:#FAFAFA;\r\n		}\r\n	/*\r\n	@tab Page\r\n	@section email border\r\n	@tip Set the border for your email.\r\n	*/\r\n		#templateContainer{\r\n			/*@editable*/border:1px none #ffff00;\r\n		}\r\n	/*\r\n	@tab Page\r\n	@section heading 1\r\n	@tip Set the styling for all first-level headings in your emails. These should be the largest of your headings.\r\n	@style heading 1\r\n	*/\r\n		h1,.h1{\r\n			/*@editable*/color:#202020;\r\n			/*@editable*/display:block;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:34px;\r\n			/*@editable*/font-weight:bold;\r\n			/*@editable*/line-height:100%;\r\n			/*@editable*/margin-top:0;\r\n			/*@editable*/margin-right:0;\r\n			/*@editable*/margin-bottom:10px;\r\n			/*@editable*/margin-left:0;\r\n			/*@editable*/text-align:left;\r\n		}\r\n	/*\r\n	@tab Page\r\n	@section heading 2\r\n	@tip Set the styling for all second-level headings in your emails.\r\n	@style heading 2\r\n	*/\r\n		h2,.h2{\r\n			/*@editable*/color:#202020;\r\n			/*@editable*/display:block;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:30px;\r\n			/*@editable*/font-weight:bold;\r\n			/*@editable*/line-height:100%;\r\n			/*@editable*/margin-top:0;\r\n			/*@editable*/margin-right:0;\r\n			/*@editable*/margin-bottom:10px;\r\n			/*@editable*/margin-left:0;\r\n			/*@editable*/text-align:left;\r\n		}\r\n	/*\r\n	@tab Page\r\n	@section heading 3\r\n	@tip Set the styling for all third-level headings in your emails.\r\n	@style heading 3\r\n	*/\r\n		h3,.h3{\r\n			/*@editable*/color:#202020;\r\n			/*@editable*/display:block;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:26px;\r\n			/*@editable*/font-weight:bold;\r\n			/*@editable*/line-height:100%;\r\n			/*@editable*/margin-top:0;\r\n			/*@editable*/margin-right:0;\r\n			/*@editable*/margin-bottom:10px;\r\n			/*@editable*/margin-left:0;\r\n			/*@editable*/text-align:left;\r\n		}\r\n	/*\r\n	@tab Page\r\n	@section heading 4\r\n	@tip Set the styling for all fourth-level headings in your emails. These should be the smallest of your headings.\r\n	@style heading 4\r\n	*/\r\n		h4,.h4{\r\n			/*@editable*/color:#202020;\r\n			/*@editable*/display:block;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:22px;\r\n			/*@editable*/font-weight:bold;\r\n			/*@editable*/line-height:100%;\r\n			/*@editable*/margin-top:0;\r\n			/*@editable*/margin-right:0;\r\n			/*@editable*/margin-bottom:10px;\r\n			/*@editable*/margin-left:0;\r\n			/*@editable*/text-align:left;\r\n		}\r\n	/*\r\n	@tab Header\r\n	@section preheader style\r\n	@tip Set the background color for your email\'s preheader area.\r\n	@theme page\r\n	*/\r\n		#templatePreheader{\r\n			/*@editable*/background-color:#eae6cb;;\r\n		}\r\n	/*\r\n	@tab Header\r\n	@section preheader text\r\n	@tip Set the styling for your email\'s preheader text. Choose a size and color that is easy to read.\r\n	*/\r\n		.preheaderContent div{\r\n			/*@editable*/color:#505048;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:10px;\r\n			/*@editable*/line-height:150%;\r\n			/*@editable*/text-align:left;\r\n		}\r\n	/*\r\n	@tab Header\r\n	@section preheader link\r\n	@tip Set the styling for your email\'s preheader links. Choose a color that helps them stand out from your text.\r\n	*/\r\n		.preheaderContent div a:link,.preheaderContent div a:visited,.preheaderContent div a .yshortcuts {\r\n			/*@editable*/color:#336699;\r\n			/*@editable*/font-weight:normal;\r\n			/*@editable*/text-decoration:underline;\r\n		}\r\n	/*\r\n	@tab Header\r\n	@section header style\r\n	@tip Set the background color and border for your email\'s header area.\r\n	@theme header\r\n	*/\r\n		#templateHeader{\r\n			/*@editable*/background-color:#648409;\r\n			/*@editable*/border-bottom:10px solid #eae6cb;\r\n		}\r\n	/*\r\n	@tab Header\r\n	@section header text\r\n	@tip Set the styling for your email\'s header text. Choose a size and color that is easy to read.\r\n	*/\r\n		.headerContent{\r\n			/*@editable*/color:#d2e0aa;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:16px;\r\n			/*@editable*/font-weight:bold;\r\n			/*@editable*/line-height:100%;\r\n			/*@editable*/padding:0;\r\n			/*@editable*/text-align:left;\r\n			/*@editable*/vertical-align:middle;\r\n		}\r\n	/*\r\n	@tab Header\r\n	@section header link\r\n	@tip Set the styling for your email\'s header links. Choose a color that helps them stand out from your text.\r\n	*/\r\n		.headerContent a:link,.headerContent a:visited,.headerContent a .yshortcuts {\r\n			/*@editable*/color:#336699;\r\n			/*@editable*/font-weight:normal;\r\n			/*@editable*/text-decoration:underline;\r\n		}\r\n	/*\r\n	@editable\r\n	*/\r\n		#headerImage{\r\n			/*@editable*/height:auto;\r\n			/*@editable*/max-width:600px;\r\n		}\r\n	/*\r\n	@tab Body\r\n	@section body style\r\n	@tip Set the background color for your email\'s body area.\r\n	*/\r\n		#templateContainer,.bodyContent,.fullWidthBandContent{\r\n			/*@editable*/background-color:#FFFFFF;\r\n		}\r\n	/*\r\n	@tab Body\r\n	@section body text\r\n	@tip Set the styling for your email\'s main content text. Choose a size and color that is easy to read.\r\n	@theme main\r\n	*/\r\n		.bodyContent div,.fullWidthBandContent div{\r\n			/*@editable*/color:#505050;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:13px;\r\n			/*@editable*/line-height:150%;\r\n			/*@editable*/text-align:left;\r\n		}\r\n	/*\r\n	@tab Body\r\n	@section body link\r\n	@tip Set the styling for your email\'s main content links. Choose a color that helps them stand out from your text.\r\n	*/\r\n		.bodyContent div a:link,.bodyContent div a:visited,.bodyContent div a .yshortcuts ,.fullWidthBandContent div a:link,.fullWidthBandContent div a:visited,.fullWidthBandContent div a .yshortcuts {\r\n			/*@editable*/color:#336699;\r\n			/*@editable*/font-weight:normal;\r\n			/*@editable*/text-decoration:underline;\r\n		}\r\n	/*\r\n	@editable\r\n	*/\r\n		.bodyContent img,.fullWidthBandContent img{\r\n			/*@editable*/display:inline;\r\n			/*@editable*/height:auto;\r\n		}\r\n	/*\r\n	@tab Sidebar\r\n	@section sidebar style\r\n	@tip Set the background color for your email\'s sidebar area.\r\n	*/\r\n		#templateSidebar{\r\n			/*@editable*/background-color:#dbdbdb;\r\n		}\r\n	/*\r\n	@tab Sidebar\r\n	@section sidebar text\r\n	@tip Set the styling for your email\'s sidebar text. Choose a size and color that is easy to read.\r\n	*/\r\n		.sidebarContent div{\r\n			/*@editable*/color:#505048;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:12px;\r\n			/*@editable*/line-height:150%;\r\n			/*@editable*/text-align:left;\r\n		}\r\n	/*\r\n	@tab Sidebar\r\n	@section sidebar link\r\n	@tip Set the styling for your email\'s sidebar links. Choose a color that helps them stand out from your text.\r\n	*/\r\n		.sidebarContent div a:link,.sidebarContent div a:visited,.sidebarContent div a .yshortcuts {\r\n			/*@editable*/color:#336699;\r\n			/*@editable*/font-weight:normal;\r\n			/*@editable*/text-decoration:underline;\r\n		}\r\n	/*\r\n	@editable\r\n	*/\r\n		.sidebarContent img{\r\n			/*@editable*/display:inline;\r\n			/*@editable*/height:auto;\r\n		}\r\n	/*\r\n	@tab Middle Columns\r\n	@section left column text\r\n	@tip Set the styling for your email\'s left column text. Choose a size and color that is easy to read.\r\n	*/\r\n		.leftMidColumnContent{\r\n			/*@editable*/background-color:#f0f0f0;\r\n		}\r\n	/*\r\n	@tab Middle Columns\r\n	@section left column text\r\n	@tip Set the styling for your email\'s left column text. Choose a size and color that is easy to read.\r\n	*/\r\n		.leftMidColumnContent div{\r\n			/*@editable*/color:#505048;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:13px;\r\n			/*@editable*/line-height:150%;\r\n			/*@editable*/text-align:left;\r\n		}\r\n	/*\r\n	@tab Middle Columns\r\n	@section left column link\r\n	@tip Set the styling for your email\'s left column links. Choose a color that helps them stand out from your text.\r\n	*/\r\n		.leftMidColumnContent div a:link,.leftMidColumnContent div a:visited,.leftMidColumnContent div a .yshortcuts {\r\n			/*@editable*/color:#336699;\r\n			/*@editable*/font-weight:normal;\r\n			/*@editable*/text-decoration:underline;\r\n		}\r\n	/*\r\n	@editable\r\n	*/\r\n		.leftMidColumnContent img{\r\n			/*@editable*/display:inline;\r\n			/*@editable*/height:auto;\r\n		}\r\n	/*\r\n	@tab Middle Columns\r\n	@section right column text\r\n	@tip Set the styling for your email\'s right column text. Choose a size and color that is easy to read.\r\n	*/\r\n		.rightMidColumnContent{\r\n			/*@editable*/background-color:#f0f0f0;\r\n		}\r\n	/*\r\n	@tab Middle Columns\r\n	@section right column text\r\n	@tip Set the styling for your email\'s right column text. Choose a size and color that is easy to read.\r\n	*/\r\n		.rightMidColumnContent div{\r\n			/*@editable*/color:#505048;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:13px;\r\n			/*@editable*/line-height:150%;\r\n			/*@editable*/text-align:left;\r\n		}\r\n	/*\r\n	@tab Middle Columns\r\n	@section right column link\r\n	@tip Set the styling for your email\'s right column links. Choose a color that helps them stand out from your text.\r\n	*/\r\n		.rightMidColumnContent div a:link,.rightMidColumnContent div a:visited,.rightMidColumnContent div a .yshortcuts {\r\n			/*@editable*/color:#336699;\r\n			/*@editable*/font-weight:normal;\r\n			/*@editable*/text-decoration:underline;\r\n		}\r\n	/*\r\n	@editable\r\n	*/\r\n		.rightMidColumnContent img{\r\n			/*@editable*/display:inline;\r\n			/*@editable*/height:auto;\r\n		}\r\n	/*\r\n	@tab Lower Columns\r\n	@section left column text\r\n	@tip Set the styling for your email\'s left column text. Choose a size and color that is easy to read.\r\n	*/\r\n		.leftLowerColumnContent{\r\n			/*@editable*/background-color:#f0f0f0;\r\n		}\r\n	/*\r\n	@tab Lower Columns\r\n	@section left column text\r\n	@tip Set the styling for your email\'s left column text. Choose a size and color that is easy to read.\r\n	*/\r\n		.leftLowerColumnContent div{\r\n			/*@editable*/color:#505048;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:13px;\r\n			/*@editable*/line-height:150%;\r\n			/*@editable*/text-align:left;\r\n		}\r\n	/*\r\n	@tab Lower Columns\r\n	@section left column link\r\n	@tip Set the styling for your email\'s left column links. Choose a color that helps them stand out from your text.\r\n	*/\r\n		.leftLowerColumnContent div a:link,.leftLowerColumnContent div a:visited,.leftLowerColumnContent div a .yshortcuts {\r\n			/*@editable*/color:#336699;\r\n			/*@editable*/font-weight:normal;\r\n			/*@editable*/text-decoration:underline;\r\n		}\r\n	/*\r\n	@editable\r\n	*/\r\n		.leftLowerColumnContent img{\r\n			/*@editable*/display:inline;\r\n			/*@editable*/height:auto;\r\n		}\r\n	/*\r\n	@tab Lower Columns\r\n	@section center column text\r\n	@tip Set the styling for your email\'s center column text. Choose a size and color that is easy to read.\r\n	*/\r\n		.centerLowerColumnContent{\r\n			/*@editable*/background-color:#f0f0f0;\r\n		}\r\n	/*\r\n	@tab Lower Columns\r\n	@section center column text\r\n	@tip Set the styling for your email\'s center column text. Choose a size and color that is easy to read.\r\n	*/\r\n		.centerLowerColumnContent div{\r\n			/*@editable*/color:#505048;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:13px;\r\n			/*@editable*/line-height:150%;\r\n			/*@editable*/text-align:left;\r\n		}\r\n	/*\r\n	@tab Lower Columns\r\n	@section center column link\r\n	@tip Set the styling for your email\'s center column links. Choose a color that helps them stand out from your text.\r\n	*/\r\n		.centerLowerColumnContent div a:link,.centerLowerColumnContent div a:visited,.centerLowerColumnContent div a .yshortcuts {\r\n			/*@editable*/color:#336699;\r\n			/*@editable*/font-weight:normal;\r\n			/*@editable*/text-decoration:underline;\r\n		}\r\n	/*\r\n	@editable\r\n	*/\r\n		.centerLowerColumnContent img{\r\n			/*@editable*/display:inline;\r\n			/*@editable*/height:auto;\r\n		}\r\n	/*\r\n	@tab Lower Columns\r\n	@section right column text\r\n	@tip Set the styling for your email\'s right column text. Choose a size and color that is easy to read.\r\n	*/\r\n		.rightLowerColumnContent{\r\n			/*@editable*/background-color:#f0f0f0;\r\n		}\r\n	/*\r\n	@tab Lower Columns\r\n	@section right column text\r\n	@tip Set the styling for your email\'s right column text. Choose a size and color that is easy to read.\r\n	*/\r\n		.rightLowerColumnContent div{\r\n			/*@editable*/color:#505048;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:13px;\r\n			/*@editable*/line-height:150%;\r\n			/*@editable*/text-align:left;\r\n		}\r\n	/*\r\n	@tab Lower Columns\r\n	@section right column link\r\n	@tip Set the styling for your email\'s right column links. Choose a color that helps them stand out from your text.\r\n	*/\r\n		.rightLowerColumnContent div a:link,.rightLowerColumnContent div a:visited,.rightLowerColumnContent div a .yshortcuts {\r\n			/*@editable*/color:#336699;\r\n			/*@editable*/font-weight:normal;\r\n			/*@editable*/text-decoration:underline;\r\n		}\r\n	/*\r\n	@editable\r\n	*/\r\n		.rightLowerColumnContent img{\r\n			/*@editable*/display:inline;\r\n			/*@editable*/height:auto;\r\n		}\r\n	/*\r\n	@tab Footer\r\n	@section footer style\r\n	@tip Set the background color and top border for your email\'s footer area.\r\n	@theme footer\r\n	*/\r\n		#templateFooter{\r\n			/*@editable*/background-color:#d5cea0;\r\n			/*@editable*/border-top:20px solid #eae6cb;;\r\n		}\r\n	/*\r\n	@tab Footer\r\n	@section footer text\r\n	@tip Set the styling for your email\'s footer text. Choose a size and color that is easy to read.\r\n	@theme footer\r\n	*/\r\n		.footerContent div{\r\n			/*@editable*/color:#ffffff;\r\n			/*@editable*/font-family:Arial;\r\n			/*@editable*/font-size:12px;\r\n			/*@editable*/line-height:125%;\r\n			/*@editable*/text-align:left;\r\n		}\r\n	/*\r\n	@tab Footer\r\n	@section footer link\r\n	@tip Set the styling for your email\'s footer links. Choose a color that helps them stand out from your text.\r\n	*/\r\n		.footerContent div a:link,.footerContent div a:visited,.footerContent div a .yshortcuts {\r\n			/*@editable*/color:#336699;\r\n			/*@editable*/font-weight:normal;\r\n			/*@editable*/text-decoration:underline;\r\n		}\r\n	/*\r\n	@editable\r\n	*/\r\n		.footerContent img{\r\n			/*@editable*/display:inline;\r\n		}\r\n	/*\r\n	@tab Footer\r\n	@section social bar style\r\n	@tip Set the background color and border for your email\'s footer social bar.\r\n	@theme footer\r\n	*/\r\n		#social{\r\n			/*@editable*/background-color:#505048;\r\n			/*@editable*/border:0;\r\n		}\r\n	/*\r\n	@tab Footer\r\n	@section social bar style\r\n	@tip Set the background color and border for your email\'s footer social bar.\r\n	*/\r\n		#social div{\r\n			/*@editable*/text-align:center;\r\n		}\r\n	/*\r\n	@tab Footer\r\n	@section utility bar style\r\n	@tip Set the background color and border for your email\'s footer utility bar.\r\n	@theme footer\r\n	*/\r\n		#utility{\r\n			/*@editable*/background-color:#d5cea0;\r\n			/*@editable*/border:0px none #b1c184;\r\n		}\r\n	/*\r\n	@tab Footer\r\n	@section utility bar style\r\n	@tip Set the background color and border for your email\'s footer utility bar.\r\n	*/\r\n		#utility div{\r\n			/*@editable*/text-align:center;\r\n		}\r\n	/*\r\n	@editable\r\n	*/\r\n		#monkeyRewards img{\r\n			/*@editable*/max-width:190px;\r\n		}\r\n		body,#backgroundTable{\r\n			background-color:#eae6cb;\r\n		}\r\n		h1,.h1{\r\n			color:#505048;\r\n			font-size:36px;\r\n		}\r\n		h2,.h2{\r\n			color:#505048;\r\n		}\r\n		h3,.h3{\r\n			color:#505048;\r\n		}\r\n		h4,.h4{\r\n			color:#505048;\r\n		}\r\n		.preheaderContent div a:link,.preheaderContent div a:visited,.preheaderContent div a .yshortcuts{\r\n			color:#505048;\r\n			text-decoration:underline;\r\n			font-weight:bold;\r\n		}\r\n		.headerContent a:link,.headerContent a:visited,.headerContent a .yshortcuts{\r\n			color:#d2e0aa;\r\n			font-weight:bold;\r\n		}\r\n		#templateContainer,.bodyContent,.fullWidthBandContent{\r\n			background-color:#f0f0f0;\r\n		}\r\n		.bodyContent div,.fullWidthBandContent div{\r\n			color:#505048;\r\n			font-size:13px;\r\n			line-height:150%;\r\n		}\r\n		.bodyContent div a:link,.bodyContent div a:visited,.bodyContent div a .yshortcuts ,.fullWidthBandContent div a:link,.fullWidthBandContent div a:visited,.fullWidthBandContent div a .yshortcuts{\r\n			color:#015176;\r\n			text-decoration:underline;\r\n		}\r\n		.leftMidColumnContent div a:link,.leftMidColumnContent div a:visited,.leftMidColumnContent div a .yshortcuts{\r\n			color:#015176;\r\n		}\r\n		.rightMidColumnContent div a:link,.rightMidColumnContent div a:visited,.rightMidColumnContent div a .yshortcuts{\r\n			color:#015176;\r\n		}\r\n		.leftLowerColumnContent div a:link,.leftLowerColumnContent div a:visited,.leftLowerColumnContent div a .yshortcuts{\r\n			color:#015176;\r\n		}\r\n		.centerLowerColumnContent div a:link,.centerLowerColumnContent div a:visited,.centerLowerColumnContent div a .yshortcuts{\r\n			color:#015176;\r\n		}\r\n		.rightLowerColumnContent div a:link,.rightLowerColumnContent div a:visited,.rightLowerColumnContent div a .yshortcuts{\r\n			color:#015176;\r\n		}\r\n		.footerContent div a:link,.footerContent div a:visited,.footerContent div a .yshortcuts{\r\n			color:#ffffff;\r\n			font-weight:bold;\r\n			text-decoration:none;\r\n		}\r\n.style1 {color: #505048}\r\n    </style></head>\r\n    <body leftmargin=\"0\" marginwidth=\"0\" topmargin=\"0\" marginheight=\"0\" offset=\"0\">\r\n    	<center>\r\n        	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" id=\"backgroundTable\">\r\n            	<tr>\r\n                	<td align=\"center\" valign=\"top\">\r\n                        <!-- // Begin Template Preheader \\\\ -->\r\n                        <table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"600\" id=\"templatePreheader\">\r\n                            <tr>\r\n                                <td valign=\"top\" class=\"preheaderContent\">\r\n                                \r\n                                	<!-- // Begin Module: Standard Preheader \\ -->\r\n                                    <table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"100%\">\r\n                                    	<tr>\r\n                                        	<td valign=\"top\">\r\n                                            	<div mc:edit=\"std_preheader_content\">\r\n                                                	 This email was sent because you have requested more information about<br />\r\n                                                	 Lake Travis Oral & Maxillofacial Surgery from your physician.\r\n                                           	    </div>\r\n                                          </td>\r\n                                            <!-- *|IFNOT:ARCHIVE_PAGE|* -->\r\n											<td valign=\"top\" width=\"190\">\r\n                                            	<div mc:edit=\"std_preheader_links\">\r\n                                                	Is this email not displaying correctly?<br><a href=\"http://www.laketravisoralsurgery.net/referrals/wp-content/themes/toolbox/email-images/ltos_patient_email.html\" target=\"_blank\">View it in your browser</a>.\r\n                                                </div>\r\n                                            </td>\r\n											<!-- *|END:IF|* -->\r\n                                        </tr>\r\n                                    </table>\r\n                                	<!-- // End Module: Standard Preheader \\ -->\r\n                                \r\n                                </td>\r\n                            </tr>\r\n                        </table>\r\n                        <!-- // End Template Preheader \\\\ -->\r\n                    	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" id=\"templateContainer\">\r\n                        	<tr>\r\n                            	<td align=\"center\" valign=\"top\">\r\n                                    <!-- // Begin Template Header \\\\ -->\r\n                                	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" id=\"templateHeader\">\r\n                                        <tr>\r\n                                            <td class=\"headerContent\">\r\n                                            \r\n                                            	<!-- // Begin Module: Standard Header Image \\\\ -->\r\n                                            	<a href=\"http://laketravisoralsurgery.com\"><img src=\"http://www.laketravisoralsurgery.net/referrals/wp-content/themes/toolbox/email-images/email_header.jpg\" style=\"max-width:600px;\" id=\"headerImage campaign-icon\" mc:label=\"header_image\" mc:edit=\"header_image\" mc:allowdesigner mc:allowtext></a>\r\n                                            	<!-- // End Module: Standard Header Image \\\\ -->                                            </td>\r\n                                      </tr>\r\n                                    </table>\r\n                                    <!-- // End Template Header \\\\ -->\r\n                                </td>\r\n                            </tr>\r\n                        	<tr>\r\n                            	<td align=\"center\" valign=\"top\">\r\n                                    <!-- // Begin Template Body \\\\ -->\r\n                                	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" id=\"templateBody\">\r\n                                    	<tr>\r\n                                        	<td valign=\"top\" width=\"380\">\r\n                                            	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"380\">\r\n                                                	<tr>\r\n                                                    	<td valign=\"top\">\r\n                                                        	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"380\">\r\n                                                            	<tr>\r\n                                                                	<td valign=\"top\" class=\"bodyContent\">\r\n                                                        \r\n                                                                        <!-- // Begin Module: Standard Content \\\\ -->\r\n                                                                        <table border=\"0\" cellpadding=\"20\" cellspacing=\"0\" width=\"100%\">\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\">\r\n						                                                            <div mc:edit=\"std_content00\"><div>\r\n	<h3 class=\"h3\" style=\"color: #505048;display: block;font-family: Arial;font-size: 26px;font-weight: bold;line-height: 100%;margin-top: 0;margin-right: 0;margin-bottom: 10px;margin-left: 0;text-align: left;\">Hello {Patient Name (First):2.3},</h3>\r\n	You have been referred to our practice by {user:user_login}.  We hope to help you in any way we can.  First let us tell you a little about Dr. Jeff Alford.  He is a board certified specialist in oral & maxillofacial surgery.  Dr. Alford graduated from the University of Texas prior to attending Baylor College of Dentistry, one of the nation\'s leading dental schools.   He completed his residency at the University of Texas Health Science Center in Houston, located in The Texas Medical Center, one of the largest and busiest medical centers in the world.   Dr. Alford, his wife and their 3 children live in Lakeway, and can frequently be found on Lake Travis or out exploring the Texas Hill Country.  Give us a call if you have any questions or would like to schedule an appointment. For more information visit to our <a href=\"http://laketravisoralsurgery.com\">website</a>.</div>\r\n<meta charset=\"utf-8\">\r\n<div>\r\n	<br>\r\n	Sincerely,<br>\r\n	Lake Travis Oral & Maxillofacial Surgery</div>\r\n<div>\r\n	 </div>\r\n    <hr />\r\n<div>\r\n	 </div>\r\n<div>\r\n	<h3 class=\"h3\" style=\"color: #505048;display: block;font-family: Arial;font-size: 26px;font-weight: bold;line-height: 100%;margin-top: 0;margin-right: 0;margin-bottom: 10px;margin-left: 0;text-align: left;\">About Our Practice</h3>\r\n    <div>\r\n	At Lake Travis Oral & Maxillofacial Surgery, serving the needs of the patient is our highest mission.  We offer exceptional service to you by providing the highest quality service in a warm, caring environment.  We will strive to continually exceed your expectations in every area possible.  In addition to providing diagnostic and surgical services that will be held to the highest standards, we commit ourselves to uphold values such as integrity, compassion, fairness and dignity.</div>\r\n    \r\n    <div>\r\n	 </div>\r\n    <h3 class=\"h3\" style=\"color: #505048;display: block;font-family: Arial;font-size: 26px;font-weight: bold;line-height: 100%;margin-top: 0;margin-right: 0;margin-bottom: 10px;margin-left: 0;text-align: left;\">A Positive Experience</h3>\r\n    <div>\r\n	Building a foundation of trust by treating our patients as special individuals is vital to our success.  We understand how uneasy some patients may feel about their oral surgery visits, and how we can make a difference in providing a relaxing and positive experience.  Our entire team is dedicated to providing you with excellent, personalized care and service to make your visits as comfortable and pleasant as possible.</div>\r\n    <div>\r\n	 </div>\r\n<div>\r\n	<a href=\"http://www.laketravisoralsurgery.com\">Learn More</a></div>\r\n</div>                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </table>\r\n                                                                        <!-- // End Module: Standard Content \\\\ -->                                                                    </td>\r\n                                                                </tr>\r\n                                                            </table>                                                        </td>\r\n                                                    </tr>\r\n                                                </table>                                          </td>\r\n                                        	<!-- // Begin Sidebar \\\\  -->\r\n                                        	<td valign=\"top\" width=\"200\" id=\"templateSidebar\">\r\n                                            	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"200\">\r\n                                                	<tr>\r\n                                                    	<td valign=\"top\" class=\"sidebarContent\">\r\n                                                        \r\n                                                           \r\n                                                        \r\n                                                            <!-- // Begin Module: Top Image with Content \\\\ -->\r\n                                                            <table border=\"0\" cellpadding=\"20\" cellspacing=\"0\" width=\"100%\">\r\n                                                                <tr mc:repeatable>\r\n                                                                    <td valign=\"top\">\r\n                                                                        <div mc:edit=\"tiwc200_content00\"><a href=\"http://www.laketravisoralsurgery.com/AppointmentRequest.aspx\"><img alt=\"Make an Appointment\" border=\"0\" height=\"47\" src=\"http://www.laketravisoralsurgery.net/referrals/wp-content/themes/toolbox/email-images/make_apt.png\" width=\"179\" /></a><br>\r\n	<a href=\"http://www.laketravisoralsurgery.com\" style=\"color: #336699;font-weight: normal;text-decoration: underline;\"><img alt=\"View Our Site\" border=\"0\" height=\"47\" src=\"http://www.laketravisoralsurgery.net/referrals/wp-content/themes/toolbox/email-images/view_site.png\" style=\"margin-top: 20px;margin-bottom: 20px;border: 0;height: auto;line-height: 100%;outline: none;text-decoration: none;display: inline;\" vspace=\"20\" width=\"179\"></a><br>\r\n	<h3 class=\"h3\" style=\"color: #505048;display: block;font-family: Arial;font-size: 26px;font-weight: bold;line-height: 100%;margin-top: 0;margin-right: 0;margin-bottom: 10px;margin-left: 0;text-align: left;\">Contact Us</h3>\r\n<div style=\"color: #505048;font-family: Arial;font-size: 12px;line-height: 150%;text-align: left;\">\r\n	Jeff Alford, D.D.S.</div>\r\n<div style=\"color: #505048;font-family: Arial;font-size: 12px;line-height: 150%;text-align: left;\">\r\n	<strong>Phone:</strong> (512) 261-6900</div>\r\n<div style=\"color: #505048;font-family: Arial;font-size: 12px;line-height: 150%;text-align: left;\">\r\n	<strong>Fax:</strong> (512) 532-0303</div>\r\n<div style=\"color: #505048;font-family: Arial;font-size: 12px;line-height: 150%;text-align: left;\">\r\n	<a href=\"mailto:info@laketravisoralsurgery.com\" style=\"color: #336699;font-weight: normal;text-decoration: underline;\" target=\"_blank\">info@laketravisoralsurgery.com</a><br>\r\n	 </div>\r\n<div style=\"color: #505048;font-family: Arial;font-size: 12px;line-height: 150%;text-align: left;\">\r\n	1921 Lohmans Crossing, </div>\r\n<div style=\"color: #505048;font-family: Arial;font-size: 12px;line-height: 150%;text-align: left;\">\r\n	Suite 208</div>\r\n<div style=\"color: #505048;font-family: Arial;font-size: 12px;line-height: 150%;text-align: left;\">\r\n	Lakeway, TX 78734</div>\r\n<div style=\"color: #505048;font-family: Arial;font-size: 12px;line-height: 150%;text-align: left;\">\r\n	 </div>\r\n<div style=\"color: #505048;font-family: Arial;font-size: 12px;line-height: 150%;text-align: left;\">\r\n	<a href=\"http://maps.google.com/maps?q=Jeff+Alford+D.D.S.&hl=en&sll=30.346837,-97.975769&sspn=0.012314,0.022531&ie=UTF8&view=map&f=d&daddr=1921+Lohmans+Crossing+%23208,+Lakeway,+TX+78734&geocode=CcYbyLKVizWdFVUOzwEdJwIp-iHnFObhfSGOVw&z=16\" style=\"color: #336699;font-weight: normal;text-decoration: underline;\">Get Directions</a><br>\r\n	<a href=\"http://maps.google.com/maps?q=Jeff+Alford+D.D.S.&hl=en&sll=30.346837,-97.975769&sspn=0.012314,0.022531&ie=UTF8&view=map&f=d&daddr=1921+Lohmans+Crossing+%23208,+Lakeway,+TX+78734&geocode=CcYbyLKVizWdFVUOzwEdJwIp-iHnFObhfSGOVw&z=16\"><img alt=\"View Map\" border=\"1\" height=\"178\" id=\"map\" src=\"http://www.laketravisoralsurgery.net/referrals/wp-content/themes/toolbox/email-images/map.png\" style=\"border: 1px solid #505050; margin-top: 20px;\" width=\"178\"></a><br>\r\n</div>\r\n</div>                                                                    </td>\r\n                                                                </tr>\r\n                                                            </table>\r\n                                                           \r\n                                                        <!-- // End Module: Top Image with Content \\\\ -->  \r\n                                                            <!-- // Begin Module: Social Block with Icons \\\\ -->\r\n                                                            <!-- <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n                                                                <tr>\r\n                                                                    <td valign=\"top\" style=\"padding-top:10px; padding-right:20px; padding-left:20px;\">\r\n                                                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"4\">\r\n                                                                            <tr mchideable=\"hideable_1\">\r\n                                                                                <td align=\"left\" valign=\"middle\" width=\"16\">\r\n                                                                                    <img src=\"http://gallery.mailchimp.com/653153ae841fd11de66ad181a/images/sfs_icon_facebook.png\" style=\"margin:0 !important;\">                                                                                </td>\r\n                                                                                <td align=\"left\" valign=\"top\">\r\n                                                                                    <div mc:edit=\"sbwi_link_one\"><a href=\"*|FACEBOOK:PROFILEURL|*\">Find us on Facebook</a> </div>                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr mchideable=\"hideable_3\">\r\n                                                                                <td align=\"left\" valign=\"middle\" width=\"16\">\r\n                                                                                    <img src=\"http://gallery.mailchimp.com/653153ae841fd11de66ad181a/images/sfs_icon_forward.png\" style=\"margin:0 !important;\">                                                                                </td>\r\n                                                                                <td align=\"left\" valign=\"top\">\r\n                                                                                    <div mc:edit=\"sbwi_link_three\">\r\n                                                                                        <a href=\"*|FORWARD|*\">Send this to a Friend</a>                                                                                    </div>                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </table>                                                                    </td>\r\n                                                                </tr>\r\n                                                            </table>-->\r\n                                                            <!-- // End Module: Social Block with Icons \\\\ --> \r\n                                                            \r\n                                                            \r\n                                                                                                                  </td>\r\n                                                    </tr>\r\n                                                </table>                                            </td>\r\n                                            <!-- // End Sidebar \\\\ -->\r\n                                        </tr>\r\n                                        <tr>\r\n                                        	<td colspan=\"2\" valign=\"top\" width=\"600\">\r\n                                            	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\">\r\n                                                	<tr>\r\n                                                    	<td valign=\"top\" class=\"fullWidthBandContent\">\r\n                                                        \r\n                                                            <!-- // Begin Module: Standard Content \\\\ -->\r\n                                                            <!--<table border=\"0\" cellpadding=\"20\" cellspacing=\"0\" width=\"100%\">\r\n                                                                <tr>\r\n                                                                    <td valign=\"top\">\r\n                                                                        <div mc:edit=\"std_content01\"><br>\r\n</div>                                                                    </td>\r\n                                                                </tr>\r\n                                                            </table>-->\r\n                                                            <!-- // End Module: Standard Content \\\\ -->                                                        </td>\r\n                                                    </tr>\r\n                                                </table>                                            </td>\r\n                                        </tr>\r\n                                        \r\n                                    </table>\r\n                                  <!-- // End Template Body \\\\ -->\r\n                                </td>\r\n                            </tr>\r\n                        	<tr>\r\n                            	<td align=\"center\" valign=\"top\">\r\n                                    <!-- // Begin Template Footer \\\\ -->\r\n                                	<table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"600\" id=\"templateFooter\">\r\n                                    	<tr>\r\n                                        	<td valign=\"top\" class=\"footerContent\">\r\n                                            \r\n                                                <!-- // Begin Module: Standard Footer \\\\ -->\r\n                                                <table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td colspan=\"2\" valign=\"middle\" id=\"social\">\r\n                                                            <div mc:edit=\"std_social\"><a class=\"tpl-content-highlight\" href=\"http://www.laketravisoralsurgery.com\">Visit our site</a></div>                                                        </td>\r\n                                                    </tr>\r\n                                                    <tr>\r\n                                                        <td valign=\"top\" width=\"579\">\r\n                                                            <div style=\"text-align: center;><span style=\"color:#505048;\"><span class=\"style1\"><em>Copyright © 2011 Lake Travis Oral & Maxillofacial Surgery, All rights reserved.</em><br>\r\n  Lakeway Oral Surgeon  –  Jeff Alford, D.D.S.</span></div>                                                      </td>\r\n                                                        \r\n                                                  </tr>\r\n                                                    <tr>\r\n                                                        <td colspan=\"2\" valign=\"middle\" id=\"utility\">\r\n                                                            <div mc:edit=\"std_utility\"><span style=\"color:#505048;\"> </span><a class=\"tpl-content-highlight\" href=\"*|UNSUB|*\"><span style=\"color:#505048;\">unsubscribe from this list</span></a><span style=\"color:#505048;\">   |   </span><a class=\"tpl-content-highlight\" href=\"*|UPDATE_PROFILE|*\"><span style=\"color:#505048;\">update subscription preferences</span></a><span style=\"color:#505048;\"> </span> </div>                                                        </td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                              <!-- // End Module: Standard Footer \\\\ -->\r\n                                            \r\n                                            </td>\r\n                                        </tr>\r\n                                    </table>\r\n                                    <!-- // End Template Footer \\\\ -->\r\n                                </td>\r\n                            </tr>\r\n                        </table>\r\n                        <br>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n        </center>\r\n    </body>\r\n</html>\";s:17:\"disableAutoformat\";s:1:\"1\";}}', ''),
('2', 'a:34:{s:2:\"id\";i:2;s:5:\"title\";s:7:\"Sign Up\";s:11:\"description\";s:33:\"Set up your own referral account.\";s:14:\"labelPlacement\";s:9:\"top_label\";s:17:\"maxEntriesMessage\";s:0:\"\";s:12:\"confirmation\";a:6:{s:4:\"type\";s:8:\"redirect\";s:7:\"message\";s:0:\"\";s:3:\"url\";s:43:\"http://laketravisoralsurgery.net/referrals/\";s:6:\"pageId\";s:0:\"\";s:11:\"queryString\";s:0:\"\";s:17:\"disableAutoformat\";b:0;}s:6:\"button\";a:3:{s:4:\"type\";s:4:\"text\";s:4:\"text\";s:6:\"Finish\";s:8:\"imageUrl\";s:0:\"\";}s:6:\"fields\";a:8:{i:0;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:7;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:10:\"Login Info\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:7:\"section\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:11:\"displayOnly\";b:1;s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:2;s:10:\"pageNumber\";i:1;}i:1;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:42:\"Email address can be changed at any point.\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:3;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:1;s:5:\"label\";s:14:\"Practice Email\";s:12:\"noDuplicates\";b:0;s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:5:\"email\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:2;s:10:\"pageNumber\";i:1;s:19:\"emailConfirmEnabled\";b:0;}i:2;a:53:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:66:\"Use full name of business. Use spaces. Username cannot be changed.\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:11;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:1;s:5:\"label\";s:24:\"Username / Practice Name\";s:12:\"noDuplicates\";b:1;s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:4:\"text\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:2;s:10:\"pageNumber\";i:1;}i:3;a:56:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:32:\"The password fields do not match\";s:2:\"id\";i:6;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:1;s:5:\"label\";s:8:\"Password\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:8:\"password\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:11:\"displayOnly\";b:1;s:15:\"disableQuantity\";b:0;s:23:\"passwordStrengthEnabled\";b:0;s:19:\"minPasswordStrength\";s:0:\"\";s:6:\"formId\";i:2;s:10:\"pageNumber\";i:1;}i:4;a:54:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:9;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:12:\"Profile Info\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:7:\"section\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:11:\"displayOnly\";b:1;s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:2;s:10:\"pageNumber\";i:1;}i:5;a:53:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:1;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:1;s:5:\"label\";s:22:\"Primary Physician Name\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:4:\"name\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";a:4:{i:0;a:3:{s:2:\"id\";d:1.1999999999999999555910790149937383830547332763671875;s:5:\"label\";s:6:\"Prefix\";s:4:\"name\";s:0:\"\";}i:1;a:3:{s:2:\"id\";d:1.3000000000000000444089209850062616169452667236328125;s:5:\"label\";s:5:\"First\";s:4:\"name\";s:0:\"\";}i:2;a:3:{s:2:\"id\";d:1.600000000000000088817841970012523233890533447265625;s:5:\"label\";s:4:\"Last\";s:4:\"name\";s:0:\"\";}i:3;a:3:{s:2:\"id\";d:1.8000000000000000444089209850062616169452667236328125;s:5:\"label\";s:6:\"Suffix\";s:4:\"name\";s:0:\"\";}}s:10:\"nameFormat\";s:8:\"extended\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:2;s:10:\"pageNumber\";i:1;}i:6;a:53:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:0:\"\";s:2:\"id\";i:4;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:1;s:5:\"label\";s:21:\"Practice Phone Number\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:5:\"phone\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:8:\"standard\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:2;s:10:\"pageNumber\";i:1;}i:7;a:53:{s:10:\"adminLabel\";s:0:\"\";s:9:\"adminOnly\";s:0:\"\";s:17:\"allowsPrepopulate\";b:0;s:12:\"defaultValue\";s:7:\"http://\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:8:\"cssClass\";s:0:\"\";s:12:\"errorMessage\";s:31:\"This is not a valid web address\";s:2:\"id\";i:5;s:9:\"inputName\";s:0:\"\";s:10:\"isRequired\";b:0;s:5:\"label\";s:27:\"Practice Website (optional)\";s:12:\"noDuplicates\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:4:\"type\";s:7:\"website\";s:19:\"postCustomFieldName\";s:0:\"\";s:20:\"displayAllCategories\";b:0;s:14:\"displayCaption\";s:0:\"\";s:18:\"displayDescription\";s:0:\"\";s:12:\"displayTitle\";s:0:\"\";s:9:\"inputType\";s:0:\"\";s:8:\"rangeMin\";s:0:\"\";s:8:\"rangeMax\";s:0:\"\";s:16:\"calendarIconType\";s:0:\"\";s:15:\"calendarIconUrl\";s:0:\"\";s:8:\"dateType\";s:0:\"\";s:10:\"dateFormat\";s:0:\"\";s:11:\"phoneFormat\";s:0:\"\";s:11:\"addressType\";s:0:\"\";s:14:\"defaultCountry\";s:0:\"\";s:15:\"defaultProvince\";s:0:\"\";s:12:\"defaultState\";s:0:\"\";s:12:\"hideAddress2\";s:0:\"\";s:11:\"hideCountry\";s:0:\"\";s:9:\"hideState\";s:0:\"\";s:6:\"inputs\";N;s:10:\"nameFormat\";s:0:\"\";s:17:\"allowedExtensions\";s:0:\"\";s:11:\"captchaType\";s:0:\"\";s:11:\"page_number\";s:0:\"\";s:12:\"captchaTheme\";s:0:\"\";s:17:\"simpleCaptchaSize\";s:0:\"\";s:22:\"simpleCaptchaFontColor\";s:0:\"\";s:28:\"simpleCaptchaBackgroundColor\";s:0:\"\";s:17:\"failed_validation\";s:0:\"\";s:12:\"productField\";s:0:\"\";s:19:\"enablePasswordInput\";s:0:\"\";s:9:\"maxLength\";s:0:\"\";s:11:\"enablePrice\";s:0:\"\";s:9:\"basePrice\";s:0:\"\";s:15:\"disableQuantity\";b:0;s:6:\"formId\";i:2;s:10:\"pageNumber\";i:1;}}s:22:\"useCurrentUserAsAuthor\";b:1;s:8:\"cssClass\";s:0:\"\";s:14:\"enableHoneypot\";b:0;s:15:\"enableAnimation\";b:0;s:26:\"postContentTemplateEnabled\";b:0;s:24:\"postTitleTemplateEnabled\";b:0;s:17:\"postTitleTemplate\";s:0:\"\";s:19:\"postContentTemplate\";s:0:\"\";s:14:\"lastPageButton\";N;s:10:\"pagination\";N;s:17:\"firstPageCssClass\";N;s:12:\"limitEntries\";b:0;s:17:\"limitEntriesCount\";s:0:\"\";s:19:\"limitEntriesMessage\";s:0:\"\";s:12:\"scheduleForm\";b:0;s:13:\"scheduleStart\";s:0:\"\";s:17:\"scheduleStartHour\";s:0:\"\";s:19:\"scheduleStartMinute\";s:0:\"\";s:17:\"scheduleStartAmpm\";s:0:\"\";s:11:\"scheduleEnd\";s:0:\"\";s:15:\"scheduleEndHour\";s:0:\"\";s:17:\"scheduleEndMinute\";s:0:\"\";s:15:\"scheduleEndAmpm\";s:0:\"\";s:15:\"scheduleMessage\";s:0:\"\";s:12:\"notification\";a:12:{s:2:\"to\";s:17:\"me@tyrichards.com\";s:7:\"subject\";s:87:\"New Referral Account has been created by {Your Name (First):1.3} {Your Name (Last):1.6}\";s:7:\"message\";s:125:\"Hi {user:display_name}:\r\n\r\n{Your Name (First):1.3} {Your Name (Last):1.6} has created a new referral account.\r\n\r\n{all_fields}\";s:3:\"bcc\";s:0:\"\";s:4:\"from\";s:17:\"me@tyrichards.com\";s:9:\"fromField\";s:0:\"\";s:8:\"fromName\";s:11:\"Jeff Alford\";s:13:\"fromNameField\";s:0:\"\";s:7:\"replyTo\";s:0:\"\";s:12:\"replyToField\";s:0:\"\";s:7:\"routing\";N;s:17:\"disableAutoformat\";s:0:\"\";}s:13:\"autoResponder\";a:8:{s:7:\"toField\";s:0:\"\";s:3:\"bcc\";s:0:\"\";s:8:\"fromName\";s:0:\"\";s:4:\"from\";s:17:\"me@tyrichards.com\";s:7:\"replyTo\";s:0:\"\";s:7:\"subject\";s:0:\"\";s:7:\"message\";s:0:\"\";s:17:\"disableAutoformat\";s:0:\"\";}}', '');

--
-- Table structure for table `wp_rg_form_view`
--

CREATE TABLE `wp_rg_form_view` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` char(15) DEFAULT NULL,
  `count` mediumint(8) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1028 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_rg_form_view`
--

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('1', '2', '2011-05-09 19:59:37', '99.190.39.126', '1'),
('2', '2', '2011-05-09 20:01:18', '99.190.39.126', '7'),
('3', '1', '2011-05-10 15:31:02', '99.147.86.236', '5'),
('4', '1', '2011-05-16 11:59:06', '76.203.202.62', '1'),
('5', '1', '2011-05-16 12:20:25', '76.203.202.62', '2'),
('6', '1', '2011-05-16 13:09:47', '76.203.202.62', '2'),
('7', '1', '2011-05-16 16:13:21', '76.203.202.62', '1'),
('8', '1', '2011-05-16 17:24:29', '76.203.202.62', '2'),
('9', '1', '2011-05-16 18:14:50', '76.203.202.62', '7'),
('10', '1', '2011-05-18 13:48:21', '76.203.202.62', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('11', '2', '2011-05-18 13:48:24', '76.203.202.62', '1'),
('12', '1', '2011-05-18 15:13:51', '76.203.202.62', '10'),
('13', '2', '2011-05-18 15:13:53', '76.203.202.62', '10'),
('14', '1', '2011-05-18 16:51:33', '76.203.202.62', '2'),
('15', '2', '2011-05-18 16:51:35', '76.203.202.62', '2'),
('16', '1', '2011-05-18 19:28:26', '76.203.202.62', '2'),
('17', '2', '2011-05-18 19:28:29', '76.203.202.62', '2'),
('18', '1', '2011-05-18 20:02:32', '76.203.202.62', '14'),
('19', '2', '2011-05-18 20:02:35', '76.203.202.62', '5'),
('20', '1', '2011-05-18 21:00:23', '76.203.202.62', '23');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('21', '1', '2011-05-18 22:05:44', '76.203.202.62', '3'),
('22', '1', '2011-05-19 00:47:34', '173.71.59.58', '6'),
('23', '1', '2011-05-19 13:20:41', '76.203.202.62', '26'),
('24', '1', '2011-05-19 14:00:47', '76.203.202.62', '9'),
('83', '1', '2011-05-25 21:00:33', '76.203.198.23', '40'),
('26', '1', '2011-05-19 15:03:11', '76.203.202.62', '1'),
('27', '1', '2011-05-19 17:24:45', '76.203.202.62', '2'),
('82', '1', '2011-05-25 20:12:52', '76.203.198.23', '16'),
('81', '1', '2011-05-25 19:06:45', '76.203.198.23', '5'),
('30', '2', '2011-05-19 18:02:01', '76.203.202.62', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('80', '1', '2011-05-25 18:11:13', '76.203.198.23', '5'),
('32', '2', '2011-05-19 19:17:53', '76.203.202.62', '15'),
('33', '1', '2011-05-19 19:34:03', '76.203.202.62', '6'),
('34', '1', '2011-05-19 20:00:03', '76.203.202.62', '4'),
('35', '2', '2011-05-19 20:00:56', '76.203.202.62', '11'),
('36', '2', '2011-05-20 13:55:11', '76.203.202.62', '1'),
('37', '2', '2011-05-20 14:03:34', '76.203.202.62', '9'),
('38', '1', '2011-05-20 14:06:57', '76.203.202.62', '13'),
('39', '2', '2011-05-20 15:13:58', '76.203.202.62', '1'),
('40', '1', '2011-05-20 15:34:35', '76.203.202.62', '3');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('41', '2', '2011-05-20 16:01:37', '76.203.202.62', '3'),
('42', '1', '2011-05-20 16:20:53', '76.203.202.62', '1'),
('43', '2', '2011-05-20 17:20:32', '76.203.202.62', '1'),
('44', '2', '2011-05-20 18:07:37', '76.203.202.62', '1'),
('45', '2', '2011-05-20 19:39:33', '76.203.202.62', '1'),
('46', '2', '2011-05-20 20:25:05', '76.203.202.62', '4'),
('47', '1', '2011-05-20 20:34:11', '76.203.202.62', '1'),
('48', '1', '2011-05-20 21:08:04', '76.203.202.62', '14'),
('49', '2', '2011-05-20 21:37:46', '76.203.202.62', '10'),
('50', '2', '2011-05-20 22:00:39', '76.203.202.62', '7');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('51', '1', '2011-05-20 22:42:32', '76.203.202.62', '4'),
('52', '1', '2011-05-20 23:01:26', '76.203.202.62', '8'),
('53', '2', '2011-05-20 23:16:21', '76.203.202.62', '3'),
('54', '2', '2011-05-21 01:44:38', '76.185.231.234', '1'),
('55', '1', '2011-05-21 01:46:11', '76.185.231.234', '1'),
('56', '2', '2011-05-23 04:23:39', '76.203.202.62', '1'),
('57', '1', '2011-05-23 04:25:08', '76.203.202.62', '1'),
('58', '2', '2011-05-23 15:48:05', '50.84.82.218', '2'),
('59', '1', '2011-05-23 15:49:51', '50.84.82.218', '1'),
('60', '2', '2011-05-23 16:00:58', '76.203.202.62', '29');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('79', '2', '2011-05-25 17:14:40', '76.203.198.23', '2'),
('62', '1', '2011-05-23 16:23:53', '76.203.202.62', '6'),
('63', '2', '2011-05-23 18:05:54', '76.203.202.62', '39'),
('64', '1', '2011-05-23 18:11:25', '76.203.202.62', '11'),
('78', '1', '2011-05-25 17:00:01', '76.203.198.23', '17'),
('66', '1', '2011-05-23 19:42:14', '76.203.202.62', '6'),
('67', '2', '2011-05-23 19:42:42', '76.203.202.62', '7'),
('68', '2', '2011-05-23 20:02:35', '76.203.202.62', '1'),
('69', '2', '2011-05-24 14:45:54', '76.203.202.62', '1'),
('70', '2', '2011-05-24 16:22:10', '76.203.202.62', '6');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('71', '1', '2011-05-24 16:36:31', '76.203.202.62', '1'),
('72', '2', '2011-05-24 18:54:58', '76.203.202.62', '1'),
('73', '2', '2011-05-24 20:38:41', '76.203.202.62', '1'),
('74', '2', '2011-05-25 14:58:09', '76.203.198.23', '1'),
('75', '2', '2011-05-25 15:04:02', '76.203.198.23', '2'),
('76', '1', '2011-05-25 16:07:36', '76.203.198.23', '7'),
('77', '2', '2011-05-25 16:08:40', '76.203.198.23', '4'),
('84', '1', '2011-05-25 22:01:55', '76.203.198.23', '3'),
('85', '1', '2011-05-26 00:35:21', '173.71.59.58', '9'),
('86', '1', '2011-05-26 11:16:07', '76.203.198.23', '10');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('87', '1', '2011-05-26 12:00:39', '76.203.198.23', '28'),
('88', '1', '2011-05-26 13:08:02', '76.203.198.23', '19'),
('89', '2', '2011-05-26 13:48:33', '76.203.198.23', '2'),
('90', '1', '2011-05-26 14:08:54', '76.203.198.23', '4'),
('91', '1', '2011-05-26 17:47:02', '76.203.206.81', '1'),
('92', '2', '2011-05-26 17:52:38', '76.203.206.81', '4'),
('93', '2', '2011-05-26 18:00:07', '76.203.206.81', '11'),
('94', '1', '2011-05-26 18:04:19', '76.203.206.81', '21'),
('95', '2', '2011-05-26 19:39:57', '76.203.206.81', '5'),
('96', '1', '2011-05-26 19:44:47', '76.203.206.81', '9');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('97', '2', '2011-05-26 20:09:02', '76.203.206.81', '3'),
('98', '1', '2011-05-26 20:09:14', '76.203.206.81', '2'),
('99', '1', '2011-05-26 21:14:12', '76.203.206.81', '2'),
('100', '2', '2011-05-26 21:25:36', '76.203.206.81', '2'),
('101', '1', '2011-05-26 22:13:44', '76.203.206.81', '2'),
('102', '2', '2011-05-26 22:13:46', '76.203.206.81', '2'),
('103', '1', '2011-05-26 23:18:26', '76.203.206.81', '5'),
('104', '2', '2011-05-26 23:18:32', '76.203.206.81', '1'),
('105', '1', '2011-05-27 02:33:12', '166.205.8.209', '2'),
('106', '1', '2011-05-27 13:25:05', '76.203.206.81', '6');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('107', '2', '2011-05-27 13:25:07', '76.203.206.81', '10'),
('108', '2', '2011-05-27 14:14:40', '76.203.206.81', '9'),
('109', '1', '2011-05-27 14:14:53', '76.203.206.81', '9'),
('110', '1', '2011-05-27 15:28:24', '76.203.206.81', '5'),
('111', '2', '2011-05-27 15:28:26', '76.203.206.81', '6'),
('112', '2', '2011-05-27 16:00:02', '76.203.206.81', '23'),
('113', '1', '2011-05-27 16:00:37', '76.203.206.81', '28'),
('114', '2', '2011-05-27 17:00:11', '76.203.206.81', '2'),
('115', '1', '2011-05-27 17:00:21', '76.203.206.81', '5'),
('116', '1', '2011-05-27 18:58:09', '76.203.206.81', '4');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('117', '2', '2011-05-27 18:58:15', '76.203.206.81', '3'),
('118', '1', '2011-05-27 19:03:03', '76.203.206.81', '4'),
('119', '2', '2011-05-27 19:03:05', '76.203.206.81', '4'),
('120', '1', '2011-05-27 20:13:54', '76.203.206.81', '10'),
('121', '1', '2011-05-27 21:00:16', '76.203.206.81', '26'),
('122', '2', '2011-05-27 21:53:47', '76.203.206.81', '6'),
('123', '1', '2011-05-27 22:00:50', '76.203.206.81', '10'),
('124', '2', '2011-05-27 22:01:19', '76.203.206.81', '8'),
('125', '1', '2011-05-28 02:26:58', '76.203.206.81', '7'),
('126', '2', '2011-05-28 02:35:12', '76.203.206.81', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('127', '1', '2011-05-31 20:21:18', '76.203.206.81', '12'),
('128', '2', '2011-05-31 20:37:54', '76.203.206.81', '5'),
('129', '2', '2011-05-31 21:02:51', '76.203.206.81', '24'),
('130', '1', '2011-05-31 21:56:39', '76.203.206.81', '1'),
('131', '1', '2011-05-31 22:04:54', '76.203.206.81', '11'),
('132', '2', '2011-05-31 22:09:20', '76.203.206.81', '2'),
('133', '1', '2011-05-31 23:07:28', '76.203.206.164', '55'),
('134', '2', '2011-05-31 23:13:47', '76.203.206.164', '30'),
('135', '1', '2011-06-01 00:00:41', '76.203.206.164', '2'),
('136', '2', '2011-06-01 00:00:44', '76.203.206.164', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('137', '1', '2011-06-01 16:58:09', '76.203.206.164', '1'),
('138', '2', '2011-06-01 16:58:24', '76.203.206.164', '1'),
('139', '1', '2011-06-01 17:06:05', '76.203.206.164', '34'),
('140', '2', '2011-06-01 17:06:08', '76.203.206.164', '26'),
('141', '1', '2011-06-01 18:44:32', '76.203.206.164', '5'),
('142', '1', '2011-06-01 19:24:53', '76.203.206.164', '3'),
('143', '1', '2011-06-01 20:04:46', '76.203.206.164', '5'),
('144', '1', '2011-06-01 21:10:13', '76.203.206.164', '24'),
('145', '1', '2011-06-01 23:33:34', '173.71.59.58', '3'),
('146', '1', '2011-06-02 00:03:58', '173.71.59.58', '4');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('147', '2', '2011-06-02 00:04:05', '173.71.59.58', '3'),
('148', '1', '2011-06-02 14:11:30', '76.203.206.164', '11'),
('149', '2', '2011-06-02 14:26:32', '76.203.206.164', '6'),
('150', '1', '2011-06-02 15:00:01', '76.203.206.164', '28'),
('151', '2', '2011-06-02 15:00:04', '76.203.206.164', '8'),
('152', '1', '2011-06-02 16:24:26', '76.203.206.164', '23'),
('153', '2', '2011-06-02 16:24:34', '76.203.206.164', '15'),
('154', '1', '2011-06-02 17:00:39', '76.203.206.164', '12'),
('155', '1', '2011-06-02 18:12:39', '76.203.206.164', '6'),
('156', '1', '2011-06-02 19:06:32', '76.203.206.164', '16');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('157', '2', '2011-06-02 19:11:31', '76.203.206.164', '2'),
('158', '1', '2011-06-02 20:56:50', '76.203.206.164', '2'),
('159', '1', '2011-06-02 21:41:33', '76.203.206.164', '3'),
('160', '2', '2011-06-02 21:41:37', '76.203.206.164', '2'),
('161', '1', '2011-06-02 22:03:40', '76.203.206.164', '12'),
('162', '1', '2011-06-02 23:05:38', '76.203.206.164', '10'),
('163', '2', '2011-06-02 23:10:13', '76.203.206.164', '2'),
('164', '1', '2011-06-03 00:22:36', '76.203.206.164', '6'),
('165', '2', '2011-06-03 00:59:35', '76.203.206.164', '1'),
('166', '1', '2011-06-03 01:00:04', '76.203.206.164', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('167', '1', '2011-06-03 13:38:26', '76.203.206.164', '2'),
('168', '2', '2011-06-03 13:38:41', '76.203.206.164', '2'),
('169', '1', '2011-06-03 14:03:02', '76.203.206.164', '16'),
('170', '2', '2011-06-03 14:03:04', '76.203.206.164', '4'),
('171', '1', '2011-06-03 16:42:26', '76.203.206.164', '2'),
('172', '2', '2011-06-03 16:42:30', '76.203.206.164', '2'),
('173', '1', '2011-06-03 17:14:00', '76.203.206.164', '2'),
('174', '2', '2011-06-03 17:18:34', '76.203.206.164', '1'),
('175', '1', '2011-06-03 19:29:18', '76.203.206.164', '2'),
('176', '2', '2011-06-03 19:29:21', '76.203.206.164', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('177', '1', '2011-06-03 21:42:20', '76.203.206.164', '3'),
('178', '1', '2011-06-03 22:01:06', '76.203.206.164', '12'),
('179', '1', '2011-06-03 23:19:53', '76.203.206.164', '9'),
('180', '1', '2011-06-04 00:00:07', '76.203.206.164', '5'),
('181', '1', '2011-06-04 02:40:06', '76.203.206.164', '1'),
('182', '1', '2011-06-07 14:21:43', '67.79.16.126', '5'),
('183', '2', '2011-06-07 14:33:09', '67.79.16.126', '1'),
('184', '1', '2011-06-07 15:00:08', '67.79.16.126', '8'),
('185', '2', '2011-06-07 15:42:26', '76.203.206.164', '12'),
('186', '1', '2011-06-07 17:57:28', '64.123.189.118', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('187', '1', '2011-06-07 18:11:02', '50.84.82.218', '7'),
('188', '2', '2011-06-07 18:19:30', '64.123.189.118', '2'),
('189', '1', '2011-06-07 19:06:50', '64.123.189.118', '1'),
('190', '2', '2011-06-07 19:07:09', '64.123.189.118', '1'),
('191', '1', '2011-06-08 15:34:52', '76.203.206.164', '3'),
('192', '1', '2011-06-08 16:30:32', '76.203.206.164', '6'),
('193', '2', '2011-06-08 16:31:23', '76.203.206.164', '18'),
('194', '2', '2011-06-08 17:00:51', '76.203.206.164', '46'),
('195', '1', '2011-06-08 17:01:09', '76.203.206.164', '9'),
('196', '2', '2011-06-08 18:04:11', '76.203.206.164', '58');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('197', '2', '2011-06-08 19:00:17', '76.203.206.164', '30'),
('198', '2', '2011-06-08 20:08:31', '76.203.206.164', '36'),
('199', '1', '2011-06-08 20:42:33', '76.203.206.164', '6'),
('200', '1', '2011-06-08 21:18:11', '76.203.206.164', '5'),
('201', '2', '2011-06-08 21:18:23', '76.203.206.164', '8'),
('202', '1', '2011-06-08 23:03:06', '76.203.206.164', '7'),
('203', '2', '2011-06-08 23:05:42', '76.203.206.164', '29'),
('204', '2', '2011-06-09 00:09:49', '76.203.206.164', '7'),
('205', '1', '2011-06-09 00:34:35', '76.203.206.164', '4'),
('206', '1', '2011-06-09 01:00:54', '76.203.206.164', '3');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('207', '2', '2011-06-09 01:06:39', '76.203.206.164', '2'),
('208', '1', '2011-06-09 15:46:59', '76.203.206.164', '4'),
('209', '2', '2011-06-09 15:47:54', '76.203.206.164', '1'),
('210', '2', '2011-06-09 16:12:25', '76.203.206.164', '7'),
('211', '1', '2011-06-09 16:13:23', '76.203.206.164', '2'),
('212', '2', '2011-06-09 17:00:05', '88.198.24.170', '14'),
('213', '1', '2011-06-09 17:17:48', '76.203.206.164', '19'),
('214', '1', '2011-06-09 18:09:11', '76.203.206.164', '33'),
('215', '2', '2011-06-09 18:48:19', '76.203.206.164', '1'),
('216', '1', '2011-06-09 19:01:16', '76.203.206.164', '46');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('217', '1', '2011-06-09 20:01:24', '76.203.206.164', '18'),
('218', '2', '2011-06-09 20:46:05', '76.203.206.164', '1'),
('219', '2', '2011-06-09 21:08:14', '76.203.206.164', '8'),
('220', '1', '2011-06-09 21:10:00', '76.203.206.164', '14'),
('221', '1', '2011-06-09 22:03:28', '76.203.206.164', '3'),
('222', '1', '2011-06-09 23:10:57', '76.203.206.164', '1'),
('223', '2', '2011-06-09 23:11:04', '76.203.206.164', '1'),
('224', '1', '2011-06-13 17:25:22', '166.205.11.195', '6'),
('225', '2', '2011-06-13 17:25:54', '166.205.11.195', '2'),
('226', '1', '2011-06-14 15:33:21', '76.203.206.164', '8');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('227', '2', '2011-06-14 15:39:05', '76.203.206.164', '8'),
('228', '2', '2011-06-14 16:17:50', '76.203.206.164', '5'),
('229', '1', '2011-06-14 16:17:55', '76.203.206.164', '9'),
('230', '1', '2011-06-14 17:14:36', '24.153.214.68', '3'),
('231', '2', '2011-06-14 17:14:39', '24.153.214.68', '5'),
('232', '1', '2011-06-14 20:50:21', '71.40.232.84', '1'),
('233', '2', '2011-06-14 20:55:12', '71.40.232.84', '1'),
('234', '1', '2011-06-15 14:28:31', '76.203.206.164', '2'),
('235', '2', '2011-06-15 14:30:34', '76.203.206.164', '3'),
('236', '1', '2011-06-19 02:16:36', '166.205.10.67', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('237', '1', '2011-06-21 14:05:14', '67.79.16.126', '1'),
('238', '1', '2011-06-21 20:00:31', '64.134.29.222', '2'),
('239', '1', '2011-06-22 16:13:14', '76.203.206.147', '1'),
('240', '1', '2011-06-23 17:05:04', '71.40.232.84', '1'),
('241', '2', '2011-06-23 17:05:10', '71.40.232.84', '2'),
('242', '1', '2011-06-24 11:01:36', '76.203.205.189', '2'),
('243', '1', '2011-06-27 17:17:05', '71.40.232.84', '1'),
('244', '2', '2011-06-27 17:17:09', '71.40.232.84', '1'),
('245', '1', '2011-06-28 12:36:11', '76.187.186.231', '1'),
('246', '1', '2011-06-28 14:54:15', '67.79.16.126', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('247', '1', '2011-06-28 17:52:40', '67.79.16.126', '1'),
('248', '1', '2011-06-28 19:22:47', '71.40.232.84', '1'),
('249', '2', '2011-06-28 19:22:51', '71.40.232.84', '2'),
('250', '1', '2011-06-28 22:22:41', '76.203.205.189', '1'),
('251', '1', '2011-06-29 17:56:23', '76.203.205.189', '1'),
('252', '1', '2011-06-30 17:35:05', '71.40.232.84', '1'),
('253', '2', '2011-06-30 17:35:10', '71.40.232.84', '2'),
('254', '1', '2011-06-30 19:00:26', '67.79.16.126', '2'),
('255', '2', '2011-06-30 19:28:22', '71.40.232.84', '1'),
('256', '1', '2011-06-30 20:25:11', '71.41.234.174', '8');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('257', '2', '2011-06-30 20:25:31', '71.41.234.174', '2'),
('258', '1', '2011-06-30 21:00:39', '99.90.103.22', '14'),
('259', '1', '2011-07-01 04:18:25', '71.41.234.174', '1'),
('260', '1', '2011-07-01 13:30:53', '50.84.82.218', '5'),
('261', '1', '2011-07-01 14:19:21', '76.203.205.189', '2'),
('262', '1', '2011-07-01 15:09:31', '76.203.205.189', '1'),
('263', '2', '2011-07-01 16:14:09', '76.203.205.189', '1'),
('264', '1', '2011-07-01 18:13:05', '76.203.205.189', '2'),
('265', '1', '2011-07-01 19:42:03', '71.41.234.174', '2'),
('266', '1', '2011-07-05 21:20:36', '64.183.211.217', '3');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('267', '1', '2011-07-06 14:31:53', '71.41.152.114', '3'),
('268', '1', '2011-07-06 17:57:49', '71.41.234.174', '2'),
('269', '1', '2011-07-06 18:08:15', '71.41.234.174', '1'),
('270', '1', '2011-07-07 02:06:52', '70.112.148.101', '1'),
('271', '1', '2011-07-07 19:53:37', '71.40.232.84', '2'),
('272', '2', '2011-07-07 19:53:47', '71.40.232.84', '2'),
('273', '1', '2011-07-10 19:13:58', '76.203.198.136', '1'),
('274', '2', '2011-07-10 19:34:50', '76.203.198.136', '1'),
('275', '1', '2011-07-10 23:50:16', '66.140.57.65', '1'),
('276', '1', '2011-07-11 15:21:17', '71.41.234.174', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('277', '1', '2011-07-12 01:48:54', '99.138.128.198', '3'),
('278', '2', '2011-07-12 01:52:22', '99.138.128.198', '1'),
('279', '2', '2011-07-12 05:21:39', '99.138.128.198', '1'),
('280', '1', '2011-07-12 15:51:55', '99.90.103.22', '3'),
('281', '1', '2011-07-12 16:59:37', '99.90.103.22', '1'),
('282', '1', '2011-07-12 17:03:04', '99.90.103.22', '2'),
('283', '1', '2011-07-12 20:06:38', '24.153.214.72', '3'),
('284', '2', '2011-07-12 20:11:23', '24.153.214.72', '3'),
('285', '1', '2011-07-13 21:15:33', '71.41.234.174', '2'),
('286', '1', '2011-07-14 15:41:02', '71.41.234.174', '4');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('287', '1', '2011-07-20 14:57:39', '71.41.234.174', '2'),
('288', '1', '2011-07-22 19:23:52', '71.41.234.174', '2'),
('289', '1', '2011-07-27 18:59:03', '71.40.232.84', '2'),
('290', '2', '2011-07-27 18:59:11', '71.40.232.84', '1'),
('291', '2', '2011-07-27 19:02:17', '71.40.232.84', '1'),
('292', '1', '2011-07-29 13:19:10', '99.138.128.198', '1'),
('293', '1', '2011-08-02 20:22:03', '71.41.234.174', '2'),
('294', '1', '2011-08-02 23:09:50', '99.138.128.198', '1'),
('295', '1', '2011-08-03 15:52:09', '71.41.152.114', '1'),
('296', '1', '2011-08-03 17:06:13', '71.41.234.174', '3');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('297', '2', '2011-08-04 13:26:58', '71.40.232.84', '3'),
('298', '1', '2011-08-04 13:27:23', '71.40.232.84', '1'),
('299', '1', '2011-08-04 14:22:36', '71.40.232.84', '1'),
('300', '2', '2011-08-04 14:22:38', '71.40.232.84', '2'),
('301', '1', '2011-08-07 11:10:32', '99.129.17.50', '1'),
('302', '1', '2011-08-08 18:29:52', '71.41.234.174', '1'),
('303', '1', '2011-08-08 19:52:07', '71.40.232.84', '1'),
('304', '2', '2011-08-08 19:52:08', '71.40.232.84', '2'),
('305', '1', '2011-08-08 21:31:01', '71.40.232.84', '1'),
('306', '1', '2011-08-09 13:57:49', '71.40.232.84', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('307', '2', '2011-08-09 13:57:51', '71.40.232.84', '1'),
('308', '1', '2011-08-09 14:19:51', '67.79.16.126', '2'),
('309', '1', '2011-08-09 17:37:00', '64.134.26.171', '2'),
('310', '1', '2011-08-09 18:12:11', '67.79.16.126', '1'),
('311', '1', '2011-08-09 19:58:50', '24.153.214.72', '1'),
('312', '1', '2011-08-09 20:00:38', '24.153.214.72', '2'),
('313', '2', '2011-08-09 20:00:43', '24.153.214.72', '2'),
('314', '1', '2011-08-16 21:33:47', '24.153.214.72', '2'),
('315', '2', '2011-08-16 21:37:01', '24.153.214.72', '2'),
('316', '1', '2011-08-22 20:13:25', '99.129.17.222', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('317', '1', '2011-08-25 20:35:23', '71.41.234.174', '4'),
('318', '1', '2011-08-26 14:06:28', '99.90.103.22', '4'),
('319', '1', '2011-08-29 22:31:20', '99.90.103.22', '2'),
('320', '1', '2011-08-30 15:17:49', '24.153.214.72', '3'),
('321', '2', '2011-08-30 15:27:04', '24.153.214.72', '2'),
('322', '1', '2011-09-09 01:09:53', '99.129.18.68', '1'),
('323', '1', '2011-09-09 22:56:25', '99.129.18.68', '1'),
('324', '1', '2011-09-10 04:17:24', '99.129.18.68', '1'),
('325', '1', '2011-09-12 15:24:22', '71.40.232.84', '1'),
('326', '2', '2011-09-12 15:24:25', '71.40.232.84', '3');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('327', '1', '2011-09-14 16:28:49', '99.129.18.68', '1'),
('328', '1', '2011-09-14 22:25:43', '71.40.232.84', '2'),
('329', '1', '2011-09-21 02:44:26', '76.203.199.177', '1'),
('330', '1', '2011-09-21 13:30:55', '71.41.234.174', '1'),
('331', '1', '2011-09-22 15:23:02', '71.41.234.174', '3'),
('332', '1', '2011-09-27 19:27:37', '71.40.232.84', '2'),
('333', '2', '2011-09-27 19:27:44', '71.40.232.84', '2'),
('334', '1', '2011-10-03 22:03:23', '76.203.200.234', '1'),
('335', '1', '2011-10-03 23:23:27', '76.203.200.234', '2'),
('336', '2', '2011-10-03 23:23:31', '76.203.200.234', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('337', '2', '2011-10-06 14:47:04', '204.131.186.138', '1'),
('338', '1', '2011-10-10 16:52:44', '99.90.103.22', '1'),
('339', '1', '2011-10-18 20:45:25', '71.41.234.174', '2'),
('340', '1', '2011-10-20 18:00:09', '71.41.234.174', '3'),
('341', '1', '2011-10-21 22:57:24', '76.203.200.234', '1'),
('342', '1', '2011-10-22 01:57:54', '64.125.188.26', '1'),
('343', '1', '2011-10-27 19:42:22', '71.40.232.84', '2'),
('344', '2', '2011-10-27 19:42:31', '71.40.232.84', '3'),
('345', '1', '2011-11-04 15:19:37', '71.41.234.174', '2'),
('346', '1', '2011-11-14 17:25:42', '71.41.234.174', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('347', '1', '2011-11-16 21:36:18', '71.41.234.174', '3'),
('348', '1', '2011-11-21 22:29:03', '71.244.26.56', '1'),
('349', '2', '2011-11-21 22:29:14', '71.244.26.56', '1'),
('350', '1', '2011-11-30 19:13:47', '71.41.234.174', '2'),
('351', '1', '2011-12-08 20:11:13', '71.41.234.174', '2'),
('352', '1', '2011-12-21 18:07:48', '71.40.232.84', '1'),
('353', '2', '2011-12-21 18:07:51', '71.40.232.84', '2'),
('354', '1', '2011-12-21 19:02:57', '71.252.245.98', '3'),
('355', '2', '2011-12-21 19:03:04', '71.252.245.98', '1'),
('356', '1', '2011-12-21 20:04:29', '71.40.232.84', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('357', '2', '2011-12-21 20:04:31', '71.40.232.84', '2'),
('358', '1', '2011-12-21 22:50:40', '64.125.188.26', '3'),
('359', '2', '2011-12-21 22:50:53', '64.125.188.26', '1'),
('360', '1', '2011-12-28 15:46:57', '166.205.9.75', '2'),
('361', '2', '2011-12-28 15:47:28', '166.205.9.75', '1'),
('362', '1', '2011-12-28 17:57:07', '64.125.188.26', '2'),
('363', '1', '2011-12-29 03:08:33', '71.252.245.98', '1'),
('364', '2', '2011-12-29 03:08:38', '71.252.245.98', '1'),
('365', '1', '2011-12-29 17:23:02', '71.40.232.84', '1'),
('366', '2', '2011-12-29 17:23:05', '71.40.232.84', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('367', '1', '2011-12-29 21:53:32', '24.153.214.56', '2'),
('368', '2', '2011-12-29 21:56:16', '24.153.214.56', '1'),
('369', '2', '2011-12-29 22:03:52', '24.153.214.56', '4'),
('370', '1', '2011-12-29 22:03:56', '24.153.214.56', '1'),
('371', '1', '2011-12-30 03:26:40', '71.252.245.98', '2'),
('372', '2', '2011-12-30 03:27:00', '71.252.245.98', '1'),
('373', '2', '2012-01-01 17:52:45', '71.252.245.98', '1'),
('374', '2', '2012-01-01 19:03:48', '64.125.188.26', '1'),
('375', '2', '2012-01-02 15:27:56', '71.252.245.98', '1'),
('376', '1', '2012-01-03 22:46:37', '99.129.130.94', '8');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('377', '2', '2012-01-03 22:46:45', '99.129.130.94', '1'),
('378', '1', '2012-01-03 23:31:32', '99.129.130.94', '3'),
('379', '1', '2012-01-04 15:01:36', '71.252.245.98', '2'),
('380', '1', '2012-01-04 17:53:29', '64.125.188.26', '4'),
('381', '1', '2012-01-04 18:30:55', '99.129.130.94', '2'),
('382', '1', '2012-01-05 22:37:39', '192.150.3.7', '13'),
('383', '1', '2012-01-05 22:37:39', '192.150.3.7', '1'),
('384', '1', '2012-01-06 19:49:15', '71.252.245.98', '1'),
('385', '1', '2012-01-06 23:05:16', '64.125.188.26', '1'),
('386', '1', '2012-01-16 15:47:28', '71.252.245.98', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('387', '1', '2012-01-18 18:35:29', '24.153.214.56', '2'),
('388', '2', '2012-01-18 18:36:37', '24.153.214.56', '2'),
('389', '1', '2012-01-23 16:53:28', '71.41.234.174', '2'),
('390', '1', '2012-01-26 23:13:50', '71.40.232.84', '1'),
('391', '2', '2012-01-26 23:13:53', '71.40.232.84', '2'),
('392', '1', '2012-01-31 21:20:59', '71.40.232.84', '1'),
('393', '2', '2012-01-31 21:21:02', '71.40.232.84', '2'),
('394', '1', '2012-02-01 21:19:04', '71.40.232.84', '1'),
('395', '2', '2012-02-01 21:19:07', '71.40.232.84', '2'),
('396', '1', '2012-02-06 15:21:15', '24.153.214.56', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('397', '2', '2012-02-06 15:40:31', '71.40.232.84', '2'),
('398', '1', '2012-02-06 20:08:58', '67.220.101.136', '1'),
('399', '1', '2012-02-07 11:00:56', '67.220.101.136', '1'),
('400', '2', '2012-02-07 19:40:20', '71.41.234.174', '1'),
('401', '1', '2012-02-07 19:40:28', '71.41.234.174', '3'),
('402', '1', '2012-02-09 15:47:46', '71.41.234.174', '2'),
('403', '1', '2012-02-11 00:01:46', '173.74.146.43', '2'),
('404', '2', '2012-02-11 00:02:01', '173.74.146.43', '1'),
('405', '2', '2012-02-11 04:48:59', '64.125.188.26', '1'),
('406', '1', '2012-02-11 06:17:26', '64.125.188.26', '3');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('407', '2', '2012-02-11 06:54:28', '166.205.10.251', '1'),
('408', '2', '2012-02-13 04:38:53', '76.186.25.184', '1'),
('409', '1', '2012-02-14 18:02:47', '173.74.146.43', '1'),
('410', '1', '2012-02-16 20:53:47', '71.41.234.174', '2'),
('411', '1', '2012-02-16 22:37:06', '24.153.214.56', '2'),
('412', '2', '2012-02-16 22:41:11', '24.153.214.56', '2'),
('413', '1', '2012-02-22 20:52:12', '71.41.234.174', '2'),
('414', '1', '2012-02-23 14:18:59', '71.41.234.174', '2'),
('415', '1', '2012-02-29 20:22:04', '71.91.172.66', '2'),
('416', '2', '2012-02-29 20:22:29', '71.91.172.66', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('417', '1', '2012-02-29 23:23:01', '71.40.232.84', '4'),
('418', '2', '2012-02-29 23:24:20', '71.40.232.84', '3'),
('419', '1', '2012-03-01 21:33:51', '71.40.232.84', '1'),
('420', '2', '2012-03-01 21:33:53', '71.40.232.84', '3'),
('421', '1', '2012-03-06 20:10:44', '71.40.232.84', '2'),
('422', '2', '2012-03-06 20:10:47', '71.40.232.84', '4'),
('423', '1', '2012-03-08 17:58:39', '173.74.146.43', '2'),
('424', '1', '2012-03-08 18:39:49', '173.74.146.43', '1'),
('425', '2', '2012-03-08 18:39:53', '173.74.146.43', '1'),
('426', '2', '2012-03-08 19:34:28', '69.15.64.170', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('427', '1', '2012-03-08 20:45:58', '64.125.188.26', '3'),
('428', '2', '2012-03-08 22:26:49', '64.125.188.26', '1'),
('429', '1', '2012-03-20 19:26:57', '71.40.232.84', '1'),
('430', '2', '2012-03-20 19:27:00', '71.40.232.84', '2'),
('431', '1', '2012-03-21 04:28:10', '173.74.146.43', '2'),
('432', '1', '2012-04-09 14:12:33', '108.178.113.20', '3'),
('433', '2', '2012-04-09 14:13:09', '108.178.113.20', '8'),
('434', '1', '2012-04-11 16:40:39', '173.74.146.43', '1'),
('435', '1', '2012-04-11 20:31:28', '64.125.188.26', '2'),
('436', '1', '2012-04-17 01:10:52', '173.74.146.43', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('437', '2', '2012-04-17 01:10:55', '173.74.146.43', '1'),
('438', '2', '2012-04-17 05:16:33', '64.125.188.26', '1'),
('439', '1', '2012-04-24 19:26:45', '99.90.103.22', '2'),
('440', '1', '2012-04-25 13:16:24', '108.178.113.251', '2'),
('441', '1', '2012-04-25 14:04:44', '108.178.113.251', '1'),
('442', '1', '2012-04-30 21:08:10', '68.71.67.4', '1'),
('443', '1', '2012-05-01 03:07:11', '64.125.188.26', '2'),
('444', '1', '2012-05-09 19:08:44', '108.178.113.251', '7'),
('445', '2', '2012-05-09 19:08:47', '108.178.113.251', '8'),
('446', '1', '2012-05-09 20:42:44', '108.178.113.251', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('447', '1', '2012-05-09 21:45:31', '108.178.113.251', '1'),
('448', '2', '2012-05-09 21:45:34', '108.178.113.251', '1'),
('449', '1', '2012-05-09 23:53:16', '108.178.113.251', '1'),
('450', '2', '2012-05-09 23:53:18', '108.178.113.251', '1'),
('451', '1', '2012-05-11 17:54:13', '108.178.113.251', '1'),
('452', '2', '2012-05-11 17:54:17', '108.178.113.251', '1'),
('453', '1', '2012-05-14 18:28:56', '108.178.113.251', '1'),
('454', '2', '2012-05-14 18:29:00', '108.178.113.251', '1'),
('455', '2', '2012-05-14 19:28:29', '108.178.113.251', '1'),
('456', '1', '2012-05-15 17:04:45', '108.178.113.251', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('457', '2', '2012-05-15 17:04:49', '108.178.113.251', '2'),
('458', '1', '2012-05-15 21:33:39', '108.178.113.20', '1'),
('459', '1', '2012-05-16 15:33:35', '108.178.113.251', '1'),
('460', '2', '2012-05-16 15:33:37', '108.178.113.251', '2'),
('461', '1', '2012-05-16 19:48:14', '173.74.146.215', '3'),
('462', '2', '2012-05-16 19:48:23', '173.74.146.215', '2'),
('463', '1', '2012-05-16 22:33:37', '64.125.188.25', '2'),
('464', '2', '2012-05-16 22:33:52', '64.125.188.25', '1'),
('465', '1', '2012-05-17 16:17:30', '108.178.113.251', '2'),
('466', '2', '2012-05-17 16:17:32', '108.178.113.251', '4');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('467', '1', '2012-05-21 20:38:16', '108.178.113.251', '3'),
('468', '2', '2012-05-21 20:38:39', '108.178.113.251', '3'),
('469', '2', '2012-05-21 21:15:40', '108.178.113.251', '1'),
('470', '1', '2012-05-22 15:18:23', '64.134.147.29', '1'),
('471', '1', '2012-05-22 18:29:14', '64.125.188.25', '2'),
('472', '1', '2012-05-22 20:49:11', '108.178.113.251', '5'),
('473', '2', '2012-05-22 20:49:21', '108.178.113.251', '6'),
('474', '2', '2012-05-22 21:00:21', '108.178.113.20', '1'),
('475', '1', '2012-05-24 16:12:50', '108.178.113.251', '2'),
('476', '2', '2012-05-24 16:12:53', '108.178.113.251', '4');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('477', '1', '2012-05-25 18:46:10', '108.178.112.183', '2'),
('478', '1', '2012-05-30 15:58:59', '64.134.144.51', '1'),
('479', '1', '2012-05-31 14:53:07', '173.74.146.215', '1'),
('480', '2', '2012-05-31 14:53:21', '173.74.146.215', '1'),
('481', '1', '2012-05-31 22:09:30', '173.74.146.215', '1'),
('482', '1', '2012-06-02 15:06:00', '173.74.146.215', '1'),
('483', '2', '2012-06-02 15:06:33', '173.74.146.215', '1'),
('484', '1', '2012-06-02 18:33:05', '64.125.188.25', '2'),
('485', '2', '2012-06-02 18:33:10', '64.125.188.25', '1'),
('486', '1', '2012-06-05 16:11:29', '108.178.113.251', '3');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('487', '2', '2012-06-05 16:11:42', '108.178.113.251', '2'),
('488', '1', '2012-06-06 13:08:29', '108.178.113.251', '1'),
('489', '2', '2012-06-06 13:08:31', '108.178.113.251', '2'),
('490', '1', '2012-06-06 19:19:58', '108.178.113.20', '1'),
('491', '1', '2012-06-07 14:54:32', '108.178.113.251', '1'),
('492', '1', '2012-06-07 15:09:45', '108.178.113.251', '1'),
('493', '2', '2012-06-07 15:12:04', '108.178.113.251', '1'),
('494', '1', '2012-06-07 17:02:02', '108.178.113.251', '1'),
('495', '2', '2012-06-07 17:02:05', '108.178.113.251', '3'),
('496', '1', '2012-06-14 15:16:33', '108.178.113.251', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('497', '2', '2012-06-14 15:16:36', '108.178.113.251', '4'),
('498', '1', '2012-06-14 16:40:54', '108.178.113.251', '2'),
('499', '2', '2012-06-14 16:40:56', '108.178.113.251', '4'),
('500', '1', '2012-06-14 17:36:04', '108.178.113.251', '1'),
('501', '2', '2012-06-14 17:36:06', '108.178.113.251', '2'),
('502', '1', '2012-06-18 16:58:53', '108.178.113.251', '2'),
('503', '2', '2012-06-18 16:59:11', '108.178.113.251', '1'),
('504', '2', '2012-06-18 17:01:00', '108.178.113.251', '1'),
('505', '1', '2012-06-18 20:34:50', '108.178.113.251', '1'),
('506', '2', '2012-06-18 20:34:55', '108.178.113.251', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('507', '1', '2012-06-18 22:09:24', '108.178.113.251', '1'),
('508', '2', '2012-06-18 22:09:26', '108.178.113.251', '2'),
('509', '1', '2012-06-19 16:59:30', '108.178.113.251', '2'),
('510', '2', '2012-06-19 16:59:48', '108.178.113.251', '1'),
('511', '2', '2012-06-19 17:00:11', '108.178.113.251', '2'),
('512', '1', '2012-06-20 18:53:53', '173.74.146.215', '1'),
('513', '1', '2012-06-20 20:14:15', '108.178.113.251', '1'),
('514', '2', '2012-06-20 20:14:20', '108.178.113.251', '2'),
('515', '1', '2012-06-20 22:14:42', '108.178.113.251', '1'),
('516', '2', '2012-06-20 22:14:44', '108.178.113.251', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('517', '1', '2012-06-25 16:18:24', '108.178.113.251', '2'),
('518', '2', '2012-06-25 16:18:26', '108.178.113.251', '3'),
('519', '1', '2012-06-27 17:00:36', '64.134.24.202', '2'),
('520', '2', '2012-06-27 17:59:54', '108.178.113.251', '1'),
('521', '2', '2012-06-27 18:03:11', '108.178.113.251', '1'),
('522', '1', '2012-06-27 20:56:47', '64.125.188.25', '1'),
('523', '1', '2012-06-27 21:47:23', '64.134.24.202', '1'),
('524', '1', '2012-06-28 19:37:48', '108.178.113.20', '2'),
('525', '2', '2012-06-28 19:43:22', '108.178.113.20', '2'),
('526', '1', '2012-07-03 22:11:30', '173.74.153.252', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('527', '1', '2012-07-04 02:37:05', '64.125.188.25', '1'),
('528', '1', '2012-07-06 15:34:19', '173.74.153.252', '1'),
('529', '1', '2012-07-06 18:13:23', '64.125.188.25', '1'),
('530', '1', '2012-07-09 20:01:59', '108.178.113.251', '1'),
('531', '1', '2012-07-10 20:14:10', '108.178.113.251', '3'),
('532', '2', '2012-07-10 20:14:25', '108.178.113.251', '5'),
('533', '1', '2012-07-12 20:29:06', '173.74.153.252', '1'),
('534', '1', '2012-07-13 21:44:11', '173.74.153.252', '1'),
('535', '1', '2012-07-23 16:49:48', '99.90.103.22', '2'),
('536', '1', '2012-07-26 16:03:18', '108.178.113.251', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('537', '2', '2012-07-26 16:03:30', '108.178.113.251', '2'),
('538', '1', '2012-07-26 20:38:58', '108.178.113.251', '3'),
('539', '2', '2012-07-26 20:39:00', '108.178.113.251', '5'),
('540', '1', '2012-07-26 21:56:27', '173.74.153.252', '1'),
('541', '1', '2012-07-26 22:32:08', '108.178.113.251', '5'),
('542', '2', '2012-07-26 22:32:18', '108.178.113.251', '7'),
('543', '1', '2012-07-26 23:09:21', '192.150.3.7', '13'),
('544', '1', '2012-07-26 23:09:21', '192.150.3.7', '1'),
('545', '1', '2012-07-27 21:37:55', '173.74.153.252', '1'),
('546', '1', '2012-08-07 16:30:04', '108.178.113.251', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('547', '2', '2012-08-07 16:30:22', '108.178.113.251', '1'),
('548', '1', '2012-08-07 19:02:32', '108.178.113.251', '1'),
('549', '2', '2012-08-07 19:02:35', '108.178.113.251', '2'),
('550', '1', '2012-08-08 18:08:07', '108.178.113.20', '2'),
('551', '1', '2012-08-15 20:53:08', '108.178.113.20', '1'),
('552', '2', '2012-08-15 20:53:23', '108.178.113.20', '2'),
('553', '1', '2012-08-20 21:10:42', '108.178.113.201', '1'),
('554', '2', '2012-08-20 21:10:45', '108.178.113.201', '3'),
('555', '1', '2012-08-21 21:36:00', '108.178.113.201', '2'),
('556', '2', '2012-08-21 21:36:13', '108.178.113.201', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('557', '1', '2012-08-22 21:59:15', '108.178.113.201', '1'),
('558', '2', '2012-08-22 21:59:18', '108.178.113.201', '1'),
('559', '2', '2012-08-22 22:00:30', '108.178.113.201', '1'),
('560', '1', '2012-08-23 15:21:55', '108.178.113.201', '1'),
('561', '2', '2012-08-23 15:21:57', '108.178.113.201', '2'),
('562', '1', '2012-08-23 20:35:10', '108.178.113.201', '1'),
('563', '2', '2012-08-23 20:35:13', '108.178.113.201', '1'),
('564', '1', '2012-08-27 21:05:07', '173.74.153.252', '8'),
('565', '1', '2012-08-28 01:27:14', '64.125.188.25', '2'),
('566', '1', '2012-09-06 16:00:59', '99.90.103.22', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('567', '1', '2012-09-18 13:17:10', '108.178.113.201', '2'),
('568', '2', '2012-09-18 13:17:23', '108.178.113.201', '2'),
('569', '1', '2012-09-20 19:35:39', '108.178.113.201', '1'),
('570', '2', '2012-09-20 19:35:41', '108.178.113.201', '2'),
('571', '1', '2012-09-24 21:10:57', '108.178.113.201', '1'),
('572', '2', '2012-09-24 21:11:00', '108.178.113.201', '2'),
('573', '1', '2012-09-25 06:26:02', '173.74.153.252', '1'),
('574', '1', '2012-09-25 11:44:20', '64.125.188.25', '4'),
('575', '1', '2012-09-26 18:34:43', '108.178.113.201', '1'),
('576', '2', '2012-09-26 18:34:46', '108.178.113.201', '3');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('577', '1', '2012-09-26 19:20:29', '108.178.113.201', '1'),
('578', '2', '2012-09-26 19:20:31', '108.178.113.201', '2'),
('579', '1', '2012-09-27 13:48:13', '108.178.113.201', '1'),
('580', '2', '2012-09-27 13:48:15', '108.178.113.201', '2'),
('581', '1', '2012-10-01 13:07:16', '108.178.113.201', '1'),
('582', '2', '2012-10-01 13:07:18', '108.178.113.201', '2'),
('583', '1', '2012-10-01 16:58:14', '108.178.113.201', '1'),
('584', '2', '2012-10-01 16:58:17', '108.178.113.201', '2'),
('585', '1', '2012-10-04 18:13:25', '99.43.203.25', '1'),
('586', '2', '2012-10-04 21:54:37', '99.43.203.25', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('587', '1', '2012-10-04 23:49:55', '64.125.188.25', '2'),
('588', '1', '2012-10-05 01:56:04', '64.125.188.25', '1'),
('589', '1', '2012-10-05 04:18:44', '64.125.188.25', '1'),
('590', '2', '2012-10-05 06:01:45', '64.125.188.25', '1'),
('591', '1', '2012-10-08 21:24:20', '108.178.113.201', '2'),
('592', '2', '2012-10-08 21:24:56', '108.178.113.201', '2'),
('593', '1', '2012-10-09 13:48:43', '108.178.113.201', '2'),
('594', '2', '2012-10-09 13:48:58', '108.178.113.201', '2'),
('595', '1', '2012-10-11 14:38:07', '108.178.113.20', '1'),
('596', '1', '2012-10-11 20:46:03', '108.178.113.201', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('597', '2', '2012-10-11 20:46:06', '108.178.113.201', '2'),
('598', '1', '2012-10-15 14:45:24', '108.178.113.20', '3'),
('599', '2', '2012-10-15 14:45:57', '108.178.113.20', '2'),
('600', '2', '2012-10-16 21:18:40', '64.134.26.212', '1'),
('601', '1', '2012-10-18 16:51:01', '108.178.113.20', '2'),
('602', '2', '2012-10-18 16:51:21', '108.178.113.20', '1'),
('603', '1', '2012-10-18 20:01:27', '108.178.113.201', '1'),
('604', '2', '2012-10-18 20:01:30', '108.178.113.201', '2'),
('605', '1', '2012-10-19 15:59:53', '99.90.103.22', '1'),
('606', '1', '2012-10-22 19:29:07', '71.41.234.174', '4');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('607', '1', '2012-10-23 15:30:28', '99.29.93.61', '2'),
('608', '2', '2012-10-23 15:30:38', '99.29.93.61', '1'),
('609', '2', '2012-11-02 17:33:31', '68.71.72.185', '1'),
('610', '1', '2012-11-02 21:04:34', '64.134.144.23', '2'),
('611', '2', '2012-11-02 21:04:40', '64.134.144.23', '1'),
('612', '1', '2012-11-03 04:30:42', '64.125.188.26', '5'),
('613', '2', '2012-11-03 04:53:34', '64.125.188.26', '1'),
('614', '1', '2012-11-06 21:36:01', '108.178.113.201', '2'),
('615', '2', '2012-11-06 21:36:04', '108.178.113.201', '3'),
('616', '1', '2012-11-13 17:11:47', '108.178.113.201', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('617', '1', '2012-11-14 19:27:53', '108.178.113.201', '1'),
('618', '2', '2012-11-14 19:27:56', '108.178.113.201', '2'),
('619', '1', '2012-11-15 22:08:33', '108.178.113.201', '1'),
('620', '2', '2012-11-15 22:08:36', '108.178.113.201', '2'),
('621', '1', '2012-11-16 23:31:06', '76.255.73.15', '1'),
('622', '1', '2012-11-21 14:17:01', '64.134.56.134', '1'),
('623', '1', '2012-11-26 14:47:02', '71.41.234.174', '2'),
('624', '1', '2012-11-27 14:34:50', '64.134.147.135', '1'),
('625', '1', '2012-11-27 20:57:46', '108.178.113.20', '1'),
('626', '1', '2012-11-30 15:47:02', '71.41.234.174', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('627', '1', '2012-12-03 23:14:14', '108.178.113.201', '3'),
('628', '1', '2012-12-04 20:29:24', '71.41.234.174', '2'),
('629', '2', '2012-12-05 00:07:22', '129.118.224.104', '3'),
('630', '2', '2012-12-05 00:07:22', '129.118.224.104', '1'),
('631', '1', '2012-12-05 22:51:42', '108.178.113.201', '1'),
('632', '1', '2012-12-10 20:56:02', '108.178.113.201', '1'),
('633', '2', '2012-12-10 20:56:05', '108.178.113.201', '2'),
('634', '1', '2012-12-11 16:07:13', '71.41.234.174', '2'),
('635', '1', '2012-12-11 21:31:06', '108.178.113.201', '1'),
('636', '2', '2012-12-11 21:31:08', '108.178.113.201', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('637', '1', '2012-12-12 18:00:05', '108.178.113.20', '2'),
('638', '2', '2012-12-12 18:11:15', '108.178.113.20', '2'),
('639', '1', '2012-12-13 20:14:57', '108.178.113.20', '2'),
('640', '2', '2012-12-13 20:15:23', '108.178.113.20', '2'),
('641', '1', '2012-12-13 22:30:36', '108.178.113.201', '1'),
('642', '2', '2012-12-13 22:30:39', '108.178.113.201', '2'),
('643', '1', '2012-12-18 16:29:52', '108.178.113.201', '2'),
('644', '2', '2012-12-18 16:30:00', '108.178.113.201', '2'),
('645', '1', '2012-12-20 18:26:34', '108.178.113.20', '10'),
('646', '2', '2012-12-20 18:27:04', '108.178.113.20', '4');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('647', '2', '2012-12-22 14:59:28', '96.226.198.220', '1'),
('648', '2', '2012-12-27 21:27:13', '69.127.246.24', '2'),
('649', '1', '2012-12-27 21:43:29', '108.178.113.20', '1'),
('650', '1', '2013-01-10 16:58:06', '108.178.113.201', '1'),
('651', '2', '2013-01-10 16:58:09', '108.178.113.201', '2'),
('652', '1', '2013-01-11 17:53:15', '108.178.113.201', '2'),
('653', '2', '2013-01-11 17:53:18', '108.178.113.201', '5'),
('654', '1', '2013-01-14 18:21:37', '108.178.113.201', '1'),
('655', '2', '2013-01-14 18:21:39', '108.178.113.201', '2'),
('656', '1', '2013-01-14 22:10:24', '108.178.113.201', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('657', '2', '2013-01-14 22:10:26', '108.178.113.201', '2'),
('658', '1', '2013-01-15 20:37:11', '99.90.103.22', '2'),
('659', '1', '2013-01-16 17:41:20', '99.90.103.22', '2'),
('660', '1', '2013-01-17 21:09:14', '108.178.113.201', '3'),
('661', '1', '2013-01-21 14:39:29', '71.41.234.174', '2'),
('662', '1', '2013-01-21 15:56:43', '108.178.113.201', '2'),
('663', '1', '2013-01-21 22:28:31', '108.178.113.201', '1'),
('664', '2', '2013-01-21 22:28:34', '108.178.113.201', '2'),
('665', '1', '2013-01-22 17:01:56', '108.178.113.201', '2'),
('666', '2', '2013-01-22 17:01:58', '108.178.113.201', '4');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('667', '1', '2013-01-23 18:38:40', '66.249.73.231', '1'),
('668', '1', '2013-01-24 15:07:20', '71.41.234.174', '2'),
('669', '1', '2013-01-24 17:32:09', '64.134.30.99', '1'),
('670', '1', '2013-01-24 21:58:10', '108.178.113.201', '3'),
('671', '2', '2013-01-24 21:58:19', '108.178.113.201', '3'),
('672', '2', '2013-01-24 22:00:27', '108.178.113.201', '3'),
('673', '1', '2013-01-24 22:00:37', '108.178.113.201', '1'),
('674', '1', '2013-01-26 09:53:04', '66.249.73.231', '1'),
('675', '1', '2013-01-28 17:07:45', '108.178.113.201', '4'),
('676', '2', '2013-01-28 17:07:47', '108.178.113.201', '4');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('677', '1', '2013-02-05 17:16:06', '108.178.113.201', '1'),
('678', '2', '2013-02-05 17:16:09', '108.178.113.201', '2'),
('679', '1', '2013-02-06 14:24:34', '99.129.130.94', '1'),
('680', '1', '2013-02-06 20:07:29', '108.178.113.201', '2'),
('681', '2', '2013-02-06 20:07:32', '108.178.113.201', '4'),
('682', '1', '2013-02-11 15:47:04', '108.194.115.235', '1'),
('683', '1', '2013-02-11 18:23:31', '64.125.188.26', '4'),
('684', '1', '2013-02-11 22:43:42', '108.178.113.201', '1'),
('685', '1', '2013-02-18 17:32:15', '108.178.113.201', '2'),
('686', '2', '2013-02-18 17:32:24', '108.178.113.201', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('687', '1', '2013-02-19 16:31:06', '108.211.97.235', '1'),
('688', '1', '2013-02-20 19:51:45', '108.211.97.235', '1'),
('689', '1', '2013-02-20 22:29:36', '108.178.113.201', '1'),
('690', '2', '2013-02-20 22:29:38', '108.178.113.201', '1'),
('691', '1', '2013-02-21 13:27:24', '76.185.228.77', '1'),
('692', '1', '2013-02-27 14:58:46', '108.178.113.201', '2'),
('693', '2', '2013-02-27 14:59:00', '108.178.113.201', '1'),
('694', '2', '2013-02-27 15:01:16', '108.178.113.201', '1'),
('695', '1', '2013-03-02 06:02:20', '173.242.125.191', '1'),
('696', '1', '2013-03-02 14:23:33', '63.147.126.185', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('697', '2', '2013-03-02 14:23:41', '63.147.126.185', '1'),
('698', '1', '2013-03-05 16:57:49', '108.178.113.201', '1'),
('699', '2', '2013-03-05 16:57:52', '108.178.113.201', '2'),
('700', '2', '2013-03-05 17:03:33', '108.178.113.201', '1'),
('701', '1', '2013-03-06 22:47:46', '108.178.113.201', '2'),
('702', '2', '2013-03-06 22:47:59', '108.178.113.201', '2'),
('703', '1', '2013-03-11 15:37:37', '108.178.113.201', '2'),
('704', '2', '2013-03-11 15:37:59', '108.178.113.201', '2'),
('705', '1', '2013-03-11 19:28:11', '108.178.113.201', '2'),
('706', '2', '2013-03-11 19:28:22', '108.178.113.201', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('707', '1', '2013-03-12 17:09:10', '108.178.113.201', '3'),
('708', '2', '2013-03-12 17:10:33', '108.178.113.201', '4'),
('709', '1', '2013-03-18 04:31:45', '173.199.119.19', '1'),
('710', '1', '2013-03-21 19:47:12', '108.178.113.201', '1'),
('711', '2', '2013-03-21 19:47:16', '108.178.113.201', '2'),
('712', '1', '2013-03-22 19:42:09', '108.211.98.247', '1'),
('713', '1', '2013-03-25 20:16:30', '99.90.103.22', '2'),
('714', '1', '2013-03-28 14:32:26', '108.178.113.201', '1'),
('715', '1', '2013-03-28 20:05:34', '216.201.172.10', '1'),
('716', '1', '2013-03-31 03:04:43', '199.21.99.117', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('717', '1', '2013-04-02 17:02:31', '108.178.113.201', '1'),
('718', '2', '2013-04-02 17:02:34', '108.178.113.201', '2'),
('719', '1', '2013-04-03 16:08:25', '108.178.112.182', '2'),
('720', '1', '2013-04-09 11:17:36', '180.76.5.54', '1'),
('721', '1', '2013-04-09 13:14:24', '108.178.113.201', '2'),
('722', '2', '2013-04-09 13:14:45', '108.178.113.201', '2'),
('723', '1', '2013-04-09 18:39:54', '71.41.152.114', '2'),
('724', '1', '2013-04-10 09:16:43', '173.199.116.211', '1'),
('725', '1', '2013-04-10 14:24:16', '71.41.152.114', '1'),
('726', '1', '2013-04-10 18:53:33', '108.178.113.201', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('727', '2', '2013-04-10 18:53:36', '108.178.113.201', '1'),
('728', '1', '2013-04-11 17:15:59', '108.178.113.201', '1'),
('729', '2', '2013-04-11 17:16:02', '108.178.113.201', '2'),
('730', '1', '2013-04-12 14:55:42', '70.104.26.136', '1'),
('731', '1', '2013-04-12 20:50:36', '64.125.188.25', '4'),
('732', '1', '2013-04-15 16:06:00', '108.208.86.62', '1'),
('733', '1', '2013-04-15 21:00:55', '108.178.113.201', '1'),
('734', '2', '2013-04-15 21:01:00', '108.178.113.201', '2'),
('735', '1', '2013-04-16 12:17:12', '95.134.112.140', '3'),
('736', '1', '2013-04-18 17:30:01', '108.178.113.201', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('737', '2', '2013-04-18 17:30:31', '108.178.113.201', '2'),
('738', '1', '2013-04-23 20:10:05', '108.178.113.201', '4'),
('739', '2', '2013-04-23 20:10:38', '108.178.113.201', '4'),
('740', '1', '2013-04-23 21:38:33', '71.41.234.174', '1'),
('741', '1', '2013-04-25 04:35:14', '173.199.116.11', '1'),
('742', '1', '2013-04-29 18:00:17', '108.178.112.182', '3'),
('743', '2', '2013-04-29 18:04:08', '108.178.112.182', '2'),
('744', '1', '2013-04-30 02:59:24', '173.199.119.19', '1'),
('745', '1', '2013-05-01 21:54:45', '83.149.126.98', '1'),
('746', '1', '2013-05-02 08:45:36', '204.12.208.234', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('747', '2', '2013-05-02 08:45:42', '204.12.208.234', '1'),
('748', '1', '2013-05-03 17:46:17', '66.249.73.8', '1'),
('749', '1', '2013-05-05 12:11:22', '180.76.5.65', '1'),
('750', '1', '2013-05-06 13:20:18', '108.178.113.201', '2'),
('751', '2', '2013-05-06 13:20:37', '108.178.113.201', '1'),
('752', '1', '2013-05-06 14:09:38', '108.208.88.94', '2'),
('753', '1', '2013-05-07 15:00:43', '71.41.234.174', '3'),
('754', '1', '2013-05-08 14:23:02', '180.76.5.165', '1'),
('755', '1', '2013-05-08 22:05:47', '108.178.113.201', '2'),
('756', '2', '2013-05-08 22:06:19', '108.178.113.201', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('757', '1', '2013-05-11 07:39:54', '173.199.114.195', '1'),
('758', '1', '2013-05-13 00:58:41', '173.192.235.226', '1'),
('759', '1', '2013-05-13 23:15:26', '208.115.113.86', '1'),
('760', '1', '2013-05-14 21:42:04', '108.178.113.201', '2'),
('761', '2', '2013-05-14 21:56:58', '108.178.113.201', '1'),
('762', '2', '2013-05-14 22:15:06', '108.178.113.201', '1'),
('763', '1', '2013-05-16 00:26:38', '173.199.119.11', '1'),
('764', '1', '2013-05-21 15:28:40', '108.178.113.201', '2'),
('765', '2', '2013-05-21 15:29:07', '108.178.113.201', '2'),
('766', '1', '2013-05-21 16:13:02', '108.178.113.201', '3');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('767', '2', '2013-05-21 16:13:10', '108.178.113.201', '3'),
('768', '1', '2013-05-28 17:24:40', '108.194.113.68', '1'),
('769', '1', '2013-05-28 23:19:28', '64.125.188.25', '3'),
('770', '1', '2013-05-29 00:02:31', '208.115.113.86', '1'),
('771', '1', '2013-05-29 21:05:27', '108.208.88.159', '3'),
('772', '1', '2013-05-30 03:30:29', '64.125.188.25', '1'),
('773', '1', '2013-05-30 04:40:07', '70.123.125.213', '1'),
('774', '1', '2013-05-30 17:14:10', '108.178.113.201', '1'),
('775', '2', '2013-05-30 17:15:00', '108.178.113.201', '2'),
('776', '1', '2013-05-30 18:27:43', '66.249.73.11', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('777', '1', '2013-05-31 22:02:45', '173.199.114.91', '1'),
('778', '1', '2013-06-01 19:12:49', '66.249.73.11', '1'),
('779', '1', '2013-06-03 22:22:13', '108.178.113.201', '2'),
('780', '2', '2013-06-03 22:22:51', '108.178.113.201', '2'),
('781', '1', '2013-06-04 06:44:42', '50.11.171.105', '1'),
('782', '1', '2013-06-04 17:25:36', '108.178.113.201', '2'),
('783', '2', '2013-06-04 17:25:47', '108.178.113.201', '1'),
('784', '1', '2013-06-04 20:36:34', '66.249.73.11', '1'),
('785', '1', '2013-06-05 00:07:07', '65.55.24.218', '1'),
('786', '1', '2013-06-05 20:11:01', '66.249.73.11', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('787', '1', '2013-06-10 16:18:08', '50.11.86.119', '3'),
('788', '2', '2013-06-10 16:46:05', '108.178.113.201', '2'),
('789', '1', '2013-06-10 18:35:46', '69.41.14.215', '3'),
('790', '1', '2013-06-10 22:03:12', '108.178.113.201', '1'),
('791', '2', '2013-06-10 22:03:18', '108.178.113.201', '2'),
('792', '1', '2013-06-11 13:56:33', '108.178.113.201', '2'),
('793', '2', '2013-06-11 13:56:38', '108.178.113.201', '2'),
('794', '2', '2013-06-11 14:01:38', '108.178.113.201', '1'),
('795', '1', '2013-06-11 17:32:15', '108.178.113.201', '1'),
('796', '2', '2013-06-11 17:32:17', '108.178.113.201', '4');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('797', '1', '2013-06-11 19:05:52', '66.249.73.11', '1'),
('798', '1', '2013-06-11 21:39:21', '108.178.113.201', '2'),
('799', '2', '2013-06-11 21:39:28', '108.178.113.201', '3'),
('800', '1', '2013-06-11 22:01:41', '108.178.113.201', '1'),
('801', '2', '2013-06-11 22:01:47', '108.178.113.201', '2'),
('802', '1', '2013-06-12 06:07:29', '173.199.120.75', '1'),
('803', '1', '2013-06-12 14:27:44', '71.41.234.174', '6'),
('804', '1', '2013-06-12 23:12:02', '66.249.73.11', '1'),
('805', '1', '2013-06-13 00:20:29', '208.115.113.86', '1'),
('806', '1', '2013-06-13 17:11:16', '108.178.113.201', '4');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('807', '2', '2013-06-13 17:14:51', '108.178.113.201', '4'),
('808', '1', '2013-06-17 21:33:30', '71.41.234.174', '2'),
('809', '1', '2013-06-19 20:00:40', '108.178.112.182', '1'),
('810', '2', '2013-06-19 20:03:41', '108.178.112.182', '1'),
('811', '1', '2013-06-21 16:22:32', '71.41.234.174', '2'),
('812', '1', '2013-06-23 14:47:37', '173.199.114.235', '1'),
('813', '2', '2013-06-23 21:10:29', '208.115.111.70', '1'),
('814', '1', '2013-06-24 03:46:29', '66.249.73.11', '1'),
('815', '1', '2013-06-25 21:25:39', '108.178.112.182', '2'),
('816', '2', '2013-06-25 21:26:04', '108.178.112.182', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('817', '1', '2013-06-28 00:03:30', '208.115.113.86', '1'),
('818', '2', '2013-06-28 05:19:52', '180.76.5.62', '1'),
('819', '1', '2013-06-28 20:24:58', '180.76.5.195', '1'),
('820', '1', '2013-06-30 14:19:57', '173.242.125.206', '1'),
('821', '1', '2013-06-30 17:36:01', '46.229.164.102', '1'),
('822', '1', '2013-07-01 12:25:50', '180.76.5.60', '1'),
('823', '1', '2013-07-01 23:00:41', '173.199.115.147', '1'),
('824', '1', '2013-07-02 15:09:46', '108.178.113.201', '3'),
('825', '2', '2013-07-02 15:13:41', '108.178.113.201', '2'),
('826', '1', '2013-07-02 21:43:56', '108.178.113.201', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('827', '2', '2013-07-02 21:44:00', '108.178.113.201', '2'),
('828', '1', '2013-07-03 05:07:19', '180.76.5.54', '1'),
('829', '1', '2013-07-03 18:53:38', '46.229.164.101', '1'),
('830', '1', '2013-07-03 21:05:11', '108.178.113.201', '2'),
('831', '2', '2013-07-03 21:05:17', '108.178.113.201', '3'),
('832', '1', '2013-07-05 07:29:05', '173.199.119.35', '1'),
('833', '1', '2013-07-06 21:09:09', '180.76.5.146', '1'),
('834', '1', '2013-07-09 02:12:13', '180.76.5.113', '1'),
('835', '2', '2013-07-09 06:01:43', '208.115.111.70', '1'),
('836', '1', '2013-07-09 09:20:26', '46.229.164.102', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('837', '1', '2013-07-09 19:47:29', '173.199.116.19', '1'),
('838', '1', '2013-07-09 21:30:50', '108.178.113.201', '2'),
('839', '2', '2013-07-09 21:31:17', '108.178.113.201', '6'),
('840', '1', '2013-07-10 20:27:14', '108.178.113.201', '2'),
('841', '2', '2013-07-10 20:29:45', '108.178.113.201', '2'),
('842', '1', '2013-07-10 22:02:02', '108.178.113.201', '1'),
('843', '2', '2013-07-10 22:02:06', '108.178.113.201', '3'),
('844', '1', '2013-07-11 13:45:35', '108.178.113.201', '1'),
('845', '2', '2013-07-11 13:45:40', '108.178.113.201', '2'),
('846', '1', '2013-07-12 19:24:47', '71.41.234.174', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('847', '1', '2013-07-13 00:03:44', '208.115.113.86', '1'),
('848', '1', '2013-07-15 17:56:22', '144.76.95.232', '1'),
('849', '1', '2013-07-16 05:17:51', '24.230.51.149', '1'),
('850', '1', '2013-07-16 07:42:15', '46.161.41.24', '1'),
('851', '1', '2013-07-16 17:01:38', '108.178.113.201', '2'),
('852', '1', '2013-07-16 22:13:59', '108.178.113.201', '1'),
('853', '1', '2013-07-18 17:22:00', '108.178.113.201', '2'),
('854', '2', '2013-07-18 17:22:32', '108.178.113.201', '2'),
('855', '1', '2013-07-18 19:41:28', '108.178.113.201', '1'),
('856', '2', '2013-07-18 19:43:08', '108.178.113.201', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('857', '1', '2013-07-19 15:34:30', '71.41.234.174', '2'),
('858', '2', '2013-07-20 12:27:18', '180.76.5.179', '1'),
('859', '2', '2013-07-22 11:57:44', '69.30.238.26', '1'),
('860', '1', '2013-07-22 18:53:21', '108.178.113.201', '3'),
('861', '2', '2013-07-22 18:53:50', '108.178.113.201', '4'),
('862', '1', '2013-07-22 19:45:15', '71.41.234.174', '2'),
('863', '1', '2013-07-22 20:48:02', '71.41.234.174', '2'),
('864', '1', '2013-07-23 22:04:20', '108.178.113.201', '2'),
('865', '2', '2013-07-23 22:06:04', '108.178.113.201', '3'),
('866', '2', '2013-07-24 10:03:11', '208.115.111.70', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('867', '1', '2013-07-24 16:25:26', '108.178.113.201', '1'),
('868', '1', '2013-07-24 17:01:29', '108.178.113.201', '2'),
('869', '2', '2013-07-24 17:01:54', '108.178.113.201', '2'),
('870', '1', '2013-07-24 20:42:55', '108.178.113.201', '1'),
('871', '2', '2013-07-24 20:43:02', '108.178.113.201', '2'),
('872', '1', '2013-07-25 05:46:36', '180.76.6.227', '1'),
('873', '1', '2013-07-28 00:00:18', '208.115.113.86', '1'),
('874', '1', '2013-07-29 07:04:18', '173.199.114.187', '1'),
('875', '1', '2013-07-29 17:40:10', '108.178.113.201', '1'),
('876', '2', '2013-07-29 17:43:26', '108.178.113.201', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('877', '1', '2013-07-30 15:45:05', '108.178.113.201', '2'),
('878', '2', '2013-07-30 15:45:16', '108.178.113.201', '2'),
('879', '1', '2013-08-01 15:28:36', '108.178.113.201', '4'),
('880', '2', '2013-08-01 15:29:11', '108.178.113.201', '3'),
('881', '1', '2013-08-03 03:03:34', '208.43.225.84', '1'),
('882', '1', '2013-08-06 15:12:03', '108.178.113.201', '2'),
('883', '2', '2013-08-06 15:17:52', '108.178.113.201', '2'),
('884', '1', '2013-08-07 13:22:57', '71.41.234.174', '2'),
('885', '1', '2013-08-07 21:43:19', '71.41.234.174', '3'),
('886', '1', '2013-08-08 14:51:19', '108.178.113.201', '3');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('887', '2', '2013-08-08 14:52:07', '108.178.113.201', '1'),
('888', '1', '2013-08-11 04:23:14', '157.55.33.23', '1'),
('889', '1', '2013-08-15 09:45:03', '172.4.181.220', '2'),
('890', '1', '2013-08-15 10:57:02', '64.125.188.25', '7'),
('891', '2', '2013-08-20 06:33:58', '208.115.111.70', '1'),
('892', '1', '2013-08-20 13:32:12', '108.178.113.201', '2'),
('893', '2', '2013-08-20 13:32:41', '108.178.113.201', '2'),
('894', '1', '2013-08-21 16:53:58', '71.41.234.174', '2'),
('895', '1', '2013-08-22 12:42:14', '108.178.113.201', '1'),
('896', '2', '2013-08-22 12:42:16', '108.178.113.201', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('897', '1', '2013-08-22 19:38:06', '108.178.113.201', '3'),
('898', '1', '2013-08-24 03:50:10', '208.115.113.86', '1'),
('899', '1', '2013-08-30 21:18:57', '46.161.41.24', '1'),
('900', '2', '2013-08-30 21:59:12', '46.161.41.24', '1'),
('901', '2', '2013-09-04 10:03:49', '208.115.111.70', '1'),
('902', '1', '2013-09-04 14:20:04', '71.41.234.174', '2'),
('903', '1', '2013-09-06 08:27:49', '180.76.6.225', '1'),
('904', '2', '2013-09-07 04:48:49', '180.76.5.178', '1'),
('905', '1', '2013-09-08 04:04:51', '208.115.113.86', '1'),
('906', '1', '2013-09-09 14:57:20', '71.41.234.174', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('907', '1', '2013-09-12 16:52:48', '108.178.112.182', '2'),
('908', '2', '2013-09-12 16:53:14', '108.178.112.182', '2'),
('909', '1', '2013-09-12 17:08:15', '108.178.113.201', '2'),
('910', '2', '2013-09-12 17:08:56', '108.178.113.201', '2'),
('911', '1', '2013-09-13 05:35:40', '157.55.32.95', '1'),
('912', '1', '2013-09-14 08:04:03', '180.76.5.69', '1'),
('913', '1', '2013-09-15 20:28:11', '180.76.5.136', '1'),
('914', '1', '2013-09-15 23:41:00', '207.172.209.16', '1'),
('915', '1', '2013-09-17 13:09:31', '108.178.113.201', '2'),
('916', '2', '2013-09-17 13:10:06', '108.178.113.201', '3');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('917', '1', '2013-09-20 03:33:24', '180.76.5.181', '1'),
('918', '1', '2013-09-23 04:25:06', '208.115.113.86', '1'),
('919', '1', '2013-09-24 19:59:35', '108.178.113.201', '2'),
('920', '2', '2013-09-24 19:59:53', '108.178.113.201', '1'),
('921', '2', '2013-09-24 20:01:28', '108.178.113.201', '1'),
('922', '1', '2013-09-24 21:37:23', '108.178.113.201', '1'),
('923', '2', '2013-09-24 21:37:31', '108.178.113.201', '2'),
('924', '1', '2013-09-25 08:43:39', '208.43.225.85', '1'),
('925', '1', '2013-09-25 15:26:28', '71.41.234.174', '5'),
('926', '1', '2013-09-25 16:52:13', '108.178.113.201', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('927', '2', '2013-09-25 16:52:26', '108.178.113.201', '2'),
('928', '1', '2013-09-30 11:55:01', '178.255.215.91', '1'),
('929', '1', '2013-10-01 15:07:32', '71.41.234.174', '5'),
('930', '1', '2013-10-02 21:55:17', '108.178.113.201', '4'),
('931', '2', '2013-10-02 21:56:01', '108.178.113.201', '2'),
('932', '1', '2013-10-02 22:05:54', '108.178.113.201', '1'),
('933', '2', '2013-10-02 22:06:05', '108.178.113.201', '2'),
('934', '2', '2013-10-04 18:16:16', '208.115.111.70', '1'),
('935', '1', '2013-10-07 19:13:34', '108.178.113.201', '3'),
('936', '2', '2013-10-07 19:14:19', '108.178.113.201', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('937', '1', '2013-10-08 04:19:53', '208.115.113.86', '1'),
('938', '1', '2013-10-10 15:45:50', '108.178.113.201', '3'),
('939', '2', '2013-10-10 15:47:29', '108.178.113.201', '2'),
('940', '2', '2013-10-11 13:50:42', '180.76.5.145', '1'),
('941', '1', '2013-10-11 15:13:20', '108.178.112.182', '3'),
('942', '2', '2013-10-11 15:13:26', '108.178.112.182', '4'),
('943', '1', '2013-10-15 18:15:56', '71.41.234.174', '2'),
('944', '1', '2013-10-17 12:21:05', '157.55.32.62', '1'),
('945', '1', '2013-10-17 18:45:05', '108.178.113.201', '4'),
('946', '2', '2013-10-17 18:45:33', '108.178.113.201', '4');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('947', '2', '2013-10-19 22:14:16', '208.115.111.70', '1'),
('948', '1', '2013-10-21 16:03:31', '71.41.234.174', '2'),
('949', '1', '2013-10-24 15:46:01', '108.178.113.201', '2'),
('950', '2', '2013-10-24 15:46:24', '108.178.113.201', '2'),
('951', '1', '2013-10-24 18:34:58', '95.134.40.68', '3'),
('952', '1', '2013-10-29 08:58:30', '207.172.209.16', '1'),
('953', '1', '2013-10-30 22:02:18', '108.178.113.201', '4'),
('954', '2', '2013-10-30 22:02:41', '108.178.113.201', '2'),
('955', '1', '2013-10-31 12:22:06', '70.114.187.108', '1'),
('956', '2', '2013-10-31 12:22:13', '70.114.187.108', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('957', '1', '2013-11-03 01:18:11', '207.172.209.16', '1'),
('958', '2', '2013-11-04 02:15:29', '208.115.111.70', '1'),
('959', '1', '2013-11-04 23:00:49', '71.41.234.174', '3'),
('960', '1', '2013-11-05 12:29:14', '217.69.133.235', '1'),
('961', '1', '2013-11-07 01:20:39', '180.76.5.151', '1'),
('962', '1', '2013-11-07 04:14:21', '208.115.113.86', '1'),
('963', '1', '2013-11-07 15:33:52', '71.41.234.174', '2'),
('964', '2', '2013-11-12 16:17:43', '180.76.5.183', '1'),
('965', '1', '2013-11-12 23:23:24', '70.114.187.108', '4'),
('966', '1', '2013-11-14 19:01:26', '70.114.187.108', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('967', '2', '2013-11-14 19:01:42', '70.114.187.108', '2'),
('968', '1', '2013-11-18 09:51:08', '180.76.5.136', '1'),
('969', '1', '2013-11-18 20:41:10', '70.114.187.108', '18'),
('970', '1', '2013-11-18 23:21:22', '208.43.225.85', '1'),
('971', '1', '2013-11-19 15:19:22', '70.114.187.108', '3'),
('972', '2', '2013-11-19 15:23:19', '70.114.187.108', '2'),
('973', '1', '2013-11-21 13:54:21', '70.114.187.108', '2'),
('974', '2', '2013-11-21 14:03:38', '70.114.187.108', '4'),
('975', '1', '2013-11-21 14:06:40', '70.114.187.108', '1'),
('976', '1', '2013-11-22 04:30:00', '208.115.113.86', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('977', '1', '2013-11-22 16:05:48', '70.114.187.108', '2'),
('978', '2', '2013-11-22 16:06:12', '70.114.187.108', '2'),
('979', '1', '2013-11-23 21:50:44', '178.255.215.79', '1'),
('980', '1', '2013-11-24 20:50:49', '69.197.13.115', '1'),
('981', '2', '2013-11-25 06:14:05', '208.115.111.70', '1'),
('982', '1', '2013-11-25 17:58:11', '66.249.74.207', '1'),
('983', '1', '2013-11-25 19:39:52', '180.76.5.171', '1'),
('984', '1', '2013-11-26 18:05:30', '70.114.187.108', '2'),
('985', '2', '2013-11-26 18:06:20', '70.114.187.108', '2'),
('986', '1', '2013-12-02 14:38:55', '180.76.5.144', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('987', '1', '2013-12-03 14:52:34', '70.114.187.108', '1'),
('988', '1', '2013-12-03 15:07:04', '70.114.187.108', '2'),
('989', '2', '2013-12-03 15:07:25', '70.114.187.108', '2'),
('990', '1', '2013-12-04 14:09:45', '70.114.187.108', '1'),
('991', '2', '2013-12-04 14:09:53', '70.114.187.108', '2'),
('992', '1', '2013-12-05 20:06:41', '70.114.187.108', '1'),
('993', '2', '2013-12-05 20:06:48', '70.114.187.108', '1'),
('994', '1', '2013-12-07 04:17:24', '208.115.113.86', '1'),
('995', '1', '2013-12-07 11:34:14', '157.55.35.108', '1'),
('996', '2', '2013-12-10 10:13:42', '208.115.111.70', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('997', '1', '2013-12-10 15:27:33', '71.41.234.174', '3'),
('998', '1', '2013-12-10 18:03:23', '70.114.187.108', '1'),
('999', '2', '2013-12-10 18:03:27', '70.114.187.108', '1'),
('1000', '2', '2013-12-10 20:17:35', '70.114.187.108', '1'),
('1001', '1', '2013-12-12 19:09:12', '70.114.187.108', '2'),
('1002', '2', '2013-12-12 19:09:36', '70.114.187.108', '3'),
('1003', '2', '2013-12-15 13:38:39', '180.76.6.156', '1'),
('1004', '1', '2013-12-16 18:11:48', '70.114.187.108', '2'),
('1005', '2', '2013-12-16 18:12:01', '70.114.187.108', '2'),
('1006', '1', '2013-12-17 17:36:54', '70.114.187.108', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('1007', '2', '2013-12-17 17:37:04', '70.114.187.108', '2'),
('1008', '1', '2013-12-20 14:17:28', '180.76.6.14', '1'),
('1009', '1', '2013-12-21 01:21:23', '217.69.135.248', '1'),
('1010', '1', '2013-12-22 04:16:52', '208.115.113.86', '1'),
('1011', '1', '2013-12-23 17:33:42', '65.55.52.97', '1'),
('1012', '1', '2013-12-23 19:35:32', '65.55.52.118', '1'),
('1013', '1', '2013-12-28 15:05:25', '185.10.104.132', '1'),
('1014', '2', '2013-12-28 18:40:05', '208.115.111.70', '1'),
('1015', '1', '2013-12-29 06:46:05', '207.241.237.235', '1'),
('1016', '1', '2013-12-30 19:59:27', '70.114.187.108', '2');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('1017', '2', '2013-12-30 19:59:40', '70.114.187.108', '1'),
('1018', '2', '2013-12-30 20:04:14', '70.114.187.108', '1'),
('1019', '1', '2013-12-31 17:57:33', '70.114.187.108', '2'),
('1020', '2', '2013-12-31 17:57:57', '70.114.187.108', '2'),
('1021', '1', '2014-01-03 10:14:40', '180.76.5.194', '1'),
('1022', '1', '2014-01-06 16:04:39', '99.90.103.22', '2'),
('1023', '1', '2014-01-06 19:10:45', '71.41.234.174', '2'),
('1024', '1', '2014-01-07 22:08:19', '70.114.187.108', '2'),
('1025', '2', '2014-01-07 22:08:55', '70.114.187.108', '2'),
('1026', '1', '2014-01-09 09:53:38', '185.10.104.131', '1');

INSERT INTO `wp_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
('1027', '1', '2014-01-09 12:36:07', '157.55.33.120', '1');

--
-- Table structure for table `wp_rg_lead`
--

CREATE TABLE `wp_rg_lead` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `is_starred` tinyint(1) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(39) NOT NULL,
  `source_url` varchar(200) NOT NULL DEFAULT '',
  `user_agent` varchar(250) NOT NULL DEFAULT '',
  `currency` varchar(5) DEFAULT NULL,
  `payment_status` varchar(15) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` decimal(19,2) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `is_fulfilled` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `transaction_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=364 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_rg_lead`
--

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('1', '2', '', '2011-05-09 19:57:06', '0', '0', '99.190.39.126', 'http://www.tyrichards.com/test1/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.65 Safari/534.24', 'USD', '', '', '', '', '', '1', ''),
('2', '1', '', '2011-05-16 11:59:57', '0', '0', '76.203.202.62', 'http://www.tyrichards.com/test1/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.68 Safari/534.24', 'USD', '', '', '', '', '', '2', ''),
('3', '1', '', '2011-05-16 12:21:30', '0', '0', '76.203.202.62', 'http://www.tyrichards.com/test1/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.68 Safari/534.24', 'USD', '', '', '', '', '', '2', ''),
('4', '1', '', '2011-05-16 12:56:03', '0', '0', '76.203.202.62', 'http://www.tyrichards.com/test1/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.68 Safari/534.24', 'USD', '', '', '', '', '', '2', ''),
('5', '1', '', '2011-05-16 13:11:03', '0', '0', '76.203.202.62', 'http://www.tyrichards.com/test1/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.68 Safari/534.24', 'USD', '', '', '', '', '', '2', ''),
('6', '1', '', '2011-05-16 16:13:49', '0', '0', '76.203.202.62', 'http://www.tyrichards.com/test1/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.68 Safari/534.24', 'USD', '', '', '', '', '', '2', ''),
('13', '2', '', '2011-05-23 15:49:14', '0', '0', '50.84.82.218', 'http://www.tyrichards.com/test1/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4', 'USD', '', '', '', '', '', '', ''),
('14', '2', '', '2011-05-25 15:06:09', '0', '0', '76.203.198.23', 'http://www.tyrichards.com/test1/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '', ''),
('15', '2', '', '2011-05-25 16:00:58', '0', '0', '76.203.198.23', 'http://www.tyrichards.com/test1/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '', ''),
('16', '2', '', '2011-05-25 16:03:29', '0', '0', '76.203.198.23', 'http://www.tyrichards.com/test1/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('17', '1', '', '2011-05-31 20:43:23', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '6', ''),
('18', '1', '', '2011-05-31 20:52:04', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('19', '1', '', '2011-05-31 20:58:35', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('20', '1', '', '2011-05-31 20:58:44', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('21', '1', '', '2011-05-31 21:02:47', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('22', '1', '', '2011-05-31 21:04:51', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('23', '1', '', '2011-05-31 21:06:46', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('24', '1', '', '2011-05-31 21:15:42', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('25', '1', '', '2011-05-31 21:16:47', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('26', '1', '', '2011-05-31 21:23:20', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('27', '1', '', '2011-05-31 21:25:34', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('28', '1', '', '2011-05-31 21:31:49', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('29', '1', '', '2011-05-31 21:33:23', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('30', '1', '', '2011-05-31 21:36:08', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('31', '1', '', '2011-05-31 21:40:29', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('32', '1', '', '2011-05-31 21:41:54', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('33', '1', '', '2011-05-31 21:42:59', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('34', '1', '', '2011-05-31 21:43:42', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('35', '1', '', '2011-05-31 21:45:21', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('36', '1', '', '2011-05-31 21:47:11', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('37', '1', '', '2011-05-31 21:48:28', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('38', '1', '', '2011-05-31 21:48:54', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('39', '1', '', '2011-05-31 21:51:14', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('40', '1', '', '2011-05-31 21:52:43', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('41', '1', '', '2011-05-31 21:54:43', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('42', '1', '', '2011-05-31 21:54:58', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('43', '1', '', '2011-05-31 21:55:57', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('44', '1', '', '2011-05-31 21:56:28', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '6', ''),
('45', '1', '', '2011-05-31 22:03:52', '0', '0', '76.203.206.81', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '6', ''),
('46', '1', '', '2011-06-03 21:43:01', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '6', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('47', '1', '', '2011-06-03 21:50:51', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '6', ''),
('48', '1', '', '2011-06-03 22:00:21', '0', '1', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '6', ''),
('49', '1', '', '2011-06-03 22:11:02', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '6', ''),
('50', '1', '', '2011-06-03 22:26:36', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '6', ''),
('51', '1', '', '2011-06-03 22:30:42', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '6', ''),
('52', '1', '', '2011-06-03 22:35:46', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '6', ''),
('53', '1', '', '2011-06-03 22:41:13', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '6', ''),
('54', '1', '', '2011-06-03 22:54:13', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '6', ''),
('55', '1', '', '2011-06-03 22:57:46', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27', 'USD', '', '', '', '', '', '6', ''),
('56', '1', '', '2011-06-07 15:02:29', '0', '0', '67.79.16.126', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4', 'USD', '', '', '', '', '', '3', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('57', '1', '', '2011-06-07 18:14:01', '0', '0', '50.84.82.218', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4', 'USD', '', '', '', '', '', '3', ''),
('58', '2', '', '2011-06-09 21:41:30', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/sign-up', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '', ''),
('59', '1', '', '2011-06-09 21:43:47', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '7', ''),
('60', '1', '', '2011-06-10 14:28:08', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.91 Safari/534.30', 'USD', '', '', '', '', '', '1', ''),
('61', '1', '', '2011-06-10 14:30:31', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.91 Safari/534.30', 'USD', '', '', '', '', '', '1', ''),
('62', '2', '', '2011-06-14 15:41:26', '0', '0', '24.153.214.68', 'http://www.laketravisoralsurgery.net/referrals/sign-up', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB7.0; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322)', 'USD', '', '', '', '', '', '', ''),
('63', '2', '', '2011-06-14 15:49:06', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/sign-up', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.91 Safari/534.30', 'USD', '', '', '', '', '', '', ''),
('64', '2', '', '2011-06-14 15:54:12', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/sign-up', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.91 Safari/534.30', 'USD', '', '', '', '', '', '', ''),
('65', '2', '', '2011-06-14 16:24:28', '0', '0', '24.153.214.68', 'http://www.laketravisoralsurgery.net/referrals/sign-up', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB7.0; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322)', 'USD', '', '', '', '', '', '', ''),
('66', '1', '', '2011-06-14 17:19:18', '0', '0', '24.153.214.68', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.17) Gecko/20110420 Firefox/3.6.17', 'USD', '', '', '', '', '', '11', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('67', '1', '', '2011-06-14 17:41:31', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19', 'USD', '', '', '', '', '', '7', ''),
('68', '1', '', '2011-06-14 19:08:36', '0', '0', '76.203.206.164', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.91 Safari/534.30', 'USD', '', '', '', '', '', '1', ''),
('69', '1', '', '2011-06-14 20:55:09', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0.1) Gecko/20100101 Firefox/4.0.1', 'USD', '', '', '', '', '', '7', ''),
('70', '1', '', '2011-06-23 17:11:43', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19', 'USD', '', '', '', '', '', '7', ''),
('71', '1', '', '2011-06-28 19:30:41', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19', 'USD', '', '', '', '', '', '7', ''),
('72', '1', '', '2011-06-30 17:47:51', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19', 'USD', '', '', '', '', '', '7', ''),
('73', '2', '', '2011-06-30 20:27:05', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/sign-up', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '', ''),
('74', '1', '', '2011-06-30 20:32:57', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('75', '2', '', '2011-06-30 21:00:38', '0', '0', '99.90.103.22', 'http://www.laketravisoralsurgery.net/referrals/sign-up', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'USD', '', '', '', '', '', '', ''),
('76', '1', '', '2011-06-30 21:06:00', '0', '0', '99.90.103.22', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'USD', '', '', '', '', '', '13', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('77', '1', '', '2011-07-01 13:43:18', '0', '0', '50.84.82.218', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4', 'USD', '', '', '', '', '', '3', ''),
('78', '1', '', '2011-07-01 13:44:51', '0', '0', '50.84.82.218', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4', 'USD', '', '', '', '', '', '3', ''),
('79', '1', '', '2011-07-01 16:01:33', '0', '0', '76.203.205.189', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.112 Safari/534.30', 'USD', '', '', '', '', '', '1', ''),
('80', '1', '', '2011-07-01 16:06:10', '0', '0', '76.203.205.189', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.112 Safari/534.30', 'USD', '', '', '', '', '', '1', ''),
('81', '1', '', '2011-07-01 16:12:05', '0', '0', '76.203.205.189', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.112 Safari/534.30', 'USD', '', '', '', '', '', '1', ''),
('82', '1', '', '2011-07-06 14:33:49', '0', '0', '71.41.152.114', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4', 'USD', '', '', '', '', '', '3', ''),
('83', '1', '', '2011-07-06 18:05:31', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('84', '1', '', '2011-07-06 18:11:18', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('85', '1', '', '2011-07-07 19:56:09', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19', 'USD', '', '', '', '', '', '7', ''),
('86', '1', '', '2011-07-12 17:07:30', '0', '0', '99.90.103.22', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'USD', '', '', '', '', '', '13', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('87', '1', '', '2011-07-12 20:14:26', '0', '0', '24.153.214.72', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.18) Gecko/20110614 Firefox/3.6.18', 'USD', '', '', '', '', '', '11', ''),
('88', '1', '', '2011-07-13 21:20:23', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('89', '1', '', '2011-07-14 15:43:12', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('90', '1', '', '2011-07-20 15:02:56', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('91', '1', '', '2011-07-22 19:26:32', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('92', '1', '', '2011-07-27 19:02:15', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19', 'USD', '', '', '', '', '', '7', ''),
('93', '1', '', '2011-08-03 17:08:44', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('94', '1', '', '2011-08-04 13:31:22', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19', 'USD', '', '', '', '', '', '7', ''),
('95', '1', '', '2011-08-04 14:25:17', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:5.0.1) Gecko/20100101 Firefox/5.0.1', 'USD', '', '', '', '', '', '7', ''),
('96', '1', '', '2011-08-08 18:32:20', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('97', '1', '', '2011-08-08 19:54:30', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:5.0.1) Gecko/20100101 Firefox/5.0.1', 'USD', '', '', '', '', '', '7', ''),
('98', '1', '', '2011-08-08 21:33:06', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:5.0.1) Gecko/20100101 Firefox/5.0.1', 'USD', '', '', '', '', '', '7', ''),
('99', '1', '', '2011-08-09 20:04:23', '0', '0', '24.153.214.72', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.18) Gecko/20110614 Firefox/3.6.18', 'USD', '', '', '', '', '', '11', ''),
('100', '1', '', '2011-08-16 21:40:53', '0', '0', '24.153.214.72', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.18) Gecko/20110614 Firefox/3.6.18', 'USD', '', '', '', '', '', '11', ''),
('101', '1', '', '2011-08-25 20:40:02', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('102', '1', '', '2011-08-25 20:43:20', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('103', '1', '', '2011-08-26 14:20:36', '0', '0', '99.90.103.22', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'USD', '', '', '', '', '', '13', ''),
('104', '1', '', '2011-08-30 15:28:08', '0', '0', '24.153.214.72', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.20) Gecko/20110803 Firefox/3.6.20', 'USD', '', '', '', '', '', '11', ''),
('105', '1', '', '2011-09-12 15:27:53', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19', 'USD', '', '', '', '', '', '7', ''),
('106', '1', '', '2011-09-14 22:28:06', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:6.0) Gecko/20100101 Firefox/6.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('107', '1', '', '2011-09-22 15:28:53', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('108', '1', '', '2011-09-27 19:36:45', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:6.0.1) Gecko/20100101 Firefox/6.0.1', 'USD', '', '', '', '', '', '7', ''),
('109', '1', '', '2011-10-20 18:02:21', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('110', '1', '', '2011-10-20 18:04:04', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('111', '1', '', '2011-10-27 19:46:11', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19', 'USD', '', '', '', '', '', '7', ''),
('112', '1', '', '2011-11-04 15:22:35', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('113', '1', '', '2011-11-14 17:29:28', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('114', '1', '', '2011-11-16 21:37:30', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('115', '1', '', '2011-11-16 21:42:30', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('116', '1', '', '2011-11-30 19:15:13', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('117', '1', '', '2011-12-08 20:12:44', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('118', '1', '', '2011-12-21 18:12:07', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19', 'USD', '', '', '', '', '', '7', ''),
('119', '1', '', '2011-12-21 20:11:09', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19', 'USD', '', '', '', '', '', '7', ''),
('120', '1', '', '2011-12-29 17:25:57', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19', 'USD', '', '', '', '', '', '7', ''),
('121', '1', '', '2011-12-29 22:03:49', '0', '0', '24.153.214.56', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:8.0) Gecko/20100101 Firefox/8.0', 'USD', '', '', '', '', '', '11', ''),
('122', '1', '', '2011-12-29 22:21:12', '0', '0', '24.153.214.56', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:8.0) Gecko/20100101 Firefox/8.0', 'USD', '', '', '', '', '', '11', ''),
('123', '2', '', '2012-01-03 22:49:39', '0', '0', '99.129.130.94', 'http://www.laketravisoralsurgery.net/referrals/sign-up', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'USD', '', '', '', '', '', '', ''),
('124', '1', '', '2012-01-03 22:54:30', '0', '0', '99.129.130.94', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'USD', '', '', '', '', '', '14', ''),
('125', '1', '', '2012-01-03 22:58:43', '0', '0', '99.129.130.94', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'USD', '', '', '', '', '', '14', ''),
('126', '1', '', '2012-01-03 23:33:25', '0', '0', '99.129.130.94', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'USD', '', '', '', '', '', '14', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('127', '1', '', '2012-01-18 18:39:03', '0', '0', '24.153.214.56', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', 'USD', '', '', '', '', '', '11', ''),
('128', '1', '', '2012-01-23 16:55:25', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('129', '1', '', '2012-01-26 23:15:51', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', 'USD', '', '', '', '', '', '7', ''),
('130', '1', '', '2012-01-31 21:23:09', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', 'USD', '', '', '', '', '', '7', ''),
('131', '1', '', '2012-02-01 21:23:21', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', 'USD', '', '', '', '', '', '7', ''),
('132', '1', '', '2012-02-06 15:52:45', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', 'USD', '', '', '', '', '', '7', ''),
('133', '1', '', '2012-02-07 19:43:03', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('134', '1', '', '2012-02-09 15:54:30', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('135', '1', '', '2012-02-16 20:57:08', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('136', '1', '', '2012-02-16 22:41:49', '0', '0', '24.153.214.56', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:10.0.1) Gecko/20100101 Firefox/10.0.1', 'USD', '', '', '', '', '', '11', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('137', '1', '', '2012-02-22 20:55:29', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('138', '1', '', '2012-02-23 14:21:14', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('139', '1', '', '2012-02-29 23:27:13', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:10.0.2) Gecko/20100101 Firefox/10.0.2', 'USD', '', '', '', '', '', '7', ''),
('140', '1', '', '2012-03-01 21:45:58', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:10.0.2) Gecko/20100101 Firefox/10.0.2', 'USD', '', '', '', '', '', '7', ''),
('141', '1', '', '2012-03-06 20:12:47', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:10.0.2) Gecko/20100101 Firefox/10.0.2', 'USD', '', '', '', '', '', '7', ''),
('142', '1', '', '2012-03-06 20:17:35', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:10.0.2) Gecko/20100101 Firefox/10.0.2', 'USD', '', '', '', '', '', '7', ''),
('143', '1', '', '2012-03-20 19:29:37', '0', '0', '71.40.232.84', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:11.0) Gecko/20100101 Firefox/11.0', 'USD', '', '', '', '', '', '7', ''),
('144', '1', '', '2012-04-09 14:17:22', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:10.0.2) Gecko/20100101 Firefox/10.0.2', 'USD', '', '', '', '', '', '11', ''),
('145', '1', '', '2012-04-09 14:52:27', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:11.0) Gecko/20100101 Firefox/11.0', 'USD', '', '', '', '', '', '11', ''),
('146', '1', '', '2012-05-09 19:11:41', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('147', '1', '', '2012-05-09 19:13:10', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('148', '1', '', '2012-05-14 19:28:26', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('149', '1', '', '2012-05-15 17:07:15', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('150', '1', '', '2012-05-16 15:38:58', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('151', '1', '', '2012-05-17 16:18:56', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('152', '1', '', '2012-05-17 16:21:49', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('153', '1', '', '2012-05-21 20:43:03', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('154', '1', '', '2012-05-21 21:15:36', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('155', '1', '', '2012-05-22 20:51:15', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('156', '1', '', '2012-05-22 20:56:00', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:11.0) Gecko/20100101 Firefox/11.0', 'USD', '', '', '', '', '', '11', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('157', '1', '', '2012-05-22 21:00:15', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:11.0) Gecko/20100101 Firefox/11.0', 'USD', '', '', '', '', '', '11', ''),
('158', '1', '', '2012-05-24 16:14:53', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('159', '1', '', '2012-05-24 16:18:08', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('160', '1', '', '2012-05-25 18:47:59', '0', '0', '108.178.112.183', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', 'USD', '', '', '', '', '', '7', ''),
('161', '1', '', '2012-06-06 13:09:59', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('162', '1', '', '2012-06-07 15:14:08', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0', 'USD', '', '', '', '', '', '7', ''),
('163', '1', '', '2012-06-07 17:04:30', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('164', '1', '', '2012-06-14 15:22:24', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('165', '1', '', '2012-06-14 15:24:12', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('166', '1', '', '2012-06-14 16:42:10', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('167', '1', '', '2012-06-14 16:46:26', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('168', '1', '', '2012-06-14 17:47:19', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('169', '1', '', '2012-06-18 17:00:57', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', 'USD', '', '', '', '', '', '7', ''),
('170', '1', '', '2012-06-18 20:36:25', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', 'USD', '', '', '', '', '', '7', ''),
('171', '1', '', '2012-06-18 22:10:55', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', 'USD', '', '', '', '', '', '7', ''),
('172', '1', '', '2012-06-19 17:05:11', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('173', '1', '', '2012-06-20 20:21:49', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', 'USD', '', '', '', '', '', '7', ''),
('174', '1', '', '2012-06-25 16:26:26', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', 'USD', '', '', '', '', '', '7', ''),
('175', '1', '', '2012-06-27 18:03:08', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', 'USD', '', '', '', '', '', '7', ''),
('176', '1', '', '2012-06-28 19:45:46', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '11', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('177', '1', '', '2012-07-10 20:17:52', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('178', '1', '', '2012-07-10 20:20:21', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'USD', '', '', '', '', '', '7', ''),
('179', '1', '', '2012-07-23 16:58:19', '0', '0', '99.90.103.22', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.3; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET4.0C; .NET4.0E; AskTbORJ/5.14.1.20007)', 'USD', '', '', '', '', '', '13', ''),
('180', '1', '', '2012-07-26 16:10:03', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'USD', '', '', '', '', '', '7', ''),
('181', '1', '', '2012-07-26 20:40:36', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'USD', '', '', '', '', '', '7', ''),
('182', '1', '', '2012-07-26 20:46:00', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'USD', '', '', '', '', '', '7', ''),
('183', '1', '', '2012-07-26 22:41:07', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'USD', '', '', '', '', '', '7', ''),
('184', '1', '', '2012-07-26 22:42:42', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'USD', '', '', '', '', '', '7', ''),
('185', '1', '', '2012-08-07 19:04:13', '0', '0', '108.178.113.251', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'USD', '', '', '', '', '', '7', ''),
('186', '1', '', '2012-08-08 18:10:02', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:13.0) Gecko/20100101 Firefox/13.0.1', 'USD', '', '', '', '', '', '11', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('187', '1', '', '2012-08-15 20:55:18', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'USD', '', '', '', '', '', '11', ''),
('188', '1', '', '2012-08-20 21:16:49', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'USD', '', '', '', '', '', '7', ''),
('189', '1', '', '2012-08-21 21:37:34', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'USD', '', '', '', '', '', '7', ''),
('190', '1', '', '2012-08-22 22:00:28', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'USD', '', '', '', '', '', '7', ''),
('191', '1', '', '2012-08-23 15:23:01', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'USD', '', '', '', '', '', '7', ''),
('192', '1', '', '2012-09-06 16:04:13', '0', '0', '99.90.103.22', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET4.0C; .NET4.0E; AskTbORJ/5.14.1.20007)', 'USD', '', '', '', '', '', '13', ''),
('193', '1', '', '2012-09-18 13:19:52', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1', 'USD', '', '', '', '', '', '7', ''),
('194', '1', '', '2012-09-20 19:37:22', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1', 'USD', '', '', '', '', '', '7', ''),
('195', '1', '', '2012-09-24 21:11:53', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1', 'USD', '', '', '', '', '', '7', ''),
('196', '1', '', '2012-09-26 18:36:19', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('197', '1', '', '2012-09-26 19:22:24', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1', 'USD', '', '', '', '', '', '7', ''),
('198', '1', '', '2012-09-27 13:49:27', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1', 'USD', '', '', '', '', '', '7', ''),
('199', '1', '', '2012-10-01 13:09:14', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1', 'USD', '', '', '', '', '', '7', ''),
('200', '1', '', '2012-10-01 16:59:46', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1', 'USD', '', '', '', '', '', '7', ''),
('201', '1', '', '2012-10-08 21:26:02', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1', 'USD', '', '', '', '', '', '7', ''),
('202', '1', '', '2012-10-09 13:50:24', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1', 'USD', '', '', '', '', '', '7', ''),
('203', '1', '', '2012-10-11 20:47:53', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1', 'USD', '', '', '', '', '', '7', ''),
('204', '1', '', '2012-10-15 14:46:51', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'USD', '', '', '', '', '', '11', ''),
('205', '1', '', '2012-10-18 16:56:06', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '11', ''),
('206', '1', '', '2012-10-18 20:04:11', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('207', '1', '', '2012-10-22 19:38:08', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('208', '1', '', '2012-11-06 21:37:14', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '7', ''),
('209', '1', '', '2012-11-13 17:16:05', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0', 'USD', '', '', '', '', '', '7', ''),
('210', '1', '', '2012-11-14 19:29:07', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '7', ''),
('211', '1', '', '2012-11-15 22:10:13', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '7', ''),
('212', '1', '', '2012-11-26 14:48:16', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('213', '1', '', '2012-12-03 23:15:38', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '7', ''),
('214', '1', '', '2012-12-04 20:31:49', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('215', '1', '', '2012-12-05 22:53:19', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '7', ''),
('216', '1', '', '2012-12-10 20:57:24', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('217', '1', '', '2012-12-11 16:08:42', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('218', '1', '', '2012-12-11 21:32:10', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '7', ''),
('219', '1', '', '2012-12-12 18:12:04', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '11', ''),
('220', '1', '', '2012-12-13 20:28:02', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '11', ''),
('221', '1', '', '2012-12-13 22:32:55', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:17.0) Gecko/20100101 Firefox/17.0', 'USD', '', '', '', '', '', '7', ''),
('222', '1', '', '2012-12-18 16:31:57', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:17.0) Gecko/20100101 Firefox/17.0', 'USD', '', '', '', '', '', '7', ''),
('223', '1', '', '2012-12-20 18:30:11', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '11', ''),
('224', '1', '', '2012-12-27 21:46:36', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '11', ''),
('225', '1', '', '2013-01-10 16:59:14', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:17.0) Gecko/20100101 Firefox/17.0', 'USD', '', '', '', '', '', '7', ''),
('226', '1', '', '2013-01-11 17:55:21', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:17.0) Gecko/20100101 Firefox/17.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('227', '1', '', '2013-01-11 17:56:15', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:17.0) Gecko/20100101 Firefox/17.0', 'USD', '', '', '', '', '', '7', ''),
('228', '1', '', '2013-01-14 18:22:49', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:17.0) Gecko/20100101 Firefox/17.0', 'USD', '', '', '', '', '', '7', ''),
('229', '1', '', '2013-01-14 22:11:12', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:17.0) Gecko/20100101 Firefox/17.0', 'USD', '', '', '', '', '', '7', ''),
('230', '1', '', '2013-01-15 20:40:20', '0', '0', '99.90.103.22', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET4.0C; .NET4.0E; AskTbORJ/5.15.4.23821)', 'USD', '', '', '', '', '', '13', ''),
('231', '1', '', '2013-01-16 17:42:35', '0', '0', '99.90.103.22', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET4.0C; .NET4.0E; AskTbORJ/5.15.4.23821)', 'USD', '', '', '', '', '', '13', ''),
('232', '1', '', '2013-01-17 21:16:01', '0', '0', '99.90.103.22', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET4.0C; .NET4.0E; AskTbORJ/5.15.4.23821)', 'USD', '', '', '', '', '', '13', ''),
('233', '1', '', '2013-01-21 14:42:18', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('234', '1', '', '2013-01-21 16:13:21', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:17.0) Gecko/20100101 Firefox/17.0', 'USD', '', '', '', '', '', '7', ''),
('235', '1', '', '2013-01-21 22:29:58', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:18.0) Gecko/20100101 Firefox/18.0', 'USD', '', '', '', '', '', '7', ''),
('236', '1', '', '2013-01-22 17:05:27', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:18.0) Gecko/20100101 Firefox/18.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('237', '1', '', '2013-01-22 17:06:38', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:18.0) Gecko/20100101 Firefox/18.0', 'USD', '', '', '', '', '', '7', ''),
('238', '1', '', '2013-01-24 15:10:00', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('239', '1', '', '2013-01-24 21:59:18', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:18.0) Gecko/20100101 Firefox/18.0', 'USD', '', '', '', '', '', '7', ''),
('240', '1', '', '2013-01-24 22:00:25', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:18.0) Gecko/20100101 Firefox/18.0', 'USD', '', '', '', '', '', '7', ''),
('241', '1', '', '2013-01-24 22:01:32', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:18.0) Gecko/20100101 Firefox/18.0', 'USD', '', '', '', '', '', '7', ''),
('242', '1', '', '2013-01-28 17:09:02', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:18.0) Gecko/20100101 Firefox/18.0', 'USD', '', '', '', '', '', '7', ''),
('243', '1', '', '2013-01-28 17:32:51', '0', '0', '108.178.113.20', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '11', ''),
('244', '1', '', '2013-02-05 17:17:15', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:18.0) Gecko/20100101 Firefox/18.0', 'USD', '', '', '', '', '', '7', ''),
('245', '1', '', '2013-02-06 20:08:40', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:18.0) Gecko/20100101 Firefox/18.0', 'USD', '', '', '', '', '', '7', ''),
('246', '1', '', '2013-02-06 20:17:03', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:18.0) Gecko/20100101 Firefox/18.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('247', '1', '', '2013-02-11 22:45:20', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:18.0) Gecko/20100101 Firefox/18.0', 'USD', '', '', '', '', '', '7', ''),
('248', '1', '', '2013-02-18 17:35:26', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:18.0) Gecko/20100101 Firefox/18.0', 'USD', '', '', '', '', '', '7', ''),
('249', '1', '', '2013-02-20 22:30:58', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:18.0) Gecko/20100101 Firefox/18.0', 'USD', '', '', '', '', '', '7', ''),
('250', '1', '', '2013-02-27 15:00:55', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('251', '1', '', '2013-03-05 17:03:27', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('252', '1', '', '2013-03-06 22:48:39', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('253', '1', '', '2013-03-11 15:38:53', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('254', '1', '', '2013-03-11 19:30:04', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('255', '1', '', '2013-03-12 17:12:22', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('256', '1', '', '2013-03-12 17:15:26', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('257', '1', '', '2013-03-21 19:50:43', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('258', '1', '', '2013-04-02 17:08:09', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('259', '1', '', '2013-04-03 16:12:22', '0', '0', '108.178.112.182', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'USD', '', '', '', '', '', '11', ''),
('260', '1', '', '2013-04-09 13:23:17', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('261', '1', '', '2013-04-09 18:41:37', '0', '0', '71.41.152.114', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB7.4; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2)', 'USD', '', '', '', '', '', '3', ''),
('262', '1', '', '2013-04-10 18:54:28', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('263', '1', '', '2013-04-11 17:17:40', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('264', '1', '', '2013-04-15 21:02:06', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('265', '1', '', '2013-04-18 17:32:24', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('266', '1', '', '2013-04-23 20:11:53', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('267', '1', '', '2013-04-23 20:35:51', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('268', '1', '', '2013-04-29 18:05:19', '0', '0', '108.178.112.182', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:16.0) Gecko/20100101 Firefox/16.0', 'USD', '', '', '', '', '', '11', ''),
('269', '1', '', '2013-05-07 15:05:35', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('270', '1', '', '2013-05-08 22:11:05', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0', 'USD', '', '', '', '', '', '7', ''),
('271', '1', '', '2013-05-21 15:33:22', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:20.0) Gecko/20100101 Firefox/20.0', 'USD', '', '', '', '', '', '7', ''),
('272', '1', '', '2013-05-21 16:14:43', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:20.0) Gecko/20100101 Firefox/20.0', 'USD', '', '', '', '', '', '7', ''),
('273', '1', '', '2013-05-21 16:23:17', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:20.0) Gecko/20100101 Firefox/20.0', 'USD', '', '', '', '', '', '7', ''),
('274', '1', '', '2013-05-29 21:12:19', '0', '0', '108.208.88.159', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36', 'USD', '', '', '', '', '', '1', ''),
('275', '1', '', '2013-05-30 17:17:01', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:20.0) Gecko/20100101 Firefox/20.0', 'USD', '', '', '', '', '', '7', ''),
('276', '1', '', '2013-06-03 22:24:47', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:20.0) Gecko/20100101 Firefox/20.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('277', '1', '', '2013-06-10 16:52:58', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('278', '1', '', '2013-06-10 22:06:33', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('279', '1', '', '2013-06-11 13:58:21', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('280', '1', '', '2013-06-11 14:01:24', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('281', '1', '', '2013-06-11 17:40:07', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('282', '1', '', '2013-06-11 21:43:23', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('283', '1', '', '2013-06-11 21:51:13', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('284', '1', '', '2013-06-11 22:03:21', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('285', '1', '', '2013-06-12 14:30:19', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('286', '1', '', '2013-06-12 14:48:25', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('287', '1', '', '2013-06-12 14:50:12', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('288', '1', '', '2013-06-17 21:38:47', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('289', '1', '', '2013-06-19 20:03:02', '0', '0', '108.178.112.182', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '11', ''),
('290', '1', '', '2013-06-21 16:28:38', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('291', '1', '', '2013-06-25 21:26:55', '0', '0', '108.178.112.182', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '11', ''),
('292', '1', '', '2013-07-02 15:15:39', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('293', '1', '', '2013-07-02 21:46:30', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('294', '1', '', '2013-07-03 21:12:24', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('295', '1', '', '2013-07-09 21:37:05', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('296', '1', '', '2013-07-10 20:30:48', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('297', '1', '', '2013-07-10 22:04:46', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('298', '1', '', '2013-07-11 13:47:36', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('299', '1', '', '2013-07-12 19:28:52', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('300', '1', '', '2013-07-16 17:03:44', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', ''),
('301', '1', '', '2013-07-16 22:15:41', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', ''),
('302', '1', '', '2013-07-18 17:24:19', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('303', '1', '', '2013-07-18 19:43:02', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:21.0) Gecko/20100101 Firefox/21.0', 'USD', '', '', '', '', '', '7', ''),
('304', '1', '', '2013-07-19 15:40:41', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('305', '1', '', '2013-07-22 18:55:45', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', ''),
('306', '1', '', '2013-07-22 18:57:45', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('307', '1', '', '2013-07-22 20:51:16', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('308', '1', '', '2013-07-23 22:09:12', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', ''),
('309', '1', '', '2013-07-24 17:03:19', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', ''),
('310', '1', '', '2013-07-24 20:44:44', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', ''),
('311', '1', '', '2013-07-29 17:44:36', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', ''),
('312', '1', '', '2013-07-30 15:46:41', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', ''),
('313', '1', '', '2013-08-01 15:30:25', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', ''),
('314', '1', '', '2013-08-01 15:33:17', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', ''),
('315', '1', '', '2013-08-06 15:20:19', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', ''),
('316', '1', '', '2013-08-07 13:31:12', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('317', '1', '', '2013-08-07 21:45:10', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('318', '1', '', '2013-08-08 14:53:34', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', ''),
('319', '1', '', '2013-08-20 13:34:22', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:22.0) Gecko/20100101 Firefox/22.0', 'USD', '', '', '', '', '', '7', ''),
('320', '1', '', '2013-08-21 17:00:34', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('321', '1', '', '2013-08-22 12:43:52', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:23.0) Gecko/20100101 Firefox/23.0', 'USD', '', '', '', '', '', '7', ''),
('322', '1', '', '2013-09-04 14:22:24', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('323', '1', '', '2013-09-12 16:54:05', '0', '0', '108.178.112.182', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:23.0) Gecko/20100101 Firefox/23.0', 'USD', '', '', '', '', '', '11', ''),
('324', '1', '', '2013-09-12 17:10:48', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:23.0) Gecko/20100101 Firefox/23.0', 'USD', '', '', '', '', '', '7', ''),
('325', '1', '', '2013-09-17 13:12:44', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:23.0) Gecko/20100101 Firefox/23.0', 'USD', '', '', '', '', '', '7', ''),
('326', '1', '', '2013-09-24 20:01:20', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('327', '1', '', '2013-09-24 21:40:02', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', ''),
('328', '1', '', '2013-09-25 15:39:05', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('329', '1', '', '2013-09-25 16:55:39', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', ''),
('330', '1', '', '2013-10-01 15:10:54', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('331', '1', '', '2013-10-02 21:57:55', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', ''),
('332', '1', '', '2013-10-02 22:07:35', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', ''),
('333', '1', '', '2013-10-07 19:15:33', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', ''),
('334', '1', '', '2013-10-10 15:50:27', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', ''),
('335', '1', '', '2013-10-11 15:14:25', '0', '0', '108.178.112.182', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Windows NT 5.1; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '11', ''),
('336', '1', '', '2013-10-11 15:43:26', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('337', '1', '', '2013-10-15 18:18:27', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('338', '1', '', '2013-10-17 18:46:48', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', ''),
('339', '1', '', '2013-10-17 18:48:21', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', ''),
('340', '1', '', '2013-10-21 16:06:56', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('341', '1', '', '2013-10-24 15:56:03', '0', '0', '108.178.113.201', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', ''),
('342', '1', '', '2013-10-30 22:05:36', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', ''),
('343', '1', '', '2013-10-31 12:24:02', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', ''),
('344', '1', '', '2013-11-04 23:03:55', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('345', '1', '', '2013-11-07 15:41:29', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('346', '1', '', '2013-11-14 19:03:44', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:25.0) Gecko/20100101 Firefox/25.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('347', '1', '', '2013-11-19 15:31:41', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', 'USD', '', '', '', '', '', '7', ''),
('348', '1', '', '2013-11-21 14:06:19', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:25.0) Gecko/20100101 Firefox/25.0', 'USD', '', '', '', '', '', '7', ''),
('349', '1', '', '2013-11-21 14:08:17', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:25.0) Gecko/20100101 Firefox/25.0', 'USD', '', '', '', '', '', '7', ''),
('350', '1', '', '2013-11-22 16:09:04', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:25.0) Gecko/20100101 Firefox/25.0', 'USD', '', '', '', '', '', '7', ''),
('351', '1', '', '2013-11-26 18:07:39', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:25.0) Gecko/20100101 Firefox/25.0', 'USD', '', '', '', '', '', '7', ''),
('352', '1', '', '2013-12-03 15:09:07', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:25.0) Gecko/20100101 Firefox/25.0', 'USD', '', '', '', '', '', '7', ''),
('353', '1', '', '2013-12-04 14:12:36', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:25.0) Gecko/20100101 Firefox/25.0', 'USD', '', '', '', '', '', '7', ''),
('354', '1', '', '2013-12-05 20:08:10', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:25.0) Gecko/20100101 Firefox/25.0', 'USD', '', '', '', '', '', '7', ''),
('355', '1', '', '2013-12-10 15:50:34', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('356', '1', '', '2013-12-10 20:17:30', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:25.0) Gecko/20100101 Firefox/25.0', 'USD', '', '', '', '', '', '7', '');

INSERT INTO `wp_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`) VALUES
('357', '1', '', '2013-12-12 19:12:03', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:25.0) Gecko/20100101 Firefox/25.0', 'USD', '', '', '', '', '', '7', ''),
('358', '1', '', '2013-12-16 18:13:42', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:25.0) Gecko/20100101 Firefox/25.0', 'USD', '', '', '', '', '', '7', ''),
('359', '1', '', '2013-12-17 17:40:30', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:25.0) Gecko/20100101 Firefox/25.0', 'USD', '', '', '', '', '', '7', ''),
('360', '1', '', '2013-12-30 20:04:08', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:25.0) Gecko/20100101 Firefox/25.0', 'USD', '', '', '', '', '', '7', ''),
('361', '1', '', '2013-12-31 17:59:10', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:26.0) Gecko/20100101 Firefox/26.0', 'USD', '', '', '', '', '', '7', ''),
('362', '1', '', '2014-01-06 19:14:27', '0', '0', '71.41.234.174', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; CMDTDF; InfoPath.2)', 'USD', '', '', '', '', '', '12', ''),
('363', '1', '', '2014-01-07 22:10:57', '0', '0', '70.114.187.108', 'http://www.laketravisoralsurgery.net/referrals/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:26.0) Gecko/20100101 Firefox/26.0', 'USD', '', '', '', '', '', '7', '');

--
-- Table structure for table `wp_rg_lead_detail`
--

CREATE TABLE `wp_rg_lead_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL,
  `form_id` mediumint(8) unsigned NOT NULL,
  `field_number` float NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3799 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_rg_lead_detail`
--

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1', '1', '2', '3', 'tyrichards@me.com'),
('10', '2', '1', '2.3', 'Kelly '),
('3', '1', '2', '1.2', 'Dr.'),
('4', '1', '2', '1.3', 'Bob'),
('5', '1', '2', '1.6', 'Jones'),
('6', '1', '2', '1.8', 'III'),
('8', '1', '2', '5', 'http://www.bobsdentistry.com'),
('9', '1', '2', '4', '(817)291-2608'),
('11', '2', '1', '2.6', 'Poppins'),
('12', '2', '1', '3', 'kelly@kellypoppins.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('13', '2', '1', '4', '(555)555-5555'),
('15', '2', '1', '7', 'Hello My name is what?'),
('25', '4', '1', '2.6', 'Richards'),
('17', '3', '1', '2.3', 'Freddy'),
('18', '3', '1', '2.6', 'Mercury'),
('19', '3', '1', '3', 'fred@freddy.com'),
('20', '3', '1', '4', '(555)555-5555'),
('22', '3', '1', '7', 'fdsfa'),
('24', '4', '1', '2.3', 'Emily'),
('26', '4', '1', '3', 'me@tyrichards.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('27', '4', '1', '4', '(555)555-5555'),
('29', '4', '1', '6', 'Tooth Ache'),
('30', '4', '1', '7', 'fasdfadsfdsaf sdf sadfs df\r\nfdsf ads\r\nfdsf\r\n\r\n\r\n\r\ndsafs '),
('32', '5', '1', '2.3', 'Benny'),
('33', '5', '1', '2.6', 'Alford'),
('34', '5', '1', '3', 'tyrichards@me.com'),
('35', '5', '1', '4', '(555)555-5555'),
('1194', '131', '1', '7', 'Please evaluate for expose and bond a chain to teeth #s 6, 11, and 18.  Also evaluate for luxation of teeth #s 18 and 31.  Alex will also need a pathology consultation for tooth # 18.  Please call the'),
('37', '5', '1', '7', 'fdsfasfsdf'),
('38', '6', '1', '2.3', 'Izzy ');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('39', '6', '1', '2.6', 'Richards'),
('40', '6', '1', '3', 'tyrichards@me.com'),
('41', '6', '1', '4', '(555)555-5555'),
('43', '6', '1', '7', 'fdasfdsf'),
('74', '13', '2', '3', 'drjalfordoms@yahoo.com'),
('87', '14', '2', '1.2', 'Dr.'),
('76', '13', '2', '1.3', 'Jeff'),
('77', '13', '2', '1.6', 'Alford'),
('482', '65', '2', '4', '(512)263-8989'),
('79', '13', '2', '5', 'http://laketravisoralsurgery.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('80', '13', '2', '4', '(512)261-6900'),
('94', '15', '2', '3', 'tyrichards@me.com'),
('85', '14', '2', '11', 'Bob The Dentist'),
('84', '14', '2', '3', 'tyrichards@me.com'),
('88', '14', '2', '1.3', 'Bob'),
('89', '14', '2', '1.6', 'Jones'),
('90', '14', '2', '1.8', 'III'),
('481', '65', '2', '1.6', 'Gosney'),
('92', '14', '2', '4', '(817)291-2608'),
('93', '14', '2', '5', 'http://www.bobsdentistry.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('95', '15', '2', '11', 'Dentist Bob'),
('104', '16', '2', '3', 'tyrichards@me.com'),
('97', '15', '2', '1.2', 'Dr.'),
('98', '15', '2', '1.3', 'Bob'),
('99', '15', '2', '1.6', 'Jones'),
('100', '15', '2', '1.8', 'III'),
('480', '65', '2', '1.3', 'Kirsten'),
('102', '15', '2', '4', '(555)555-5555'),
('103', '15', '2', '5', 'http://www.bobthedentist.com'),
('105', '16', '2', '11', 'Bob Dentist');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('107', '16', '2', '1.2', 'Dr.'),
('108', '16', '2', '1.3', 'Bob'),
('109', '16', '2', '1.6', 'Jones'),
('110', '16', '2', '1.8', 'III'),
('479', '65', '2', '1.2', 'Dr.'),
('112', '16', '2', '4', '(555)555-5555'),
('113', '16', '2', '5', 'http://www.bobthedentist.com'),
('114', '17', '1', '2.3', 'Izzy'),
('115', '17', '1', '2.6', 'Richards'),
('116', '17', '1', '3', 'izzy@tyrichards.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('117', '17', '1', '4', '(555)555-5555'),
('119', '17', '1', '7', 'fdsafadsf'),
('120', '18', '1', '2.3', 'Izzy'),
('121', '18', '1', '2.6', 'Richards'),
('122', '18', '1', '3', 'tyrichards@me.com'),
('123', '18', '1', '4', '(555)555-5555'),
('125', '18', '1', '7', 'fsdafdsf'),
('126', '19', '1', '2.3', 'Izzy'),
('127', '19', '1', '2.6', 'Richards'),
('128', '19', '1', '3', 'tyrichards@me.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('129', '19', '1', '4', '(555)555-5555'),
('131', '19', '1', '7', 'fsdafdsf'),
('132', '20', '1', '2.3', 'Izzy'),
('133', '20', '1', '2.6', 'Richards'),
('134', '20', '1', '3', 'tyrichards@me.com'),
('135', '20', '1', '4', '(555)555-5555'),
('1193', '131', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/02/Davis,Alex_Pano6.JPG'),
('137', '20', '1', '7', 'fsdafdsf'),
('138', '21', '1', '2.3', 'Izzy'),
('139', '21', '1', '2.6', 'Richards');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('140', '21', '1', '3', 'tyrichards@me.com'),
('141', '21', '1', '4', '(555)555-5555'),
('1192', '131', '1', '11.6', '27'),
('143', '21', '1', '7', 'fsdafdsf'),
('144', '22', '1', '2.3', 'Izzy'),
('145', '22', '1', '2.6', 'Richards'),
('146', '22', '1', '3', 'tyrichards@me.com'),
('147', '22', '1', '4', '(555)555-5555'),
('1191', '131', '1', '10.12', '11'),
('149', '22', '1', '7', 'fsdafdsf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('150', '23', '1', '2.3', 'Izzy'),
('151', '23', '1', '2.6', 'Richards'),
('152', '23', '1', '3', 'tyrichards@me.com'),
('153', '23', '1', '4', '(555)555-5555'),
('1190', '131', '1', '10.6', '6'),
('155', '23', '1', '7', 'fsdafdsf'),
('156', '24', '1', '2.3', 'Izzy'),
('157', '24', '1', '2.6', 'Richards'),
('158', '24', '1', '3', 'tyrichards@me.com'),
('159', '24', '1', '4', '(555)555-5555');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('161', '24', '1', '7', 'fsdafdsf'),
('162', '25', '1', '2.3', 'Izzy'),
('163', '25', '1', '2.6', 'Richards'),
('164', '25', '1', '3', 'tyrichards@me.com'),
('165', '25', '1', '4', '(555)555-5555'),
('167', '25', '1', '7', 'fsdafdsf'),
('168', '26', '1', '2.3', 'Izzy'),
('169', '26', '1', '2.6', 'Richards'),
('170', '26', '1', '3', 'tyrichards@me.com'),
('171', '26', '1', '4', '(555)555-5555');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1189', '131', '1', '6', 'Luxation of teeth numbers 18 and 31 and pathology consult on tooth # 18'),
('173', '26', '1', '7', 'fsdafdsf'),
('174', '27', '1', '2.3', 'Izzy'),
('175', '27', '1', '2.6', 'Richards'),
('176', '27', '1', '3', 'tyrichards@me.com'),
('177', '27', '1', '4', '(555)555-5555'),
('1188', '131', '1', '26.9', 'Other'),
('179', '27', '1', '7', 'fsdafdsf'),
('180', '28', '1', '2.3', 'Izzy'),
('181', '28', '1', '2.6', 'Richards');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('182', '28', '1', '3', 'tyrichards@me.com'),
('183', '28', '1', '4', '(555)555-5555'),
('1187', '131', '1', '26.2', 'Expose & Bond'),
('185', '28', '1', '7', 'fsdafdsf'),
('186', '29', '1', '2.3', 'Izzy'),
('187', '29', '1', '2.6', 'Richards'),
('188', '29', '1', '3', 'tyrichards@me.com'),
('189', '29', '1', '4', '(555)555-5555'),
('191', '29', '1', '7', 'fsdafdsf'),
('192', '30', '1', '2.3', 'Izzy');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('193', '30', '1', '2.6', 'Richards'),
('194', '30', '1', '3', 'tyrichards@me.com'),
('195', '30', '1', '4', '(555)555-5555'),
('197', '30', '1', '7', 'fsdafdsf'),
('198', '31', '1', '2.3', 'Izzy'),
('199', '31', '1', '2.6', 'Richards'),
('200', '31', '1', '3', 'tyrichards@me.com'),
('201', '31', '1', '4', '(555)555-5555'),
('1186', '131', '1', '25', 'Guardian would like you to call to schedule'),
('203', '31', '1', '7', 'fsdafdsf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('204', '32', '1', '2.3', 'Izzy'),
('205', '32', '1', '2.6', 'Richards'),
('206', '32', '1', '3', 'tyrichards@me.com'),
('207', '32', '1', '4', '(555)555-5555'),
('1185', '131', '1', '4', '(512)924-9887'),
('209', '32', '1', '7', 'fsdafdsf'),
('210', '33', '1', '2.3', 'Izzy'),
('211', '33', '1', '2.6', 'Richards'),
('212', '33', '1', '3', 'tyrichards@me.com'),
('213', '33', '1', '4', '(555)555-5555');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('215', '33', '1', '7', 'fsdafdsf'),
('216', '34', '1', '2.3', 'Izzy'),
('217', '34', '1', '2.6', 'Richards'),
('218', '34', '1', '3', 'tyrichards@me.com'),
('219', '34', '1', '4', '(555)555-5555'),
('1184', '131', '1', '3', 'kellymdavis@gmail.com'),
('221', '34', '1', '7', 'fsdafdsf'),
('222', '35', '1', '2.3', 'Izzy'),
('223', '35', '1', '2.6', 'Richards'),
('224', '35', '1', '3', 'tyrichards@me.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('225', '35', '1', '4', '(555)555-5555'),
('1183', '131', '1', '21.6', 'Davis'),
('227', '35', '1', '7', 'fsdafdsf'),
('228', '36', '1', '2.3', 'Izzy'),
('229', '36', '1', '2.6', 'Richards'),
('230', '36', '1', '3', 'tyrichards@me.com'),
('231', '36', '1', '4', '(555)555-5555'),
('1182', '131', '1', '21.3', 'Kelly'),
('233', '36', '1', '7', 'fsdafdsf'),
('234', '37', '1', '2.3', 'Izzy');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('235', '37', '1', '2.6', 'Richards'),
('236', '37', '1', '3', 'tyrichards@me.com'),
('237', '37', '1', '4', '(555)555-5555'),
('239', '37', '1', '7', 'fsdafdsf'),
('240', '38', '1', '2.3', 'Izzy'),
('241', '38', '1', '2.6', 'Richards'),
('242', '38', '1', '3', 'tyrichards@me.com'),
('243', '38', '1', '4', '(555)555-5555'),
('1181', '131', '1', '20.1', 'Patient is a minor'),
('245', '38', '1', '7', 'fsdafdsf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('246', '39', '1', '2.3', 'Izzy'),
('247', '39', '1', '2.6', 'Richards'),
('248', '39', '1', '3', 'tyrichards@me.com'),
('249', '39', '1', '4', '(555)555-5555'),
('1180', '131', '1', '2.6', 'Davis'),
('251', '39', '1', '7', 'fsdafdsf'),
('252', '40', '1', '2.3', 'Izzy'),
('253', '40', '1', '2.6', 'Richards'),
('254', '40', '1', '3', 'tyrichards@me.com'),
('255', '40', '1', '4', '(555)555-5555');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1179', '131', '1', '2.3', 'Alex '),
('257', '40', '1', '7', 'fsdafdsf'),
('258', '41', '1', '2.3', 'Izzy'),
('259', '41', '1', '2.6', 'Richards'),
('260', '41', '1', '3', 'tyrichards@me.com'),
('261', '41', '1', '4', '(555)555-5555'),
('263', '41', '1', '7', 'fsdafdsf'),
('264', '42', '1', '2.3', 'Izzy'),
('265', '42', '1', '2.6', 'Richards'),
('266', '42', '1', '3', 'tyrichards@me.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('267', '42', '1', '4', '(555)555-5555'),
('269', '42', '1', '7', 'fsdafdsf'),
('270', '43', '1', '2.3', 'Izzy'),
('271', '43', '1', '2.6', 'Richards'),
('272', '43', '1', '3', 'tyrichards@me.com'),
('273', '43', '1', '4', '(555)555-5555'),
('275', '43', '1', '7', 'fsdafdsf'),
('276', '44', '1', '2.3', 'Izzy'),
('277', '44', '1', '2.6', 'Richards'),
('278', '44', '1', '3', 'tyrichards@me.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('279', '44', '1', '4', '(555)555-5555'),
('281', '44', '1', '7', 'fsdafdsf'),
('282', '45', '1', '2.3', 'Izzy'),
('283', '45', '1', '2.6', 'Richards'),
('284', '45', '1', '3', 'izzy@tyrichards.com'),
('285', '45', '1', '4', '(555)555-5555'),
('1178', '130', '1', '7', 'Please extract teeth #s K and T.  In addition to the extractions, please uncover teeth #s 5,6,12,21, and 22'),
('287', '45', '1', '7', 'fdsafadsf'),
('288', '46', '1', '2.3', 'Izzy'),
('289', '46', '1', '2.6', 'Richards');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('290', '46', '1', '3', 'tyrichards@me.com'),
('291', '46', '1', '4', '(555)555-5555'),
('1177', '130', '1', '9.11', 'K'),
('293', '46', '1', '8.1', 'A'),
('294', '46', '1', '9.8', 'M'),
('295', '46', '1', '9.9', 'L'),
('296', '46', '1', '10.6', '6'),
('297', '46', '1', '11.9', '24'),
('298', '46', '1', '7', 'fdsfdsf'),
('299', '47', '1', '2.3', 'Izzy');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('300', '47', '1', '2.6', 'Richards'),
('301', '47', '1', '3', 'tyrichards@me.com'),
('302', '47', '1', '4', '(555)555-5555'),
('1176', '130', '1', '9.1', 'T'),
('304', '47', '1', '8.4', 'D'),
('305', '47', '1', '9.5', 'P'),
('306', '47', '1', '10.11', '10'),
('307', '47', '1', '11.9', '24'),
('308', '47', '1', '7', 'fdsafdsff\r\nfdsafdsa'),
('309', '48', '1', '2.3', 'Izzy');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('310', '48', '1', '2.6', 'R'),
('311', '48', '1', '3', 'tyrichards@me.com'),
('312', '48', '1', '4', '(555)555-5555'),
('1175', '130', '1', '26.1', 'Extraction'),
('314', '48', '1', '9.9', 'L'),
('315', '48', '1', '7', 'fdsfds'),
('316', '49', '1', '2.3', 'Izzy'),
('317', '49', '1', '2.6', 'b'),
('318', '49', '1', '3', 'tyrichards@me.com'),
('319', '49', '1', '4', '(555)555-5555');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('321', '49', '1', '8.8', 'H'),
('322', '49', '1', '8.9', 'I'),
('323', '49', '1', '9.8', 'M'),
('324', '49', '1', '9.9', 'L'),
('325', '49', '1', '10.9', '9'),
('326', '49', '1', '10.11', '10'),
('327', '49', '1', '11.9', '24'),
('328', '49', '1', '11.11', '23'),
('329', '49', '1', '7', 'fdsf'),
('330', '50', '1', '2.3', 'Izzy');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('331', '50', '1', '2.6', 'B'),
('332', '50', '1', '3', 'tyrichards@me.com'),
('333', '50', '1', '4', '(555)555-5555'),
('1174', '130', '1', '24', '--- Select One ---'),
('335', '50', '1', '8.9', 'I'),
('336', '50', '1', '9.9', 'L'),
('337', '50', '1', '10.9', '9'),
('338', '50', '1', '11.8', '25'),
('339', '50', '1', '7', 'fdsfdsf'),
('340', '51', '1', '2.3', 'Izzy');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('341', '51', '1', '2.6', 'b'),
('342', '51', '1', '3', 'tyrichards@me.com'),
('343', '51', '1', '4', '(555)555-5555'),
('1173', '130', '1', '2.6', 'Griswold'),
('345', '51', '1', '8.4', 'D'),
('346', '51', '1', '9.4', 'Q'),
('347', '51', '1', '7', 'fsfdaf'),
('348', '52', '1', '2.3', 'Izzy'),
('349', '52', '1', '2.6', 'b'),
('350', '52', '1', '3', 'tyrichards@me.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('351', '52', '1', '4', '(555)555-5555'),
('1172', '130', '1', '2.3', 'Madison'),
('353', '52', '1', '8.5', 'E'),
('354', '52', '1', '9.5', 'P'),
('355', '52', '1', '11.6', '27'),
('356', '52', '1', '7', 'fdsf'),
('357', '53', '1', '2.3', 'Izzy'),
('358', '53', '1', '2.6', 'B'),
('359', '53', '1', '3', 'tyrichards@me.com'),
('360', '53', '1', '4', '(555)555-5555');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('362', '53', '1', '8.1', 'A'),
('363', '53', '1', '8.2', 'B'),
('364', '53', '1', '8.5', 'E'),
('365', '53', '1', '8.6', 'F'),
('366', '53', '1', '8.7', 'G'),
('367', '53', '1', '8.8', 'H'),
('368', '53', '1', '9.6', 'O'),
('369', '53', '1', '9.7', 'N'),
('370', '53', '1', '9.8', 'M'),
('371', '53', '1', '10.1', '1');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('372', '53', '1', '10.2', '2'),
('373', '53', '1', '11.1', '32'),
('374', '53', '1', '7', 'fdsafsa'),
('375', '54', '1', '2.3', 'Izzy'),
('376', '54', '1', '2.6', 'B'),
('377', '54', '1', '3', 'tyrichards@me.com'),
('378', '54', '1', '4', '(555)555-5555'),
('380', '54', '1', '8.6', 'F'),
('381', '54', '1', '9.6', 'O'),
('382', '54', '1', '10.5', '5');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('383', '54', '1', '11.5', '28'),
('384', '54', '1', '7', 'fdsafds'),
('385', '55', '1', '2.3', 'Izzy'),
('386', '55', '1', '2.6', 'B'),
('387', '55', '1', '3', 'tyrichards@me.com'),
('388', '55', '1', '4', '(555)555-5555'),
('390', '55', '1', '8.6', 'F'),
('391', '55', '1', '7', 'fdsaf\r\nfdsfsdaf\r\nfdasf\r\nsdfsdfads\r\ndfs'),
('392', '56', '1', '2.3', 'Jeff'),
('393', '56', '1', '2.6', 'Alford');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('394', '56', '1', '3', 'drjalfordoms@yahoo.com'),
('395', '56', '1', '4', '(214)450-3800'),
('1171', '129', '1', '7', 'Our pano machine is down today so we do not have any xrays to send.'),
('397', '56', '1', '10.1', '1'),
('398', '56', '1', '10.17', '16'),
('399', '56', '1', '11.1', '32'),
('400', '56', '1', '11.17', '17'),
('401', '56', '1', '7', 'test'),
('402', '57', '1', '2.3', 'Kelly'),
('403', '57', '1', '2.6', 'Alford');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('404', '57', '1', '3', 'mrskalford@aol.com'),
('405', '57', '1', '4', '(817)300-0848'),
('407', '57', '1', '10.4', '4'),
('408', '57', '1', '7', 'test '),
('409', '58', '2', '3', 'info@lakewayortho.com'),
('410', '58', '2', '11', 'lakewayortho'),
('417', '59', '1', '2.3', 'test'),
('412', '58', '2', '1.3', 'Jeff'),
('413', '58', '2', '1.6', 'Dykes'),
('484', '66', '1', '2.3', 'Alec');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('415', '58', '2', '4', '(512)263-2993'),
('416', '58', '2', '5', 'http://lakewayortho.com'),
('418', '59', '1', '2.6', 'test'),
('419', '59', '1', '3', 'info@lakewayortho.com'),
('420', '59', '1', '4', '(512)555-5555'),
('1170', '129', '1', '6', 'Lower jaw advancement'),
('422', '59', '1', '10.6', '6'),
('423', '59', '1', '10.12', '11'),
('424', '60', '1', '2.3', 'Test'),
('425', '60', '1', '2.6', 'Test');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('426', '60', '1', '3', 'me@tyrichards.com'),
('427', '60', '1', '4', '(555)555-5555'),
('1169', '129', '1', '26.9', 'Other'),
('429', '60', '1', '8.6', 'F'),
('430', '60', '1', '9.6', 'O'),
('431', '60', '1', '10.6', '6'),
('432', '60', '1', '11.6', '27'),
('433', '60', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/06/Icon_big.png'),
('434', '60', '1', '7', 'fdsfas'),
('435', '61', '1', '2.3', 'test2');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('436', '61', '1', '2.6', 'test2'),
('437', '61', '1', '3', 'me@tyrichards.com'),
('438', '61', '1', '4', '(555)555-5555'),
('440', '61', '1', '8.1', 'A'),
('441', '61', '1', '8.2', 'B'),
('442', '61', '1', '9.1', 'T'),
('443', '61', '1', '9.2', 'S'),
('444', '61', '1', '10.1', '1'),
('445', '61', '1', '10.2', '2'),
('446', '61', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/06/referrals_desktop_icon.zip');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('447', '61', '1', '7', 'You can now receive files! Yay!'),
('448', '62', '2', '3', 'healthysmilesoflakeway@yahoo.com'),
('449', '62', '2', '11', 'Healthy Smiles of Lakeway'),
('456', '63', '2', '3', 'emily@tyrichards.com'),
('451', '62', '2', '1.3', 'Juanita'),
('452', '62', '2', '1.6', 'Sabochick'),
('477', '65', '2', '11', 'Healthy Smiles of Lakeway'),
('454', '62', '2', '4', '(512)263-8989'),
('455', '62', '2', '5', 'http://www.healthysmilesoflakeway.com'),
('457', '63', '2', '11', 'Emily The Dentist');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('466', '64', '2', '3', 'emily@tyrichards.com'),
('459', '63', '2', '1.2', 'Dr.'),
('460', '63', '2', '1.3', 'Emily'),
('461', '63', '2', '1.6', 'Richards'),
('462', '63', '2', '1.8', 'III'),
('464', '63', '2', '4', '(555)555-5555'),
('465', '63', '2', '5', 'http://www.emilythedentist.com'),
('467', '64', '2', '11', 'Emily The Orthodontist'),
('483', '65', '2', '5', 'http://www.healthysmilesoflakeway.com'),
('469', '64', '2', '1.2', 'Dr.');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('470', '64', '2', '1.3', 'Emily'),
('471', '64', '2', '1.6', 'Richards'),
('472', '64', '2', '1.8', 'III'),
('476', '65', '2', '3', 'healthysmilesoflakeway@yahoo.com'),
('474', '64', '2', '4', '(555)555-5555'),
('475', '64', '2', '5', 'http://www.emilythedentist.com'),
('485', '66', '1', '2.6', 'Woodruff'),
('486', '66', '1', '3', 'healthysmilesoflakeway@yahoo.com'),
('487', '66', '1', '4', '(512)785-4499'),
('489', '66', '1', '11.17', '17');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('490', '66', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/06/Woodruff.JPG'),
('491', '66', '1', '7', 'this pano is from 1-28-09 & is the most recent we have on file-we do not have an email address on file for this patient so I entered ours'),
('492', '67', '1', '2.3', 'Katy'),
('493', '67', '1', '2.6', 'Gilliam'),
('494', '67', '1', '3', 'bonniegilliam@yahoo.com'),
('495', '67', '1', '4', '(512)419-8702'),
('1168', '129', '1', '25', 'Guardian would like you to call to schedule'),
('497', '67', '1', '10.1', '1'),
('498', '67', '1', '10.17', '16'),
('499', '67', '1', '11.1', '32');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('500', '67', '1', '11.17', '17'),
('501', '67', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/06/Panoramic X-Ray.jpg'),
('502', '67', '1', '7', 'Patient is a minor. Mothers name is Bonnie Gilliam.'),
('503', '68', '1', '2.3', 'Test'),
('504', '68', '1', '2.6', 'Test'),
('505', '68', '1', '3', 'test@test.com'),
('506', '68', '1', '4', '(555)555-5555'),
('1167', '129', '1', '4', '(512)261-3009'),
('508', '68', '1', '8.5', 'E'),
('509', '68', '1', '9.5', 'P');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('510', '68', '1', '10.5', '5'),
('511', '68', '1', '11.5', '28'),
('512', '68', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/06/Referrals - Lake Travis Oral & Maxillofacial Surgery.webloc'),
('513', '68', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/06/Referrals - Lake Travis Oral & Maxillofacial Surgery1.webloc'),
('514', '68', '1', '17', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/06/Referrals - Lake Travis Oral & Maxillofacial Surgery2.webloc'),
('515', '68', '1', '18', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/06/Referrals - Lake Travis Oral & Maxillofacial Surgery3.webloc'),
('516', '68', '1', '7', 'test 1'),
('517', '69', '1', '2.3', 'Tyler'),
('518', '69', '1', '2.6', 'Seymore'),
('519', '69', '1', '3', 'TammieSeymore@yahoo.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('520', '69', '1', '4', '(325)998-4893'),
('522', '69', '1', '10.1', '1'),
('523', '69', '1', '10.17', '16'),
('524', '69', '1', '11.1', '32'),
('525', '69', '1', '11.17', '17'),
('526', '69', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/06/Seymore,Tyler_Pano1.JPG'),
('527', '69', '1', '7', 'Patient is a minor.  Patient\'s mom\'s name is Tammie Seymore.  Above phone number is her cell phone.'),
('528', '70', '1', '2.3', 'Robert '),
('529', '70', '1', '2.6', 'Smith'),
('530', '70', '1', '3', 'maryallensmith4@gmail.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('531', '70', '1', '4', '(512)466-9227'),
('1166', '129', '1', '3', 'sdd@austin.rr.com'),
('533', '70', '1', '10.1', '1'),
('534', '70', '1', '10.17', '16'),
('535', '70', '1', '11.1', '32'),
('536', '70', '1', '11.17', '17'),
('537', '70', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/06/Panoramic X-Ray1.jpg'),
('538', '70', '1', '7', 'Patient is minor.\r\nMother: Mary Allen Smith'),
('539', '71', '1', '2.3', 'Jolie'),
('540', '71', '1', '2.6', 'Nguyen');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('541', '71', '1', '4', '(512)785-8913'),
('1165', '129', '1', '21.6', 'Dwight'),
('543', '71', '1', '10.1', '1'),
('544', '71', '1', '10.17', '16'),
('545', '71', '1', '11.1', '32'),
('546', '71', '1', '11.17', '17'),
('547', '71', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/06/Panoramic X-Ray2.jpg'),
('548', '71', '1', '7', 'D.O.B. - 09/06/94\r\nMother - Vickie Nguyen'),
('549', '72', '1', '2.3', 'Avery'),
('550', '72', '1', '2.6', 'Lightfoot');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('551', '72', '1', '3', 'janelightfoot@att.net'),
('552', '72', '1', '4', '(512)750-1999'),
('1164', '129', '1', '21.3', 'Susan'),
('554', '72', '1', '6', 'Frenectomy'),
('555', '72', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/06/Lightfoot,Avery_FinalPanoPH1.JPG'),
('556', '72', '1', '7', 'D.O.B. - 01/16/02\r\nMother: Jane Lightfoot'),
('557', '73', '2', '3', 'julie@youraustintxdentist.com'),
('558', '73', '2', '11', 'A Summer Smile'),
('564', '74', '1', '2.3', 'test'),
('560', '73', '2', '1.3', 'Summer');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('561', '73', '2', '1.6', 'Rydell'),
('562', '73', '2', '4', '(512)382-1969'),
('563', '73', '2', '5', 'http://youraustintxdentist.com'),
('565', '74', '1', '2.6', 'test'),
('566', '74', '1', '3', 'sumryd627@aol.com'),
('567', '74', '1', '4', '(512)382-1969'),
('569', '74', '1', '10.17', '16'),
('570', '75', '2', '3', 'info@candcdentistry.com'),
('571', '75', '2', '11', 'C and C Dentistry'),
('578', '76', '1', '2.3', 'test');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('573', '75', '2', '1.3', 'Jaime'),
('574', '75', '2', '1.6', 'Ramirez'),
('575', '75', '2', '1.8', 'DDS'),
('576', '75', '2', '4', '(512)263-8900'),
('577', '75', '2', '5', 'http://candcdentistry.com'),
('579', '76', '1', '2.6', 'test'),
('580', '76', '1', '3', 'info@candcdentistry.com'),
('581', '76', '1', '4', '(512)827-7434'),
('1163', '129', '1', '20.1', 'Patient is a minor'),
('583', '76', '1', '10.1', '1');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('584', '76', '1', '10.17', '16'),
('585', '76', '1', '11.1', '32'),
('586', '76', '1', '11.17', '17'),
('587', '77', '1', '2.3', 'test'),
('588', '77', '1', '2.6', 'test'),
('589', '77', '1', '3', 'drjalfordoms@yahoo.com'),
('590', '77', '1', '4', '(512)827-7434'),
('1162', '129', '1', '2.6', 'Dwight'),
('592', '77', '1', '10.1', '1'),
('593', '77', '1', '10.17', '16');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('594', '77', '1', '11.1', '32'),
('595', '77', '1', '11.17', '17'),
('596', '78', '1', '2.3', 'test'),
('597', '78', '1', '2.6', 'test'),
('598', '78', '1', '3', 'drjalfordoms@yahoo.com'),
('599', '78', '1', '4', '(512)827-7434'),
('1161', '129', '1', '2.3', 'Ryan'),
('601', '78', '1', '10.1', '1'),
('602', '78', '1', '10.17', '16'),
('603', '78', '1', '11.1', '32');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('604', '78', '1', '11.17', '17'),
('605', '79', '1', '2.3', 'Minor'),
('606', '79', '1', '2.6', 'Minor'),
('607', '79', '1', '20.1', 'Patient is a minor'),
('608', '79', '1', '21.3', 'Adult'),
('609', '79', '1', '21.6', 'Adult'),
('635', '81', '1', '20.1', 'Patient is a minor'),
('612', '79', '1', '25', 'Guardian does not want to be contacted'),
('614', '79', '1', '8.5', 'E'),
('615', '79', '1', '9.5', 'P');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('616', '79', '1', '10.4', '4'),
('617', '79', '1', '11.4', '29'),
('618', '79', '1', '7', 'test'),
('619', '80', '1', '2.3', 'Minor'),
('620', '80', '1', '2.6', 'Minor'),
('621', '80', '1', '20.1', 'Patient is a minor'),
('622', '80', '1', '21.3', 'Adult'),
('623', '80', '1', '21.6', 'Adult'),
('633', '81', '1', '2.3', 'Minor'),
('634', '81', '1', '2.6', 'Minor');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('626', '80', '1', '25', 'Guardian does not want to be contacted'),
('628', '80', '1', '8.4', 'D'),
('629', '80', '1', '9.4', 'Q'),
('630', '80', '1', '10.4', '4'),
('631', '80', '1', '11.4', '29'),
('632', '80', '1', '7', 'fdasfs'),
('636', '81', '1', '21.3', 'Adult'),
('637', '81', '1', '21.6', 'Adult'),
('638', '81', '1', '3', 'me@tyrichards.com'),
('639', '81', '1', '4', '(817)291-2608');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('640', '81', '1', '25', 'Guardian does not want to be contacted'),
('642', '81', '1', '8.7', 'G'),
('643', '81', '1', '9.7', 'N'),
('644', '81', '1', '10.7', '7'),
('645', '81', '1', '11.7', '26'),
('646', '81', '1', '7', 'fasdf'),
('647', '82', '1', '2.3', 'test'),
('648', '82', '1', '2.6', 'test'),
('649', '82', '1', '20.1', 'Patient is a minor'),
('650', '82', '1', '21.3', 'test1');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('651', '82', '1', '21.6', 'test1'),
('652', '82', '1', '3', 'drjalfordoms@yahoo.com'),
('653', '82', '1', '4', '(214)450-3800'),
('654', '82', '1', '25', 'Guardian would like you to call to schedule'),
('1160', '128', '1', '7', 'Please Ext 15, Please also evaluate 3rds and ext if you feel necessary'),
('656', '82', '1', '10.5', '5'),
('657', '82', '1', '7', 'test. test. '),
('658', '83', '1', '2.3', 'Keith '),
('659', '83', '1', '2.6', 'Payne'),
('660', '83', '1', '3', 'kim.s.payne@wellsfargo.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('661', '83', '1', '4', '(512)424-0128'),
('662', '83', '1', '24', 'Patient would like you to call to schedule'),
('664', '83', '1', '6', 'Pt would like comprehensive evaluation of all bone loss and would also like implant consult for teeth 3, 14 and19. Both 2 and 3 have extensive root caries.  Are teeth restorable or hopeless? Should pt'),
('665', '83', '1', '10.2', '2'),
('666', '83', '1', '10.3', '3'),
('667', '83', '1', '10.15', '14'),
('668', '83', '1', '11.15', '19'),
('669', '83', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/07/radio_exam.jpg'),
('670', '83', '1', '7', 'The phone number and email are his wife\'s, she will sent up his appointment.\r\nJeff- please call me with any questions, this is the guys I was talking to you about earlier today. \r\nSummer Rydel'),
('671', '84', '1', '2.3', 'Mandy');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('672', '84', '1', '2.6', 'Serna'),
('673', '84', '1', '3', 'mandyjserna@gmail.com'),
('674', '84', '1', '4', '(254)654-6248'),
('675', '84', '1', '24', 'Patient would like you to call to schedule'),
('677', '84', '1', '10.4', '4'),
('678', '84', '1', '10.5', '5'),
('679', '84', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/07/radio_exam1.jpg'),
('680', '84', '1', '7', 'The pt had infection in both 4 and 5 when she presented for a limited exam.  Both teeth were extracted today 7/6/11.  Pt will be interested in finding out more info on implants in those areas'),
('681', '85', '1', '2.3', 'Emily'),
('682', '85', '1', '2.6', 'Evans');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('683', '85', '1', '20.1', 'Patient is a minor'),
('684', '85', '1', '21.3', 'Julia '),
('685', '85', '1', '21.6', 'Evans'),
('686', '85', '1', '3', 'juliaevans@austin.rr.com'),
('687', '85', '1', '4', '(512)266-0096'),
('688', '85', '1', '25', 'Guardian would like you to call to schedule'),
('690', '85', '1', '6', 'Frenectomy'),
('691', '85', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/07/Panoramic X-Ray.jpg'),
('692', '86', '1', '2.3', 'Heather '),
('693', '86', '1', '2.6', 'Dueease');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('694', '86', '1', '3', 'hdueease@gmail.com'),
('695', '86', '1', '4', '(512)669-5561'),
('696', '86', '1', '24', '--- Select One ---'),
('698', '86', '1', '10.1', '1'),
('699', '86', '1', '10.17', '16'),
('700', '86', '1', '11.1', '32'),
('701', '86', '1', '11.17', '17'),
('702', '86', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/07/X00158.JPG'),
('703', '87', '1', '2.3', 'Dave'),
('704', '87', '1', '2.6', 'Zinsmeyer');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('705', '87', '1', '20.1', 'Patient is a minor'),
('706', '87', '1', '21.3', 'Kay'),
('707', '87', '1', '21.6', 'Zinsmeyer'),
('708', '87', '1', '4', '(512)470-7450'),
('709', '87', '1', '25', '--- Select One ---'),
('711', '87', '1', '10.1', '1'),
('712', '87', '1', '10.17', '16'),
('713', '87', '1', '11.1', '32'),
('714', '87', '1', '11.17', '17'),
('715', '87', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/07/Zinsmeyer3-28-11.JPG');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('716', '88', '1', '2.3', 'Pam '),
('717', '88', '1', '2.6', 'Taylor'),
('718', '88', '1', '3', 'pam28taylor@yahoo.com'),
('719', '88', '1', '24', 'Patient would like you to email to schedule'),
('1159', '128', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/01/radio_exam.jpg'),
('721', '88', '1', '11.3', '30'),
('722', '88', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/07/22_PA 28-30.jpg'),
('723', '88', '1', '7', 'Patient would like a consult to find out pricing and info for implant on #30'),
('724', '89', '1', '2.3', 'Belissa'),
('725', '89', '1', '2.6', 'Zamora');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('726', '89', '1', '3', 'belissazamora@gmail.com'),
('727', '89', '1', '4', '(512)656-6759'),
('728', '89', '1', '24', 'Patient would like you to call to schedule'),
('1158', '128', '1', '11.17', '17'),
('730', '89', '1', '10.1', '1'),
('731', '89', '1', '10.17', '16'),
('732', '89', '1', '11.1', '32'),
('733', '89', '1', '11.17', '17'),
('734', '89', '1', '7', 'Please take Pano, pt needs 3rds extracted so that #32 doesn\'t cause permanent trauma to #31. '),
('735', '90', '1', '2.3', 'Jennifer');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('736', '90', '1', '2.6', 'Smith'),
('737', '90', '1', '3', 'jenn@practicecafe.com'),
('738', '90', '1', '4', '(512)423-6559'),
('739', '90', '1', '24', 'Patient would like you to call to schedule'),
('1157', '128', '1', '11.1', '32'),
('741', '90', '1', '10.1', '1'),
('742', '90', '1', '10.17', '16'),
('743', '90', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/07/1.jpg'),
('744', '90', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/07/radio_exam2.jpg'),
('745', '90', '1', '7', 'Please take pano, Pt appears to have 1 and 16 trying to come in and they are bothering her.  I didn\'t see 17 or 32 on my PA\'s ');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('746', '91', '1', '2.3', 'craig '),
('747', '91', '1', '2.6', 'Barton'),
('748', '91', '1', '4', '(214)507-8063'),
('749', '91', '1', '24', '--- Select One ---'),
('1156', '128', '1', '10.17', '16'),
('751', '91', '1', '6', 'Pt has dry sockets on 17 and 32'),
('752', '91', '1', '11.1', '32'),
('753', '91', '1', '11.17', '17'),
('754', '91', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/07/radio_exam3.jpg'),
('755', '91', '1', '7', 'Jeff-thanks so much for seeing craig today!  he will call you when he is on his way.  I numbed him and irrigated!');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('756', '92', '1', '2.3', 'Tamara '),
('757', '92', '1', '2.6', 'Aarsaether'),
('758', '92', '1', '20.1', 'Patient is a minor'),
('759', '92', '1', '21.3', 'Norma'),
('760', '92', '1', '21.6', 'Aarsaether'),
('761', '92', '1', '3', 'Norma@Aarsaether.net'),
('762', '92', '1', '4', '(512)263-4203'),
('763', '92', '1', '25', 'Guardian would like you to call to schedule'),
('1155', '128', '1', '10.16', '15'),
('765', '92', '1', '10.1', '1');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('766', '92', '1', '10.17', '16'),
('767', '92', '1', '11.1', '32'),
('768', '92', '1', '11.17', '17'),
('769', '92', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/07/Aarsaether,Tamara_Pano1.JPG'),
('770', '92', '1', '7', 'Please extract all third molars.  Teeth numbers 1,16,17, and 32.'),
('771', '93', '1', '2.3', 'Carolyn'),
('772', '93', '1', '2.6', 'Orsack'),
('773', '93', '1', '4', '(713)503-4414'),
('774', '93', '1', '24', '--- Select One ---'),
('1154', '128', '1', '10.1', '1');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('776', '93', '1', '11.2', '31'),
('777', '93', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/21_PA 30-32.jpg'),
('778', '93', '1', '7', 'Pt has periodontal abcess #31, needs ext and bone graft. Please discuss options of implants with pt.  Pt already has an appointment today at 3:15. Thanks Summer Rydel'),
('779', '94', '1', '2.3', 'Chelsie'),
('780', '94', '1', '2.6', 'Nguyen'),
('781', '94', '1', '20.1', 'Patient is a minor'),
('782', '94', '1', '21.3', 'Samantha'),
('783', '94', '1', '21.6', 'Nguyen'),
('784', '94', '1', '3', 'sammyp75@gmail.com'),
('785', '94', '1', '4', '(949)275-0342');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('786', '94', '1', '25', '--- Select One ---'),
('1153', '128', '1', '26.4', 'Implant'),
('788', '94', '1', '10.1', '1'),
('789', '94', '1', '10.4', '4'),
('790', '94', '1', '10.14', '13'),
('791', '94', '1', '10.17', '16'),
('792', '94', '1', '11.1', '32'),
('793', '94', '1', '11.4', '29'),
('794', '94', '1', '11.14', '20'),
('795', '94', '1', '11.17', '17');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('796', '94', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/Nguyen,Chelsi_Pano1.JPG'),
('797', '94', '1', '7', 'Tooth #4 is impacted.  Please evaluate bone density apical to tooth #28.'),
('798', '95', '1', '2.3', 'Riley'),
('799', '95', '1', '2.6', 'Pritchard'),
('800', '95', '1', '20.1', 'Patient is a minor'),
('801', '95', '1', '21.3', 'Kelly'),
('802', '95', '1', '21.6', 'Pritchard'),
('803', '95', '1', '3', 'kbp1965@hotmail.com'),
('804', '95', '1', '4', '(512)266-3578'),
('805', '95', '1', '25', 'Guardian would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('807', '95', '1', '10.1', '1'),
('808', '95', '1', '10.17', '16'),
('809', '95', '1', '11.1', '32'),
('810', '95', '1', '11.17', '17'),
('811', '95', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/Pritchard,Riley_Pano1.JPG'),
('812', '95', '1', '7', 'Please evaluate for the extraction of all third molars.  Teeth numbers 1,16,17, and 32.  Also, please evaluate Riley for the luxation of tooth number 31.'),
('813', '96', '1', '2.3', 'Justin'),
('814', '96', '1', '2.6', 'Glenn'),
('815', '96', '1', '4', '(806)445-4148'),
('816', '96', '1', '24', '--- Select One ---');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1152', '128', '1', '26.1', 'Extraction'),
('818', '96', '1', '10.8', '8'),
('819', '96', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/10_.jpg'),
('820', '96', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/Justin Glenn.jpg'),
('821', '96', '1', '7', 'Pt already on your schedule for Friday @ 3.  Pt wants to discuss extraction and implant on #8.  #8 is not a good tooth to do a PVC on, needs to come out.  '),
('822', '97', '1', '2.3', 'Ashlee'),
('823', '97', '1', '2.6', 'Courtney'),
('824', '97', '1', '20.1', 'Patient is a minor'),
('825', '97', '1', '21.3', 'Heather'),
('826', '97', '1', '21.6', 'Courtney');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('827', '97', '1', '3', 'courtneyheather@rocketmail.com'),
('828', '97', '1', '4', '(830)385-2721'),
('829', '97', '1', '25', 'Guardian would like you to call to schedule'),
('831', '97', '1', '10.1', '1'),
('832', '97', '1', '10.5', '5'),
('833', '97', '1', '10.13', '12'),
('834', '97', '1', '10.17', '16'),
('835', '97', '1', '11.1', '32'),
('836', '97', '1', '11.17', '17'),
('837', '97', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/Courtney, Ashlee_ pano1.JPG');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('838', '97', '1', '7', 'Please extract teeth numbers 1,5,12,16,17, and 32.\r\nHope you all are having a great summer!!-Lindsey'),
('839', '98', '1', '2.3', 'Riley'),
('840', '98', '1', '2.6', 'Pritchard'),
('841', '98', '1', '20.1', 'Patient is a minor'),
('842', '98', '1', '21.3', 'Kelly'),
('843', '98', '1', '21.6', 'Pritchard'),
('844', '98', '1', '3', 'kbp1965@hotmail.com'),
('845', '98', '1', '4', '(512)266-3578'),
('846', '98', '1', '25', 'Guardian would like you to call to schedule'),
('1151', '128', '1', '24', '--- Select One ---');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('848', '98', '1', '10.1', '1'),
('849', '98', '1', '10.17', '16'),
('850', '98', '1', '11.1', '32'),
('851', '98', '1', '11.17', '17'),
('852', '98', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/Pritchard,Riley_Pano11.JPG'),
('853', '98', '1', '7', 'Please extract all third molars, teeth numbers 1,16,17, and 32.  Also, please luxate tooth #31.'),
('854', '99', '1', '2.3', 'Nancy'),
('855', '99', '1', '2.6', 'Christian'),
('856', '99', '1', '4', '(512)577-5990'),
('857', '99', '1', '24', '--- Select One ---');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1150', '128', '1', '2.6', 'Robinson'),
('859', '99', '1', '10.1', '1'),
('860', '99', '1', '10.17', '16'),
('861', '99', '1', '11.1', '32'),
('862', '99', '1', '11.17', '17'),
('863', '99', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/Christian3-20-07.JPG'),
('864', '99', '1', '7', 'This pano is from 2007 but its all we have on file for her.'),
('865', '100', '1', '2.3', 'Paul'),
('866', '100', '1', '2.6', 'Schilling'),
('867', '100', '1', '4', '(512)436-9967');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('868', '100', '1', '24', 'Patient does not want to be contacted'),
('1149', '128', '1', '2.3', 'Michael'),
('870', '100', '1', '11.15', '19'),
('871', '100', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/Schilling.JPG'),
('872', '100', '1', '7', 'Pano we have on file is from 2007 & I explained to the patient that your office would need something more current.  The xray I have sent you was taken today.'),
('873', '101', '1', '2.3', 'Patrice'),
('874', '101', '1', '2.6', 'Ghedi'),
('875', '101', '1', '3', 'tricieg@ghedi.com'),
('876', '101', '1', '4', '(512)385-3706'),
('877', '101', '1', '24', 'Patient would like you to email to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('879', '101', '1', '11.2', '31'),
('880', '101', '1', '11.3', '30'),
('881', '101', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/22_PA 28-30.jpg'),
('882', '101', '1', '7', 'Pt needs #31 EXT and implant.  Pt very nervous about dental tx.  Likes to be sedated here for appointments'),
('883', '102', '1', '2.3', 'Laura '),
('884', '102', '1', '2.6', 'Waldman'),
('885', '102', '1', '24', 'Patient does not want to be contacted'),
('887', '102', '1', '6', 'Nasopalatine Duct Cyst between 8/9'),
('888', '102', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/10_PA 7-10.jpg'),
('889', '102', '1', '7', 'Pt will call when she is able to afford removal of cyst');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('890', '103', '1', '2.3', 'Michael'),
('891', '103', '1', '2.6', 'Dunn'),
('892', '103', '1', '3', 'emptyd@mac.com'),
('893', '103', '1', '4', '(512)638-1954'),
('894', '103', '1', '24', '--- Select One ---'),
('896', '103', '1', '11.4', '29'),
('897', '103', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/X00030.JPG'),
('898', '103', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/X00030_1.JPG'),
('899', '103', '1', '7', 'Patient is scheduled on Sept 2, 2011 at 9:00am'),
('900', '104', '1', '2.3', 'Paul');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('901', '104', '1', '2.6', 'Schilling'),
('902', '104', '1', '4', '(512)436-9967'),
('903', '104', '1', '24', '--- Select One ---'),
('905', '104', '1', '11.15', '19'),
('906', '104', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/SchillingPA.JPG'),
('907', '104', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/08/SchillingPANO.JPG'),
('908', '105', '1', '2.3', 'Ashlee'),
('909', '105', '1', '2.6', 'Courtney'),
('910', '105', '1', '20.1', 'Patient is a minor'),
('911', '105', '1', '21.3', 'Heather');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('912', '105', '1', '21.6', 'Courtney'),
('913', '105', '1', '3', 'courtneyheather@rocketmail.com'),
('914', '105', '1', '4', '(830)385-2721'),
('915', '105', '1', '25', 'Guardian would like you to call to schedule'),
('917', '105', '1', '10.1', '1'),
('918', '105', '1', '10.5', '5'),
('919', '105', '1', '10.13', '12'),
('920', '105', '1', '10.17', '16'),
('921', '105', '1', '11.1', '32'),
('922', '105', '1', '11.17', '17');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('923', '105', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/09/Courtney, Ashlee_ pano1.JPG'),
('924', '105', '1', '7', 'Please extract all third molars teeth numbers 1,16,17, and 32.  Please also extract teeth numbers 5 and 12 and evaluate for a frenectomy.'),
('925', '106', '1', '2.3', 'My '),
('926', '106', '1', '2.6', 'Johnson'),
('927', '106', '1', '3', 'LongD.Dong@gmail.com'),
('928', '106', '1', '4', '(512)263-6969'),
('929', '106', '1', '24', 'Patient would like you to call to schedule'),
('1148', '127', '1', '7', 'The patient was given a ref form with the incorrect tooth circled.  The correct teeth are 32 &17'),
('931', '106', '1', '6', 'Strange burning when I pee.'),
('932', '107', '1', '2.3', 'Luis');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('933', '107', '1', '2.6', 'Escobar'),
('934', '107', '1', '24', '--- Select One ---'),
('936', '107', '1', '11.15', '19'),
('937', '107', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/09/26_PA 19-21.jpg'),
('938', '107', '1', '7', 'Pt has appointment with you Monday.  Needs implant #19'),
('939', '108', '1', '2.3', 'Craig'),
('940', '108', '1', '2.6', 'Boklage'),
('941', '108', '1', '3', 'cboklage@gmail.com'),
('942', '108', '1', '4', '(512)689-9926'),
('943', '108', '1', '24', 'Patient would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('945', '108', '1', '6', 'Localized Osteotomy'),
('946', '108', '1', '10.9', '9'),
('947', '108', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/09/Boklage,Craig_Pano1.JPG'),
('948', '108', '1', '7', 'Pt. had trauma to tooth #9 and #10.  Tooth #9 is ankylosed and possibly #10.  Dr. Dykes is wanting to place brackets and then have a localized osteotomy done on tooth #9 and possibly on #10 if it is a'),
('949', '109', '1', '2.3', 'Jai'),
('950', '109', '1', '2.6', 'Patel'),
('951', '109', '1', '3', 'patelj09@email.campbell.edu'),
('952', '109', '1', '24', 'Patient would like you to email to schedule'),
('954', '109', '1', '11.15', '19'),
('955', '109', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/10/26_PA 19-21.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('956', '109', '1', '7', 'Please evaluate for implant #19'),
('957', '110', '1', '2.3', 'Suzanne '),
('958', '110', '1', '2.6', 'Mudd'),
('959', '110', '1', '24', '--- Select One ---'),
('961', '110', '1', '7', 'Please extract remaining third molars, I only took bitewings and the 3rds aren\'t seen on the xrays so please take a PANO'),
('962', '111', '1', '2.3', 'Logan'),
('963', '111', '1', '2.6', 'Haller'),
('964', '111', '1', '20.1', 'Patient is a minor'),
('965', '111', '1', '21.3', 'Julie'),
('966', '111', '1', '21.6', 'Haller');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('967', '111', '1', '3', 'julie.haller4@gmail.com'),
('968', '111', '1', '4', '(703)231-2535'),
('969', '111', '1', '25', 'Guardian would like you to call to schedule'),
('971', '111', '1', '10.5', '5'),
('972', '111', '1', '10.13', '12'),
('973', '111', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/10/Haller,Logan_Pano1.JPG'),
('974', '111', '1', '7', 'Extract teeth numbers 5 and 12-Naomi'),
('975', '112', '1', '2.3', 'sheryl '),
('976', '112', '1', '2.6', 'Youngs'),
('977', '112', '1', '3', 'julie@youraustintxdentist.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('978', '112', '1', '24', '--- Select One ---'),
('1147', '127', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/01/LovettPANO.JPG'),
('980', '112', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/11/radio_exam.jpg'),
('981', '112', '1', '7', 'Here is sheryl\'s FMX, Please evaluate for implants in the areas of 30 and 14 to bring pt back to 1st molar occlussion.  I was thinking to extract 2, 14, 18, and root tip 30.  I will Crown #3 and 19 af'),
('982', '113', '1', '2.3', 'Guy '),
('983', '113', '1', '2.6', 'Hogle'),
('984', '113', '1', '24', 'Patient does not want to be contacted'),
('1146', '127', '1', '11.17', '17'),
('986', '113', '1', '11.15', '19'),
('987', '113', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/11/26_.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('988', '113', '1', '7', '#19 has been deemed non-restorable, needs to be EXT and implant. '),
('989', '114', '1', '2.3', 'Shayna '),
('990', '114', '1', '2.6', 'O\'Brien'),
('991', '114', '1', '24', '--- Select One ---'),
('1145', '127', '1', '11.1', '32'),
('993', '114', '1', '10.1', '1'),
('994', '114', '1', '10.17', '16'),
('995', '114', '1', '11.1', '32'),
('996', '114', '1', '11.17', '17'),
('997', '114', '1', '7', 'Please evaluate and extract all 3rds');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('998', '115', '1', '2.3', 'Bobbie '),
('999', '115', '1', '2.6', 'Lee'),
('1000', '115', '1', '24', '--- Select One ---'),
('1002', '115', '1', '11.3', '30'),
('1003', '115', '1', '11.4', '29'),
('1004', '115', '1', '11.15', '19'),
('1005', '115', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/11/radio_exam1.jpg'),
('1006', '115', '1', '7', 'Please consult with patient about implants in 19,29,30 and possible crown lengthening and gingival recontouring of the maxillary front 6, I will send Dr. Alford tx options I went over with patient '),
('1007', '116', '1', '2.3', 'Kevin '),
('1008', '116', '1', '2.6', 'Milburn');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1009', '116', '1', '24', '--- Select One ---'),
('1144', '127', '1', '26.3', 'Third Molars'),
('1011', '116', '1', '6', 'Please evaluate lesion and swelling associated with #18'),
('1012', '116', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/11/26_1.jpg'),
('1013', '116', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/11/radio_exam2.jpg'),
('1014', '117', '1', '2.3', 'Jodi Marie'),
('1015', '117', '1', '2.6', 'Smith'),
('1016', '117', '1', '24', '--- Select One ---'),
('1018', '117', '1', '10.1', '1'),
('1019', '117', '1', '10.17', '16');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1020', '117', '1', '11.17', '17'),
('1021', '117', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/12/radio_exam.jpg'),
('1022', '117', '1', '7', 'Pt has pericornitis involving #17, please evaluate and ext all remaining 3rds.  Pt very nervous and anxious about dentists.  '),
('1023', '118', '1', '2.3', 'Anne'),
('1024', '118', '1', '2.6', 'Reckhart'),
('1025', '118', '1', '20.1', 'Patient is a minor'),
('1026', '118', '1', '21.3', 'Darcy'),
('1027', '118', '1', '21.6', 'Reckhart'),
('1028', '118', '1', '3', 'dareckart@aol.com'),
('1029', '118', '1', '4', '(512)557-9873');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1030', '118', '1', '25', 'Guardian would like you to call to schedule'),
('1032', '118', '1', '10.5', '5'),
('1033', '118', '1', '10.13', '12'),
('1034', '118', '1', '11.5', '28'),
('1035', '118', '1', '11.13', '21'),
('1036', '118', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/12/Reckhart,Anne_Pano3.JPG'),
('1037', '118', '1', '7', 'Please evaluate for the extractions of teeth #\'s 5, 12, 21 and 28 and evaluate for TMJ.'),
('1038', '119', '1', '2.3', 'Avery'),
('1039', '119', '1', '2.6', 'Liardon'),
('1040', '119', '1', '20.1', 'Patient is a minor');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1041', '119', '1', '21.3', 'Amy '),
('1042', '119', '1', '21.6', 'Liardon'),
('1043', '119', '1', '3', 'aliardon@att.net'),
('1044', '119', '1', '4', '(512)914-4204'),
('1045', '119', '1', '25', 'Guardian would like you to call to schedule'),
('1143', '127', '1', '24', 'Patient does not want to be contacted'),
('1047', '119', '1', '11.4', '29'),
('1048', '119', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/12/Li,Eric_Pano1.JPG'),
('1049', '119', '1', '7', 'Please evaluate Avery Liardon for the extraction of immaturely formed tooth # 29. We are planning to maintain the lower 2nd primary molars for as long as possible.\r\n'),
('1050', '120', '1', '2.3', 'Nick');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1051', '120', '1', '2.6', 'Rosas'),
('1052', '120', '1', '20.1', 'Patient is a minor'),
('1053', '120', '1', '21.3', 'Jenny'),
('1054', '120', '1', '21.6', 'Rosas'),
('1055', '120', '1', '3', 'rosasjen@earthlink.net'),
('1056', '120', '1', '4', '(512)568-0483'),
('1057', '120', '1', '25', 'Guardian would like you to call to schedule'),
('1059', '120', '1', '10.4', '4'),
('1060', '120', '1', '10.14', '13'),
('1061', '120', '1', '11.4', '29');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1062', '120', '1', '11.14', '20'),
('1063', '120', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/12/Rosas,Nick_Pano2.JPG'),
('1064', '120', '1', '7', 'As a part of his orthodontic treatment plan, please evaluate Nick Rosas for the extraction of teeth #s 4, 13.\r\n20. and 29.\r\n('),
('1065', '121', '1', '2.3', 'Casey '),
('1066', '121', '1', '2.6', 'Amsler'),
('1067', '121', '1', '4', '(512)215-9289'),
('1068', '121', '1', '24', 'Patient would like you to call to schedule'),
('1142', '127', '1', '4', '(512)484-8257'),
('1070', '121', '1', '10.1', '1'),
('1071', '121', '1', '10.17', '16');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1072', '121', '1', '11.1', '32'),
('1073', '121', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/12/Amsler_Casey_Pano.JPG'),
('1074', '121', '1', '7', 'His dad, John, has been scheduling his appointments with us. John\'s number is 585-8015.'),
('1075', '122', '1', '2.3', 'Yolanda'),
('1076', '122', '1', '2.6', 'Velasquez'),
('1077', '122', '1', '4', '(512)263-5149'),
('1078', '122', '1', '24', 'Patient would like you to call to schedule'),
('1080', '122', '1', '11.2', '31'),
('1081', '122', '1', '11.3', '30'),
('1082', '122', '1', '11.7', '26');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1083', '122', '1', '11.8', '25'),
('1084', '122', '1', '11.9', '24'),
('1085', '122', '1', '11.11', '23'),
('1086', '122', '1', '11.15', '19'),
('1087', '122', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2011/12/Velasquez12-29-11.JPG'),
('1088', '122', '1', '7', 'fabricating a flipper to be delivered at the extraction appointment  needs to be at least 3 weeks from today'),
('1089', '123', '2', '3', 'info@singortho.com'),
('1090', '123', '2', '11', 'Sing Orthodontics'),
('1096', '124', '1', '2.3', 'test'),
('1092', '123', '2', '1.3', 'Yashu');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1093', '123', '2', '1.6', 'Sing'),
('1094', '123', '2', '4', '(512)402-1121'),
('1095', '123', '2', '5', 'http://www.singortho.com'),
('1097', '124', '1', '2.6', 'test'),
('1098', '124', '1', '20.1', 'Patient is a minor'),
('1099', '124', '1', '21.3', 'mom'),
('1100', '124', '1', '21.6', 'dad'),
('1101', '124', '1', '3', 'drjalfordoms@yahoo.com'),
('1102', '124', '1', '4', '(214)450-3800'),
('1103', '124', '1', '25', 'Guardian would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1141', '127', '1', '3', 'lovett.dave@gmail.com'),
('1105', '124', '1', '10.1', '1'),
('1106', '124', '1', '10.12', '11'),
('1107', '124', '1', '10.17', '16'),
('1108', '124', '1', '11.1', '32'),
('1109', '124', '1', '11.17', '17'),
('1110', '124', '1', '7', 'Expose and bond + extract 3rds'),
('1111', '125', '1', '2.3', 'Test'),
('1112', '125', '1', '2.6', 'Test'),
('1113', '125', '1', '20.1', 'Patient is a minor');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1114', '125', '1', '21.3', 'Mom'),
('1115', '125', '1', '21.6', 'Dad'),
('1116', '125', '1', '3', 'drjalfordoms@yahoo.com'),
('1117', '125', '1', '4', '(214)450-3800'),
('1118', '125', '1', '25', 'Guardian would like you to email to schedule'),
('1140', '127', '1', '2.6', 'Lovett'),
('1120', '125', '1', '10.1', '1'),
('1121', '125', '1', '10.12', '11'),
('1122', '125', '1', '10.17', '16'),
('1123', '125', '1', '11.17', '17');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1124', '126', '1', '2.3', 'Test'),
('1125', '126', '1', '2.6', 'Test'),
('1126', '126', '1', '20.1', 'Patient is a minor'),
('1127', '126', '1', '21.3', 'Mom'),
('1128', '126', '1', '21.6', 'Dad'),
('1129', '126', '1', '3', 'drjalfordoms@yahoo.com'),
('1130', '126', '1', '4', '(214)450-3800'),
('1131', '126', '1', '25', 'Guardian does not want to be contacted'),
('1139', '127', '1', '2.3', 'Dave'),
('1133', '126', '1', '10.1', '1');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1134', '126', '1', '10.12', '11'),
('1135', '126', '1', '10.17', '16'),
('1136', '126', '1', '11.1', '32'),
('1137', '126', '1', '11.17', '17'),
('1138', '126', '1', '7', 'expose bond 11 + ext 3rds'),
('1195', '132', '1', '2.3', 'Tina'),
('1196', '132', '1', '2.6', 'Lulo'),
('1197', '132', '1', '20.1', 'Patient is a minor'),
('1198', '132', '1', '21.3', 'Shannon'),
('1199', '132', '1', '21.6', 'Lulo');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1200', '132', '1', '3', 'slulo@hotmail.com'),
('1201', '132', '1', '4', '(954)439-8934'),
('1202', '132', '1', '25', 'Guardian would like you to call to schedule'),
('1203', '132', '1', '26.2', 'Expose & Bond'),
('1204', '132', '1', '10.6', '6'),
('1205', '132', '1', '10.12', '11'),
('1206', '132', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/02/Lulo,Christina_Pano1.JPG'),
('1207', '132', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/02/Lulo,Christina_Ceph1.JPG'),
('1208', '132', '1', '7', 'Please expose and bond a chain to teeth #s 6 and 11.'),
('1209', '133', '1', '2.3', 'test');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1210', '133', '1', '2.6', 'test'),
('1211', '133', '1', '3', 'skinnyoms@yahoo.com'),
('1212', '133', '1', '4', '(214)450-3800'),
('1213', '133', '1', '24', 'Patient would like you to call to schedule'),
('1214', '133', '1', '26.3', 'Third Molars'),
('1215', '133', '1', '10.1', '1'),
('1216', '133', '1', '10.17', '16'),
('1217', '133', '1', '11.1', '32'),
('1218', '133', '1', '11.17', '17'),
('1219', '134', '1', '2.3', 'Jack');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1220', '134', '1', '2.6', 'Cunningham'),
('1221', '134', '1', '3', 'jnkkcunn@yahoo.com'),
('1222', '134', '1', '4', '(512)470-4521'),
('1223', '134', '1', '24', 'Patient would like you to call to schedule'),
('1224', '134', '1', '26.9', 'Other'),
('1225', '134', '1', '6', 'Consult with Dr. Alford '),
('1226', '134', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/02/radio_exam.jpg'),
('1227', '134', '1', '7', 'Hey Jeff, this is the guy that I spoke with you about the other day, about restoring the lower to rebuild occlussion.  He is the gentleman I have in the Snap on Smile.  We discussed you consulting wit'),
('1228', '135', '1', '2.3', 'Rachel'),
('1229', '135', '1', '2.6', 'Peters');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1230', '135', '1', '24', 'Patient does not want to be contacted'),
('1231', '135', '1', '26.1', 'Extraction'),
('1232', '135', '1', '10.1', '1'),
('1233', '135', '1', '10.17', '16'),
('1234', '135', '1', '11.1', '32'),
('1235', '135', '1', '11.17', '17'),
('1236', '135', '1', '7', 'Only have Bitewings, pt will need Pano\r\nPlease evaluate and ext 3rds, pt will call to schedule.  Pt very phobic of needles.'),
('1237', '136', '1', '2.3', 'Steve'),
('1238', '136', '1', '2.6', 'McKinley'),
('1239', '136', '1', '24', '--- Select One ---');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1240', '136', '1', '26.1', 'Extraction'),
('1241', '136', '1', '10.6', '6'),
('1242', '136', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/02/McKinley6.JPG'),
('1243', '137', '1', '2.3', 'Catherine'),
('1244', '137', '1', '2.6', 'Murphey'),
('1245', '137', '1', '24', 'Patient does not want to be contacted'),
('1246', '137', '1', '26.1', 'Extraction'),
('1247', '137', '1', '10.1', '1'),
('1248', '137', '1', '10.17', '16'),
('1249', '137', '1', '11.1', '32');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1250', '137', '1', '11.17', '17'),
('1251', '137', '1', '7', 'Please evualate and extract all 3rds, Pt is the sister of my assistant :-)\r\nPlease take a Pano, I only took BW\'s '),
('1252', '138', '1', '2.3', 'Shelia'),
('1253', '138', '1', '2.6', 'Martinez'),
('1254', '138', '1', '24', '--- Select One ---'),
('1255', '138', '1', '26.4', 'Implant'),
('1256', '138', '1', '10.3', '3'),
('1257', '138', '1', '10.12', '11'),
('1258', '138', '1', '10.13', '12'),
('1259', '138', '1', '11.3', '30');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1260', '138', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/02/shelia.jpg'),
('1261', '138', '1', '7', 'I spoke with dr. alford and he said he could do a no charge consult for implants on this patient.  I strongly stressed to patient the importance of implants, especially on the upper left.  I will have'),
('1262', '139', '1', '2.3', 'Christopher'),
('1263', '139', '1', '2.6', 'Heldebrandt'),
('1264', '139', '1', '20.1', 'Patient is a minor'),
('1265', '139', '1', '21.3', 'Tomoe'),
('1266', '139', '1', '21.6', 'Heldebrandt'),
('1267', '139', '1', '3', 'tomoemc@yahoo.co.jp'),
('1268', '139', '1', '4', '(512)284-3203'),
('1269', '139', '1', '25', 'Guardian would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1270', '139', '1', '26.1', 'Extraction'),
('1271', '139', '1', '10.1', '1'),
('1272', '139', '1', '10.5', '5'),
('1273', '139', '1', '10.13', '12'),
('1274', '139', '1', '10.17', '16'),
('1275', '139', '1', '11.1', '32'),
('1276', '139', '1', '11.5', '28'),
('1277', '139', '1', '11.13', '21'),
('1278', '139', '1', '11.17', '17'),
('1279', '139', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/02/Heldebrandt,Christopher_Pano02292012.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1280', '139', '1', '7', 'Please eval and treatment apporpriately'),
('1281', '140', '1', '2.3', 'Gracie'),
('1282', '140', '1', '2.6', 'Jaimeson'),
('1283', '140', '1', '20.1', 'Patient is a minor'),
('1284', '140', '1', '21.3', 'MJ'),
('1285', '140', '1', '21.6', 'Hurt'),
('1286', '140', '1', '3', 'mjjamieson2003@yahoo.com'),
('1287', '140', '1', '4', '(404)933-9012'),
('1288', '140', '1', '25', 'Guardian would like you to call to schedule'),
('1289', '140', '1', '26.2', 'Expose & Bond');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1290', '140', '1', '26.9', 'Other'),
('1291', '140', '1', '6', 'Expose and Bond with chain'),
('1292', '140', '1', '10.6', '6'),
('1293', '140', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/03/Jamieson,Gracie_Pano.jpg'),
('1294', '140', '1', '7', 'Please eval and treat for expose and bond #6.\r\n\r\nJeff-It is not erupted enough for me to do any significant movement.  Thank you, JD'),
('1295', '141', '1', '2.3', 'Sarah'),
('1296', '141', '1', '2.6', 'Callia'),
('1297', '141', '1', '20.1', 'Patient is a minor'),
('1298', '141', '1', '21.3', 'Ramona'),
('1299', '141', '1', '21.6', 'Callia');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1300', '141', '1', '3', 'cajuncowgirl@gmail.com'),
('1301', '141', '1', '4', '(504)442-2544'),
('1302', '141', '1', '25', 'Guardian would like you to call to schedule'),
('1303', '141', '1', '26.1', 'Extraction'),
('1304', '141', '1', '8.1', 'A'),
('1305', '141', '1', '8.11', 'J'),
('1306', '141', '1', '9.11', 'K'),
('1307', '141', '1', '10.1', '1'),
('1308', '141', '1', '10.5', '5'),
('1309', '141', '1', '10.13', '12');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1310', '141', '1', '10.17', '16'),
('1311', '141', '1', '11.1', '32'),
('1312', '141', '1', '11.17', '17'),
('1313', '141', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/03/Callia,Sarah_pano.jpg'),
('1314', '142', '1', '2.3', 'Matthew'),
('1315', '142', '1', '2.6', 'Callia'),
('1316', '142', '1', '20.1', 'Patient is a minor'),
('1317', '142', '1', '21.3', 'Ramona'),
('1318', '142', '1', '21.6', 'Callia'),
('1319', '142', '1', '3', 'cajuncowgirl@gmail.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1320', '142', '1', '4', '(504)442-2544'),
('1321', '142', '1', '25', 'Guardian would like you to call to schedule'),
('1322', '142', '1', '26.1', 'Extraction'),
('1323', '142', '1', '8.8', 'H'),
('1324', '142', '1', '10.1', '1'),
('1325', '142', '1', '10.17', '16'),
('1326', '142', '1', '11.1', '32'),
('1327', '142', '1', '11.17', '17'),
('1328', '142', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/03/Callia,Matt_pano.jpg'),
('1329', '143', '1', '2.3', 'Gabe');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1330', '143', '1', '2.6', 'Villenueva'),
('1331', '143', '1', '20.1', 'Patient is a minor'),
('1332', '143', '1', '21.3', 'Rebecca'),
('1333', '143', '1', '21.6', 'Villenueva'),
('1334', '143', '1', '3', 'rebecca.villanueva@yahoo.com'),
('1335', '143', '1', '4', '(512)577-1351'),
('1336', '143', '1', '25', 'Guardian would like you to call to schedule'),
('1337', '143', '1', '26.1', 'Extraction'),
('1338', '143', '1', '10.5', '5'),
('1339', '143', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/03/G.Villanueva_pano.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1340', '144', '1', '2.3', 'Isaac'),
('1341', '144', '1', '2.6', 'Franz'),
('1342', '144', '1', '4', '(512)922-1844'),
('1343', '144', '1', '24', 'Patient would like you to call to schedule'),
('1344', '144', '1', '26.1', 'Extraction'),
('1345', '144', '1', '10.17', '16'),
('1346', '144', '1', '11.1', '32'),
('1347', '144', '1', '11.17', '17'),
('1348', '144', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/04/Franz_Isaac_Pano.JPG'),
('1349', '144', '1', '7', 'Isaac called the office this morning and was having some pain in the upper left area. He said it was his wisdom tooth and we have them on his treatment plan for extraction. The attached pano was taken');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1350', '145', '1', '2.3', 'Fred'),
('1351', '145', '1', '2.6', 'Walker'),
('1352', '145', '1', '3', 'fred@fredwalkerlaw.com'),
('1353', '145', '1', '4', '(512)330-9977'),
('1354', '145', '1', '24', '--- Select One ---'),
('1355', '145', '1', '26.2', 'Expose & Bond'),
('1356', '145', '1', '26.9', 'Other'),
('1357', '145', '1', '6', 'Dr Gosney will call'),
('1358', '145', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/04/Walker.JPG'),
('1359', '146', '1', '2.3', 'test');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1360', '146', '1', '2.6', 'test'),
('1361', '146', '1', '20.1', 'Patient is a minor'),
('1362', '146', '1', '21.3', 'dad'),
('1363', '146', '1', '21.6', 'mom'),
('1364', '146', '1', '4', '(214)450-3800'),
('1365', '146', '1', '25', 'Guardian would like you to call to schedule'),
('1366', '146', '1', '26.3', 'Third Molars'),
('1367', '146', '1', '10.1', '1'),
('1368', '146', '1', '10.17', '16'),
('1369', '146', '1', '11.1', '32');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1370', '146', '1', '11.17', '17'),
('1371', '147', '1', '2.3', 'test'),
('1372', '147', '1', '2.6', 'test'),
('1373', '147', '1', '3', 'skinnyoms@yahoo.com'),
('1374', '147', '1', '24', 'Patient would like you to call to schedule'),
('1375', '147', '1', '26.1', 'Extraction'),
('1376', '147', '1', '10.1', '1'),
('1377', '148', '1', '2.3', 'Wyatt'),
('1378', '148', '1', '2.6', 'Archibald'),
('1379', '148', '1', '20.1', 'Patient is a minor');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1380', '148', '1', '21.3', 'Karen'),
('1381', '148', '1', '21.6', 'Archibald'),
('1382', '148', '1', '3', 'karchibald@austin.rr.com'),
('1383', '148', '1', '4', '(713)201-0256'),
('1384', '148', '1', '25', '--- Select One ---'),
('1385', '148', '1', '26.1', 'Extraction'),
('1386', '148', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Panoramic X-Ray_Archibald.jpg'),
('1387', '148', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Archibald,Wyatt_ExtReferral.pdf'),
('1388', '148', '1', '7', 'Please call me and let me know if you were able to download the x-ray  and request. He prefers to sign a request so we can just attach it. Hope this works for you. \r\n\r\nHappy Monday!\r\nShelli'),
('1389', '149', '1', '2.3', 'Isabella \"Bella\"');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1390', '149', '1', '2.6', 'Demco'),
('1391', '149', '1', '20.1', 'Patient is a minor'),
('1392', '149', '1', '21.3', 'Denise'),
('1393', '149', '1', '21.6', 'Demco'),
('1394', '149', '1', '3', 'demco6@sbcglobal.com'),
('1395', '149', '1', '4', '(512)934-7456'),
('1396', '149', '1', '25', 'Guardian would like you to call to schedule'),
('1397', '149', '1', '26.1', 'Extraction'),
('1398', '149', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Panoramic X-Ray_Demco.jpg'),
('1399', '149', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Demco,Isabella_ExtReferral.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1400', '149', '1', '7', 'Thanks guys!'),
('1401', '150', '1', '2.3', 'Jett '),
('1402', '150', '1', '2.6', 'Morgan'),
('1403', '150', '1', '20.1', 'Patient is a minor'),
('1404', '150', '1', '21.3', 'Dawn'),
('1405', '150', '1', '21.6', 'Ginn'),
('1406', '150', '1', '3', 'dawnmorgan2008@yahoo.com'),
('1407', '150', '1', '4', '(337)578-8833'),
('1408', '150', '1', '25', 'Guardian would like you to call to schedule'),
('1409', '150', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1410', '150', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Panoramic X-Ray_Morgan.jpg'),
('1411', '150', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Morgan,Jett_ExtReferral.pdf'),
('1412', '150', '1', '7', 'Here is Jett\'s information, sorry I missed your call....\r\n\r\nShelli'),
('1413', '151', '1', '2.3', 'Aubrey'),
('1414', '151', '1', '2.6', 'Van Niekerk'),
('1415', '151', '1', '3', 'claudette@truckmark.com'),
('1416', '151', '1', '4', '(512)284-7131'),
('1417', '151', '1', '24', '--- Select One ---'),
('1418', '151', '1', '26.1', 'Extraction'),
('1419', '151', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Panoramic X-Ray_vanNierkerk.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1420', '151', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/VanNiekerk,Aubrey_ExtReferral.pdf'),
('1421', '151', '1', '7', 'Thanks!\r\n\r\nShelli'),
('1422', '152', '1', '2.3', 'Carmen'),
('1423', '152', '1', '2.6', 'Shuler'),
('1424', '152', '1', '20.1', 'Patient is a minor'),
('1425', '152', '1', '21.3', 'Annette'),
('1426', '152', '1', '21.6', 'Shuler'),
('1427', '152', '1', '3', 'nettyshuler@gmail.com'),
('1428', '152', '1', '4', '(512)744-7876'),
('1429', '152', '1', '25', 'Guardian would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1430', '152', '1', '26.1', 'Extraction'),
('1431', '152', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Shuler,Carmen_ExtReferral.pdf'),
('1432', '152', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Panoramic X-Ray_Shuler.jpg'),
('1433', '152', '1', '7', 'Thanks!\r\n\r\nShelli'),
('1434', '153', '1', '2.3', 'Amanda'),
('1435', '153', '1', '2.6', 'Wolf'),
('1436', '153', '1', '20.1', 'Patient is a minor'),
('1437', '153', '1', '21.3', 'Dawn'),
('1438', '153', '1', '21.6', 'Wolf'),
('1439', '153', '1', '3', 'john.dawnwolf@gmail.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1440', '153', '1', '4', '(512)266-4767'),
('1441', '153', '1', '25', 'Guardian would like you to call to schedule'),
('1442', '153', '1', '26.2', 'Expose & Bond'),
('1443', '153', '1', '26.3', 'Third Molars'),
('1444', '153', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Panoramic X-Ray_Wolf.jpg'),
('1445', '153', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Wolf,Amanda_ExtReferral2.pdf'),
('1446', '153', '1', '17', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Wolf,Amanda_EBCReferral.pdf'),
('1447', '153', '1', '7', 'Thanks!\r\n\r\nShelli'),
('1448', '154', '1', '2.3', 'Boley'),
('1449', '154', '1', '2.6', 'Alex');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1450', '154', '1', '20.1', 'Patient is a minor'),
('1451', '154', '1', '21.3', 'Julie'),
('1452', '154', '1', '21.6', 'Boley'),
('1453', '154', '1', '3', 'boley95@gmail.com'),
('1454', '154', '1', '4', '(309)241-4660'),
('1455', '154', '1', '25', 'Guardian would like you to call to schedule'),
('1456', '154', '1', '26.3', 'Third Molars'),
('1457', '154', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Boley,Alex_ExtReferral.pdf'),
('1458', '154', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Panoramic X-Ray-Boley.jpg'),
('1459', '154', '1', '7', 'Thanks!\r\nShelli');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1460', '155', '1', '2.3', 'Fezaan'),
('1461', '155', '1', '2.6', 'Jameel'),
('1462', '155', '1', '24', '--- Select One ---'),
('1463', '155', '1', '26.9', 'Other'),
('1464', '155', '1', '6', 'Consult'),
('1465', '155', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Lateral Ceph X-Ray_Jameel.jpg'),
('1466', '155', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Panoramic X-Ray_Jameel.jpg'),
('1467', '156', '1', '2.3', 'Michael'),
('1468', '156', '1', '2.6', 'Brown'),
('1469', '156', '1', '24', '--- Select One ---');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1470', '156', '1', '26.1', 'Extraction'),
('1471', '156', '1', '11.4', '29'),
('1472', '156', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/BROWNPANO5-26-10.JPG'),
('1473', '156', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/BROWNBW5-14-12.JPG'),
('1474', '157', '1', '2.3', 'Gian'),
('1475', '157', '1', '2.6', 'Mena'),
('1476', '157', '1', '4', '(512)263-7717'),
('1477', '157', '1', '24', '--- Select One ---'),
('1478', '157', '1', '26.3', 'Third Molars'),
('1479', '157', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/MENAPANO5-22-12.JPG');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1480', '158', '1', '2.3', 'Audrey'),
('1481', '158', '1', '2.6', 'Dorin'),
('1482', '158', '1', '20.1', 'Patient is a minor'),
('1483', '158', '1', '21.3', 'Colleen'),
('1484', '158', '1', '21.6', 'Dorin'),
('1485', '158', '1', '3', 'colleen.dorin@navy.mail'),
('1486', '158', '1', '4', '(619)818-4436'),
('1487', '158', '1', '25', 'Guardian would like you to call to schedule'),
('1488', '158', '1', '26.1', 'Extraction'),
('1489', '158', '1', '26.3', 'Third Molars');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1490', '158', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Dorin,Audrey_ExtReferral.pdf'),
('1491', '158', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Panoramic X-Ray_Dorin, Audrey.jpg'),
('1492', '158', '1', '7', 'Refer to attachment for orders...Correnna'),
('1493', '159', '1', '2.3', 'Eric'),
('1494', '159', '1', '2.6', 'Howell'),
('1495', '159', '1', '20.1', 'Patient is a minor'),
('1496', '159', '1', '21.3', 'Nancy'),
('1497', '159', '1', '21.6', 'Howell'),
('1498', '159', '1', '3', 'howellgang@gmail.com'),
('1499', '159', '1', '4', '(512)769-6087');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1500', '159', '1', '25', 'Guardian would like you to call to schedule'),
('1501', '159', '1', '26.1', 'Extraction'),
('1502', '159', '1', '26.3', 'Third Molars'),
('1503', '159', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Howell,Eric_ExtReferral.pdf'),
('1504', '159', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/05/Panoramic X-Ray_Howell,Eric.jpg'),
('1505', '159', '1', '7', 'Refer to attachment for extraction orders...Correnna'),
('1506', '160', '1', '2.3', 'test'),
('1507', '160', '1', '2.6', 'test'),
('1508', '160', '1', '3', 'drjalfordoms@yahoo.com'),
('1509', '160', '1', '24', 'Patient would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1510', '160', '1', '26.1', 'Extraction'),
('1511', '160', '1', '26.3', 'Third Molars'),
('1512', '160', '1', '26.5', 'All-On-4™'),
('1513', '161', '1', '2.3', 'Jaqueline'),
('1514', '161', '1', '2.6', 'Garcia'),
('1515', '161', '1', '20.1', 'Patient is a minor'),
('1516', '161', '1', '21.3', 'Traci'),
('1517', '161', '1', '21.6', 'Smith'),
('1518', '161', '1', '3', 'tlsmith@austin.rr.com'),
('1519', '161', '1', '4', '(512)413-5076');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1520', '161', '1', '25', 'Guardian would like you to call to schedule'),
('1521', '161', '1', '26.1', 'Extraction'),
('1522', '161', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Garcia,Jacqueline_ExtReferral.pdf'),
('1523', '161', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray_Garcia.jpg'),
('1524', '161', '1', '7', 'Thanks!\r\nShelli'),
('1525', '162', '1', '2.3', 'Samantha'),
('1526', '162', '1', '2.6', 'Bourgoyne'),
('1527', '162', '1', '20.1', 'Patient is a minor'),
('1528', '162', '1', '21.3', 'Denise'),
('1529', '162', '1', '21.6', 'Bourgoyne');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1530', '162', '1', '3', 'denise@austin.rr.com'),
('1531', '162', '1', '4', '(512)261-6433'),
('1532', '162', '1', '25', '--- Select One ---'),
('1533', '162', '1', '26.1', 'Extraction'),
('1534', '162', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Bourgoyne,Samantha_ExtReferral.pdf'),
('1535', '162', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Bourgoyne,Samatha_pano.jpg'),
('1536', '162', '1', '7', 'Thank you! Shelli'),
('1537', '163', '1', '2.3', 'Samantha'),
('1538', '163', '1', '2.6', 'Bourgoyne'),
('1539', '163', '1', '20.1', 'Patient is a minor');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1540', '163', '1', '21.3', 'Denise'),
('1541', '163', '1', '21.6', 'Bourgoyne'),
('1542', '163', '1', '3', 'deniseb@austin.rr.com'),
('1543', '163', '1', '25', '--- Select One ---'),
('1544', '163', '1', '26.1', 'Extraction'),
('1545', '163', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Bourgoyne,Samantha_ExtReferral1.pdf'),
('1546', '163', '1', '7', 'Here is the second request for tooth numbers #c and #h. '),
('1547', '164', '1', '2.3', 'Anne '),
('1548', '164', '1', '2.6', 'Reckart'),
('1549', '164', '1', '20.1', 'Patient is a minor');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1550', '164', '1', '21.3', 'Darcy'),
('1551', '164', '1', '21.6', 'Reckart'),
('1552', '164', '1', '3', 'dareckart@aol.com'),
('1553', '164', '1', '4', '(512)557-9873'),
('1554', '164', '1', '25', 'Guardian would like you to call to schedule'),
('1555', '164', '1', '26.1', 'Extraction'),
('1556', '164', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Reckart,Anne_ExtReferral.pdf'),
('1557', '164', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray_Anne.jpg'),
('1558', '164', '1', '7', 'We are referring sisters for extraction of biscuspids. One for all 4\'s ( and d\'s) and the other sister for all 5\'s ( and eval for ext of 8\'s). Sorry typing in ortho numbers. :) Nice Mom, cool girls! \r'),
('1559', '165', '1', '2.3', 'Caroline');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1560', '165', '1', '2.6', 'Reckart'),
('1561', '165', '1', '20.1', 'Patient is a minor'),
('1562', '165', '1', '21.3', 'Darcy'),
('1563', '165', '1', '21.6', 'Reckart'),
('1564', '165', '1', '3', 'dareckart@aol.com'),
('1565', '165', '1', '4', '(512)557-9873'),
('1566', '165', '1', '25', '--- Select One ---'),
('1567', '165', '1', '26.1', 'Extraction'),
('1568', '165', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Reckart,Caroline_ExtReferral.pdf'),
('1569', '165', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray_Caroline.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1570', '165', '1', '7', 'Thanks guys!\r\n\r\nShelli'),
('1571', '166', '1', '2.3', 'Caroline'),
('1572', '166', '1', '2.6', 'Reckart'),
('1573', '166', '1', '20.1', 'Patient is a minor'),
('1574', '166', '1', '21.3', 'Darcy'),
('1575', '166', '1', '25', '--- Select One ---'),
('1576', '166', '1', '26.1', 'Extraction'),
('1577', '166', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Reckart,Caroline_ExtReferral1.pdf'),
('1578', '166', '1', '7', 'Here is an updated request that includes the primary teeth. '),
('1579', '167', '1', '2.3', 'Rylee');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1580', '167', '1', '2.6', 'Stachour'),
('1581', '167', '1', '20.1', 'Patient is a minor'),
('1582', '167', '1', '21.3', 'Charlotte'),
('1583', '167', '1', '21.6', 'Stachour'),
('1584', '167', '1', '3', 'rcstac@aol.com'),
('1585', '167', '1', '4', '(512)243-5568'),
('1586', '167', '1', '25', '--- Select One ---'),
('1587', '167', '1', '26.1', 'Extraction'),
('1588', '167', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Stachour,Rylee_ExtReferral.pdf'),
('1589', '167', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray_Rylee.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1590', '167', '1', '7', 'Here is a request for Rylee, Jantzen\'s sister. I left Mom a message that we sent request. \r\n\r\nShelli'),
('1591', '168', '1', '2.3', 'Robyn'),
('1592', '168', '1', '2.6', 'Lippel'),
('1593', '168', '1', '20.1', 'Patient is a minor'),
('1594', '168', '1', '21.3', 'Erica'),
('1595', '168', '1', '21.6', 'Johnsmiller'),
('1596', '168', '1', '3', 'edrgnldy@yahoo.com'),
('1597', '168', '1', '4', '(949)235-8848'),
('1598', '168', '1', '25', 'Guardian would like you to call to schedule'),
('1599', '168', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1600', '168', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray_Lippel.jpg'),
('1601', '168', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray_Lippel1.jpg'),
('1602', '168', '1', '17', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray_Lippel2.jpg'),
('1603', '168', '1', '7', 'Thanks! Accidentally attached two requests and not sure how to delete one. :) I am so smart  at times. \r\n\r\nShelli'),
('1604', '169', '1', '2.3', 'Taylor'),
('1605', '169', '1', '2.6', 'Kreps'),
('1606', '169', '1', '20.1', 'Patient is a minor'),
('1607', '169', '1', '21.3', 'Kim'),
('1608', '169', '1', '21.6', 'Kreps'),
('1609', '169', '1', '3', 'kim@vistasearchgroup.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1610', '169', '1', '4', '(512)961-9828'),
('1611', '169', '1', '25', 'Guardian would like you to call to schedule'),
('1612', '169', '1', '26.1', 'Extraction'),
('1613', '169', '1', '26.3', 'Third Molars'),
('1614', '169', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray_Kreps,Taylor.jpg'),
('1615', '169', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Kreps,Taylor_ExtReferral.pdf'),
('1616', '169', '1', '7', 'Attached are the orders.\r\n\r\nThank you,\r\nCorrenna '),
('1617', '170', '1', '2.3', 'Dylan'),
('1618', '170', '1', '2.6', 'Doggett'),
('1619', '170', '1', '20.1', 'Patient is a minor');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1620', '170', '1', '21.3', 'Kristine'),
('1621', '170', '1', '21.6', 'Doggett'),
('1622', '170', '1', '3', 'kristine@doggettfamily.net'),
('1623', '170', '1', '4', '(512)261-8658'),
('1624', '170', '1', '25', 'Guardian would like you to call to schedule'),
('1625', '170', '1', '26.1', 'Extraction'),
('1626', '170', '1', '26.3', 'Third Molars'),
('1627', '170', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Doggott,Dylan_ExtReferral.pdf'),
('1628', '170', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray_Doggett,Dylan.jpg'),
('1629', '170', '1', '7', 'Attached are the orders. \r\n\r\nThanks,\r\nCorrenna ');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1630', '171', '1', '2.3', 'Madison'),
('1631', '171', '1', '2.6', 'Griswold'),
('1632', '171', '1', '20.1', 'Patient is a minor'),
('1633', '171', '1', '21.3', 'Susan'),
('1634', '171', '1', '21.6', 'Griswold'),
('1635', '171', '1', '3', 'griswoldsusan@yahoo.com'),
('1636', '171', '1', '4', '(303)506-8174'),
('1637', '171', '1', '25', 'Guardian would like you to call to schedule'),
('1638', '171', '1', '26.1', 'Extraction'),
('1639', '171', '1', '26.2', 'Expose & Bond');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1640', '171', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray_Griswold,Madison.jpg'),
('1641', '171', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Griswold,Madison_EBC,EXTReferral.pdf'),
('1642', '172', '1', '2.3', 'Zachary '),
('1643', '172', '1', '2.6', 'Russell'),
('1644', '172', '1', '20.1', 'Patient is a minor'),
('1645', '172', '1', '21.3', 'Kim'),
('1646', '172', '1', '21.6', 'Russell'),
('1647', '172', '1', '3', 'kimberlyrussellrn@gmail.com'),
('1648', '172', '1', '4', '(512)698-2532'),
('1649', '172', '1', '25', 'Guardian would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1650', '172', '1', '26.1', 'Extraction'),
('1651', '172', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Russell,Zachary_ExtRef.pdf'),
('1652', '172', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray_Zachary.jpg'),
('1653', '172', '1', '7', 'Thanks!\r\n\r\nShelli'),
('1654', '173', '1', '2.3', 'Nicholas '),
('1655', '173', '1', '2.6', 'Geist'),
('1656', '173', '1', '20.1', 'Patient is a minor'),
('1657', '173', '1', '21.3', 'Danna'),
('1658', '173', '1', '21.6', 'Geist'),
('1659', '173', '1', '3', 'geistd@sbcglobal.net');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1660', '173', '1', '4', '(512)332-6895'),
('1661', '173', '1', '25', 'Guardian would like you to call to schedule'),
('1662', '173', '1', '26.1', 'Extraction'),
('1663', '173', '1', '26.3', 'Third Molars'),
('1664', '173', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Geist,Nicholas_ExtReferral.pdf'),
('1665', '173', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray_Geist,Nicholas.jpg'),
('1666', '174', '1', '2.3', 'Eric'),
('1667', '174', '1', '2.6', 'Salazar'),
('1668', '174', '1', '4', '(512)999-0663'),
('1669', '174', '1', '24', 'Patient would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1670', '174', '1', '26.1', 'Extraction'),
('1671', '174', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Salazar,Eric_ExtReferral.pdf'),
('1672', '174', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray.jpg'),
('1673', '174', '1', '7', 'HIV+\r\n\r\nThanks!\r\nShelli'),
('1674', '175', '1', '2.3', 'Stephanie'),
('1675', '175', '1', '2.6', 'Demco'),
('1676', '175', '1', '20.1', 'Patient is a minor'),
('1677', '175', '1', '21.3', 'Denise'),
('1678', '175', '1', '21.6', 'Demco'),
('1679', '175', '1', '3', 'demco6@sbcglobal.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1680', '175', '1', '4', '(512)934-7456'),
('1681', '175', '1', '25', 'Guardian would like you to call to schedule'),
('1682', '175', '1', '26.1', 'Extraction'),
('1683', '175', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Demco,Stephanie_ExtReferral.pdf'),
('1684', '175', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/Panoramic X-Ray_Demco.jpg'),
('1685', '175', '1', '7', 'Thanks! \r\n\r\nShelli'),
('1686', '176', '1', '2.3', 'Chatterjee'),
('1687', '176', '1', '2.6', 'Usha'),
('1688', '176', '1', '24', '--- Select One ---'),
('1689', '176', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1690', '176', '1', '11.1', '32'),
('1691', '176', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/06/ChatterjeeU.JPG'),
('1692', '176', '1', '7', 'Patient\'s son will call tomorrow to schedule this appointment.  Patient is 84yo'),
('1693', '177', '1', '2.3', 'Donovan'),
('1694', '177', '1', '2.6', 'Amsler'),
('1695', '177', '1', '20.1', 'Patient is a minor'),
('1696', '177', '1', '21.3', 'John'),
('1697', '177', '1', '21.6', 'Amsler'),
('1698', '177', '1', '3', 'jamsler1@yahoo.com'),
('1699', '177', '1', '4', '(512)585-8015');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1700', '177', '1', '25', 'Guardian would like you to call to schedule'),
('1701', '177', '1', '26.1', 'Extraction'),
('1702', '177', '1', '26.2', 'Expose & Bond'),
('1703', '177', '1', '26.3', 'Third Molars'),
('1704', '177', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/Donovan A.jpg'),
('1705', '177', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/Amsler,Donovan_RXEBC,EXT.pdf'),
('1706', '177', '1', '7', 'Please look at extraction request. '),
('1707', '178', '1', '2.3', 'Donovan'),
('1708', '178', '1', '2.6', 'Amsler'),
('1709', '178', '1', '24', '--- Select One ---');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1710', '178', '1', '26.1', 'Extraction'),
('1711', '178', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/Amsler,Donovan_EXTReferral.pdf'),
('1712', '178', '1', '7', 'Here is the correct extraction request, sorry!'),
('1713', '179', '1', '2.3', 'Elizabeth'),
('1714', '179', '1', '2.6', 'McCaney'),
('1715', '179', '1', '3', 'lizisawesome91@gmail.com'),
('1716', '179', '1', '4', '(512)516-3422'),
('1717', '179', '1', '24', 'Patient would like you to call to schedule'),
('1718', '179', '1', '26.1', 'Extraction'),
('1719', '179', '1', '10.17', '16');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1720', '179', '1', '11.1', '32'),
('1721', '179', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/X00744.JPG'),
('1722', '180', '1', '2.3', 'Bryant'),
('1723', '180', '1', '2.6', 'Parrett'),
('1724', '180', '1', '20.1', 'Patient is a minor'),
('1725', '180', '1', '21.3', 'Leanne'),
('1726', '180', '1', '21.6', 'Parrett'),
('1727', '180', '1', '3', 'leanneparrett@gmail.com'),
('1728', '180', '1', '4', '(512)517-7353'),
('1729', '180', '1', '25', 'Guardian would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1730', '180', '1', '26.1', 'Extraction'),
('1731', '180', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/Bryant pano.jpg'),
('1732', '180', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/Parrett,Bryant_ExtReferral.pdf'),
('1733', '180', '1', '7', 'Please call with any questions!!'),
('1734', '181', '1', '2.3', 'Jenny'),
('1735', '181', '1', '2.6', 'Nguyen'),
('1736', '181', '1', '3', 'jmuseofficial@gmail.com'),
('1737', '181', '1', '4', '(512)698-5309'),
('1738', '181', '1', '24', 'Patient would like you to call to schedule'),
('1739', '181', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1740', '181', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/Nguyen,Jenny_ExtReferral.pdf'),
('1741', '181', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/J_Nguyen_pano.jpg'),
('1742', '181', '1', '7', 'Please call with any questions!! Have a great day!\r\nTiffany'),
('1743', '182', '1', '2.3', 'Christina'),
('1744', '182', '1', '2.6', 'Lulo'),
('1745', '182', '1', '20.1', 'Patient is a minor'),
('1746', '182', '1', '21.3', 'Shannon'),
('1747', '182', '1', '21.6', 'Lulo'),
('1748', '182', '1', '3', 'slulo@hotmail.com'),
('1749', '182', '1', '4', '(954)439-8934');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1750', '182', '1', '25', 'Guardian would like you to call to schedule'),
('1751', '182', '1', '26.1', 'Extraction'),
('1752', '182', '1', '26.2', 'Expose & Bond'),
('1753', '182', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/CLulo_pano.jpg'),
('1754', '182', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/Lulo,Tina_EBCReferral.pdf'),
('1755', '182', '1', '7', 'Please call with any questions, have a great day!!\r\nTiffany'),
('1756', '183', '1', '2.3', 'Waverly'),
('1757', '183', '1', '2.6', 'Peterson'),
('1758', '183', '1', '20.1', 'Patient is a minor'),
('1759', '183', '1', '21.3', 'Dawn');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1760', '183', '1', '21.6', 'Peterson'),
('1761', '183', '1', '3', 'ddnwpeterson@earthlink.net'),
('1762', '183', '1', '4', '(512)266-3300'),
('1763', '183', '1', '25', 'Guardian would like you to call to schedule'),
('1764', '183', '1', '26.1', 'Extraction'),
('1765', '183', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/WPeterson_Pano.jpg'),
('1766', '183', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/Peterson,Waverly_ExtReferral.pdf'),
('1767', '183', '1', '7', 'Please call with any questions!\r\nTiffany'),
('1768', '184', '1', '2.3', 'Natalia'),
('1769', '184', '1', '2.6', 'Guerrero');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1770', '184', '1', '20.1', 'Patient is a minor'),
('1771', '184', '1', '21.3', 'Masferrer'),
('1772', '184', '1', '21.6', 'Lorena'),
('1773', '184', '1', '3', 'loremas2003@yahoo.com'),
('1774', '184', '1', '4', '(512)944-2269'),
('1775', '184', '1', '25', 'Guardian would like you to call to schedule'),
('1776', '184', '1', '26.1', 'Extraction'),
('1777', '184', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/Guerrero,Natalie_ExtReferral.pdf'),
('1778', '184', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/07/NGuerrero_Pano.jpg'),
('1779', '184', '1', '7', 'Please call with any questions!\r\nTiffany');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1780', '185', '1', '2.3', 'Cade'),
('1781', '185', '1', '2.6', 'Bruck'),
('1782', '185', '1', '20.1', 'Patient is a minor'),
('1783', '185', '1', '21.3', 'Chris'),
('1784', '185', '1', '21.6', 'Jobe'),
('1785', '185', '1', '3', 'tumbletrain@hotmail.com'),
('1786', '185', '1', '4', '(512)814-9555'),
('1787', '185', '1', '25', 'Guardian would like you to call to schedule'),
('1788', '185', '1', '26.1', 'Extraction'),
('1789', '185', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/08/Bruck_Pano.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1790', '185', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/08/Bruck,Cade_ExtReferral.pdf'),
('1791', '185', '1', '7', 'Hope everyone is having a good day! Call with any questions. \r\nTiffany'),
('1792', '186', '1', '2.3', 'Austin'),
('1793', '186', '1', '2.6', 'Bain'),
('1794', '186', '1', '24', 'Patient would like you to call to schedule'),
('1795', '186', '1', '26.1', 'Extraction'),
('1796', '186', '1', '11.16', '18'),
('1797', '186', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/08/Bain.Austin.Pano'),
('1798', '187', '1', '2.3', 'kali'),
('1799', '187', '1', '2.6', 'burr');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1800', '187', '1', '20.1', 'Patient is a minor'),
('1801', '187', '1', '3', 'knk-22@live.com'),
('1802', '187', '1', '4', '(512)538-8397'),
('1803', '187', '1', '25', '--- Select One ---'),
('1804', '187', '1', '26.1', 'Extraction'),
('1805', '187', '1', '26.4', 'Implant'),
('1806', '187', '1', '10.2', '2'),
('1807', '187', '1', '11.1', '32'),
('1808', '187', '1', '11.16', '18'),
('1809', '187', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/08/BurrK.JPG');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1810', '188', '1', '2.3', 'Ethan'),
('1811', '188', '1', '2.6', 'Bryant'),
('1812', '188', '1', '20.1', 'Patient is a minor'),
('1813', '188', '1', '21.3', 'Stacy'),
('1814', '188', '1', '21.6', 'Bryant'),
('1815', '188', '1', '3', 'stacy.bryant@usoncology.com'),
('1816', '188', '1', '4', '(512)608-8258'),
('1817', '188', '1', '25', 'Guardian would like you to call to schedule'),
('1818', '188', '1', '26.1', 'Extraction'),
('1819', '188', '1', '26.3', 'Third Molars');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1820', '188', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/08/Bryant,Ethan_ExtReferral.pdf'),
('1821', '188', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/08/EBryant_Pano.jpg'),
('1822', '188', '1', '7', 'Please call the office with any questions. Have a great day!!\r\nTiffany'),
('1823', '189', '1', '2.3', 'Rex'),
('1824', '189', '1', '2.6', 'Poole'),
('1825', '189', '1', '20.1', 'Patient is a minor'),
('1826', '189', '1', '21.3', 'Michelle'),
('1827', '189', '1', '21.6', 'Poole'),
('1828', '189', '1', '3', 'mkrpoole@hotmail.com'),
('1829', '189', '1', '4', '(512)573-7397');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1830', '189', '1', '25', 'Guardian would like you to call to schedule'),
('1831', '189', '1', '26.1', 'Extraction'),
('1832', '189', '1', '26.3', 'Third Molars'),
('1833', '189', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/08/RPoole_Pano.jpg'),
('1834', '189', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/08/Poole,Rex_ExtReferral.pdf'),
('1835', '189', '1', '7', 'Please call with any questions!! Have a good evening!\r\nTiffany'),
('1836', '190', '1', '2.3', 'Alex'),
('1837', '190', '1', '2.6', 'Davis'),
('1838', '190', '1', '20.1', 'Patient is a minor'),
('1839', '190', '1', '21.3', 'Kelly');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1840', '190', '1', '21.6', 'Davis'),
('1841', '190', '1', '3', 'kellymdavis@gmail.com'),
('1842', '190', '1', '4', '(512)924-9887'),
('1843', '190', '1', '25', 'Guardian would like you to call to schedule'),
('1844', '190', '1', '26.1', 'Extraction'),
('1845', '190', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/08/Davis,Alex_ExtReferral.pdf'),
('1846', '190', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/08/ADavis_Pano.jpg'),
('1847', '190', '1', '7', 'Please call with any questions. Have a great evening!!\r\nTiffany'),
('1848', '191', '1', '2.3', 'Lauren'),
('1849', '191', '1', '2.6', 'Saucedo');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1850', '191', '1', '20.1', 'Patient is a minor'),
('1851', '191', '1', '21.3', 'Melissa'),
('1852', '191', '1', '21.6', 'Gladden'),
('1853', '191', '1', '3', 'melissa.gladden@pervasive.com'),
('1854', '191', '1', '4', '(512)656-9029'),
('1855', '191', '1', '25', 'Guardian would like you to call to schedule'),
('1856', '191', '1', '26.1', 'Extraction'),
('1857', '191', '1', '26.3', 'Third Molars'),
('1858', '191', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/08/LSaucedo_Pano.jpg'),
('1859', '191', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/08/Saucedo,Lauren_ExtReferral.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1860', '191', '1', '7', 'Tiffany'),
('1861', '192', '1', '2.3', 'Laura'),
('1862', '192', '1', '2.6', 'Laukoter'),
('1863', '192', '1', '3', 'lmlgreen@yahoo.com'),
('1864', '192', '1', '4', '(972)672-7253'),
('1865', '192', '1', '24', 'Patient would like you to call to schedule'),
('1866', '192', '1', '26.1', 'Extraction'),
('1867', '192', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/09/X00824.JPG'),
('1868', '193', '1', '2.3', 'Diego'),
('1869', '193', '1', '2.6', 'Guerrero');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1870', '193', '1', '20.1', 'Patient is a minor'),
('1871', '193', '1', '21.3', 'Lorena'),
('1872', '193', '1', '21.6', 'Masferrer'),
('1873', '193', '1', '3', 'loremas2003@yahoo.com'),
('1874', '193', '1', '4', '(512)944-2269'),
('1875', '193', '1', '25', 'Guardian would like you to call to schedule'),
('1876', '193', '1', '26.9', 'Other'),
('1877', '193', '1', '6', 'Evaluate the development on tooth #2'),
('1878', '193', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/09/Guerrero,Diego_ExtReferral.pdf'),
('1879', '193', '1', '7', 'Please call the office if you have any questions.\r\nHave a wonderful day!!');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1880', '194', '1', '2.3', 'Connor'),
('1881', '194', '1', '2.6', 'Hagarty'),
('1882', '194', '1', '20.1', 'Patient is a minor'),
('1883', '194', '1', '21.3', 'Kristen'),
('1884', '194', '1', '21.6', 'Hagarty'),
('1885', '194', '1', '3', 'kristenhagarty@gmail.com'),
('1886', '194', '1', '4', '(512)350-6886'),
('1887', '194', '1', '25', 'Guardian would like you to call to schedule'),
('1888', '194', '1', '26.2', 'Expose & Bond'),
('1889', '194', '1', '10.6', '6');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1890', '194', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/09/Hagarty,Connor_EBCreferral.pdf'),
('1891', '194', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/09/CHagarty Pano.jpg'),
('1892', '194', '1', '7', 'Please call with any questions, thank you!!\r\nTiffany'),
('1893', '195', '1', '2.3', 'Chris'),
('1894', '195', '1', '2.6', 'Albrecht'),
('1895', '195', '1', '3', 'chrisalbrecht94@gmail.com'),
('1896', '195', '1', '4', '(512)221-8352'),
('1897', '195', '1', '24', 'Patient would like you to call to schedule'),
('1898', '195', '1', '26.8', 'TMJ'),
('1899', '195', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/09/CAlbrecht Pano.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1900', '195', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/09/Albrecht,Chris_TMJreferral.pdf'),
('1901', '195', '1', '7', 'Please call with any questions, thank you!\r\nTiffany'),
('1902', '196', '1', '2.3', 'Brad'),
('1903', '196', '1', '2.6', 'Fields`'),
('1904', '196', '1', '4', '(817)773-2055'),
('1905', '196', '1', '24', 'Patient would like you to call to schedule'),
('1906', '196', '1', '26.1', 'Extraction'),
('1907', '196', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/09/Fields,Brad_ExtReferral.pdf'),
('1908', '196', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/09/BFields Pano.jpg'),
('1909', '196', '1', '7', 'Please call if you have any questions!\r\nTiffany');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1910', '197', '1', '2.3', 'Olivia'),
('1911', '197', '1', '2.6', 'Gonzales'),
('1912', '197', '1', '20.1', 'Patient is a minor'),
('1913', '197', '1', '21.3', 'David'),
('1914', '197', '1', '21.6', 'Gonzales'),
('1915', '197', '1', '3', 'david.gonzales@siemens.com'),
('1916', '197', '1', '4', '(713)208-2052'),
('1917', '197', '1', '25', 'Guardian would like you to call to schedule'),
('1918', '197', '1', '26.1', 'Extraction'),
('1919', '197', '1', '26.3', 'Third Molars');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1920', '197', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/09/OGonzales Pano.jpg'),
('1921', '197', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/09/Gonzales,Olivia_ExtReferral.pdf'),
('1922', '197', '1', '7', 'Tiffany'),
('1923', '198', '1', '2.3', 'Tina'),
('1924', '198', '1', '2.6', 'Lulo'),
('1925', '198', '1', '20.1', 'Patient is a minor'),
('1926', '198', '1', '21.3', 'Shannon'),
('1927', '198', '1', '21.6', 'Lulo'),
('1928', '198', '1', '3', 'slulo@hotmail.com'),
('1929', '198', '1', '4', '(954)439-8934');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1930', '198', '1', '25', 'Guardian would like you to call to schedule'),
('1931', '198', '1', '26.2', 'Expose & Bond'),
('1932', '198', '1', '26.9', 'Other'),
('1933', '198', '1', '6', 'evaluate for the re-exposure of tooth #11'),
('1934', '198', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/09/Lulo,Tino_EBCReferral.pdf'),
('1935', '198', '1', '7', 'Tiffany'),
('1936', '199', '1', '2.3', 'Ian'),
('1937', '199', '1', '2.6', 'Brann'),
('1938', '199', '1', '20.1', 'Patient is a minor'),
('1939', '199', '1', '21.3', 'Christine');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1940', '199', '1', '21.6', 'Brann'),
('1941', '199', '1', '3', 'cmbrann@aol.com'),
('1942', '199', '1', '4', '(859)609-1895'),
('1943', '199', '1', '25', 'Guardian would like you to call to schedule'),
('1944', '199', '1', '26.1', 'Extraction'),
('1945', '199', '1', '26.9', 'Other'),
('1946', '199', '1', '6', 'evalute for the ext of #h and evaluate #10 and #11 for impaction'),
('1947', '199', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/Brann,Ian_ExtReferral.pdf'),
('1948', '199', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/IBrann Pano.jpg'),
('1949', '199', '1', '7', 'Tiffany');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1950', '200', '1', '2.3', 'Wayne'),
('1951', '200', '1', '2.6', 'Ferguson'),
('1952', '200', '1', '20.1', 'Patient is a minor'),
('1953', '200', '1', '21.3', 'Mark'),
('1954', '200', '1', '21.6', 'Ferguson'),
('1955', '200', '1', '3', 'mferguson28@austin.rr.com'),
('1956', '200', '1', '4', '(512)230-4168'),
('1957', '200', '1', '25', 'Guardian would like you to call to schedule'),
('1958', '200', '1', '26.1', 'Extraction'),
('1959', '200', '1', '26.3', 'Third Molars');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1960', '200', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/WFerguson Pano.jpg'),
('1961', '200', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/Ferguson,Wayne_ExtReferral.pdf'),
('1962', '200', '1', '7', 'Tiffany'),
('1963', '201', '1', '2.3', 'Jodie'),
('1964', '201', '1', '2.6', 'Elderton'),
('1965', '201', '1', '20.1', 'Patient is a minor'),
('1966', '201', '1', '21.3', 'Laura'),
('1967', '201', '1', '21.6', 'Elderton'),
('1968', '201', '1', '3', 'lelderton@austin.rr.com'),
('1969', '201', '1', '4', '(512)266-3843');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1970', '201', '1', '25', 'Guardian would like you to call to schedule'),
('1971', '201', '1', '26.1', 'Extraction'),
('1972', '201', '1', '26.3', 'Third Molars'),
('1973', '201', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/JElderton Pano.jpg'),
('1974', '201', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/Elderton,Jodie_ExtReferral.pdf'),
('1975', '201', '1', '7', 'Please call with any questions!\r\nTiffany'),
('1976', '202', '1', '2.3', 'Ben '),
('1977', '202', '1', '2.6', 'Najera'),
('1978', '202', '1', '20.1', 'Patient is a minor'),
('1979', '202', '1', '21.3', 'Sunny');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1980', '202', '1', '21.6', 'Najera'),
('1981', '202', '1', '3', 'rella0930@yahoo.com'),
('1982', '202', '1', '4', '(512)626-9260'),
('1983', '202', '1', '25', 'Guardian would like you to call to schedule'),
('1984', '202', '1', '26.2', 'Expose & Bond'),
('1985', '202', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/Najera,Ben_EBCReferral.pdf'),
('1986', '202', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/BNajera Pano.jpg'),
('1987', '202', '1', '7', 'Tiffany'),
('1988', '203', '1', '2.3', 'Lizzie'),
('1989', '203', '1', '2.6', 'Ademski');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('1990', '203', '1', '3', 'elizabethadenmki@yahoo.com'),
('1991', '203', '1', '4', '(512)809-1869'),
('1992', '203', '1', '24', 'Patient would like you to call to schedule'),
('1993', '203', '1', '26.9', 'Other'),
('1994', '203', '1', '6', 'evaluate tooth #32'),
('1995', '203', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/EAdemski Pano.jpg'),
('1996', '203', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/Ademski,ElizabethReferral.pdf'),
('1997', '203', '1', '7', 'This pano is the most current one we have for this patient. Please call with any questions. \r\nTiffany'),
('1998', '204', '1', '2.3', 'Lauren'),
('1999', '204', '1', '2.6', 'Zielke');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2000', '204', '1', '24', '--- Select One ---'),
('2001', '204', '1', '26.3', 'Third Molars'),
('2002', '204', '1', '10.1', '1'),
('2003', '204', '1', '10.17', '16'),
('2004', '204', '1', '11.1', '32'),
('2005', '204', '1', '11.17', '17'),
('2006', '204', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/ZielkeL.JPG'),
('2007', '205', '1', '2.3', 'Josh'),
('2008', '205', '1', '2.6', 'Horowitz'),
('2009', '205', '1', '3', 'josh@nycity411.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2010', '205', '1', '4', '(917)977-1806'),
('2011', '205', '1', '24', 'Patient would like you to call to schedule'),
('2012', '205', '1', '26.4', 'Implant'),
('2013', '205', '1', '11.4', '29'),
('2014', '205', '1', '11.14', '20'),
('2015', '205', '1', '11.16', '18'),
('2016', '205', '1', '7', 'Dr. Rux requests Dr. Alford to do exts of these teeth as well'),
('2017', '206', '1', '2.3', 'Jessi'),
('2018', '206', '1', '2.6', 'Tatum'),
('2019', '206', '1', '20.1', 'Patient is a minor');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2020', '206', '1', '21.3', 'Dana'),
('2021', '206', '1', '21.6', 'Tatum'),
('2022', '206', '1', '3', 'dtatum@providentmemory.com'),
('2023', '206', '1', '4', '(254)493-9157'),
('2024', '206', '1', '25', 'Guardian would like you to call to schedule'),
('2025', '206', '1', '26.1', 'Extraction'),
('2026', '206', '1', '26.9', 'Other'),
('2027', '206', '1', '6', 'evaluate thirds and uncover tooth numbers #18 and #31'),
('2028', '206', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/Tatum,Jessi_ExtReferral.pdf'),
('2029', '206', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/JTatum Pano.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2030', '207', '1', '2.3', 'Jeff '),
('2031', '207', '1', '2.6', 'Sonntag'),
('2032', '207', '1', '24', '--- Select One ---'),
('2033', '207', '1', '26.4', 'Implant'),
('2034', '207', '1', '10.11', '10'),
('2035', '207', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/1_.jpg'),
('2036', '207', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/10/11_.jpg'),
('2037', '207', '1', '7', 'Please evaluate #10 for implant and tx as necessary, pt has appt. at 3:15 today with you guys'),
('2038', '208', '1', '2.3', 'John-Paul'),
('2039', '208', '1', '2.6', 'Storrar');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2040', '208', '1', '20.1', 'Patient is a minor'),
('2041', '208', '1', '21.3', 'Im'),
('2042', '208', '1', '21.6', 'Hundley'),
('2043', '208', '1', '3', 'kimbermichales@aol.com'),
('2044', '208', '1', '4', '(512)784-0316'),
('2045', '208', '1', '25', 'Guardian would like you to call to schedule'),
('2046', '208', '1', '26.1', 'Extraction'),
('2047', '208', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/11/JP Storrar Pano.jpg'),
('2048', '208', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/11/untitled002.pdf'),
('2049', '208', '1', '7', 'Please call if any questions, thank you!\r\nTiffany');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2050', '209', '1', '2.3', 'Brad'),
('2051', '209', '1', '2.6', 'Fields'),
('2052', '209', '1', '3', 'sfields@ambienthealth.com'),
('2053', '209', '1', '4', '(817)773-2055'),
('2054', '209', '1', '24', 'Patient would like you to call to schedule'),
('2055', '209', '1', '26.1', 'Extraction'),
('2056', '209', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/11/Fields,Brad_ExtReferral.pdf'),
('2057', '209', '1', '7', 'Please add to orders eperculectomy of #18. \r\nDad (Shay) will be calling you this afternoon to go over fees and scheduling. \r\n\r\nThank You. '),
('2058', '210', '1', '2.3', 'Brent '),
('2059', '210', '1', '2.6', 'Davis');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2060', '210', '1', '20.1', 'Patient is a minor'),
('2061', '210', '1', '21.3', 'Ann'),
('2062', '210', '1', '21.6', 'Davis'),
('2063', '210', '1', '3', 'anndavis@austin.rr.com'),
('2064', '210', '1', '4', '(512)261-8610'),
('2065', '210', '1', '25', 'Guardian would like you to call to schedule'),
('2066', '210', '1', '26.1', 'Extraction'),
('2067', '210', '1', '26.2', 'Expose & Bond'),
('2068', '210', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/11/BDavis Pano.jpg'),
('2069', '210', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/11/Davis,Brent_ExtReferral.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2070', '210', '1', '7', 'Please call if you have any questions. Tiffany'),
('2071', '211', '1', '2.3', 'Robert'),
('2072', '211', '1', '2.6', 'Fields'),
('2073', '211', '1', '3', 'sfields@ambienthealth.com'),
('2074', '211', '1', '4', '(972)475-6992'),
('2075', '211', '1', '24', 'Patient would like you to call to schedule'),
('2076', '211', '1', '26.1', 'Extraction'),
('2077', '211', '1', '26.9', 'Other'),
('2078', '211', '1', '6', 'evaluate tooth #18 for operculectomy'),
('2079', '211', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/11/Fields,Brads_ExtRequest.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2080', '211', '1', '7', 'Please call with any questions, thank you!\r\nTiffany'),
('2081', '212', '1', '2.3', 'Tori'),
('2082', '212', '1', '2.6', 'Kaiser'),
('2083', '212', '1', '24', '--- Select One ---'),
('2084', '212', '1', '26.4', 'Implant'),
('2085', '212', '1', '10.4', '4'),
('2086', '212', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/11/8_PA 3-5.jpg'),
('2087', '212', '1', '7', 'Pt is doctors best friend, lives in Dallas'),
('2088', '213', '1', '2.3', 'Ashley'),
('2089', '213', '1', '2.6', 'Londa');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2090', '213', '1', '20.1', 'Patient is a minor'),
('2091', '213', '1', '21.3', 'Sonya'),
('2092', '213', '1', '21.6', 'Londa'),
('2093', '213', '1', '3', 'sonyascanlan@hotmail.com'),
('2094', '213', '1', '4', '(512)992-8483'),
('2095', '213', '1', '25', 'Guardian would like you to call to schedule'),
('2096', '213', '1', '26.1', 'Extraction'),
('2097', '213', '1', '26.2', 'Expose & Bond'),
('2098', '213', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/Londa,Ashley_EBCreferral.pdf'),
('2099', '213', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/ALonda Pano.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2100', '213', '1', '7', 'Please call if you have any questions, thanks!\r\nTiffany'),
('2101', '214', '1', '2.3', 'mark'),
('2102', '214', '1', '2.6', 'luetzelscwab'),
('2103', '214', '1', '24', '--- Select One ---'),
('2104', '214', '1', '26.1', 'Extraction'),
('2105', '214', '1', '10.17', '16'),
('2106', '214', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/12_.jpg'),
('2107', '214', '1', '7', 'Please extract #16 and evaluate other 3rd molars for ext.  Discuss benefits of removal of other thirds with patient'),
('2108', '215', '1', '2.3', 'Donny'),
('2109', '215', '1', '2.6', 'Amsler');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2110', '215', '1', '20.1', 'Patient is a minor'),
('2111', '215', '1', '21.3', 'John'),
('2112', '215', '1', '21.6', 'Amsler'),
('2113', '215', '1', '3', 'jamsler1@yahoo.com'),
('2114', '215', '1', '4', '(512)585-8015'),
('2115', '215', '1', '25', 'Guardian would like you to call to schedule'),
('2116', '215', '1', '26.1', 'Extraction'),
('2117', '215', '1', '26.2', 'Expose & Bond'),
('2118', '215', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/DAmsler Pano.jpg'),
('2119', '215', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/Amsler,Donovan_RXEBC,EXT.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2120', '215', '1', '7', 'Please call dad once received, I know he has some questions regarding pt being put under and the procedure itself!!\r\nThanks, Tiffany'),
('2121', '216', '1', '2.3', 'Madison'),
('2122', '216', '1', '2.6', 'Crowns'),
('2123', '216', '1', '20.1', 'Patient is a minor'),
('2124', '216', '1', '21.3', 'Beth'),
('2125', '216', '1', '21.6', 'Crowns'),
('2126', '216', '1', '3', 'unx@aol.com'),
('2127', '216', '1', '4', '(512)264-0022'),
('2128', '216', '1', '25', 'Guardian would like you to call to schedule'),
('2129', '216', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2130', '216', '1', '26.3', 'Third Molars'),
('2131', '216', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/MCrowns Pano.jpg'),
('2132', '216', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/untitled002.pdf'),
('2133', '216', '1', '7', 'Please call if you have any questions! Tiffany'),
('2134', '217', '1', '2.3', 'John '),
('2135', '217', '1', '2.6', 'Caskey'),
('2136', '217', '1', '24', '--- Select One ---'),
('2137', '217', '1', '26.4', 'Implant'),
('2138', '217', '1', '10.11', '10'),
('2139', '217', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/10_.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2140', '217', '1', '7', 'Implant 10, please make flipper in office'),
('2141', '218', '1', '2.3', 'Amanda'),
('2142', '218', '1', '2.6', 'Reeder'),
('2143', '218', '1', '20.1', 'Patient is a minor'),
('2144', '218', '1', '21.3', 'Michele'),
('2145', '218', '1', '21.6', 'Reeder'),
('2146', '218', '1', '3', 'michele.reeder@gmail.com'),
('2147', '218', '1', '4', '(512)266-6319'),
('2148', '218', '1', '25', 'Guardian would like you to call to schedule'),
('2149', '218', '1', '26.2', 'Expose & Bond');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2150', '218', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/untitled001.pdf'),
('2151', '218', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/AReeder Pano.jpg'),
('2152', '218', '1', '7', 'Tiffany'),
('2153', '219', '1', '2.3', 'Steven'),
('2154', '219', '1', '2.6', 'McKinley'),
('2155', '219', '1', '24', 'Patient would like you to call to schedule'),
('2156', '219', '1', '26.3', 'Third Molars'),
('2157', '219', '1', '10.1', '1'),
('2158', '219', '1', '10.17', '16'),
('2159', '219', '1', '11.1', '32');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2160', '219', '1', '11.17', '17'),
('2161', '219', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/McKinleyS4-14-11.JPG'),
('2162', '219', '1', '7', 'pano is from April 2011'),
('2163', '220', '1', '2.3', 'Susan'),
('2164', '220', '1', '2.6', 'Empoliti'),
('2165', '220', '1', '24', 'Patient does not want to be contacted'),
('2166', '220', '1', '26.4', 'Implant'),
('2167', '220', '1', '11.15', '19'),
('2168', '220', '1', '11.16', '18'),
('2169', '220', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/Empoliti8-19-09.JPG');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2170', '220', '1', '7', 'Susan will call your office in Jan to schedule...pano was taken Aug. 2009-it is the most recent pano we have but I do have more recent bws if you\'d like me to send those?'),
('2171', '221', '1', '2.3', 'Sara'),
('2172', '221', '1', '2.6', 'Wolf'),
('2173', '221', '1', '20.1', 'Patient is a minor'),
('2174', '221', '1', '21.3', 'Dawn'),
('2175', '221', '1', '21.6', 'Wolf'),
('2176', '221', '1', '3', 'john.dawnwolf@gmail.com'),
('2177', '221', '1', '4', '(512)689-8060'),
('2178', '221', '1', '25', 'Guardian would like you to call to schedule'),
('2179', '221', '1', '26.2', 'Expose & Bond');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2180', '221', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/SWolf Pano.jpg'),
('2181', '221', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/Wolf,Sara_EBCreferral.pdf'),
('2182', '221', '1', '7', 'Tiffany'),
('2183', '222', '1', '2.3', 'Haydin'),
('2184', '222', '1', '2.6', 'Freeman'),
('2185', '222', '1', '20.1', 'Patient is a minor'),
('2186', '222', '1', '21.3', 'Gerald'),
('2187', '222', '1', '21.6', 'Freeman'),
('2188', '222', '1', '3', 'geraldfreeman@earthlink.net'),
('2189', '222', '1', '4', '(512)497-5619');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2190', '222', '1', '25', 'Guardian would like you to call to schedule'),
('2191', '222', '1', '26.2', 'Expose & Bond'),
('2192', '222', '1', '26.3', 'Third Molars'),
('2193', '222', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/Freeman,Haydin_ExtEBCReferral.pdf'),
('2194', '222', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/Panoramic X-Ray_Freeman.jpg'),
('2195', '222', '1', '7', 'Thanks Guys!'),
('2196', '223', '1', '2.3', 'James'),
('2197', '223', '1', '2.6', 'Starr'),
('2198', '223', '1', '4', '(512)944-4360'),
('2199', '223', '1', '24', 'Patient would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2200', '223', '1', '26.1', 'Extraction'),
('2201', '223', '1', '26.4', 'Implant'),
('2202', '223', '1', '10.12', '11'),
('2203', '223', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/StarrJ12-20-12.JPG'),
('2204', '223', '1', '7', 'James has an appointment tomorrow at 12:15 for a consult.\r\nThanks,\r\nJuanita'),
('2205', '224', '1', '2.3', 'James, Jr'),
('2206', '224', '1', '2.6', 'Gonzales'),
('2207', '224', '1', '20.1', 'Patient is a minor'),
('2208', '224', '1', '21.3', 'Roxanne'),
('2209', '224', '1', '21.6', 'Gonzales');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2210', '224', '1', '3', 'jimroxx3@yahoo.com'),
('2211', '224', '1', '4', '(210)316-2875'),
('2212', '224', '1', '25', 'Guardian would like you to call to schedule'),
('2213', '224', '1', '26.3', 'Third Molars'),
('2214', '224', '1', '10.1', '1'),
('2215', '224', '1', '10.17', '16'),
('2216', '224', '1', '11.1', '32'),
('2217', '224', '1', '11.17', '17'),
('2218', '224', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2012/12/GonzalesJ3-26-12.JPG'),
('2219', '224', '1', '7', 'Wants to schedule for May 2013\r\npano was taken 3/26/2012');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2220', '225', '1', '2.3', 'Erin'),
('2221', '225', '1', '2.6', 'White'),
('2222', '225', '1', '3', 'erwhite30@me.com'),
('2223', '225', '1', '4', '(512)785-1811'),
('2224', '225', '1', '24', 'Patient would like you to call to schedule'),
('2225', '225', '1', '26.1', 'Extraction'),
('2226', '225', '1', '26.3', 'Third Molars'),
('2227', '225', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/EWhite Pano.jpg'),
('2228', '225', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/White,Erin_ExtReferral.pdf'),
('2229', '225', '1', '7', 'Please call if you should have any questions. \r\nTiffany');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2230', '226', '1', '2.3', 'Tyler Garrett'),
('2231', '226', '1', '2.6', 'Respondek'),
('2232', '226', '1', '3', 'shellimcnabb5@yahoo.com'),
('2233', '226', '1', '4', '(512)695-9029'),
('2234', '226', '1', '24', '--- Select One ---'),
('2235', '226', '1', '26.3', 'Third Molars'),
('2236', '226', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/Panoramic X-Ray_GarrettRespondek.jpg'),
('2237', '227', '1', '2.3', 'Austin'),
('2238', '227', '1', '2.6', 'Respondek'),
('2239', '227', '1', '3', 'shellimcnabb5@yahoo.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2240', '227', '1', '4', '(512)695-9029'),
('2241', '227', '1', '24', '--- Select One ---'),
('2242', '227', '1', '26.3', 'Third Molars'),
('2243', '227', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/Panoramic X-Ray_AustinRespondek.jpg'),
('2244', '228', '1', '2.3', 'Jessica'),
('2245', '228', '1', '2.6', 'Skiftun'),
('2246', '228', '1', '20.1', 'Patient is a minor'),
('2247', '228', '1', '21.3', 'Dana'),
('2248', '228', '1', '21.6', 'Tatum'),
('2249', '228', '1', '3', 'dtatum@providentmemory.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2250', '228', '1', '4', '(254)493-9157'),
('2251', '228', '1', '25', 'Guardian would like you to call to schedule'),
('2252', '228', '1', '26.2', 'Expose & Bond'),
('2253', '228', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/JSkiftun Pano.jpg'),
('2254', '228', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/Skiftum,Jessi_ExtReferral.pdf'),
('2255', '228', '1', '7', 'Please call if you should have any questions\r\nTiffany'),
('2256', '229', '1', '2.3', 'Payton'),
('2257', '229', '1', '2.6', 'Maxwell'),
('2258', '229', '1', '20.1', 'Patient is a minor'),
('2259', '229', '1', '21.3', 'Jessica');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2260', '229', '1', '21.6', 'Deming'),
('2261', '229', '1', '3', 'danjessdeming@gmail.com'),
('2262', '229', '1', '4', '(512)466-5157'),
('2263', '229', '1', '25', '--- Select One ---'),
('2264', '229', '1', '26.2', 'Expose & Bond'),
('2265', '229', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/Maxwell,Payton_EBCReferral.pdf'),
('2266', '229', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/PMaxwell Pano.jpg'),
('2267', '229', '1', '7', 'Tiffany'),
('2268', '230', '1', '2.3', 'Dallas '),
('2269', '230', '1', '2.6', 'Ulbricht');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2270', '230', '1', '4', '(979)906-0116'),
('2271', '230', '1', '24', '--- Select One ---'),
('2272', '230', '1', '26.3', 'Third Molars'),
('2273', '230', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/X00937.JPG'),
('2274', '230', '1', '7', 'consult for wisdom teeth'),
('2275', '231', '1', '2.3', 'Brandi'),
('2276', '231', '1', '2.6', 'Wagner'),
('2277', '231', '1', '4', '(918)852-8756'),
('2278', '231', '1', '24', '--- Select One ---'),
('2279', '231', '1', '26.4', 'Implant');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2280', '231', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/X00895.JPG'),
('2281', '231', '1', '7', 'Implant consult #13'),
('2282', '232', '1', '2.3', 'Ricki'),
('2283', '232', '1', '2.6', 'Hendricks'),
('2284', '232', '1', '24', '--- Select One ---'),
('2285', '232', '1', '26.4', 'Implant'),
('2286', '232', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/X00210.JPG'),
('2287', '233', '1', '2.3', 'Aline'),
('2288', '233', '1', '2.6', 'Milam'),
('2289', '233', '1', '24', '--- Select One ---');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2290', '233', '1', '26.1', 'Extraction'),
('2291', '233', '1', '26.4', 'Implant'),
('2292', '233', '1', '11.15', '19'),
('2293', '233', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/24_.jpg'),
('2294', '233', '1', '7', 'please evaluate #19 for ext and possible implant. \r\nPt in pain'),
('2295', '234', '1', '2.3', 'Jess'),
('2296', '234', '1', '2.6', 'LaFleur'),
('2297', '234', '1', '20.1', 'Patient is a minor'),
('2298', '234', '1', '21.3', 'Lori'),
('2299', '234', '1', '21.6', 'LaFleur');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2300', '234', '1', '3', 'jo_lo_lafleur@hotmail.com'),
('2301', '234', '1', '4', '(512)949-9723'),
('2302', '234', '1', '25', 'Guardian would like you to call to schedule'),
('2303', '234', '1', '26.1', 'Extraction'),
('2304', '234', '1', '26.3', 'Third Molars'),
('2305', '234', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/JLaFleur Pano.jpg'),
('2306', '234', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/LaFleur,Jess_ExtReferral.pdf'),
('2307', '234', '1', '7', 'Tiffany'),
('2308', '235', '1', '2.3', 'Erika'),
('2309', '235', '1', '2.6', 'Hoffert');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2310', '235', '1', '20.1', 'Patient is a minor'),
('2311', '235', '1', '21.3', 'Rosemary'),
('2312', '235', '1', '21.6', 'Hoffert'),
('2313', '235', '1', '3', 'rosemary.hoffert@freescale.com'),
('2314', '235', '1', '4', '(512)914-4395'),
('2315', '235', '1', '25', 'Guardian would like you to call to schedule'),
('2316', '235', '1', '26.1', 'Extraction'),
('2317', '235', '1', '26.3', 'Third Molars'),
('2318', '235', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/EHoffert Pano.jpg'),
('2319', '235', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/Hoffert,Erika_ExtReferral.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2320', '235', '1', '7', 'Tiffany'),
('2321', '236', '1', '2.3', 'Marco'),
('2322', '236', '1', '2.6', 'Haros'),
('2323', '236', '1', '20.1', 'Patient is a minor'),
('2324', '236', '1', '21.3', 'Isalina'),
('2325', '236', '1', '21.6', 'Herrera'),
('2326', '236', '1', '3', 'isalina.herrera@stdavids.com'),
('2327', '236', '1', '4', '(512)484-9046'),
('2328', '236', '1', '25', '--- Select One ---'),
('2329', '236', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2330', '236', '1', '26.3', 'Third Molars'),
('2331', '236', '1', '26.9', 'Other'),
('2332', '236', '1', '6', 'extract supernumerary tooth #10'),
('2333', '236', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/Haros,Marco_ExtReferral.pdf'),
('2334', '236', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/MHaros Pano.jpg'),
('2335', '236', '1', '7', 'Tiffany'),
('2336', '237', '1', '2.3', 'Jaclyn '),
('2337', '237', '1', '2.6', 'Anderson'),
('2338', '237', '1', '3', 'jaclyna1986@gmail.com'),
('2339', '237', '1', '4', '(830)708-8884');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2340', '237', '1', '24', 'Patient would like you to call to schedule'),
('2341', '237', '1', '26.2', 'Expose & Bond'),
('2342', '237', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/JAnderson Pano.jpg'),
('2343', '237', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/Anderson,Jaclyn_EBCreferral.pdf'),
('2344', '237', '1', '7', 'Tiffany'),
('2345', '238', '1', '2.3', 'Gerald '),
('2346', '238', '1', '2.6', 'Crawford'),
('2347', '238', '1', '24', '--- Select One ---'),
('2348', '238', '1', '26.1', 'Extraction'),
('2349', '238', '1', '26.4', 'Implant');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2350', '238', '1', '10.11', '10'),
('2351', '238', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/10_.jpg'),
('2352', '238', '1', '7', 'Please Evaluate #10 for extraction and implant'),
('2353', '239', '1', '2.3', 'Robyn'),
('2354', '239', '1', '2.6', 'Lippel'),
('2355', '239', '1', '20.1', 'Patient is a minor'),
('2356', '239', '1', '21.3', 'Erica'),
('2357', '239', '1', '21.6', 'Johnsmiller'),
('2358', '239', '1', '3', 'edrgnldy@yahoo.com'),
('2359', '239', '1', '4', '(949)235-8848');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2360', '239', '1', '25', 'Guardian would like you to call to schedule'),
('2361', '239', '1', '26.1', 'Extraction'),
('2362', '239', '1', '26.3', 'Third Molars'),
('2363', '239', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/Anzaldua,Jake_ExtReferral.pdf'),
('2364', '239', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/JAnzaldua Pano.jpg'),
('2365', '239', '1', '7', 'Tiffany'),
('2366', '240', '1', '2.3', 'Robyn'),
('2367', '240', '1', '2.6', 'Lippel'),
('2368', '240', '1', '20.1', 'Patient is a minor'),
('2369', '240', '1', '21.3', 'Erica');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2370', '240', '1', '21.6', 'Johnsmiller'),
('2371', '240', '1', '3', 'edrgnldy@yahoo.com'),
('2372', '240', '1', '4', '(949)235-8848'),
('2373', '240', '1', '25', 'Guardian would like you to call to schedule'),
('2374', '240', '1', '26.1', 'Extraction'),
('2375', '240', '1', '26.3', 'Third Molars'),
('2376', '240', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/RLippel Pano.jpg'),
('2377', '240', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/Lippel,Robyn_ExtReferral.pdf'),
('2378', '240', '1', '7', 'Sorry, attached wrong pts referral to Robyn\'s first email!\r\nTiffany'),
('2379', '241', '1', '2.3', 'Jake');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2380', '241', '1', '2.6', 'Anzaldua'),
('2381', '241', '1', '20.1', 'Patient is a minor'),
('2382', '241', '1', '21.3', 'Marsha'),
('2383', '241', '1', '21.6', 'Koebcke'),
('2384', '241', '1', '3', 'marsha@designsbycooties.com'),
('2385', '241', '1', '4', '(512)514-0841'),
('2386', '241', '1', '25', 'Guardian would like you to call to schedule'),
('2387', '241', '1', '26.1', 'Extraction'),
('2388', '241', '1', '26.3', 'Third Molars'),
('2389', '241', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/Anzaldua,Jake_ExtReferral1.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2390', '241', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/JAnzaldua Pano1.jpg'),
('2391', '241', '1', '7', 'Here is Jake\'s info.\r\nTiffany'),
('2392', '242', '1', '2.3', 'Olivia'),
('2393', '242', '1', '2.6', 'Thorpe'),
('2394', '242', '1', '20.1', 'Patient is a minor'),
('2395', '242', '1', '21.3', 'Donella'),
('2396', '242', '1', '21.6', 'Thorpe'),
('2397', '242', '1', '3', 'ojt123@aol.com'),
('2398', '242', '1', '4', '(512)266-1528'),
('2399', '242', '1', '25', 'Guardian would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2400', '242', '1', '26.1', 'Extraction'),
('2401', '242', '1', '26.3', 'Third Molars'),
('2402', '242', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/OThorpe Pano.jpg'),
('2403', '242', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/Thorpe,Olivia_ExtReferral.pdf'),
('2404', '242', '1', '7', 'Tiffany'),
('2405', '243', '1', '2.3', 'Shawna'),
('2406', '243', '1', '2.6', 'Krulan'),
('2407', '243', '1', '3', 'shawna.krulan@g.austincc.com'),
('2408', '243', '1', '4', '(512)317-2065'),
('2409', '243', '1', '24', 'Patient would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2410', '243', '1', '26.1', 'Extraction'),
('2411', '243', '1', '10.1', '1'),
('2412', '243', '1', '10.2', '2'),
('2413', '243', '1', '10.16', '15'),
('2414', '243', '1', '10.17', '16'),
('2415', '243', '1', '11.1', '32'),
('2416', '243', '1', '11.2', '31'),
('2417', '243', '1', '11.4', '29'),
('2418', '243', '1', '11.16', '18'),
('2419', '243', '1', '11.17', '17');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2420', '243', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/01/KrulanS1-28-13.JPG'),
('2421', '244', '1', '2.3', 'Hunter'),
('2422', '244', '1', '2.6', 'Dersch'),
('2423', '244', '1', '20.1', 'Patient is a minor'),
('2424', '244', '1', '21.3', 'Jules'),
('2425', '244', '1', '21.6', 'Dersch'),
('2426', '244', '1', '4', '(512)755-9911'),
('2427', '244', '1', '25', 'Guardian would like you to call to schedule'),
('2428', '244', '1', '26.1', 'Extraction'),
('2429', '244', '1', '26.3', 'Third Molars');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2430', '244', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/Dersch,Hunter_ExtReferral.pdf'),
('2431', '244', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/HDersch Pano.jpg'),
('2432', '244', '1', '7', 'Tiffany'),
('2433', '245', '1', '2.3', 'Jack'),
('2434', '245', '1', '2.6', 'Casey'),
('2435', '245', '1', '20.1', 'Patient is a minor'),
('2436', '245', '1', '21.3', 'Mary'),
('2437', '245', '1', '21.6', 'Casey'),
('2438', '245', '1', '3', 'marycasey@austin.rr.com'),
('2439', '245', '1', '4', '(512)694-8940');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2440', '245', '1', '25', 'Guardian would like you to call to schedule'),
('2441', '245', '1', '26.1', 'Extraction'),
('2442', '245', '1', '26.3', 'Third Molars'),
('2443', '245', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/JCasey Pano.jpg'),
('2444', '245', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/Casey,Jack_ExtReferral.pdf'),
('2445', '245', '1', '7', 'Tiffany'),
('2446', '246', '1', '2.3', 'Elizabeth'),
('2447', '246', '1', '2.6', 'Medina'),
('2448', '246', '1', '3', 'elizabeth.medina13@gmail.com'),
('2449', '246', '1', '4', '(512)739-5496');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2450', '246', '1', '24', 'Patient would like you to call to schedule'),
('2451', '246', '1', '26.1', 'Extraction'),
('2452', '246', '1', '26.3', 'Third Molars'),
('2453', '246', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/Medina,Liz_ExtReferral.pdf'),
('2454', '246', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/LMedina Pano.jpg'),
('2455', '246', '1', '7', 'Tiffany'),
('2456', '247', '1', '2.3', 'Elena'),
('2457', '247', '1', '2.6', 'Plant'),
('2458', '247', '1', '20.1', 'Patient is a minor'),
('2459', '247', '1', '21.3', 'Daena');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2460', '247', '1', '21.6', 'Plant'),
('2461', '247', '1', '4', '(414)795-5997'),
('2462', '247', '1', '25', 'Guardian would like you to call to schedule'),
('2463', '247', '1', '26.1', 'Extraction'),
('2464', '247', '1', '26.3', 'Third Molars'),
('2465', '247', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/EPlant Pano.jpg'),
('2466', '247', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/Plant,Elena_ExtReferral.pdf'),
('2467', '247', '1', '7', 'Tiffany'),
('2468', '248', '1', '2.3', 'Christopher'),
('2469', '248', '1', '2.6', 'Heldebrandt');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2470', '248', '1', '20.1', 'Patient is a minor'),
('2471', '248', '1', '21.3', 'Tomoe'),
('2472', '248', '1', '21.6', 'Heldebrandt'),
('2473', '248', '1', '3', 'tomoeheldebrandt@gmail.com'),
('2474', '248', '1', '4', '(512)284-3203'),
('2475', '248', '1', '25', '--- Select One ---'),
('2476', '248', '1', '26.2', 'Expose & Bond'),
('2477', '248', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/Heldebrandt,Christopher_EBCReferral.pdf'),
('2478', '248', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/CHeldebrandt Pano.jpg'),
('2479', '248', '1', '7', 'Tiffany');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2480', '249', '1', '2.3', 'Lauren'),
('2481', '249', '1', '2.6', 'Smith'),
('2482', '249', '1', '20.1', 'Patient is a minor'),
('2483', '249', '1', '21.3', 'Jennifer'),
('2484', '249', '1', '21.6', 'Smith'),
('2485', '249', '1', '3', 'bnjboxer@sbcglobal.net'),
('2486', '249', '1', '4', '(831)588-6604'),
('2487', '249', '1', '25', 'Guardian would like you to call to schedule'),
('2488', '249', '1', '26.1', 'Extraction'),
('2489', '249', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/Smith,Lauren_ExtReferral.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2490', '249', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/LSmith Pano.jpg'),
('2491', '249', '1', '7', 'Tiffany'),
('2492', '250', '1', '2.3', 'Emily'),
('2493', '250', '1', '2.6', 'Hardey'),
('2494', '250', '1', '20.1', 'Patient is a minor'),
('2495', '250', '1', '21.3', 'Kathy'),
('2496', '250', '1', '21.6', 'Hardey'),
('2497', '250', '1', '3', 'kathy.hardey@gmail.com'),
('2498', '250', '1', '4', '(512)264-1577'),
('2499', '250', '1', '25', 'Guardian would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2500', '250', '1', '26.1', 'Extraction'),
('2501', '250', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/untitled002.pdf'),
('2502', '250', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/02/EHardey Pano.jpg'),
('2503', '250', '1', '7', 'Tiffany'),
('2504', '251', '1', '2.3', 'Ian'),
('2505', '251', '1', '2.6', 'Brann'),
('2506', '251', '1', '20.1', 'Patient is a minor'),
('2507', '251', '1', '21.3', 'Christine'),
('2508', '251', '1', '21.6', 'Brann'),
('2509', '251', '1', '3', 'cmbrann@aol.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2510', '251', '1', '4', '(859)609-1895'),
('2511', '251', '1', '25', 'Guardian would like you to call to schedule'),
('2512', '251', '1', '26.1', 'Extraction'),
('2513', '251', '1', '26.9', 'Other'),
('2514', '251', '1', '6', 'Evalute tooth #10 and #11 for impaction'),
('2515', '251', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/03/Brann,Ian_ExtReferral.pdf'),
('2516', '251', '1', '7', 'Patient is already Scheduled, and added to have #J ext.'),
('2517', '252', '1', '2.3', 'Gabby'),
('2518', '252', '1', '2.6', 'Jamieson'),
('2519', '252', '1', '20.1', 'Patient is a minor');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2520', '252', '1', '21.3', 'MJ'),
('2521', '252', '1', '21.6', 'Hurt'),
('2522', '252', '1', '3', 'mjjamieson2003@yahoo.com'),
('2523', '252', '1', '4', '(404)933-9012'),
('2524', '252', '1', '25', 'Guardian would like you to call to schedule'),
('2525', '252', '1', '26.1', 'Extraction'),
('2526', '252', '1', '26.2', 'Expose & Bond'),
('2527', '252', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/03/GJamieson Pano.jpg'),
('2528', '252', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/03/Jamieson,Gabby_ExtEBCReferral.pdf'),
('2529', '252', '1', '7', 'Tiffany');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2530', '253', '1', '2.3', 'Taylor'),
('2531', '253', '1', '2.6', 'Kreps'),
('2532', '253', '1', '20.1', 'Patient is a minor'),
('2533', '253', '1', '21.3', 'Kim'),
('2534', '253', '1', '21.6', 'Kreps'),
('2535', '253', '1', '3', 'kimkreps@gmail.com'),
('2536', '253', '1', '4', '(512)663-7320'),
('2537', '253', '1', '25', 'Guardian would like you to call to schedule'),
('2538', '253', '1', '26.1', 'Extraction'),
('2539', '253', '1', '26.3', 'Third Molars');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2540', '253', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/03/Kreps,Taylor_EXTreferral.pdf'),
('2541', '253', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/03/TKreps Pano.jpg'),
('2542', '253', '1', '7', 'Tiffany'),
('2543', '254', '1', '2.3', 'Aubrey'),
('2544', '254', '1', '2.6', 'VanNiekerk'),
('2545', '254', '1', '20.1', 'Patient is a minor'),
('2546', '254', '1', '21.3', 'Claudette'),
('2547', '254', '1', '21.6', 'VanNiekerk'),
('2548', '254', '1', '3', 'claudette@truckmark.com'),
('2549', '254', '1', '4', '(858)610-4017');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2550', '254', '1', '25', 'Guardian would like you to call to schedule'),
('2551', '254', '1', '26.1', 'Extraction'),
('2552', '254', '1', '26.3', 'Third Molars'),
('2553', '254', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/03/untitled001.pdf'),
('2554', '254', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/03/AVanNiekerk Pano.jpg'),
('2555', '254', '1', '7', 'Pt is not a minor, she is 19yrs but we do not have any of her information, just mom\'s info.\r\nTiffany'),
('2556', '255', '1', '2.3', 'Amanda'),
('2557', '255', '1', '2.6', 'Reeder'),
('2558', '255', '1', '20.1', 'Patient is a minor'),
('2559', '255', '1', '21.3', 'Michele');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2560', '255', '1', '21.6', 'Reeder'),
('2561', '255', '1', '3', 'michele.reeder@gmail.com'),
('2562', '255', '1', '4', '(512)266-6319'),
('2563', '255', '1', '25', 'Guardian would like you to call to schedule'),
('2564', '255', '1', '26.1', 'Extraction'),
('2565', '255', '1', '26.2', 'Expose & Bond'),
('2566', '255', '1', '26.3', 'Third Molars'),
('2567', '255', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/03/AReeder Pano.jpg'),
('2568', '255', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/03/Reeder.pdf'),
('2569', '255', '1', '7', 'Tiffany');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2570', '256', '1', '2.3', 'Gabby'),
('2571', '256', '1', '2.6', 'Young'),
('2572', '256', '1', '20.1', 'Patient is a minor'),
('2573', '256', '1', '21.3', 'Monica'),
('2574', '256', '1', '21.6', 'Goulding-Young'),
('2575', '256', '1', '3', 'mogoyo42@sbcglobal.net'),
('2576', '256', '1', '4', '(512)674-5379'),
('2577', '256', '1', '25', 'Guardian would like you to call to schedule'),
('2578', '256', '1', '26.1', 'Extraction'),
('2579', '256', '1', '26.3', 'Third Molars');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2580', '256', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/03/untitled002.pdf'),
('2581', '256', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/03/GYoung Pano.jpg'),
('2582', '256', '1', '7', 'Tiffany'),
('2583', '257', '1', '2.3', 'Alex '),
('2584', '257', '1', '2.6', 'Shelton'),
('2585', '257', '1', '20.1', 'Patient is a minor'),
('2586', '257', '1', '21.3', 'Caroline'),
('2587', '257', '1', '21.6', 'Shelton'),
('2588', '257', '1', '3', 'caroline1025@sbcglobal.net'),
('2589', '257', '1', '4', '(512)739-0882');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2590', '257', '1', '25', 'Guardian would like you to call to schedule'),
('2591', '257', '1', '26.1', 'Extraction'),
('2592', '257', '1', '26.3', 'Third Molars'),
('2593', '257', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/03/ASheltonPano.jpg'),
('2594', '257', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/03/Shelton,Alex_Extreferral.pdf'),
('2595', '257', '1', '7', 'Roxanne Kline'),
('2596', '258', '1', '2.3', 'Brittany'),
('2597', '258', '1', '2.6', 'Grander'),
('2598', '258', '1', '20.1', 'Patient is a minor'),
('2599', '258', '1', '21.3', 'Catherine');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2600', '258', '1', '21.6', 'Vance'),
('2601', '258', '1', '3', 'mscathyswimaustin@gmail.com'),
('2602', '258', '1', '4', '(512)263-7813'),
('2603', '258', '1', '25', '--- Select One ---'),
('2604', '258', '1', '26.1', 'Extraction'),
('2605', '258', '1', '26.3', 'Third Molars'),
('2606', '258', '1', '26.4', 'Implant'),
('2607', '258', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/Grander,Brittany_ExtReferral.pdf'),
('2608', '258', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/BGrander Pano.jpg'),
('2609', '258', '1', '7', 'please call with any questions\r\nTiffany');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2610', '259', '1', '2.3', 'Carolyn'),
('2611', '259', '1', '2.6', 'Wheat'),
('2612', '259', '1', '24', '--- Select One ---'),
('2613', '259', '1', '26.1', 'Extraction'),
('2614', '259', '1', '26.4', 'Implant'),
('2615', '259', '1', '10.12', '11'),
('2616', '259', '1', '10.13', '12'),
('2617', '259', '1', '10.14', '13'),
('2618', '259', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/0_.jpg'),
('2619', '259', '1', '7', 'Pano was taken at Dr. Gary Crozier\'s office on 1-14-3013.  ');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2620', '260', '1', '2.3', 'Taylor'),
('2621', '260', '1', '2.6', 'Trascher'),
('2622', '260', '1', '20.1', 'Patient is a minor'),
('2623', '260', '1', '21.3', 'Zola'),
('2624', '260', '1', '21.6', 'Trascher'),
('2625', '260', '1', '3', 'zolarn@gmail.com'),
('2626', '260', '1', '4', '(512)423-4216'),
('2627', '260', '1', '25', 'Guardian would like you to call to schedule'),
('2628', '260', '1', '26.2', 'Expose & Bond'),
('2629', '260', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/Taylor Trascher Pano.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2630', '260', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/Trasher,Taylor_EBCreferral.pdf'),
('2631', '260', '1', '7', 'Roxanne Kline'),
('2632', '261', '1', '2.3', 'test '),
('2633', '261', '1', '2.6', 'test'),
('2634', '261', '1', '3', 'drjalfordoms@yahoo.com'),
('2635', '261', '1', '4', '(214)450-3800'),
('2636', '261', '1', '24', 'Patient would like you to call to schedule'),
('2637', '261', '1', '26.4', 'Implant'),
('2638', '261', '1', '10.5', '5'),
('2639', '262', '1', '2.3', 'Austin');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2640', '262', '1', '2.6', 'Tilley'),
('2641', '262', '1', '20.1', 'Patient is a minor'),
('2642', '262', '1', '21.3', 'Laura'),
('2643', '262', '1', '21.6', 'Tilley'),
('2644', '262', '1', '3', 'tilley5@me.com'),
('2645', '262', '1', '4', '(480)612-3079'),
('2646', '262', '1', '25', 'Guardian would like you to call to schedule'),
('2647', '262', '1', '26.1', 'Extraction'),
('2648', '262', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/Tilley,Austin_ExtReferral.pdf'),
('2649', '262', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/ATilley Pano.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2650', '262', '1', '7', 'Please call with any questions!\r\nTiffany'),
('2651', '263', '1', '2.3', 'Abby'),
('2652', '263', '1', '2.6', 'Weidenbach'),
('2653', '263', '1', '3', 'weidenbach.abby@gmail.com'),
('2654', '263', '1', '4', '(979)595-5271'),
('2655', '263', '1', '24', 'Patient would like you to call to schedule'),
('2656', '263', '1', '26.1', 'Extraction'),
('2657', '263', '1', '26.3', 'Third Molars'),
('2658', '263', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/AWeidenbach Pano.jpg'),
('2659', '263', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/Weidenbach,Abby_ExtReferral.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2660', '263', '1', '7', 'Tiffany'),
('2661', '264', '1', '2.3', 'Erika'),
('2662', '264', '1', '2.6', 'Hoffert'),
('2663', '264', '1', '20.1', 'Patient is a minor'),
('2664', '264', '1', '21.3', 'Rosemary'),
('2665', '264', '1', '21.6', 'Hoffert'),
('2666', '264', '1', '3', 'rosemary.hoffert@freescale.com'),
('2667', '264', '1', '4', '(512)914-4395'),
('2668', '264', '1', '25', 'Guardian would like you to call to schedule'),
('2669', '264', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2670', '264', '1', '26.3', 'Third Molars'),
('2671', '264', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/Hoffert,Erika_ExtReferral.pdf'),
('2672', '264', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/EHoffert Pano.jpg'),
('2673', '264', '1', '7', 'Tiffany'),
('2674', '265', '1', '2.3', 'Marshall'),
('2675', '265', '1', '2.6', 'Gregg'),
('2676', '265', '1', '20.1', 'Patient is a minor'),
('2677', '265', '1', '21.3', 'Jodi'),
('2678', '265', '1', '21.6', 'Gregg'),
('2679', '265', '1', '3', 'jodi@jodigregg.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2680', '265', '1', '4', '(512)228-9500'),
('2681', '265', '1', '25', 'Guardian would like you to call to schedule'),
('2682', '265', '1', '26.1', 'Extraction'),
('2683', '265', '1', '26.3', 'Third Molars'),
('2684', '265', '1', '26.9', 'Other'),
('2685', '265', '1', '6', 'expose and luxate tooth #31'),
('2686', '265', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/MGregg Pano.jpg'),
('2687', '265', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/Gregg,Marshall_ExtEBCreferral.pdf'),
('2688', '265', '1', '7', 'Please call with any questions\r\nTiffany'),
('2689', '266', '1', '2.3', 'Sabrina ');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2690', '266', '1', '2.6', 'Savoie'),
('2691', '266', '1', '20.1', 'Patient is a minor'),
('2692', '266', '1', '21.3', 'Jodi'),
('2693', '266', '1', '21.6', 'Savoie'),
('2694', '266', '1', '3', 'genesavoie@gmail.com'),
('2695', '266', '1', '4', '(973)876-8098'),
('2696', '266', '1', '25', 'Guardian would like you to call to schedule'),
('2697', '266', '1', '26.1', 'Extraction'),
('2698', '266', '1', '26.3', 'Third Molars'),
('2699', '266', '1', '26.5', 'All-On-4™');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2700', '266', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/Savoie,Sabrina_ExtReferral.pdf'),
('2701', '266', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/SSavoie Pano.jpg'),
('2702', '266', '1', '7', 'Tiffany'),
('2703', '267', '1', '2.3', 'Kelsey'),
('2704', '267', '1', '2.6', 'Boulter'),
('2705', '267', '1', '20.1', 'Patient is a minor'),
('2706', '267', '1', '21.3', 'Shelly'),
('2707', '267', '1', '21.6', 'Boulter'),
('2708', '267', '1', '4', '(512)695-5111'),
('2709', '267', '1', '25', 'Guardian would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2710', '267', '1', '26.1', 'Extraction'),
('2711', '267', '1', '26.3', 'Third Molars'),
('2712', '267', '1', '26.9', 'Other'),
('2713', '267', '1', '6', 'ext of supernumerary teeth #2, 19, 20 and 28'),
('2714', '267', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/KBoulter Pano.jpg'),
('2715', '267', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/Boulter,Kelsey_ExtReferral.pdf'),
('2716', '267', '1', '7', 'Tiffany'),
('2717', '268', '1', '2.3', 'Kenneth '),
('2718', '268', '1', '2.6', 'Moore'),
('2719', '268', '1', '24', '--- Select One ---');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2720', '268', '1', '26.4', 'Implant'),
('2721', '268', '1', '10.13', '12'),
('2722', '268', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/04/MooreK4-23-13.JPG'),
('2723', '269', '1', '2.3', 'Donna '),
('2724', '269', '1', '2.6', 'Laufman'),
('2725', '269', '1', '24', '--- Select One ---'),
('2726', '269', '1', '26.1', 'Extraction'),
('2727', '269', '1', '26.4', 'Implant'),
('2728', '269', '1', '11.3', '30'),
('2729', '269', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/05/23_.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2730', '269', '1', '7', 'Please Extract #30 and evaluate for implant'),
('2731', '270', '1', '2.3', 'Josh'),
('2732', '270', '1', '2.6', 'Phillips'),
('2733', '270', '1', '20.1', 'Patient is a minor'),
('2734', '270', '1', '21.3', 'Wendra'),
('2735', '270', '1', '21.6', 'Phillips'),
('2736', '270', '1', '3', 'wendra.phillips@abtexasnsa.com'),
('2737', '270', '1', '4', '(830)798-5257'),
('2738', '270', '1', '25', 'Guardian would like you to call to schedule'),
('2739', '270', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2740', '270', '1', '26.3', 'Third Molars'),
('2741', '270', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/05/Josh Phillips Pano.jpg'),
('2742', '270', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/05/Phillips,Josh_ExtReferral2.pdf'),
('2743', '271', '1', '2.3', 'Alexandra'),
('2744', '271', '1', '2.6', 'Muchinsky'),
('2745', '271', '1', '3', 'amuchinsky@austin.rr.com'),
('2746', '271', '1', '4', '(512)217-8313'),
('2747', '271', '1', '24', 'Patient would like you to call to schedule'),
('2748', '271', '1', '26.1', 'Extraction'),
('2749', '271', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/05/Muchinsky,Alexandra_Pano052113.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2750', '271', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/05/Muchinsky,Alexandra_Extreferral.pdf'),
('2751', '272', '1', '2.3', 'Dulce'),
('2752', '272', '1', '2.6', 'Aguilar'),
('2753', '272', '1', '3', 'daguilar@cwa-tseu.org'),
('2754', '272', '1', '4', '(512)507-0056'),
('2755', '272', '1', '24', 'Patient would like you to call to schedule'),
('2756', '272', '1', '26.1', 'Extraction'),
('2757', '272', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/05/Aguilar,Dulce_Extreferral.pdf'),
('2758', '272', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/05/Aguilar,Dulce_Pano052113.jpg'),
('2759', '273', '1', '2.3', 'Kate');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2760', '273', '1', '2.6', 'Sumner'),
('2761', '273', '1', '20.1', 'Patient is a minor'),
('2762', '273', '1', '21.3', 'Laura'),
('2763', '273', '1', '21.6', 'Sumner'),
('2764', '273', '1', '3', 'lsumner@austin.rr.com'),
('2765', '273', '1', '4', '(512)736-1622'),
('2766', '273', '1', '25', 'Guardian would like you to call to schedule'),
('2767', '273', '1', '26.1', 'Extraction'),
('2768', '273', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/05/Sumner,Kate_Extreferral.pdf'),
('2769', '273', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/05/Sumner,Kate_Pano010713.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2770', '274', '1', '2.3', 'Ty'),
('2771', '274', '1', '2.6', 'Richards'),
('2772', '274', '1', '3', 'me@tyrichards.com'),
('2773', '274', '1', '4', '(817)291-2608'),
('2774', '274', '1', '24', '--- Select One ---'),
('2775', '274', '1', '26.1', 'Extraction'),
('2776', '274', '1', '9.5', 'P'),
('2777', '274', '1', '9.6', 'O'),
('2778', '274', '1', '7', 'testing testing'),
('2779', '275', '1', '2.3', 'Hunter');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2780', '275', '1', '2.6', 'McVey'),
('2781', '275', '1', '20.1', 'Patient is a minor'),
('2782', '275', '1', '21.3', 'Chantal'),
('2783', '275', '1', '21.6', 'Elliott'),
('2784', '275', '1', '3', 'chantalelliott@gmail.com'),
('2785', '275', '1', '4', '(512)550-3334'),
('2786', '275', '1', '25', 'Guardian would like you to call to schedule'),
('2787', '275', '1', '26.1', 'Extraction'),
('2788', '275', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/05/McVey,Hunter_Extreferral.pdf'),
('2789', '275', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/05/McVey,Hunter_Pano81612.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2790', '276', '1', '2.3', 'Hadley'),
('2791', '276', '1', '2.6', 'McCormick'),
('2792', '276', '1', '20.1', 'Patient is a minor'),
('2793', '276', '1', '21.3', 'Lei'),
('2794', '276', '1', '21.6', 'McCormick'),
('2795', '276', '1', '3', 'rmccormick@austin.rr.com'),
('2796', '276', '1', '4', '(512)470-9967'),
('2797', '276', '1', '25', 'Guardian would like you to call to schedule'),
('2798', '276', '1', '26.1', 'Extraction'),
('2799', '276', '1', '26.2', 'Expose & Bond');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2800', '276', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/McCormick,Hadley_Extreferral.pdf'),
('2801', '276', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/McCormick,Hadley_Pano060313.jpg'),
('2802', '277', '1', '2.3', 'Coby'),
('2803', '277', '1', '2.6', 'Chimene'),
('2804', '277', '1', '3', 'secure@chimene.com'),
('2805', '277', '1', '4', '(832)326-2317'),
('2806', '277', '1', '24', 'Patient would like you to call to schedule'),
('2807', '277', '1', '26.2', 'Expose & Bond'),
('2808', '277', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/Chimene,Coby_Pano121712.jpg'),
('2809', '277', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/Chimene,Coby_EBCReferral.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2810', '278', '1', '2.3', 'Victoria'),
('2811', '278', '1', '2.6', 'Suss'),
('2812', '278', '1', '20.1', 'Patient is a minor'),
('2813', '278', '1', '21.3', 'Lisa'),
('2814', '278', '1', '21.6', 'Suss'),
('2815', '278', '1', '3', 'lisasuss@gmail.com'),
('2816', '278', '1', '4', '(512)266-3090'),
('2817', '278', '1', '25', 'Guardian would like you to call to schedule'),
('2818', '278', '1', '26.1', 'Extraction'),
('2819', '278', '1', '26.2', 'Expose & Bond');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2820', '278', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/Suss,Victoria_Pano02062013.jpg'),
('2821', '278', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/Suss,Victoria_EBCExtReferral.pdf'),
('2822', '278', '1', '7', 'Mom has concerns about insurance.'),
('2823', '279', '1', '2.3', 'Brack'),
('2824', '279', '1', '2.6', 'Davies'),
('2825', '279', '1', '20.1', 'Patient is a minor'),
('2826', '279', '1', '21.3', 'Julie'),
('2827', '279', '1', '21.6', 'Oliver'),
('2828', '279', '1', '3', 'julie.oliver@stdavids.com'),
('2829', '279', '1', '4', '(512)506-0102');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2830', '279', '1', '25', 'Guardian would like you to call to schedule'),
('2831', '279', '1', '26.1', 'Extraction'),
('2832', '279', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/Davies,Brack_Extreferral.pdf'),
('2833', '279', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/Davies,Brack_Pano06102013.jpg'),
('2834', '280', '1', '2.3', 'Brian'),
('2835', '280', '1', '2.6', 'Mulligan'),
('2836', '280', '1', '20.1', 'Patient is a minor'),
('2837', '280', '1', '21.3', 'Kirsten'),
('2838', '280', '1', '21.6', 'Mulligan'),
('2839', '280', '1', '3', 'kirstenmulligan@yahoo.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2840', '280', '1', '4', '(512)497-7190'),
('2841', '280', '1', '25', 'Guardian would like you to call to schedule'),
('2842', '280', '1', '26.1', 'Extraction'),
('2843', '280', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/Mulligan,Brian_Extreferral.pdf'),
('2844', '280', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/Mulligan,Brian_Pano06102013.jpg'),
('2845', '281', '1', '2.3', 'Maia'),
('2846', '281', '1', '2.6', 'Courtois'),
('2847', '281', '1', '20.1', 'Patient is a minor'),
('2848', '281', '1', '21.3', 'Peter'),
('2849', '281', '1', '21.6', 'Courtois');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2850', '281', '1', '3', 'pcourtois@austin.rr.com'),
('2851', '281', '1', '4', '(402)321-4828'),
('2852', '281', '1', '25', 'Guardian would like you to call to schedule'),
('2853', '281', '1', '26.1', 'Extraction'),
('2854', '281', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/Panoramic X-Ray_Courtois.jpg'),
('2855', '281', '1', '7', 'Hi guys, \r\nWe would like tooth numbers 4 and 13 out for orthodontics. Dad is interested in having wisdom teeth removed at same time. Dad also interested in Maia having jaw surgery but Dr. Dykes does n'),
('2856', '282', '1', '2.3', 'Juan'),
('2857', '282', '1', '2.6', 'De Haro'),
('2858', '282', '1', '20.1', 'Patient is a minor'),
('2859', '282', '1', '21.3', 'Laura');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2860', '282', '1', '21.6', 'De Haro'),
('2861', '282', '1', '3', 'lauradeharo@yahoo.com'),
('2862', '282', '1', '4', '(512)484-5919'),
('2863', '282', '1', '25', 'Guardian would like you to call to schedule'),
('2864', '282', '1', '26.3', 'Third Molars'),
('2865', '282', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/DeHaro,Juan_Extreferral.pdf'),
('2866', '282', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/DeHaro,Juan_Pano08212012.jpg'),
('2867', '283', '1', '2.3', 'Catherine'),
('2868', '283', '1', '2.6', 'Johnson'),
('2869', '283', '1', '20.1', 'Patient is a minor');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2870', '283', '1', '21.3', 'Helen'),
('2871', '283', '1', '21.6', 'Johnson'),
('2872', '283', '1', '3', 'hcaroljohnson@hotmail.com'),
('2873', '283', '1', '4', '(650)743-1797'),
('2874', '283', '1', '25', 'Guardian would like you to call to schedule'),
('2875', '283', '1', '26.3', 'Third Molars'),
('2876', '283', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/Johnson,Catherine_Extreferral.pdf'),
('2877', '283', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/Johnson,Catherine_Pano06112013.jpg'),
('2878', '284', '1', '2.3', 'Nathan'),
('2879', '284', '1', '2.6', 'Johnson');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2880', '284', '1', '20.1', 'Patient is a minor'),
('2881', '284', '1', '21.3', 'Helen'),
('2882', '284', '1', '21.6', 'Johnson'),
('2883', '284', '1', '3', 'hcaroljohnson@hotmail.com'),
('2884', '284', '1', '4', '(650)743-1797'),
('2885', '284', '1', '25', 'Guardian would like you to call to schedule'),
('2886', '284', '1', '26.3', 'Third Molars'),
('2887', '284', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/Johnson,Nathan_Extreferral.pdf'),
('2888', '284', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/Johnson,Nathan_Pano062812.jpg'),
('2889', '285', '1', '2.3', 'Marcus');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2890', '285', '1', '2.6', 'Rose'),
('2891', '285', '1', '24', '--- Select One ---'),
('2892', '285', '1', '26.1', 'Extraction'),
('2893', '285', '1', '26.4', 'Implant'),
('2894', '285', '1', '11.8', '25'),
('2895', '285', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/25_.jpg'),
('2896', '285', '1', '7', 'Periodontal abcess #25, please extract and evaluate for implant'),
('2897', '286', '1', '2.3', 'Shannan'),
('2898', '286', '1', '2.6', 'Buchholz'),
('2899', '286', '1', '4', '(361)935-8561');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2900', '286', '1', '24', 'Patient would like you to call to schedule'),
('2901', '286', '1', '26.1', 'Extraction'),
('2902', '286', '1', '26.4', 'Implant'),
('2903', '286', '1', '11.16', '18'),
('2904', '286', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/24_.jpg'),
('2905', '286', '1', '7', 'Please ext #18 and evaluate for implant'),
('2906', '287', '1', '2.3', 'Katherine'),
('2907', '287', '1', '2.6', 'Becerra'),
('2908', '287', '1', '24', 'Patient does not want to be contacted'),
('2909', '287', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2910', '287', '1', '10.1', '1'),
('2911', '287', '1', '10.17', '16'),
('2912', '287', '1', '11.1', '32'),
('2913', '287', '1', '11.17', '17'),
('2914', '287', '1', '7', 'Pt will call to schedule.  Please extract all 3rds'),
('2915', '288', '1', '2.3', 'Dede '),
('2916', '288', '1', '2.6', 'Hebert'),
('2917', '288', '1', '4', '(512)291-0805'),
('2918', '288', '1', '24', 'Patient would like you to call to schedule'),
('2919', '288', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2920', '288', '1', '26.4', 'Implant'),
('2921', '288', '1', '10.15', '14'),
('2922', '288', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/D hebert PA.psd'),
('2923', '288', '1', '7', '#14 - non restorable by endodontist consult. ext and implant consult'),
('2924', '289', '1', '2.3', 'Carol'),
('2925', '289', '1', '2.6', 'Farrell'),
('2926', '289', '1', '3', 'cfarrell@nuventix.com'),
('2927', '289', '1', '4', '(512)413-4812'),
('2928', '289', '1', '24', '--- Select One ---'),
('2929', '289', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2930', '289', '1', '26.4', 'Implant'),
('2931', '289', '1', '10.14', '13'),
('2932', '290', '1', '2.3', 'clayton'),
('2933', '290', '1', '2.6', 'matthews'),
('2934', '290', '1', '4', '(817)525-0474'),
('2935', '290', '1', '24', 'Patient would like you to call to schedule'),
('2936', '290', '1', '26.1', 'Extraction'),
('2937', '290', '1', '26.4', 'Implant'),
('2938', '290', '1', '10.1', '1'),
('2939', '290', '1', '10.17', '16');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2940', '290', '1', '11.1', '32'),
('2941', '290', '1', '11.15', '19'),
('2942', '290', '1', '11.17', '17'),
('2943', '290', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/06/c. matthews.jpg'),
('2944', '290', '1', '7', 'ext wisdom teeth and #19 ext with implant consult'),
('2945', '291', '1', '2.3', 'Susan'),
('2946', '291', '1', '2.6', 'Empoliti'),
('2947', '291', '1', '24', '--- Select One ---'),
('2948', '291', '1', '26.1', 'Extraction'),
('2949', '291', '1', '26.4', 'Implant');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2950', '291', '1', '10.14', '13'),
('2951', '291', '1', '11.15', '19'),
('2952', '291', '1', '11.16', '18'),
('2953', '292', '1', '2.3', 'Madison'),
('2954', '292', '1', '2.6', 'Gavin'),
('2955', '292', '1', '20.1', 'Patient is a minor'),
('2956', '292', '1', '21.3', 'Michelle'),
('2957', '292', '1', '21.6', 'Gavin'),
('2958', '292', '1', '3', 'mgavin.art@gmail.com'),
('2959', '292', '1', '4', '(512)507-7536');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2960', '292', '1', '25', 'Guardian would like you to call to schedule'),
('2961', '292', '1', '26.1', 'Extraction'),
('2962', '292', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Gavin,Madison_Extreferral.pdf'),
('2963', '292', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Gavin,Madison_Pano070213.jpg'),
('2964', '293', '1', '2.3', 'Ian'),
('2965', '293', '1', '2.6', 'Siek'),
('2966', '293', '1', '20.1', 'Patient is a minor'),
('2967', '293', '1', '21.3', 'Debra'),
('2968', '293', '1', '21.6', 'Siek'),
('2969', '293', '1', '3', 'dazekes@aol.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2970', '293', '1', '4', '(719)332-6167'),
('2971', '293', '1', '25', 'Guardian would like you to call to schedule'),
('2972', '293', '1', '26.3', 'Third Molars'),
('2973', '293', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Siek,Ian_Extreferral.pdf'),
('2974', '293', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Siek,Ian_Pano070213.jpg'),
('2975', '294', '1', '2.3', 'Madeline'),
('2976', '294', '1', '2.6', 'Orr'),
('2977', '294', '1', '20.1', 'Patient is a minor'),
('2978', '294', '1', '21.3', 'Christy'),
('2979', '294', '1', '21.6', 'Orr');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2980', '294', '1', '3', 'christyorr99@gmail.com'),
('2981', '294', '1', '4', '(512)922-9210'),
('2982', '294', '1', '25', 'Guardian would like you to call to schedule'),
('2983', '294', '1', '26.3', 'Third Molars'),
('2984', '294', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Orr,Madeline_Extreferral.pdf'),
('2985', '294', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Orr,Madeline_Pano070313.jpg'),
('2986', '295', '1', '2.3', 'Caroline'),
('2987', '295', '1', '2.6', 'Gilmore'),
('2988', '295', '1', '20.1', 'Patient is a minor'),
('2989', '295', '1', '21.3', 'Valerie');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('2990', '295', '1', '21.6', 'Gilmore'),
('2991', '295', '1', '3', 'jeg1964@yahoo.com'),
('2992', '295', '1', '4', '(512)436-6850'),
('2993', '295', '1', '25', 'Guardian would like you to call to schedule'),
('2994', '295', '1', '26.9', 'Other'),
('2995', '295', '1', '6', 'Evaluate for the position and development of tooth # 1 and 2.'),
('2996', '295', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Gilmore,Caroline_Pano070913.jpg'),
('2997', '295', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Gilmore,Caroline_TxReferral.pdf'),
('2998', '296', '1', '2.3', 'Danielle'),
('2999', '296', '1', '2.6', 'Siek');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3000', '296', '1', '3', 'dazekes@aol.com'),
('3001', '296', '1', '4', '(719)332-6167'),
('3002', '296', '1', '24', 'Patient would like you to call to schedule'),
('3003', '296', '1', '26.1', 'Extraction'),
('3004', '296', '1', '26.3', 'Third Molars'),
('3005', '296', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/DSiek Pano.jpg'),
('3006', '296', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Siek,Dani_ExtRefereral.pdf'),
('3007', '296', '1', '7', 'Tiffany'),
('3008', '297', '1', '2.3', 'Lindsey'),
('3009', '297', '1', '2.6', 'Baranauskas');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3010', '297', '1', '20.1', 'Patient is a minor'),
('3011', '297', '1', '21.3', 'Tiffany'),
('3012', '297', '1', '21.6', 'Baranauskas'),
('3013', '297', '1', '3', 'tbaranauskas@austin.rr.com'),
('3014', '297', '1', '4', '(512)635-3074'),
('3015', '297', '1', '25', 'Guardian would like you to call to schedule'),
('3016', '297', '1', '26.1', 'Extraction'),
('3017', '297', '1', '10.5', '5'),
('3018', '297', '1', '10.13', '12'),
('3019', '297', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Baranauskas,Lindsey_ExtreferralAlford.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3020', '297', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Baranauskas,Lindsey_Pano071013.jpg'),
('3021', '298', '1', '2.3', 'Jake'),
('3022', '298', '1', '2.6', 'Hicks'),
('3023', '298', '1', '20.1', 'Patient is a minor'),
('3024', '298', '1', '21.3', 'Andy'),
('3025', '298', '1', '21.6', 'Hicks'),
('3026', '298', '1', '3', 'hicksbiga@sbcglobal.net'),
('3027', '298', '1', '4', '(512)797-7767'),
('3028', '298', '1', '25', 'Guardian would like you to call to schedule'),
('3029', '298', '1', '26.3', 'Third Molars');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3030', '298', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Hicks,Jake_Extreferral.pdf'),
('3031', '298', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Hicks,Jake_Pano071013.jpg'),
('3032', '299', '1', '2.3', 'steve '),
('3033', '299', '1', '2.6', 'williams'),
('3034', '299', '1', '3', 'sbwilliams@austin.rr.com'),
('3035', '299', '1', '4', '(512)298-8508'),
('3036', '299', '1', '24', 'Patient does not want to be contacted'),
('3037', '299', '1', '26.1', 'Extraction'),
('3038', '299', '1', '26.4', 'Implant'),
('3039', '299', '1', '11.16', '18');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3040', '299', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/S williams.jpg'),
('3041', '299', '1', '7', 'ext and implant consult. pt will call you to schedule'),
('3042', '300', '1', '2.3', 'Hannah'),
('3043', '300', '1', '2.6', 'Sherry'),
('3044', '300', '1', '20.1', 'Patient is a minor'),
('3045', '300', '1', '21.3', 'Danielle'),
('3046', '300', '1', '21.6', 'Sherry'),
('3047', '300', '1', '3', '4sherrys@att.net'),
('3048', '300', '1', '4', '(512)368-5330'),
('3049', '300', '1', '25', 'Guardian would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3050', '300', '1', '26.1', 'Extraction'),
('3051', '300', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Sherry,Hannah_ExtReferral.pdf'),
('3052', '300', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/HSherry Pano.jpg'),
('3053', '300', '1', '7', ': ) Tiffany'),
('3054', '301', '1', '2.3', 'Jolie'),
('3055', '301', '1', '2.6', 'Nguyen'),
('3056', '301', '1', '4', '(512)698-5309'),
('3057', '301', '1', '24', 'Patient would like you to call to schedule'),
('3058', '301', '1', '26.1', 'Extraction'),
('3059', '301', '1', '26.3', 'Third Molars');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3060', '301', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Nguyen,Jolie_ExtReferral.pdf'),
('3061', '301', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/JNguyen Pano.jpg'),
('3062', '301', '1', '7', 'We do not have an email on file for mom or patient and the number given is for mom. Her name is Vickie and the last pano was taken in 2011. '),
('3063', '302', '1', '2.3', 'Cassidy'),
('3064', '302', '1', '2.6', 'Ehrie'),
('3065', '302', '1', '20.1', 'Patient is a minor'),
('3066', '302', '1', '21.3', 'Mina'),
('3067', '302', '1', '21.6', 'Ehrie'),
('3068', '302', '1', '3', 'ehrie1@mac.com'),
('3069', '302', '1', '4', '(512)529-7960');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3070', '302', '1', '25', 'Guardian would like you to call to schedule'),
('3071', '302', '1', '26.1', 'Extraction'),
('3072', '302', '1', '10.5', '5'),
('3073', '302', '1', '10.13', '12'),
('3074', '302', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Ehrie,Cassidy_ExtReferral.pdf'),
('3075', '302', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Ehrie,Cassidy_Pano071813.jpg'),
('3076', '303', '1', '2.3', 'Aidan'),
('3077', '303', '1', '2.6', 'O\'Toole'),
('3078', '303', '1', '20.1', 'Patient is a minor'),
('3079', '303', '1', '21.3', 'Dale');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3080', '303', '1', '21.6', 'O\'Toole'),
('3081', '303', '1', '3', 'otooles97@gmail.com'),
('3082', '303', '1', '4', '(512)925-4297'),
('3083', '303', '1', '25', 'Guardian would like you to call to schedule'),
('3084', '303', '1', '26.3', 'Third Molars'),
('3085', '303', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Otoole,Aidan_ExtReferral.pdf'),
('3086', '303', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Otoole,Aidan_Pano071813.jpg'),
('3087', '304', '1', '2.3', 'anne'),
('3088', '304', '1', '2.6', 'Clay'),
('3089', '304', '1', '3', 'annieclay@gmail.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3090', '304', '1', '4', '(817)798-6090'),
('3091', '304', '1', '24', '--- Select One ---'),
('3092', '304', '1', '26.4', 'Implant'),
('3093', '304', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/A Clay PA.jpg'),
('3094', '304', '1', '7', 'Dr Rydel has been talking with Dr Alford about a cone beam x ray and a free implant consult'),
('3095', '305', '1', '2.3', 'Kathryn'),
('3096', '305', '1', '2.6', 'Gilliam'),
('3097', '305', '1', '20.1', 'Patient is a minor'),
('3098', '305', '1', '21.3', 'Bonnie'),
('3099', '305', '1', '21.6', 'Gilliam');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3100', '305', '1', '3', 'bonniegilliam@yahoo.com'),
('3101', '305', '1', '4', '(512)419-8702'),
('3102', '305', '1', '25', '--- Select One ---'),
('3103', '305', '1', '26.3', 'Third Molars'),
('3104', '305', '1', '10.1', '1'),
('3105', '305', '1', '11.1', '32'),
('3106', '305', '1', '11.17', '17'),
('3107', '305', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Gilliam,Kathryn_Extreferral.pdf'),
('3108', '305', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Gilliam,Kathryn_Pano041712.jpg'),
('3109', '306', '1', '2.3', 'Brett');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3110', '306', '1', '2.6', 'Harris'),
('3111', '306', '1', '20.1', 'Patient is a minor'),
('3112', '306', '1', '21.3', 'Kim'),
('3113', '306', '1', '21.6', 'Harris'),
('3114', '306', '1', '3', 'kimharris2121@gmail.com'),
('3115', '306', '1', '4', '(512)423-7729'),
('3116', '306', '1', '25', '--- Select One ---'),
('3117', '306', '1', '26.3', 'Third Molars'),
('3118', '306', '1', '10.1', '1'),
('3119', '306', '1', '10.17', '16');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3120', '306', '1', '11.1', '32'),
('3121', '306', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Harris,Brett_Extreferral.pdf'),
('3122', '306', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Harris,Brett_Pano072213.jpg'),
('3123', '307', '1', '2.3', 'alex'),
('3124', '307', '1', '2.6', 'vovk'),
('3125', '307', '1', '4', '(512)573-0202'),
('3126', '307', '1', '24', '--- Select One ---'),
('3127', '307', '1', '26.1', 'Extraction'),
('3128', '307', '1', '26.4', 'Implant'),
('3129', '307', '1', '10.1', '1');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3130', '307', '1', '10.4', '4'),
('3131', '307', '1', '10.5', '5'),
('3132', '307', '1', '10.17', '16'),
('3133', '307', '1', '11.16', '18'),
('3134', '307', '1', '11.17', '17'),
('3135', '307', '1', '7', 'ext # 1, 16, 17, 18 and implant consult for #4 and 5'),
('3136', '308', '1', '2.3', 'Diego'),
('3137', '308', '1', '2.6', 'Guerrero'),
('3138', '308', '1', '20.1', 'Patient is a minor'),
('3139', '308', '1', '21.3', 'Lorerna');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3140', '308', '1', '21.6', 'Masferrer'),
('3141', '308', '1', '3', 'loremas2003@yahoo.com'),
('3142', '308', '1', '4', '(512)944-2269'),
('3143', '308', '1', '25', '--- Select One ---'),
('3144', '308', '1', '26.9', 'Other'),
('3145', '308', '1', '6', 'Please evaluate the prognosis of tooth #2.'),
('3146', '308', '1', '10.2', '2'),
('3147', '308', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Guerrero,Diego_Evalprognosisreferral.pdf'),
('3148', '308', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Guerrero,Diego_Pano072313.jpg'),
('3149', '309', '1', '2.3', 'Wynne');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3150', '309', '1', '2.6', 'Grafton'),
('3151', '309', '1', '20.1', 'Patient is a minor'),
('3152', '309', '1', '21.3', 'Stacy'),
('3153', '309', '1', '21.6', 'Grafton'),
('3154', '309', '1', '3', 'stacygrafton@yahoo.com'),
('3155', '309', '1', '4', '(512)401-7248'),
('3156', '309', '1', '25', 'Guardian would like you to call to schedule'),
('3157', '309', '1', '26.1', 'Extraction'),
('3158', '309', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/WGrafton Pano.jpg'),
('3159', '309', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Grafton,Wynne_ExtReferral.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3160', '310', '1', '2.3', 'Christian'),
('3161', '310', '1', '2.6', 'Proulx'),
('3162', '310', '1', '20.1', 'Patient is a minor'),
('3163', '310', '1', '21.3', 'Stacy'),
('3164', '310', '1', '21.6', 'Proulx'),
('3165', '310', '1', '3', 'stacyproulx@yahoo.com'),
('3166', '310', '1', '4', '(612)220-3971'),
('3167', '310', '1', '25', '--- Select One ---'),
('3168', '310', '1', '26.1', 'Extraction'),
('3169', '310', '1', '10.1', '1');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3170', '310', '1', '10.5', '5'),
('3171', '310', '1', '10.13', '12'),
('3172', '310', '1', '10.17', '16'),
('3173', '310', '1', '11.1', '32'),
('3174', '310', '1', '11.5', '28'),
('3175', '310', '1', '11.13', '21'),
('3176', '310', '1', '11.17', '17'),
('3177', '310', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Proulx,Christian_ExtReferral.pdf'),
('3178', '310', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Proulx,Christian_Pano071713.jpg'),
('3179', '311', '1', '2.3', 'Temple');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3180', '311', '1', '2.6', 'Davies'),
('3181', '311', '1', '20.1', 'Patient is a minor'),
('3182', '311', '1', '21.3', 'Julie'),
('3183', '311', '1', '21.6', 'Oliver'),
('3184', '311', '1', '3', 'julie.oliver@stdavids.com'),
('3185', '311', '1', '4', '(512)506-0102'),
('3186', '311', '1', '25', 'Guardian would like you to call to schedule'),
('3187', '311', '1', '26.3', 'Third Molars'),
('3188', '311', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Davies,Temple_Extreferral.pdf'),
('3189', '311', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Davies,Temple_Pano011013.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3190', '312', '1', '2.3', 'Davis'),
('3191', '312', '1', '2.6', 'Sones'),
('3192', '312', '1', '20.1', 'Patient is a minor'),
('3193', '312', '1', '21.3', 'Jenny'),
('3194', '312', '1', '21.6', 'Sones'),
('3195', '312', '1', '3', 'jsones@austin.rr.com'),
('3196', '312', '1', '4', '(512)801-7080'),
('3197', '312', '1', '25', 'Guardian would like you to call to schedule'),
('3198', '312', '1', '26.3', 'Third Molars'),
('3199', '312', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Sones,Davis_Extreferral.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3200', '312', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/07/Sones,Davis_Pano073013.jpg'),
('3201', '313', '1', '2.3', 'Hunter'),
('3202', '313', '1', '2.6', 'Dersch'),
('3203', '313', '1', '20.1', 'Patient is a minor'),
('3204', '313', '1', '21.3', 'Jules'),
('3205', '313', '1', '21.6', 'Dersch'),
('3206', '313', '1', '4', '(512)755-9911'),
('3207', '313', '1', '25', 'Guardian would like you to call to schedule'),
('3208', '313', '1', '26.1', 'Extraction'),
('3209', '313', '1', '26.3', 'Third Molars');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3210', '313', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/Dersch,Hunter_ExtReferral.pdf'),
('3211', '313', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/HDersch Pano.jpg'),
('3212', '313', '1', '7', 'no email on file for mom -Tiffany'),
('3213', '314', '1', '2.3', 'Jacob'),
('3214', '314', '1', '2.6', 'Orel'),
('3215', '314', '1', '20.1', 'Patient is a minor'),
('3216', '314', '1', '21.3', 'Jeannie'),
('3217', '314', '1', '21.6', 'Orel'),
('3218', '314', '1', '3', 'jeannie@jjoconstruction.com'),
('3219', '314', '1', '4', '(216)973-6746');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3220', '314', '1', '25', 'Guardian would like you to call to schedule'),
('3221', '314', '1', '26.1', 'Extraction'),
('3222', '314', '1', '26.3', 'Third Molars'),
('3223', '314', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/JOrel Pano.jpg'),
('3224', '314', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/Orel,Jake_ExtReferral.pdf'),
('3225', '314', '1', '7', 'pano was taken by his previous orthodontist in Ohio on 7/1/13 -Tiffany'),
('3226', '315', '1', '2.3', 'Austin'),
('3227', '315', '1', '2.6', 'Tilley'),
('3228', '315', '1', '3', 'tilley5@me.com'),
('3229', '315', '1', '4', '(480)612-3079');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3230', '315', '1', '24', 'Patient would like you to call to schedule'),
('3231', '315', '1', '26.3', 'Third Molars'),
('3232', '315', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/Tilley,Austin_ExtReferral.pdf'),
('3233', '315', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/Tilley,Austin.jpg'),
('3234', '315', '1', '7', 'Here you go....Shelli'),
('3235', '316', '1', '2.3', 'diana'),
('3236', '316', '1', '2.6', 'garza'),
('3237', '316', '1', '3', 'flyhewy122@gmail.com'),
('3238', '316', '1', '4', '(512)296-1807'),
('3239', '316', '1', '24', 'Patient would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3240', '316', '1', '26.9', 'Other'),
('3241', '316', '1', '6', 'see notes below'),
('3242', '316', '1', '10.13', '12'),
('3243', '316', '1', '10.14', '13'),
('3244', '316', '1', '10.15', '14'),
('3245', '316', '1', '10.16', '15'),
('3246', '316', '1', '10.17', '16'),
('3247', '316', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/d garza.jpg'),
('3248', '316', '1', '7', 'pt take cone beam, pt been experiencing pain in endentualous site #14 for 2+ years. pt doesnt want to do RCT on #15 if that is the problem, need to rule out any other concerns. talked to Dr Alford abo'),
('3249', '317', '1', '2.3', 'allen');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3250', '317', '1', '2.6', 'corralejo'),
('3251', '317', '1', '4', '(512)585-5606'),
('3252', '317', '1', '24', 'Patient would like you to call to schedule'),
('3253', '317', '1', '26.1', 'Extraction'),
('3254', '317', '1', '10.1', '1'),
('3255', '317', '1', '10.17', '16'),
('3256', '317', '1', '11.1', '32'),
('3257', '317', '1', '11.17', '17'),
('3258', '317', '1', '7', 'ext all 3rd\'s. we only have BW so you will have to take a pano'),
('3259', '318', '1', '2.3', 'Kaelin');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3260', '318', '1', '2.6', 'Mace'),
('3261', '318', '1', '3', 'j.kaelin.mace@gmail.com'),
('3262', '318', '1', '4', '(832)495-8521'),
('3263', '318', '1', '24', 'Patient would like you to call to schedule'),
('3264', '318', '1', '26.3', 'Third Molars'),
('3265', '318', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/Mace,Kaelin_Extreferral.pdf'),
('3266', '318', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/Mace,Kaelin_Pano080813.jpg'),
('3267', '319', '1', '2.3', 'Katherine'),
('3268', '319', '1', '2.6', 'Pananides'),
('3269', '319', '1', '20.1', 'Patient is a minor');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3270', '319', '1', '21.3', 'Robyn'),
('3271', '319', '1', '21.6', 'Goodier'),
('3272', '319', '1', '3', 'robyn.goodier@gmail.con'),
('3273', '319', '1', '4', '(512)436-9834'),
('3274', '319', '1', '25', 'Guardian would like you to call to schedule'),
('3275', '319', '1', '26.3', 'Third Molars'),
('3276', '319', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/Panaides,Katherine_Extreferral.pdf'),
('3277', '319', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/Pananides,Katherine_Pano08192013.jpg'),
('3278', '320', '1', '2.3', 'elizabeth'),
('3279', '320', '1', '2.6', 'holmes');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3280', '320', '1', '4', '(713)253-1022'),
('3281', '320', '1', '24', 'Patient does not want to be contacted'),
('3282', '320', '1', '26.4', 'Implant'),
('3283', '320', '1', '10.14', '13'),
('3284', '320', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/radio_exam.jpg'),
('3285', '320', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/radio_exam.jpg vv.jpg'),
('3286', '320', '1', '7', 'ext and implant consult. broken tooth #13. recommended implant vs. crown lengthening and post and bu and crown'),
('3287', '321', '1', '2.3', 'Josh'),
('3288', '321', '1', '2.6', 'Phillips'),
('3289', '321', '1', '20.1', 'Patient is a minor');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3290', '321', '1', '21.3', 'Wendra'),
('3291', '321', '1', '21.6', 'Phillips'),
('3292', '321', '1', '3', 'wendra.phillips@abtexasna.com'),
('3293', '321', '1', '4', '(830)613-1549'),
('3294', '321', '1', '25', 'Guardian would like you to call to schedule'),
('3295', '321', '1', '26.3', 'Third Molars'),
('3296', '321', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/Phillips,Josh_Extreferral.pdf'),
('3297', '321', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/08/Phillips,Josh_Pano05092013.jpg'),
('3298', '322', '1', '2.3', 'barbara'),
('3299', '322', '1', '2.6', 'pannabecker');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3300', '322', '1', '4', '(512)292-3285'),
('3301', '322', '1', '24', 'Patient does not want to be contacted'),
('3302', '322', '1', '26.7', 'Pathology'),
('3303', '322', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/09/4_.jpg'),
('3304', '322', '1', '7', 'please evaluate upper right soft palate. 2x3mm black circular region. pt is a smoker'),
('3305', '323', '1', '2.3', 'Bennett'),
('3306', '323', '1', '2.6', 'Woodruff'),
('3307', '323', '1', '20.1', 'Patient is a minor'),
('3308', '323', '1', '4', '(830)431-1667'),
('3309', '323', '1', '25', '--- Select One ---');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3310', '323', '1', '26.1', 'Extraction'),
('3311', '323', '1', '26.4', 'Implant'),
('3312', '323', '1', '9.1', 'T'),
('3313', '323', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/09/Woodruff PANO 9-12-13.JPG'),
('3314', '324', '1', '2.3', 'Mia'),
('3315', '324', '1', '2.6', 'Silbert'),
('3316', '324', '1', '20.1', 'Patient is a minor'),
('3317', '324', '1', '21.3', 'Tracey'),
('3318', '324', '1', '21.6', 'Silbert'),
('3319', '324', '1', '3', 'londonsilberts@mac.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3320', '324', '1', '4', '(512)949-9487'),
('3321', '324', '1', '25', 'Guardian would like you to call to schedule'),
('3322', '324', '1', '26.9', 'Other'),
('3323', '324', '1', '6', 'Evaluate retro molar area of tooth #15'),
('3324', '324', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/09/Silbert,Mia_ExtReferral.pdf'),
('3325', '324', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/09/Silbert,Mia_Pano09122013.jpg'),
('3326', '325', '1', '2.3', 'Charles'),
('3327', '325', '1', '2.6', 'Radi'),
('3328', '325', '1', '3', 'radifamily@hotmail.com'),
('3329', '325', '1', '4', '(512)789-5603');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3330', '325', '1', '24', 'Patient would like you to call to schedule'),
('3331', '325', '1', '26.9', 'Other'),
('3332', '325', '1', '6', 'Evaluate for bone graft and implant for tooth #3.'),
('3333', '325', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/09/Radi,Charles_Graftreferral.pdf'),
('3334', '325', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/09/Radi,Charles_Pano09162013.jpg'),
('3335', '326', '1', '2.3', 'Jack'),
('3336', '326', '1', '2.6', 'Lum'),
('3337', '326', '1', '20.1', 'Patient is a minor'),
('3338', '326', '1', '21.3', 'Rosa'),
('3339', '326', '1', '21.6', 'Lum');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3340', '326', '1', '3', 'rosalum555@gmail.com'),
('3341', '326', '1', '4', '(512)263-5273'),
('3342', '326', '1', '25', '--- Select One ---'),
('3343', '326', '1', '26.3', 'Third Molars'),
('3344', '326', '1', '10.1', '1'),
('3345', '326', '1', '10.17', '16'),
('3346', '326', '1', '11.1', '32'),
('3347', '326', '1', '11.17', '17'),
('3348', '326', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/09/Lum,Jack_ExtReferral.pdf'),
('3349', '326', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/09/Lum,Jack_Pano08012013.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3350', '327', '1', '2.3', 'Alexa'),
('3351', '327', '1', '2.6', 'Bailey'),
('3352', '327', '1', '20.1', 'Patient is a minor'),
('3353', '327', '1', '21.3', 'Kim'),
('3354', '327', '1', '21.6', 'Bailey'),
('3355', '327', '1', '3', 'baileysbibs@gmail.com'),
('3356', '327', '1', '4', '(512)799-8342'),
('3357', '327', '1', '25', '--- Select One ---'),
('3358', '327', '1', '26.2', 'Expose & Bond'),
('3359', '327', '1', '10.12', '11');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3360', '327', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/09/Bailey,Gracie_ExposureReferral.pdf'),
('3361', '327', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/09/Bailey,Alexa_Pano01282013.jpg'),
('3362', '328', '1', '2.3', 'charlotte'),
('3363', '328', '1', '2.6', 'reyes'),
('3364', '328', '1', '4', '(512)632-3464'),
('3365', '328', '1', '24', 'Patient would like you to call to schedule'),
('3366', '328', '1', '26.1', 'Extraction'),
('3367', '328', '1', '26.4', 'Implant'),
('3368', '328', '1', '11.15', '19'),
('3369', '328', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/09/reyes.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3370', '329', '1', '2.3', 'Avery'),
('3371', '329', '1', '2.6', 'Tucker'),
('3372', '329', '1', '20.1', 'Patient is a minor'),
('3373', '329', '1', '21.3', 'Cindy'),
('3374', '329', '1', '21.6', 'Moritz'),
('3375', '329', '1', '3', 'clp18@att.net'),
('3376', '329', '1', '4', '(361)649-5101'),
('3377', '329', '1', '25', 'Guardian would like you to call to schedule'),
('3378', '329', '1', '26.1', 'Extraction'),
('3379', '329', '1', '26.2', 'Expose & Bond');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3380', '329', '1', '26.9', 'Other'),
('3381', '329', '1', '6', 'Hemisect tooth # k and t/ expose and bond Tooth #4'),
('3382', '329', '1', '9.1', 'T'),
('3383', '329', '1', '9.11', 'K'),
('3384', '329', '1', '10.1', '1'),
('3385', '329', '1', '10.17', '16'),
('3386', '329', '1', '11.1', '32'),
('3387', '329', '1', '11.17', '17'),
('3388', '329', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/09/Tucker,Avery_ExtEbcHemisecReferral.pdf'),
('3389', '329', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/09/Tucker,Avery_Pano08142013.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3390', '330', '1', '2.3', 'jean'),
('3391', '330', '1', '2.6', 'barton'),
('3392', '330', '1', '24', 'Patient does not want to be contacted'),
('3393', '330', '1', '26.4', 'Implant'),
('3394', '330', '1', '26.7', 'Pathology'),
('3395', '330', '1', '10.15', '14'),
('3396', '330', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/11_.jpg'),
('3397', '330', '1', '7', 'pt will call you to schedule '),
('3398', '331', '1', '2.3', 'Griffin'),
('3399', '331', '1', '2.6', 'Whitman');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3400', '331', '1', '20.1', 'Patient is a minor'),
('3401', '331', '1', '21.3', 'Alex'),
('3402', '331', '1', '21.6', 'Whitman'),
('3403', '331', '1', '3', 'Alex@thetshirtgirl.com'),
('3404', '331', '1', '4', '(760)809-7750'),
('3405', '331', '1', '25', 'Guardian would like you to call to schedule'),
('3406', '331', '1', '26.3', 'Third Molars'),
('3407', '331', '1', '10.1', '1'),
('3408', '331', '1', '10.17', '16'),
('3409', '331', '1', '11.1', '32');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3410', '331', '1', '11.17', '17'),
('3411', '331', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Whitman,Griffin_Pano12132012.jpg'),
('3412', '331', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Whitman,Griffin_ReferralExt.pdf'),
('3413', '332', '1', '2.3', 'Austin'),
('3414', '332', '1', '2.6', 'Branam'),
('3415', '332', '1', '20.1', 'Patient is a minor'),
('3416', '332', '1', '21.3', 'Corey'),
('3417', '332', '1', '21.6', 'Branam'),
('3418', '332', '1', '3', 'branam_family@yahoo.com'),
('3419', '332', '1', '4', '(512)569-7187');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3420', '332', '1', '25', 'Guardian would like you to call to schedule'),
('3421', '332', '1', '26.2', 'Expose & Bond'),
('3422', '332', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Branam,Austin_Pano06102013.jpg'),
('3423', '332', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Branam,Austin_ReferralEBC.pdf'),
('3424', '333', '1', '2.3', 'Minh'),
('3425', '333', '1', '2.6', 'Pham'),
('3426', '333', '1', '3', 'congminhp@yahoo.com'),
('3427', '333', '1', '4', '(512)999-5253'),
('3428', '333', '1', '24', 'Patient would like you to call to schedule'),
('3429', '333', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3430', '333', '1', '10.5', '5'),
('3431', '333', '1', '10.13', '12'),
('3432', '333', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Pham,Minh_ReferralExt.pdf'),
('3433', '334', '1', '2.3', 'Trevor'),
('3434', '334', '1', '2.6', 'Wyatt'),
('3435', '334', '1', '20.1', 'Patient is a minor'),
('3436', '334', '1', '21.3', 'Beverly'),
('3437', '334', '1', '21.6', 'Wyatt'),
('3438', '334', '1', '3', 'bwfruitofthespirit@yahoo.com'),
('3439', '334', '1', '4', '(512)417-5043');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3440', '334', '1', '25', 'Guardian would like you to call to schedule'),
('3441', '334', '1', '26.6', 'Orthognathic'),
('3442', '334', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Wyatt,Trevor_Ceph10092013.jpg'),
('3443', '334', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Wyatt,Trevor_Pano10092013.jpg'),
('3444', '334', '1', '17', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Wyatt,Trevor_Refsurg.pdf'),
('3445', '335', '1', '2.3', 'JOHN'),
('3446', '335', '1', '2.6', 'ESTRADA'),
('3447', '335', '1', '24', 'Patient does not want to be contacted'),
('3448', '335', '1', '26.3', 'Third Molars'),
('3449', '335', '1', '11.1', '32');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3450', '335', '1', '11.17', '17'),
('3451', '335', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/ESTRADA.JPG'),
('3452', '336', '1', '2.3', 'Bradyn'),
('3453', '336', '1', '2.6', 'Lange'),
('3454', '336', '1', '20.1', 'Patient is a minor'),
('3455', '336', '1', '21.3', 'Gina'),
('3456', '336', '1', '21.6', 'Lange'),
('3457', '336', '1', '3', 'glange3@gmail.com'),
('3458', '336', '1', '4', '(512)465-2061'),
('3459', '336', '1', '25', 'Guardian would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3460', '336', '1', '26.3', 'Third Molars'),
('3461', '336', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Lange,Bradyn_Extreferral.pdf'),
('3462', '336', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Lange,Bradyn_Pano10102013.jpg'),
('3463', '337', '1', '2.3', 'johnny '),
('3464', '337', '1', '2.6', 'tenorio'),
('3465', '337', '1', '4', '(512)296-0842'),
('3466', '337', '1', '24', 'Patient would like you to call to schedule'),
('3467', '337', '1', '26.1', 'Extraction'),
('3468', '337', '1', '10.2', '2'),
('3469', '337', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/8_.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3470', '337', '1', '7', 'ext #2 pt has had previous radiation and chemo'),
('3471', '338', '1', '2.3', 'Jason'),
('3472', '338', '1', '2.6', 'Kozan'),
('3473', '338', '1', '3', 'jason.kozan@hotmail.com'),
('3474', '338', '1', '4', '(512)568-2877'),
('3475', '338', '1', '24', 'Patient would like you to call to schedule'),
('3476', '338', '1', '26.6', 'Orthognathic'),
('3477', '338', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Kozan,Jason_Reforthorthgnathicsurg.pdf'),
('3478', '338', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Kozan,Jason_Pano10172013.jpg'),
('3479', '338', '1', '17', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Kozan,Jason_Ceph10172013.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3480', '339', '1', '2.3', 'Tina'),
('3481', '339', '1', '2.6', 'Gauthier'),
('3482', '339', '1', '4', '(512)471-4175'),
('3483', '339', '1', '24', 'Patient would like you to call to schedule'),
('3484', '339', '1', '26.8', 'TMJ'),
('3485', '339', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Gauthier,Tina_RefTMJ.pdf'),
('3486', '339', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Gauthier,Tina_Pano10172013.jpg'),
('3487', '339', '1', '17', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Gauthier,Tina_Ceph10172013.jpg'),
('3488', '340', '1', '2.3', 'Wetzel'),
('3489', '340', '1', '2.6', 'Nick');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3490', '340', '1', '24', '--- Select One ---'),
('3491', '340', '1', '26.1', 'Extraction'),
('3492', '340', '1', '26.4', 'Implant'),
('3493', '340', '1', '10.8', '8'),
('3494', '340', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/10_.jpg'),
('3495', '340', '1', '7', 'Pt has broken tooth #8 at gumline, please evaluate strength of all anterior RCTed teeth since crowns were placed recently and the integrity of #8 was poor.  '),
('3496', '341', '1', '2.3', 'Patrick'),
('3497', '341', '1', '2.6', 'Heldebrandt'),
('3498', '341', '1', '20.1', 'Patient is a minor'),
('3499', '341', '1', '21.3', 'Michael');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3500', '341', '1', '21.6', 'Heldebrandt'),
('3501', '341', '1', '3', 'tomoeheldebrandt@gmail.com'),
('3502', '341', '1', '4', '(512)284-3203'),
('3503', '341', '1', '25', '--- Select One ---'),
('3504', '341', '1', '26.1', 'Extraction'),
('3505', '341', '1', '9.1', 'T'),
('3506', '341', '1', '9.11', 'K'),
('3507', '341', '1', '10.5', '5'),
('3508', '341', '1', '10.13', '12'),
('3509', '341', '1', '11.5', '28');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3510', '341', '1', '11.13', '21'),
('3511', '341', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Heldebrandt,Patrick_Pano10232013.jpg'),
('3512', '341', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Heldebrandt,Patrick_Refext.pdf'),
('3513', '342', '1', '2.3', 'Iridian'),
('3514', '342', '1', '2.6', 'Villegas'),
('3515', '342', '1', '20.1', 'Patient is a minor'),
('3516', '342', '1', '21.3', 'Willie'),
('3517', '342', '1', '21.6', 'Flores'),
('3518', '342', '1', '3', 'marylu.07@hotmail.com'),
('3519', '342', '1', '4', '(512)363-0427');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3520', '342', '1', '25', 'Guardian would like you to call to schedule'),
('3521', '342', '1', '26.1', 'Extraction'),
('3522', '342', '1', '10.1', '1'),
('3523', '342', '1', '10.5', '5'),
('3524', '342', '1', '10.13', '12'),
('3525', '342', '1', '10.17', '16'),
('3526', '342', '1', '11.1', '32'),
('3527', '342', '1', '11.17', '17'),
('3528', '342', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Villegas,Iridian_Pano10302013.jpg'),
('3529', '342', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Villegas,Iridian_Refext.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3530', '343', '1', '2.3', 'Danette'),
('3531', '343', '1', '2.6', 'Shelton'),
('3532', '343', '1', '3', 'danettersi@yahoo.com'),
('3533', '343', '1', '4', '(512)627-0026'),
('3534', '343', '1', '24', 'Patient would like you to call to schedule'),
('3535', '343', '1', '26.9', 'Other'),
('3536', '343', '1', '6', 'Evaluate mandibular tori.'),
('3537', '343', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Shelton,Danette_Pano10302013.jpg'),
('3538', '343', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/10/Shelton,Danette_Refmaxtori.pdf'),
('3539', '344', '1', '2.3', 'alex');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3540', '344', '1', '2.6', 'ruiz'),
('3541', '344', '1', '24', 'Patient would like you to call to schedule'),
('3542', '344', '1', '26.1', 'Extraction'),
('3543', '344', '1', '26.4', 'Implant'),
('3544', '344', '1', '11.16', '18'),
('3545', '344', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/11/A Ruiz.jpg'),
('3546', '344', '1', '7', 'please ext #18 and evaluate for implant'),
('3547', '345', '1', '2.3', 'hanz'),
('3548', '345', '1', '2.6', 'derocher'),
('3549', '345', '1', '4', '(512)784-3659');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3550', '345', '1', '24', 'Patient would like you to call to schedule'),
('3551', '345', '1', '26.1', 'Extraction'),
('3552', '345', '1', '26.4', 'Implant'),
('3553', '345', '1', '11.15', '19'),
('3554', '345', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/11/H Derocher.jpg'),
('3555', '345', '1', '7', 'consult for ext and implant placement'),
('3556', '346', '1', '2.3', 'Christina'),
('3557', '346', '1', '2.6', 'Lulo'),
('3558', '346', '1', '20.1', 'Patient is a minor'),
('3559', '346', '1', '21.3', 'Shannon');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3560', '346', '1', '21.6', 'Lulo'),
('3561', '346', '1', '3', 'slulo@hotmail.com'),
('3562', '346', '1', '4', '(954)439-8934'),
('3563', '346', '1', '25', 'Guardian would like you to call to schedule'),
('3564', '346', '1', '26.2', 'Expose & Bond'),
('3565', '346', '1', '10.6', '6'),
('3566', '346', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/11/Lulo,Tina_Pano05132013.jpg'),
('3567', '346', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/11/Lulo,Tina_ReferralREEBC.pdf'),
('3568', '347', '1', '2.3', 'Kelly'),
('3569', '347', '1', '2.6', 'Larimore');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3570', '347', '1', '20.1', 'Patient is a minor'),
('3571', '347', '1', '21.3', 'Linda'),
('3572', '347', '1', '21.6', 'Larimore'),
('3573', '347', '1', '3', 'lrlarimore@gmail.com'),
('3574', '347', '1', '4', '(512)750-2032'),
('3575', '347', '1', '25', 'Guardian would like you to call to schedule'),
('3576', '347', '1', '26.1', 'Extraction'),
('3577', '347', '1', '10.1', '1'),
('3578', '347', '1', '10.17', '16'),
('3579', '347', '1', '11.1', '32');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3580', '347', '1', '11.17', '17'),
('3581', '347', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/11/Larimore,Kelly_pano05082013.jpg'),
('3582', '347', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/11/Larimore,Kelly_ExtReferral.pdf'),
('3583', '348', '1', '2.3', 'Charlie'),
('3584', '348', '1', '2.6', 'Cross'),
('3585', '348', '1', '20.1', 'Patient is a minor'),
('3586', '348', '1', '21.3', 'Britney'),
('3587', '348', '1', '21.6', 'Cross'),
('3588', '348', '1', '3', 'britneyecross@gmail.com'),
('3589', '348', '1', '4', '(361)935-7398');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3590', '348', '1', '25', 'Guardian would like you to call to schedule'),
('3591', '348', '1', '26.1', 'Extraction'),
('3592', '348', '1', '10.2', '2'),
('3593', '348', '1', '10.16', '15'),
('3594', '348', '1', '11.2', '31'),
('3595', '348', '1', '11.16', '18'),
('3596', '348', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/11/Cross,Charlie_Extreferral.pdf'),
('3597', '348', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/11/Cross,Charlie_Pano11202013.jpg'),
('3598', '349', '1', '2.3', 'Serena'),
('3599', '349', '1', '2.6', 'Kuruvilla');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3600', '349', '1', '20.1', 'Patient is a minor'),
('3601', '349', '1', '21.3', 'Jessy'),
('3602', '349', '1', '21.6', 'Kuruvilla'),
('3603', '349', '1', '3', 'jessnasjplus3@yahoo.com'),
('3604', '349', '1', '4', '(610)764-6991'),
('3605', '349', '1', '25', '--- Select One ---'),
('3606', '349', '1', '26.1', 'Extraction'),
('3607', '349', '1', '10.5', '5'),
('3608', '349', '1', '10.13', '12'),
('3609', '349', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/11/Kuruvilla,Serena_Extreferral.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3610', '349', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/11/Kuruvilla,Serena_Pano11202013.jpg'),
('3611', '350', '1', '2.3', 'Lauren'),
('3612', '350', '1', '2.6', 'Saucedo'),
('3613', '350', '1', '20.1', 'Patient is a minor'),
('3614', '350', '1', '21.3', 'Melissa'),
('3615', '350', '1', '21.6', 'Gladden'),
('3616', '350', '1', '3', 'melissa.gladden@pervasive.com'),
('3617', '350', '1', '4', '(512)656-9029'),
('3618', '350', '1', '25', 'Guardian would like you to call to schedule'),
('3619', '350', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3620', '350', '1', '10.5', '5'),
('3621', '350', '1', '10.13', '12'),
('3622', '350', '1', '11.5', '28'),
('3623', '350', '1', '11.14', '20'),
('3624', '350', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/11/Saucedo,Lauren_ExtReferral.pdf'),
('3625', '350', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/11/Saucedo,Lauren_Pano08232012.jpg'),
('3626', '351', '1', '2.3', 'Taylor'),
('3627', '351', '1', '2.6', 'Lawrence'),
('3628', '351', '1', '20.1', 'Patient is a minor'),
('3629', '351', '1', '21.3', 'Pamela');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3630', '351', '1', '21.6', 'Lawrence'),
('3631', '351', '1', '3', 'pamelalawrence@earthlink.net'),
('3632', '351', '1', '4', '(512)413-1770'),
('3633', '351', '1', '25', 'Guardian would like you to call to schedule'),
('3634', '351', '1', '26.9', 'Other'),
('3635', '351', '1', '6', 'frenectomy'),
('3636', '351', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/11/Lawrence,Taylor_FrenReferral.pdf'),
('3637', '352', '1', '2.3', 'Hailey'),
('3638', '352', '1', '2.6', 'Stewart'),
('3639', '352', '1', '20.1', 'Patient is a minor');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3640', '352', '1', '21.3', 'Rebecca'),
('3641', '352', '1', '21.6', 'Stewart'),
('3642', '352', '1', '3', 'rebeccastewart50@yahoo.com'),
('3643', '352', '1', '4', '(214)387-7674'),
('3644', '352', '1', '25', 'Guardian would like you to call to schedule'),
('3645', '352', '1', '26.1', 'Extraction'),
('3646', '352', '1', '10.1', '1'),
('3647', '352', '1', '10.17', '16'),
('3648', '352', '1', '11.1', '32'),
('3649', '352', '1', '11.17', '17');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3650', '352', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Stewart,Hailey_ExtReferral.pdf'),
('3651', '352', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Stewart,Hailey_Pano06272013.jpg'),
('3652', '353', '1', '2.3', 'Emma'),
('3653', '353', '1', '2.6', 'O\'Connor'),
('3654', '353', '1', '20.1', 'Patient is a minor'),
('3655', '353', '1', '21.3', 'Jean'),
('3656', '353', '1', '21.6', 'O\'Connor'),
('3657', '353', '1', '3', 'jlo@austin.rr.com'),
('3658', '353', '1', '4', '(512)785-3454'),
('3659', '353', '1', '25', 'Guardian would like you to call to schedule');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3660', '353', '1', '26.1', 'Extraction'),
('3661', '353', '1', '10.1', '1'),
('3662', '353', '1', '10.17', '16'),
('3663', '353', '1', '11.1', '32'),
('3664', '353', '1', '11.17', '17'),
('3665', '353', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/O\'Connor,Emma_ExtReferral.pdf'),
('3666', '353', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/O\'Connor,Emma_Pano07162013.jpg'),
('3667', '353', '1', '7', 'Alt # (512)266-5665'),
('3668', '354', '1', '2.3', 'Ryan'),
('3669', '354', '1', '2.6', 'Ezzell');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3670', '354', '1', '20.1', 'Patient is a minor'),
('3671', '354', '1', '21.3', 'Deborah'),
('3672', '354', '1', '21.6', 'Ezzell'),
('3673', '354', '1', '3', 'dezzell@austin.rr.com'),
('3674', '354', '1', '4', '(512)470-7555'),
('3675', '354', '1', '25', 'Guardian would like you to call to schedule'),
('3676', '354', '1', '26.2', 'Expose & Bond'),
('3677', '354', '1', '10.12', '11'),
('3678', '354', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Ezzell,Ryan_EBCReferral.pdf'),
('3679', '354', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Ezzell,Ryan_Pano01032013.jpg');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3680', '355', '1', '2.3', 'wade '),
('3681', '355', '1', '2.6', 'schaertel'),
('3682', '355', '1', '3', 'julie@youraustintxdentist.com'),
('3683', '355', '1', '4', '(702)496-1020'),
('3684', '355', '1', '24', 'Patient would like you to call to schedule'),
('3685', '355', '1', '26.1', 'Extraction'),
('3686', '355', '1', '26.4', 'Implant'),
('3687', '355', '1', '11.16', '18'),
('3688', '355', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/w schaertel.jpg'),
('3689', '355', '1', '7', 'endo recommends extraction for #18, non restorable consult about implant ');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3690', '356', '1', '2.3', 'Zachary'),
('3691', '356', '1', '2.6', 'Wind'),
('3692', '356', '1', '20.1', 'Patient is a minor'),
('3693', '356', '1', '21.3', 'Steve'),
('3694', '356', '1', '21.6', 'Wind'),
('3695', '356', '1', '3', 'jazswind@hotmail.com'),
('3696', '356', '1', '4', '(469)879-4631'),
('3697', '356', '1', '25', 'Guardian would like you to call to schedule'),
('3698', '356', '1', '26.1', 'Extraction'),
('3699', '356', '1', '10.1', '1');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3700', '356', '1', '10.17', '16'),
('3701', '356', '1', '11.1', '32'),
('3702', '356', '1', '11.17', '17'),
('3703', '356', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Wind,Zachary_ExtReferral.pdf'),
('3704', '356', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Wind,Zachary_Pano04092013.jpg'),
('3705', '356', '1', '7', 'Alt #512-296-2993 (Home)'),
('3706', '357', '1', '2.3', 'Tyler'),
('3707', '357', '1', '2.6', 'Seymore'),
('3708', '357', '1', '20.1', 'Patient is a minor'),
('3709', '357', '1', '21.3', 'Tammie');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3710', '357', '1', '21.6', 'Seymore'),
('3711', '357', '1', '3', 'tammieseymore@yahoo.com'),
('3712', '357', '1', '4', '(512)983-6110'),
('3713', '357', '1', '25', 'Guardian would like you to call to schedule'),
('3714', '357', '1', '26.3', 'Third Molars'),
('3715', '357', '1', '10.1', '1'),
('3716', '357', '1', '10.17', '16'),
('3717', '357', '1', '11.1', '32'),
('3718', '357', '1', '11.17', '17'),
('3719', '357', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Seymore,Tyler_ExtReferral.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3720', '357', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Seymore,Tyler_Pano06112013.jpg'),
('3721', '358', '1', '2.3', 'Corey'),
('3722', '358', '1', '2.6', 'Kobayashi'),
('3723', '358', '1', '20.1', 'Patient is a minor'),
('3724', '358', '1', '21.3', 'Donna'),
('3725', '358', '1', '21.6', 'Kobayashi'),
('3726', '358', '1', '3', 'kobayashiclan@gmail.com'),
('3727', '358', '1', '4', '(520)861-3892'),
('3728', '358', '1', '25', 'Guardian would like you to call to schedule'),
('3729', '358', '1', '26.1', 'Extraction');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3730', '358', '1', '10.1', '1'),
('3731', '358', '1', '10.17', '16'),
('3732', '358', '1', '11.1', '32'),
('3733', '358', '1', '11.17', '17'),
('3734', '358', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Kobayashi,Corey_ExtReferral.pdf'),
('3735', '358', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Kobayashi,Corey_Pano12162013.jpg'),
('3736', '359', '1', '2.3', 'Tyler'),
('3737', '359', '1', '2.6', 'Seymore'),
('3738', '359', '1', '20.1', 'Patient is a minor'),
('3739', '359', '1', '21.3', 'Tammy');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3740', '359', '1', '21.6', 'Seymore'),
('3741', '359', '1', '3', 'tammieseymore@yahoo.com'),
('3742', '359', '1', '4', '(512)983-6110'),
('3743', '359', '1', '25', 'Guardian would like you to call to schedule'),
('3744', '359', '1', '26.1', 'Extraction'),
('3745', '359', '1', '10.1', '1'),
('3746', '359', '1', '10.17', '16'),
('3747', '359', '1', '11.1', '32'),
('3748', '359', '1', '11.17', '17'),
('3749', '359', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Seymore,Tyler_ExtReferral1.pdf');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3750', '359', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Seymore,Tyler_Pano061120131.jpg'),
('3751', '360', '1', '2.3', 'darianne'),
('3752', '360', '1', '2.6', 'Rogers'),
('3753', '360', '1', '20.1', 'Patient is a minor'),
('3754', '360', '1', '21.3', 'Sherry'),
('3755', '360', '1', '21.6', 'Rogers'),
('3756', '360', '1', '3', 'sherry@dream-a-dream.com'),
('3757', '360', '1', '4', '(512)799-6084'),
('3758', '360', '1', '25', 'Guardian would like you to call to schedule'),
('3759', '360', '1', '26.9', 'Other');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3760', '360', '1', '6', 'tad in UR tooth #4-5 area'),
('3761', '360', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Rogers,Darianne_TadReferral.pdf'),
('3762', '360', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Rogers,Darianne_Pano04242013.jpg'),
('3763', '361', '1', '2.3', 'Christina'),
('3764', '361', '1', '2.6', 'Lulo'),
('3765', '361', '1', '20.1', 'Patient is a minor'),
('3766', '361', '1', '21.3', 'Shannon'),
('3767', '361', '1', '21.6', 'Lulo'),
('3768', '361', '1', '3', 'slulo@hotmail.com'),
('3769', '361', '1', '4', '(954)439-8934');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3770', '361', '1', '25', 'Guardian would like you to call to schedule'),
('3771', '361', '1', '26.2', 'Expose & Bond'),
('3772', '361', '1', '10.6', '6'),
('3773', '361', '1', '10.12', '11'),
('3774', '361', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Lulo,Christina_Pano05132013.jpg'),
('3775', '361', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2013/12/Lulo,Christina_EBC6,11Referral.pdf'),
('3776', '362', '1', '2.3', 'Anne'),
('3777', '362', '1', '2.6', 'Scott'),
('3778', '362', '1', '3', 'anne.scott@austin.rr.com'),
('3779', '362', '1', '4', '(512)899-8956');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3780', '362', '1', '24', '--- Select One ---'),
('3781', '362', '1', '26.9', 'Other'),
('3782', '362', '1', '6', 'ginvectomy'),
('3783', '362', '1', '7', 'ginvectomy between 8 and 9 to help with invisalign movement '),
('3784', '363', '1', '2.3', 'Habron'),
('3785', '363', '1', '2.6', 'Botts'),
('3786', '363', '1', '20.1', 'Patient is a minor'),
('3787', '363', '1', '21.3', 'Tondalaia'),
('3788', '363', '1', '21.6', 'Botts'),
('3789', '363', '1', '3', 'tondalaia.botts@gmail.com');

INSERT INTO `wp_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
('3790', '363', '1', '4', '(610)368-4218'),
('3791', '363', '1', '25', 'Guardian would like you to call to schedule'),
('3792', '363', '1', '26.1', 'Extraction'),
('3793', '363', '1', '10.1', '1'),
('3794', '363', '1', '10.17', '16'),
('3795', '363', '1', '11.1', '32'),
('3796', '363', '1', '11.17', '17'),
('3797', '363', '1', '15', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2014/01/Botts,Habron_EXTReferral.pdf'),
('3798', '363', '1', '16', 'http://www.laketravisoralsurgery.net/referrals/wp-content/uploads/gravity_forms/1/2014/01/Botts,Habron_Pano01072014.jpg');

--
-- Table structure for table `wp_rg_lead_detail_long`
--

CREATE TABLE `wp_rg_lead_detail_long` (
  `lead_detail_id` bigint(20) unsigned NOT NULL,
  `value` longtext,
  KEY `lead_detail_key` (`lead_detail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_rg_lead_detail_long`
--

INSERT INTO `wp_rg_lead_detail_long` (`lead_detail_id`, `value`) VALUES
('664', 'Pt would like comprehensive evaluation of all bone loss and would also like implant consult for teeth 3, 14 and19. Both 2 and 3 have extensive root caries.  Are teeth restorable or hopeless? Should pt see periodontist for bone loss in anteriors, are they restorable with veneers, what is the prognosis?'),
('948', 'Pt. had trauma to tooth #9 and #10.  Tooth #9 is ankylosed and possibly #10.  Dr. Dykes is wanting to place brackets and then have a localized osteotomy done on tooth #9 and possibly on #10 if it is also ankylosed.  Pt. is wanting to visit with Dr. Alford prior to placement of brackets to discuss treatment and fees with your office.  Please have Dr. Alford call Dr. Dykes to discuss treatment at convenience. '),
('981', 'Here is sheryl\'s FMX, Please evaluate for implants in the areas of 30 and 14 to bring pt back to 1st molar occlussion.  I was thinking to extract 2, 14, 18, and root tip 30.  I will Crown #3 and 19 after you guys meet and decide what to do. What are your thoughts?  FYI-Pt is a smoker'),
('1194', 'Please evaluate for expose and bond a chain to teeth #s 6, 11, and 18.  Also evaluate for luxation of teeth #s 18 and 31.  Alex will also need a pathology consultation for tooth # 18.  Please call the office if you have any questions.'),
('1227', 'Hey Jeff, this is the guy that I spoke with you about the other day, about restoring the lower to rebuild occlussion.  He is the gentleman I have in the Snap on Smile.  We discussed you consulting with him on the best options for the future.  Please have your office call to get him in to see you.  He is excited to move forward with a game plan.  I will email you his photos.  Thanks Summer'),
('1261', 'I spoke with dr. alford and he said he could do a no charge consult for implants on this patient.  I strongly stressed to patient the importance of implants, especially on the upper left.  I will have pt call to set up appointment.'),
('1349', 'Isaac called the office this morning and was having some pain in the upper left area. He said it was his wisdom tooth and we have them on his treatment plan for extraction. The attached pano was taken in Oct. 2009. –Juanita'),
('1558', 'We are referring sisters for extraction of biscuspids. One for all 4\'s ( and d\'s) and the other sister for all 5\'s ( and eval for ext of 8\'s). Sorry typing in ortho numbers. :) Nice Mom, cool girls! \r\n\r\nShelli'),
('2855', 'Hi guys, \r\nWe would like tooth numbers 4 and 13 out for orthodontics. Dad is interested in having wisdom teeth removed at same time. Dad also interested in Maia having jaw surgery but Dr. Dykes does not feel that it is the best option. Please have Dr. Alford speak with Dr. Dykes regarding her proposed tx plan prior to the appt.\r\nThanks!\r\nShelli '),
('3248', 'pt take cone beam, pt been experiencing pain in endentualous site #14 for 2+ years. pt doesnt want to do RCT on #15 if that is the problem, need to rule out any other concerns. talked to Dr Alford about case. pt wants to rule out everything before she just extracts #15');

--
-- Table structure for table `wp_rg_lead_notes`
--

CREATE TABLE `wp_rg_lead_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL,
  `user_name` varchar(250) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `lead_id` (`lead_id`),
  KEY `lead_user_key` (`lead_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table `wp_rg_lead_notes` is empty
--

--
-- Table structure for table `wp_rg_userregistration`
--

CREATE TABLE `wp_rg_userregistration` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `meta` longtext,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_rg_userregistration`
--

INSERT INTO `wp_rg_userregistration` (`id`, `form_id`, `is_active`, `meta`) VALUES
('1', '2', '1', 'a:13:{s:8:\"username\";s:2:\"11\";s:9:\"firstname\";s:3:\"1.3\";s:8:\"lastname\";s:3:\"1.6\";s:5:\"email\";s:1:\"3\";s:8:\"password\";s:1:\"6\";s:4:\"role\";s:11:\"contributor\";s:9:\"user_meta\";a:2:{i:0;a:3:{s:9:\"meta_name\";s:8:\"user_url\";s:10:\"meta_value\";s:1:\"5\";s:6:\"custom\";b:0;}i:1;a:3:{s:9:\"meta_name\";s:0:\"\";s:10:\"meta_value\";s:0:\"\";s:6:\"custom\";b:0;}}s:21:\"reg_condition_enabled\";s:0:\"\";s:22:\"reg_condition_field_id\";s:2:\"10\";s:22:\"reg_condition_operator\";s:2:\"is\";s:19:\"reg_condition_value\";s:11:\"Remember Me\";s:12:\"notification\";s:1:\"1\";s:15:\"set_post_author\";s:1:\"1\";}');


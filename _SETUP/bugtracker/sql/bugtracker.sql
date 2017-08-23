/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 10.1.25-MariaDB : Database - bugtracker
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bugtracker` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bugtracker`;

/*Table structure for table `cms_admin_requests` */

DROP TABLE IF EXISTS `cms_admin_requests`;

CREATE TABLE `cms_admin_requests` (
  `request_id` int(5) NOT NULL AUTO_INCREMENT,
  `project_id` int(5) NOT NULL DEFAULT '0',
  `task_id` int(5) NOT NULL DEFAULT '0',
  `submitted_by` int(5) NOT NULL DEFAULT '0',
  `request_type` int(2) NOT NULL DEFAULT '0',
  `reason_given` text,
  `time_submitted` int(11) NOT NULL DEFAULT '0',
  `resolved_by` int(5) NOT NULL DEFAULT '0',
  `time_resolved` int(11) NOT NULL DEFAULT '0',
  `deny_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `cms_resolved_project` (`resolved_by`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_admin_requests` */

/*Table structure for table `cms_assigned` */

DROP TABLE IF EXISTS `cms_assigned`;

CREATE TABLE `cms_assigned` (
  `assigned_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`assigned_id`),
  UNIQUE KEY `cms_task_user` (`task_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_assigned` */

/*Table structure for table `cms_attachments` */

DROP TABLE IF EXISTS `cms_attachments`;

CREATE TABLE `cms_attachments` (
  `attachment_id` int(5) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `comment_id` int(10) NOT NULL DEFAULT '0',
  `orig_name` varchar(255) NOT NULL,
  `file_name` varchar(30) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` int(20) NOT NULL DEFAULT '0',
  `added_by` int(3) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attachment_id`),
  KEY `cms_task_id_attachments` (`task_id`,`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_attachments` */

/*Table structure for table `cms_cache` */

DROP TABLE IF EXISTS `cms_cache`;

CREATE TABLE `cms_cache` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `type` varchar(4) NOT NULL,
  `content` longtext NOT NULL,
  `topic` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `max_items` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_cache_type` (`type`,`topic`,`project_id`,`max_items`),
  KEY `cms_cache_type_topic` (`type`,`topic`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cms_cache` */

insert  into `cms_cache`(`id`,`type`,`content`,`topic`,`last_updated`,`project_id`,`max_items`) values 
(1,'task','a:8:{i:0;a:3:{i:0;s:14:\"document_start\";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:\"p_open\";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:\"cdata\";i:1;a:1:{i:0;s:8:\"This isn\";}i:2;i:1;}i:3;a:3:{i:0;s:18:\"singlequoteclosing\";i:1;a:0:{}i:2;i:9;}i:4;a:3:{i:0;s:5:\"cdata\";i:1;a:1:{i:0;s:70:\"t a real task.  You should close it and start opening some real tasks.\";}i:2;i:10;}i:5;a:3:{i:0;s:6:\"plugin\";i:1;a:3:{i:0;s:7:\"newline\";i:1;a:2:{i:0;s:1:\"\n\";i:1;i:5;}i:2;i:5;}i:2;i:80;}i:6;a:3:{i:0;s:7:\"p_close\";i:1;a:0:{}i:2;i:80;}i:7;a:3:{i:0;s:12:\"document_end\";i:1;a:0:{}i:2;i:80;}}',1,1503447939,0,0);

/*Table structure for table `cms_comments` */

DROP TABLE IF EXISTS `cms_comments`;

CREATE TABLE `cms_comments` (
  `comment_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `user_id` int(3) NOT NULL DEFAULT '0',
  `comment_text` text,
  `last_edited_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `cms_task_id_comments` (`task_id`),
  KEY `cms_user_id_comments` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_comments` */

/*Table structure for table `cms_dependencies` */

DROP TABLE IF EXISTS `cms_dependencies`;

CREATE TABLE `cms_dependencies` (
  `depend_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `dep_task_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`depend_id`),
  UNIQUE KEY `cms_task_id_deps` (`task_id`,`dep_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_dependencies` */

/*Table structure for table `cms_effort` */

DROP TABLE IF EXISTS `cms_effort`;

CREATE TABLE `cms_effort` (
  `effort_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `user_id` int(3) NOT NULL DEFAULT '0',
  `start_timestamp` int(11) DEFAULT NULL,
  `end_timestamp` int(11) DEFAULT NULL,
  `effort` int(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`effort_id`),
  KEY `cms_task_id_effort` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_effort` */

/*Table structure for table `cms_groups` */

DROP TABLE IF EXISTS `cms_groups`;

CREATE TABLE `cms_groups` (
  `group_id` int(3) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(20) NOT NULL,
  `group_desc` varchar(150) NOT NULL,
  `project_id` int(3) NOT NULL DEFAULT '0',
  `is_admin` int(1) NOT NULL DEFAULT '0',
  `manage_project` int(1) NOT NULL DEFAULT '0',
  `view_tasks` int(1) NOT NULL DEFAULT '0',
  `open_new_tasks` int(1) NOT NULL DEFAULT '0',
  `modify_own_tasks` int(1) NOT NULL DEFAULT '0',
  `modify_all_tasks` int(1) NOT NULL DEFAULT '0',
  `view_comments` int(1) NOT NULL DEFAULT '0',
  `add_comments` int(1) NOT NULL DEFAULT '0',
  `edit_comments` int(1) NOT NULL DEFAULT '0',
  `edit_own_comments` int(1) NOT NULL DEFAULT '0',
  `delete_comments` int(1) NOT NULL DEFAULT '0',
  `create_attachments` int(1) NOT NULL DEFAULT '0',
  `delete_attachments` int(1) NOT NULL DEFAULT '0',
  `view_history` int(1) NOT NULL DEFAULT '0',
  `close_own_tasks` int(1) NOT NULL DEFAULT '0',
  `close_other_tasks` int(1) NOT NULL DEFAULT '0',
  `assign_to_self` int(1) NOT NULL DEFAULT '0',
  `assign_others_to_self` int(1) NOT NULL DEFAULT '0',
  `add_to_assignees` int(1) NOT NULL DEFAULT '0',
  `view_reports` int(1) NOT NULL DEFAULT '0',
  `add_votes` int(1) NOT NULL DEFAULT '0',
  `edit_assignments` int(1) NOT NULL DEFAULT '0',
  `show_as_assignees` int(1) NOT NULL DEFAULT '0',
  `view_estimated_effort` int(1) NOT NULL DEFAULT '0',
  `view_current_effort_done` int(1) NOT NULL DEFAULT '0',
  `track_effort` int(1) NOT NULL DEFAULT '0',
  `group_open` int(1) NOT NULL DEFAULT '0',
  `add_multiple_tasks` int(1) NOT NULL DEFAULT '0',
  `view_roadmap` int(1) NOT NULL DEFAULT '0',
  `view_own_tasks` int(1) NOT NULL DEFAULT '0',
  `view_groups_tasks` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `cms_group_name` (`group_name`,`project_id`),
  KEY `cms_belongs_to_project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `cms_groups` */

insert  into `cms_groups`(`group_id`,`group_name`,`group_desc`,`project_id`,`is_admin`,`manage_project`,`view_tasks`,`open_new_tasks`,`modify_own_tasks`,`modify_all_tasks`,`view_comments`,`add_comments`,`edit_comments`,`edit_own_comments`,`delete_comments`,`create_attachments`,`delete_attachments`,`view_history`,`close_own_tasks`,`close_other_tasks`,`assign_to_self`,`assign_others_to_self`,`add_to_assignees`,`view_reports`,`add_votes`,`edit_assignments`,`show_as_assignees`,`view_estimated_effort`,`view_current_effort_done`,`track_effort`,`group_open`,`add_multiple_tasks`,`view_roadmap`,`view_own_tasks`,`view_groups_tasks`) values 
(1,'Admin','Members have unlimited access to all functionality',0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1),
(2,'Developers','Global Developers for all projects',0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1),
(3,'Reporters','Open new tasks / add comments in all projects',0,0,0,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,1,1,1,0,1,1),
(4,'Basic','Members can login, relying upon Project permissions only',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,0,1,1),
(5,'Pending','Users who are awaiting approval of their accounts',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(6,'Project Managers','Permission to do anything related to the Default Project',1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);

/*Table structure for table `cms_history` */

DROP TABLE IF EXISTS `cms_history`;

CREATE TABLE `cms_history` (
  `history_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(3) NOT NULL DEFAULT '0',
  `event_date` int(11) NOT NULL DEFAULT '0',
  `event_type` int(2) NOT NULL DEFAULT '0',
  `field_changed` varchar(50) NOT NULL,
  `old_value` text,
  `new_value` text,
  PRIMARY KEY (`history_id`),
  KEY `cms_idx_task_id` (`task_id`),
  KEY `cms_idx_event_date` (`event_date`),
  KEY `cms_idx_event_type` (`event_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cms_history` */

insert  into `cms_history`(`history_id`,`task_id`,`user_id`,`event_date`,`event_type`,`field_changed`,`old_value`,`new_value`) values 
(1,1,1,1130024797,1,'','','');

/*Table structure for table `cms_links` */

DROP TABLE IF EXISTS `cms_links`;

CREATE TABLE `cms_links` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `url` text,
  `added_by` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) DEFAULT '0',
  PRIMARY KEY (`link_id`),
  KEY `cms_task_id_links` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_links` */

/*Table structure for table `cms_list_category` */

DROP TABLE IF EXISTS `cms_list_category`;

CREATE TABLE `cms_list_category` (
  `category_id` int(3) NOT NULL AUTO_INCREMENT,
  `project_id` int(3) NOT NULL DEFAULT '0',
  `category_name` varchar(40) NOT NULL,
  `show_in_list` int(1) NOT NULL DEFAULT '0',
  `category_owner` int(3) NOT NULL DEFAULT '0',
  `lft` int(10) unsigned NOT NULL DEFAULT '0',
  `rgt` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`),
  KEY `cms_project_id_cat` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cms_list_category` */

insert  into `cms_list_category`(`category_id`,`project_id`,`category_name`,`show_in_list`,`category_owner`,`lft`,`rgt`) values 
(1,1,'Backend / Core',1,0,2,3),
(2,0,'root',0,0,1,2),
(3,1,'root',0,0,1,4);

/*Table structure for table `cms_list_os` */

DROP TABLE IF EXISTS `cms_list_os`;

CREATE TABLE `cms_list_os` (
  `os_id` int(3) NOT NULL AUTO_INCREMENT,
  `project_id` int(3) NOT NULL DEFAULT '0',
  `os_name` varchar(40) NOT NULL,
  `list_position` int(3) NOT NULL DEFAULT '0',
  `show_in_list` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`os_id`),
  UNIQUE KEY `cms_project_id_os` (`project_id`,`os_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `cms_list_os` */

insert  into `cms_list_os`(`os_id`,`project_id`,`os_name`,`list_position`,`show_in_list`) values 
(1,1,'All',1,1),
(2,1,'Windows',2,1),
(3,1,'Linux',3,1),
(4,1,'Mac OS',4,1);

/*Table structure for table `cms_list_resolution` */

DROP TABLE IF EXISTS `cms_list_resolution`;

CREATE TABLE `cms_list_resolution` (
  `resolution_id` int(3) NOT NULL AUTO_INCREMENT,
  `resolution_name` varchar(40) NOT NULL,
  `list_position` int(3) NOT NULL DEFAULT '0',
  `show_in_list` int(1) NOT NULL DEFAULT '0',
  `project_id` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resolution_id`),
  UNIQUE KEY `cms_project_id_res` (`project_id`,`resolution_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `cms_list_resolution` */

insert  into `cms_list_resolution`(`resolution_id`,`resolution_name`,`list_position`,`show_in_list`,`project_id`) values 
(1,'Not a bug',1,1,0),
(2,'Won\'t fix',2,1,0),
(3,'Won\'t implement',3,1,0),
(4,'Works for me',4,1,0),
(5,'Deferred',5,1,0),
(6,'Duplicate',6,1,0),
(7,'Fixed',7,1,0),
(8,'Implemented',8,1,0);

/*Table structure for table `cms_list_status` */

DROP TABLE IF EXISTS `cms_list_status`;

CREATE TABLE `cms_list_status` (
  `status_id` int(3) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(40) NOT NULL,
  `list_position` int(3) NOT NULL DEFAULT '0',
  `show_in_list` int(1) NOT NULL DEFAULT '0',
  `project_id` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `cms_project_id_status` (`project_id`,`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `cms_list_status` */

insert  into `cms_list_status`(`status_id`,`status_name`,`list_position`,`show_in_list`,`project_id`) values 
(1,'Unconfirmed',1,1,0),
(2,'New',2,1,0),
(3,'Assigned',3,1,0),
(4,'Researching',4,1,0),
(5,'Waiting on Customer',5,1,0),
(6,'Requires testing',6,1,0);

/*Table structure for table `cms_list_tag` */

DROP TABLE IF EXISTS `cms_list_tag`;

CREATE TABLE `cms_list_tag` (
  `tag_id` int(5) NOT NULL AUTO_INCREMENT,
  `project_id` int(5) NOT NULL DEFAULT '0',
  `tag_name` varchar(40) NOT NULL,
  `list_position` int(3) NOT NULL DEFAULT '0',
  `show_in_list` int(1) NOT NULL DEFAULT '0',
  `class` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `cms_tag_name` (`project_id`,`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_list_tag` */

/*Table structure for table `cms_list_tasktype` */

DROP TABLE IF EXISTS `cms_list_tasktype`;

CREATE TABLE `cms_list_tasktype` (
  `tasktype_id` int(3) NOT NULL AUTO_INCREMENT,
  `tasktype_name` varchar(40) NOT NULL,
  `list_position` int(3) NOT NULL DEFAULT '0',
  `show_in_list` int(1) NOT NULL DEFAULT '0',
  `project_id` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tasktype_id`),
  UNIQUE KEY `cms_project_id_tt` (`project_id`,`tasktype_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `cms_list_tasktype` */

insert  into `cms_list_tasktype`(`tasktype_id`,`tasktype_name`,`list_position`,`show_in_list`,`project_id`) values 
(1,'Bug Report',1,1,0),
(2,'Feature Request',2,1,0);

/*Table structure for table `cms_list_version` */

DROP TABLE IF EXISTS `cms_list_version`;

CREATE TABLE `cms_list_version` (
  `version_id` int(3) NOT NULL AUTO_INCREMENT,
  `project_id` int(3) NOT NULL DEFAULT '0',
  `version_name` varchar(40) NOT NULL,
  `list_position` int(3) NOT NULL DEFAULT '0',
  `show_in_list` int(1) NOT NULL DEFAULT '0',
  `version_tense` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version_id`),
  UNIQUE KEY `cms_project_id_version_name` (`project_id`,`version_name`),
  KEY `cms_project_id_version` (`project_id`,`version_tense`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cms_list_version` */

insert  into `cms_list_version`(`version_id`,`project_id`,`version_name`,`list_position`,`show_in_list`,`version_tense`) values 
(1,1,'Development',1,1,2);

/*Table structure for table `cms_notification_messages` */

DROP TABLE IF EXISTS `cms_notification_messages`;

CREATE TABLE `cms_notification_messages` (
  `message_id` int(10) NOT NULL AUTO_INCREMENT,
  `message_subject` text,
  `message_body` text,
  `time_created` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_notification_messages` */

/*Table structure for table `cms_notification_recipients` */

DROP TABLE IF EXISTS `cms_notification_recipients`;

CREATE TABLE `cms_notification_recipients` (
  `recipient_id` int(10) NOT NULL AUTO_INCREMENT,
  `message_id` int(10) NOT NULL DEFAULT '0',
  `notify_method` varchar(1) NOT NULL,
  `notify_address` varchar(100) NOT NULL,
  PRIMARY KEY (`recipient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_notification_recipients` */

/*Table structure for table `cms_notifications` */

DROP TABLE IF EXISTS `cms_notifications`;

CREATE TABLE `cms_notifications` (
  `notify_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notify_id`),
  UNIQUE KEY `cms_task_id_notifs` (`task_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_notifications` */

/*Table structure for table `cms_prefs` */

DROP TABLE IF EXISTS `cms_prefs`;

CREATE TABLE `cms_prefs` (
  `pref_id` int(1) NOT NULL AUTO_INCREMENT,
  `pref_name` varchar(20) NOT NULL,
  `pref_value` text,
  PRIMARY KEY (`pref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Data for the table `cms_prefs` */

insert  into `cms_prefs`(`pref_id`,`pref_name`,`pref_value`) values 
(1,'fs_ver','1.0-rc4'),
(2,'logo','flyspray_small.png'),
(3,'gravatars','0'),
(4,'emailNoHTML','0'),
(5,'jabber_server',''),
(6,'jabber_port','5222'),
(7,'jabber_username',''),
(8,'jabber_password',''),
(9,'anon_group','4'),
(10,'user_notify','1'),
(11,'admin_email','flyspray@example.com'),
(12,'lang_code','en'),
(13,'need_approval','0'),
(14,'spam_proof','0'),
(15,'default_project','1'),
(16,'dateformat','%d.%m.%Y'),
(17,'dateformat_extended','%d.%m.%Y %H:%M'),
(18,'anon_reg','1'),
(19,'global_theme','CleanFS'),
(20,'visible_columns','id category tasktype priority severity summary status progress'),
(21,'visible_fields','tasktype category severity priority status private assignedto reportedin dueversion duedate progress os votes'),
(22,'smtp_server',''),
(23,'smtp_user',''),
(24,'smtp_pass',''),
(25,'page_title',''),
(26,'notify_registration','0'),
(27,'jabber_ssl','0'),
(28,'last_update_check','1503447939'),
(29,'intro_message',''),
(30,'cache_feeds','1'),
(31,'disable_lostpw','0'),
(32,'disable_changepw','0'),
(33,'days_before_alert','0'),
(34,'hide_emails','1'),
(35,'pages_welcome_msg','index'),
(36,'active_oauths',''),
(37,'only_oauth_reg','0'),
(38,'enable_avatars','1'),
(39,'max_avatar_size','50'),
(40,'default_order_by','id desc, id asc'),
(41,'default_order_by_dir','desc'),
(42,'url_rewriting','0'),
(43,'max_vote_per_day','2'),
(44,'votes_per_project','10'),
(45,'custom_style',''),
(46,'general_integration',''),
(47,'footer_integration',''),
(48,'lock_for','5'),
(49,'email_ssl','0'),
(50,'email_tls','0'),
(51,'default_timezone','0');

/*Table structure for table `cms_projects` */

DROP TABLE IF EXISTS `cms_projects`;

CREATE TABLE `cms_projects` (
  `project_id` int(3) NOT NULL AUTO_INCREMENT,
  `project_title` varchar(100) NOT NULL,
  `theme_style` varchar(20) NOT NULL DEFAULT '0',
  `default_cat_owner` int(3) NOT NULL DEFAULT '0',
  `intro_message` text,
  `project_is_active` int(1) NOT NULL DEFAULT '0',
  `visible_columns` varchar(255) NOT NULL,
  `visible_fields` varchar(255) NOT NULL,
  `others_view` int(1) NOT NULL DEFAULT '0',
  `others_viewroadmap` int(1) NOT NULL DEFAULT '0',
  `anon_open` int(1) NOT NULL DEFAULT '0',
  `notify_email` text,
  `notify_jabber` text,
  `notify_reply` text,
  `notify_types` varchar(100) NOT NULL DEFAULT '0',
  `feed_img_url` text,
  `feed_description` text,
  `notify_subject` varchar(100) NOT NULL DEFAULT '',
  `lang_code` varchar(10) NOT NULL,
  `comment_closed` int(1) NOT NULL DEFAULT '0',
  `auto_assign` int(1) NOT NULL DEFAULT '0',
  `last_updated` int(11) NOT NULL DEFAULT '0',
  `default_task` text,
  `default_entry` varchar(8) NOT NULL DEFAULT 'index',
  `disp_intro` int(1) DEFAULT '0',
  `use_effort_tracking` int(1) DEFAULT '0',
  `default_due_version` varchar(40) NOT NULL DEFAULT 'Undecided',
  `pages_intro_msg` varchar(80) NOT NULL DEFAULT 'index',
  `hours_per_manday` int(11) NOT NULL DEFAULT '0',
  `estimated_effort_format` int(3) NOT NULL DEFAULT '0',
  `current_effort_done_format` int(3) NOT NULL DEFAULT '0',
  `default_order_by` varchar(100) NOT NULL DEFAULT 'id',
  `default_order_by_dir` varchar(5) NOT NULL DEFAULT 'desc',
  `custom_style` varchar(32) DEFAULT NULL,
  `freetagging` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cms_projects` */

insert  into `cms_projects`(`project_id`,`project_title`,`theme_style`,`default_cat_owner`,`intro_message`,`project_is_active`,`visible_columns`,`visible_fields`,`others_view`,`others_viewroadmap`,`anon_open`,`notify_email`,`notify_jabber`,`notify_reply`,`notify_types`,`feed_img_url`,`feed_description`,`notify_subject`,`lang_code`,`comment_closed`,`auto_assign`,`last_updated`,`default_task`,`default_entry`,`disp_intro`,`use_effort_tracking`,`default_due_version`,`pages_intro_msg`,`hours_per_manday`,`estimated_effort_format`,`current_effort_done_format`,`default_order_by`,`default_order_by_dir`,`custom_style`,`freetagging`) values 
(1,'BugTracker','CleanFS',0,'**Welcome to your BugTracker. Credits go to FlySpray for providing the base!**',1,'id category tasktype priority severity summary status progress','tasktype category severity priority status private assignedto reportedin dueversion duedate progress os votes',1,1,0,'','0','','0','','','','en',0,0,1503448000,'','index',0,0,'0','',0,0,0,'id asc, id asc','DESC','',1);

/*Table structure for table `cms_registrations` */

DROP TABLE IF EXISTS `cms_registrations`;

CREATE TABLE `cms_registrations` (
  `reg_id` int(10) NOT NULL AUTO_INCREMENT,
  `reg_time` int(11) NOT NULL DEFAULT '0',
  `confirm_code` varchar(20) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  `real_name` varchar(100) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `jabber_id` varchar(100) NOT NULL,
  `notify_type` int(1) NOT NULL DEFAULT '0',
  `magic_url` varchar(40) NOT NULL,
  `time_zone` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_registrations` */

/*Table structure for table `cms_related` */

DROP TABLE IF EXISTS `cms_related`;

CREATE TABLE `cms_related` (
  `related_id` int(10) NOT NULL AUTO_INCREMENT,
  `this_task` int(10) NOT NULL DEFAULT '0',
  `related_task` int(10) NOT NULL DEFAULT '0',
  `is_duplicate` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`related_id`),
  UNIQUE KEY `cms_this_task` (`this_task`,`related_task`,`is_duplicate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_related` */

/*Table structure for table `cms_reminders` */

DROP TABLE IF EXISTS `cms_reminders`;

CREATE TABLE `cms_reminders` (
  `reminder_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `to_user_id` int(3) NOT NULL DEFAULT '0',
  `from_user_id` int(3) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `how_often` int(12) NOT NULL DEFAULT '0',
  `last_sent` int(11) NOT NULL DEFAULT '0',
  `reminder_message` text,
  PRIMARY KEY (`reminder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_reminders` */

/*Table structure for table `cms_searches` */

DROP TABLE IF EXISTS `cms_searches`;

CREATE TABLE `cms_searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `search_string` text,
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_searches` */

/*Table structure for table `cms_tags` */

DROP TABLE IF EXISTS `cms_tags`;

CREATE TABLE `cms_tags` (
  `task_id` int(5) DEFAULT NULL,
  `tag` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_tags` */

/*Table structure for table `cms_task_tag` */

DROP TABLE IF EXISTS `cms_task_tag`;

CREATE TABLE `cms_task_tag` (
  `task_id` int(5) NOT NULL,
  `tag_id` int(5) NOT NULL,
  PRIMARY KEY (`task_id`,`tag_id`),
  UNIQUE KEY `cms_task_id_tag` (`task_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_task_tag` */

/*Table structure for table `cms_tasks` */

DROP TABLE IF EXISTS `cms_tasks`;

CREATE TABLE `cms_tasks` (
  `task_id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(3) NOT NULL DEFAULT '0',
  `task_type` int(3) NOT NULL DEFAULT '0',
  `date_opened` int(11) NOT NULL DEFAULT '0',
  `opened_by` int(3) NOT NULL DEFAULT '0',
  `is_closed` int(1) NOT NULL DEFAULT '0',
  `date_closed` int(11) NOT NULL DEFAULT '0',
  `closed_by` int(3) NOT NULL DEFAULT '0',
  `closure_comment` text,
  `item_summary` varchar(100) NOT NULL,
  `detailed_desc` text,
  `item_status` int(3) NOT NULL DEFAULT '0',
  `resolution_reason` int(3) NOT NULL DEFAULT '1',
  `product_category` int(3) NOT NULL DEFAULT '0',
  `product_version` int(3) NOT NULL DEFAULT '0',
  `closedby_version` int(3) NOT NULL DEFAULT '0',
  `operating_system` int(3) NOT NULL DEFAULT '0',
  `task_severity` int(3) NOT NULL DEFAULT '0',
  `task_priority` int(3) NOT NULL DEFAULT '0',
  `last_edited_by` int(3) NOT NULL DEFAULT '0',
  `last_edited_time` int(11) NOT NULL DEFAULT '0',
  `percent_complete` int(3) NOT NULL DEFAULT '0',
  `mark_private` int(1) NOT NULL DEFAULT '0',
  `due_date` int(11) NOT NULL DEFAULT '0',
  `anon_email` varchar(100) NOT NULL DEFAULT '',
  `task_token` varchar(32) NOT NULL DEFAULT '0',
  `supertask_id` int(10) DEFAULT '0',
  `list_order` int(3) DEFAULT '0',
  `estimated_effort` int(3) DEFAULT '0',
  PRIMARY KEY (`task_id`),
  KEY `cms_attached_to_project` (`project_id`),
  KEY `cms_task_severity` (`task_severity`),
  KEY `cms_task_type` (`task_type`),
  KEY `cms_product_category` (`product_category`),
  KEY `cms_item_status` (`item_status`),
  KEY `cms_is_closed` (`is_closed`),
  KEY `cms_closedby_version` (`closedby_version`),
  KEY `cms_due_date` (`due_date`),
  KEY `cms_task_project_super` (`project_id`,`supertask_id`),
  KEY `cms_task_super` (`supertask_id`,`task_id`,`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cms_tasks` */

insert  into `cms_tasks`(`task_id`,`project_id`,`task_type`,`date_opened`,`opened_by`,`is_closed`,`date_closed`,`closed_by`,`closure_comment`,`item_summary`,`detailed_desc`,`item_status`,`resolution_reason`,`product_category`,`product_version`,`closedby_version`,`operating_system`,`task_severity`,`task_priority`,`last_edited_by`,`last_edited_time`,`percent_complete`,`mark_private`,`due_date`,`anon_email`,`task_token`,`supertask_id`,`list_order`,`estimated_effort`) values 
(1,1,1,1452600000,1,0,0,0,' ','Sample Task','This isn\'t a real task.  You should close it and start opening some real tasks.',2,1,1,1,0,1,1,2,0,0,0,0,0,'','0',0,0,0);

/*Table structure for table `cms_user_emails` */

DROP TABLE IF EXISTS `cms_user_emails`;

CREATE TABLE `cms_user_emails` (
  `id` int(5) DEFAULT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `oauth_uid` varchar(255) NOT NULL DEFAULT '0',
  `oauth_provider` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_user_emails` */

/*Table structure for table `cms_users` */

DROP TABLE IF EXISTS `cms_users`;

CREATE TABLE `cms_users` (
  `user_id` int(3) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) NOT NULL,
  `user_pass` varchar(128) DEFAULT NULL,
  `real_name` varchar(100) NOT NULL,
  `jabber_id` varchar(100) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `notify_type` int(1) NOT NULL DEFAULT '0',
  `notify_own` int(6) NOT NULL DEFAULT '0',
  `account_enabled` int(1) NOT NULL DEFAULT '0',
  `dateformat` varchar(30) NOT NULL DEFAULT '',
  `dateformat_extended` varchar(30) NOT NULL DEFAULT '',
  `magic_url` varchar(40) NOT NULL DEFAULT '',
  `tasks_perpage` int(3) NOT NULL DEFAULT '0',
  `register_date` int(11) NOT NULL DEFAULT '0',
  `time_zone` int(6) NOT NULL DEFAULT '0',
  `login_attempts` int(11) NOT NULL DEFAULT '0',
  `lock_until` int(11) NOT NULL DEFAULT '0',
  `lang_code` varchar(10) NOT NULL DEFAULT '0',
  `oauth_uid` varchar(255) NOT NULL DEFAULT '0',
  `oauth_provider` varchar(10) NOT NULL DEFAULT '',
  `profile_image` varchar(100) NOT NULL DEFAULT '',
  `hide_my_email` int(1) NOT NULL DEFAULT '0',
  `notify_online` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `cms_user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cms_users` */

insert  into `cms_users`(`user_id`,`user_name`,`user_pass`,`real_name`,`jabber_id`,`email_address`,`notify_type`,`notify_own`,`account_enabled`,`dateformat`,`dateformat_extended`,`magic_url`,`tasks_perpage`,`register_date`,`time_zone`,`login_attempts`,`lock_until`,`lang_code`,`oauth_uid`,`oauth_provider`,`profile_image`,`hide_my_email`,`notify_online`) values 
(1,'admin','c170a641d9bcff3094a78b17655d5d6d','Administrator','','root@localhost.com',0,1,1,'%d.%m.%Y','%d.%m.%Y %H:%M','',25,0,0,0,0,'en','0','','',0,0);

/*Table structure for table `cms_users_in_groups` */

DROP TABLE IF EXISTS `cms_users_in_groups`;

CREATE TABLE `cms_users_in_groups` (
  `record_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL DEFAULT '0',
  `group_id` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `cms_group_id_uig` (`group_id`,`user_id`),
  KEY `cms_user_id_uig` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cms_users_in_groups` */

insert  into `cms_users_in_groups`(`record_id`,`user_id`,`group_id`) values 
(1,1,1);

/*Table structure for table `cms_votes` */

DROP TABLE IF EXISTS `cms_votes`;

CREATE TABLE `cms_votes` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `date_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`),
  KEY `cms_task_id_votes` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_votes` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Version : 50712
 Source Host           : localhost
 Source Database       : cron_web

 Target Server Version : 50712
 File Encoding         : utf-8

 Date: 22/03/2018 16:18:22 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `pp_task`
-- ----------------------------
DROP TABLE IF EXISTS `pp_task`;
CREATE TABLE `pp_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `server_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '服务器资源ID',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `task_name` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名称',
  `task_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '任务类型:1-常驻类型，0-定时类型',
  `description` varchar(200) NOT NULL DEFAULT '' COMMENT '任务描述',
  `cron_spec` varchar(100) NOT NULL DEFAULT '' COMMENT '时间表达式',
  `concurrent` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否只允许一个实例',
  `command` text NOT NULL COMMENT '命令详情',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0停用 1启用',
  `notify` tinyint(4) NOT NULL DEFAULT '0' COMMENT '通知设置',
  `notify_email` text NOT NULL COMMENT '通知人列表',
  `timeout` smallint(6) NOT NULL DEFAULT '0' COMMENT '超时设置',
  `execute_times` int(11) NOT NULL DEFAULT '0' COMMENT '累计执行次数',
  `prev_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次执行时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `pp_task`
-- ----------------------------
BEGIN;
INSERT INTO `pp_task` VALUES ('1', '1', '0', '2', '测试任务名称', '0', '测试任务说明', '0 0/1 11 * *', '0', 'echo \"hello\\n\" >> /tmp/test_cron1.log', '0', '0', 'xxx@123.com', '0', '47', '1502941758', '1497855526'), ('2', '1', '1', '2', '外部服务器', '0', '一分钟一次', '0 */1 * * * *', '0', '/webroot/server/php/bin/php /webroot/www/default/test.php', '0', '0', 'xxx@123.com', '0', '83', '1502940180', '1502876155'), ('3', '1', '1', '1', '重要测试任务222', '0', '2s执行一次', '*/2 *  *  *  *', '0', '/webroot/server/php/bin/php /webroot/www/default/test2.php', '0', '0', 'xxx@123.com', '0','24', '1502941383', '1502936077'), ('9', '1', '4', '2', '密码验证任务', '0', '5秒执行一次', '*/5 * * * *', '0', '/webroot/server/php/bin/php /webroot/www/default/test2.php', '0', '0', 'xxx@123.com', '0', '1', '1502946004', '1502945973');
COMMIT;

-- ----------------------------
--  Table structure for `pp_task_group`
-- ----------------------------
DROP TABLE IF EXISTS `pp_task_group`;
CREATE TABLE `pp_task_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '组名',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `pp_task_group`
-- ----------------------------
BEGIN;
INSERT INTO `pp_task_group` VALUES ('1', '1', '抓取任务', '定时抓取网页', '0'), ('2', '1', '测试任务', '任务分组测试', '0');
COMMIT;

-- ----------------------------
--  Table structure for `pp_task_log`
-- ----------------------------
DROP TABLE IF EXISTS `pp_task_log`;
CREATE TABLE `pp_task_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '任务ID',
  `output` mediumtext NOT NULL COMMENT '任务输出',
  `error` text NOT NULL COMMENT '错误信息',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `process_time` int(11) NOT NULL DEFAULT '0' COMMENT '消耗时间/毫秒',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_task_id` (`task_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `pp_task_log`
-- ----------------------------
BEGIN;
INSERT INTO `pp_task_log` VALUES ('1', '7', '等待10秒\nphp执行完毕', '', '0', '20484', '1502940420'), ('2', '7', '等待10秒\nphp执行完毕', '', '0', '20367', '1502940480'), ('3', '8', '等待11秒\nphp执行完毕', '', '0', '121487', '1502940420'), ('4', '7', '等待10秒\nphp执行完毕', '', '0', '20317', '1502940540'), ('5', '7', '等待10秒\nphp执行完毕', '', '0', '20629', '1502940600'), ('6', '7', '等待10秒\nphp执行完毕', '', '0', '20387', '1502940660'), ('7', '8', '等待11秒\nphp执行完毕', '', '0', '121626', '1502940600'), ('8', '7', '等待10秒\nphp执行完毕', '', '0', '20486', '1502940720'), ('9', '7', '等待10秒\nphp执行完毕', '', '0', '20416', '1502940780'), ('10', '7', '等待10秒\nphp执行完毕', '', '0', '20378', '1502940840'), ('11', '8', '等待11秒\nphp执行完毕', '', '0', '121432', '1502940780'), ('12', '7', '等待10秒\nphp执行完毕', '', '0', '21313', '1502940900'), ('13', '7', '等待10秒\nphp执行完毕', '', '0', '20420', '1502940960'), ('14', '7', '等待10秒\nphp执行完毕', '', '0', '21271', '1502941020'), ('15', '8', '等待11秒\nphp执行完毕', '', '0', '121418', '1502940960'), ('16', '7', '等待10秒\nphp执行完毕', '', '0', '20355', '1502941080'), ('17', '3', '等待11秒\nphp执行完毕', '', '0', '121437', '1502941260'), ('18', '3', '等待11秒\nphp执行完毕', '', '0', '121343', '1502941383'), ('19', '1', '', '', '0', '56', '1502941758'), ('20', '9', '等待11秒\nphp执行完毕', '', '0', '121481', '1502946004');
COMMIT;

-- ----------------------------
--  Table structure for `pp_task_server`
-- ----------------------------
DROP TABLE IF EXISTS `pp_task_server`;
CREATE TABLE `pp_task_server` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `server_name` varchar(64) NOT NULL DEFAULT '0' COMMENT '服务器名称',
  `server_account` varchar(32) NOT NULL DEFAULT 'root' COMMENT '账户名称',
  `server_ip` varchar(20) NOT NULL DEFAULT '0' COMMENT '服务器IP',
  `port` int(4) unsigned NOT NULL DEFAULT '22' COMMENT '服务器端口',
  `password` varchar(64) NOT NULL DEFAULT '0' COMMENT '服务器密码',
  `private_key_src` varchar(128) NOT NULL DEFAULT '0' COMMENT '私钥文件地址',
  `public_key_src` varchar(128) NOT NULL DEFAULT '0' COMMENT '公钥地址',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '登录类型：0-密码登录，1-私钥登录',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0-正常，1-删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='服务器列表';

-- ----------------------------
--  Records of `pp_task_server`
-- ----------------------------
BEGIN;
INSERT INTO `pp_task_server` VALUES ('1', '密钥验证登录服务器', 'root', '172.16.210.157', '22', '', '/Users/haodaquan/.ssh/pp_rsa', '/Users/haodaquan/.ssh/pp_rsa.pub', '1', '远程服务器示例', '1502862723', '1502945893', '0'), ('4', '密码验证服务器', 'root', '172.16.210.157', '22', 'root', '', '', '0', '这是密码验证服务器', '1502945869', '1502945869', '0');
COMMIT;

-- ----------------------------
--  Table structure for `pp_user`
-- ----------------------------
DROP TABLE IF EXISTS `pp_user`;
CREATE TABLE `pp_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT '密码盐',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0正常 -1禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `pp_user`
-- ----------------------------
BEGIN;
INSERT INTO `pp_user` VALUES ('1', 'admin', 'admin@sample.com', '7fef6171469e80d32c0559f88b377245', '', '1502870914', '', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

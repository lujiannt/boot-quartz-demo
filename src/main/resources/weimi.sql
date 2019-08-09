/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : weimi

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-08-09 08:30:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('clusteredScheduler', 'TaskDemo', '1', '0 0/30 * * * ? *', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('clusteredScheduler', 'TaskDemo2', '2', '0/5 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', 'com.quartz.job.HelloJob', '1', '0/6 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', 'com.quartz.job.NewJob', '2', '0/5 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('clusteredScheduler', 'TaskDemo', '1', null, 'com.test.module_schedule.task.TaskDemo', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `qrtz_job_details` VALUES ('clusteredScheduler', 'TaskDemo2', '2', null, 'com.test.module_schedule.task.TaskDemo2', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', 'com.quartz.job.HelloJob', '1', null, 'com.quartz.job.HelloJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', 'com.quartz.job.NewJob', '2', null, 'com.quartz.job.NewJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('clusteredScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('clusteredScheduler', 'TRIGGER_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_logs
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_logs`;
CREATE TABLE `qrtz_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TRIGGER_NAME` varchar(255) DEFAULT NULL,
  `TASK_NAME` varchar(255) DEFAULT NULL,
  `QTIME` datetime DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `COSTTIME` bigint(16) DEFAULT NULL,
  `RESULT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_logs
-- ----------------------------
INSERT INTO `qrtz_logs` VALUES ('47', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:24:30', null, '66814', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('48', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:53:26', null, '11', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('49', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:53:26', null, '10', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('50', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:53:30', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('51', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:53:30', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('52', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:53:35', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('53', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:53:35', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('54', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:53:40', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('55', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:53:40', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('56', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:29', null, '3', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('57', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:29', null, '4', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('58', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:29', null, '47', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('59', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:29', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('60', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:29', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('61', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:29', null, '24', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('62', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:29', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('63', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:30', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('64', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:30', null, '25', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('65', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:30', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('66', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:30', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('67', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:30', null, '49', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('68', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:30', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('69', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:30', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('70', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:30', null, '25', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('71', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:30', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('72', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:30', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('73', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:30', null, '24', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('74', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:30', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('75', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:30', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('76', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:30', null, '68', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('77', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:31', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('78', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:31', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('79', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:31', null, '23', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('80', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:31', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('81', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:31', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('82', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:31', null, '23', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('83', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:31', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('84', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:31', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('85', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:31', null, '25', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('86', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:35', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('87', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:35', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('88', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:35', null, '36', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('89', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:40', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('90', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:40', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('91', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:40', null, '33', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('92', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:45', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('93', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:45', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('94', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:45', null, '56', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('95', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 09:54:50', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('96', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:50', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('97', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 09:54:50', null, '38', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('98', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:03:38', null, '7', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('99', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:03:38', null, '8', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('100', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:03:38', null, '80', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('101', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:03:40', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('102', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:03:40', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('103', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:03:40', null, '24', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('104', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:03:45', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('105', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:03:45', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('106', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:03:45', null, '24', 'FAILURE');
INSERT INTO `qrtz_logs` VALUES ('107', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:28', null, '4', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('108', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:28', null, '2', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('109', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:28', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('110', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:28', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('111', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:28', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('112', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:28', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('113', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:28', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('114', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:29', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('115', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:29', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('116', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:29', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('117', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:29', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('118', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:29', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('119', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:29', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('120', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:29', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('121', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:29', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('122', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:29', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('123', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:30', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('124', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:30', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('125', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:35', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('126', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:35', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('127', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:40', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('128', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:40', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('129', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:45', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('130', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:45', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('131', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:50', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('132', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:50', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('133', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:04:55', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('134', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:04:55', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('135', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:05:00', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('136', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:05:00', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('137', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:05:05', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('138', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:05:05', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('139', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:05:10', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('140', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:05:10', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('141', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:05:15', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('142', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:05:15', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('143', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:05:20', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('144', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:05:20', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('145', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:05:25', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('146', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:05:25', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('147', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:05:30', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('148', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:05:30', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('149', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:05:35', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('150', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:05:35', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('151', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:05:40', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('152', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:05:40', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('153', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:05:45', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('154', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:05:45', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('155', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:05:50', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('156', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:05:50', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('157', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:06:04', null, '7', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('158', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:06:05', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('159', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:06:05', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('160', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:06:10', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('161', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:06:15', null, '3', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('162', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:06:15', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('163', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:06:15', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('164', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:06:15', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('165', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:06:15', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('166', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:06:15', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('167', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:06:20', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('168', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:06:20', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('169', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:06:25', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('170', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:06:25', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('171', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:06:49', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('172', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:06:49', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('173', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:06:49', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('174', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:06:49', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('175', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:06:49', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('176', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:06:49', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('177', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:06:50', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('178', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:06:50', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('179', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:06:50', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('180', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:06:50', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('181', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:06:55', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('182', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:06:55', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('183', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:07:00', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('184', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:07:00', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('185', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:07:05', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('186', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:07:05', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('187', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:07:10', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('188', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:07:10', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('189', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:07:15', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('190', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:07:15', null, '1', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('191', null, 'com.test.module_schedule.task.TaskDemo', '2019-08-08 10:07:21', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('192', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:07:22', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('193', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:07:25', null, '0', 'SUCCESS');
INSERT INTO `qrtz_logs` VALUES ('194', null, 'com.test.module_schedule.task.TaskDemo2', '2019-08-08 10:07:30', null, '1', 'SUCCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('clusteredScheduler', 'DESKTOP-K59EE1R1565258764288', '1565258851488', '10000');
INSERT INTO `qrtz_scheduler_state` VALUES ('quartzScheduler', 'DESKTOP-L2HH64U1534213605233', '1534214089095', '10000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('clusteredScheduler', 'TaskDemo', '1', 'TaskDemo', '1', null, '1565249400000', '-1', '5', 'WAITING', 'CRON', '1565248103000', '0', null, '0', '');
INSERT INTO `qrtz_triggers` VALUES ('clusteredScheduler', 'TaskDemo2', '2', 'TaskDemo2', '2', null, '1565258855000', '1565258850000', '5', 'WAITING', 'CRON', '1565251660000', '0', null, '0', '');
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', 'com.quartz.job.HelloJob', '1', 'com.quartz.job.HelloJob', '1', null, '1532763942000', '1532763936000', '5', 'PAUSED', 'CRON', '1528191828000', '0', null, '0', '');
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', 'com.quartz.job.NewJob', '2', 'com.quartz.job.NewJob', '2', null, '1532764110000', '1532764105000', '5', 'PAUSED', 'CRON', '1528184964000', '0', null, '0', '');

-- ----------------------------
-- Table structure for quartz_schedulejob
-- ----------------------------
DROP TABLE IF EXISTS `quartz_schedulejob`;
CREATE TABLE `quartz_schedulejob` (
  `ID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务id',
  `JOB_NAME` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `JOB_STATUS` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务状态 0禁用 1启用',
  `CRON_EXPRESSION` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务运行时间表达式',
  `CONCURRENT` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否并发启动任务 0禁用 1启用',
  `DESCRIPTION` varchar(516) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务描述',
  `JOB_GROUP` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务所属组',
  `TARGET_OBJECT` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行任务的类',
  `TARGET_METHOD` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务类中的方法',
  `IS_SPRING_BEAN` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否是Spring中定义的Bean 0不是 1是 如果是0需要设置全类名,测试CLAZZ字段需要配置',
  `CLAZZ` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '如果不是Spring中的Bean需要配置全类名用于反射',
  `CHILD_JOBS` varchar(516) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '[一系列(包括单个)]的子任务(按照配置的顺序执行)',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='调度时间配置表';

-- ----------------------------
-- Records of quartz_schedulejob
-- ----------------------------
INSERT INTO `quartz_schedulejob` VALUES ('111', '测试定时器', '1', '0 0/30 * * * ? *', '1', '每隔5秒执行一次', '1', 'demoTask', 'demoTask1', '1', 'TaskDemo', null);
INSERT INTO `quartz_schedulejob` VALUES ('222', '测试2', '1', '0/5 * * * * ?', '1', 'asa', '2', 'asasa', 'sasa', 'asassa', 'TaskDemo2', '1');
INSERT INTO `quartz_schedulejob` VALUES ('333', '测试2', '1', '0 0/10 * * * ? *', '1', 'asa', '2', 'asasa', 'sasa', 'asassa', 'TaskDemo2', '1');
INSERT INTO `quartz_schedulejob` VALUES ('4', '测试2', '0', '0 0/10 * * * ? *', '1', 'asa', '4', 'asasa', 'sasa', 'asassa', 'TaskDemo2', '1');

-- ----------------------------
-- Table structure for t_auth_log
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_log`;
CREATE TABLE `t_auth_log` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `title` varchar(150) DEFAULT NULL COMMENT '标题',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `message` varchar(255) DEFAULT NULL COMMENT '消息',
  `op_date` date DEFAULT NULL COMMENT '日期',
  `source` varchar(255) DEFAULT NULL COMMENT '来源',
  `remark` text COMMENT '备注',
  `cost_time` double(12,0) DEFAULT NULL COMMENT '耗时操作(单位毫秒)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志同步信息表  -本地';

-- ----------------------------
-- Records of t_auth_log
-- ----------------------------

-- ----------------------------
-- Table structure for weimi_noticeinfo
-- ----------------------------
DROP TABLE IF EXISTS `weimi_noticeinfo`;
CREATE TABLE `weimi_noticeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `isDeleted` int(11) DEFAULT NULL,
  `noticeContent` text,
  `noticeTitle` varchar(255) DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weimi_noticeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for wm_activity_info
-- ----------------------------
DROP TABLE IF EXISTS `wm_activity_info`;
CREATE TABLE `wm_activity_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(55) DEFAULT NULL COMMENT '活动名称',
  `activityId` varchar(64) DEFAULT NULL COMMENT '活动名称ID',
  `activitySite` varchar(255) DEFAULT NULL COMMENT '活动地点，是否结算奖励',
  `numbers` int(11) DEFAULT NULL COMMENT '投票数',
  `status` int(1) DEFAULT '1' COMMENT '活动状态：0“未开始”、1“已上线”、2“已结束”',
  `describe` text COMMENT '活动描述',
  `rule` text COMMENT '活动规则',
  `startTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动开始时间',
  `endTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动截止时间',
  `activityType` int(11) DEFAULT NULL COMMENT '活动类型名称',
  `votePer` int(11) DEFAULT '-1' COMMENT '每人多少票，-1为自己资产数',
  `updateTime` datetime DEFAULT NULL COMMENT '创建时间或修改时间',
  `isDelete` int(11) DEFAULT '1',
  `isAward` int(11) DEFAULT '0' COMMENT '是否发放奖励 0.没有 1.发放',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_activity_info
-- ----------------------------

-- ----------------------------
-- Table structure for wm_activity_option
-- ----------------------------
DROP TABLE IF EXISTS `wm_activity_option`;
CREATE TABLE `wm_activity_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activityId` varchar(128) DEFAULT NULL,
  `optionId` varchar(128) DEFAULT NULL COMMENT '社区公投，群组ID，或者用户ID',
  `content` text,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `money` decimal(8,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_activity_option
-- ----------------------------

-- ----------------------------
-- Table structure for wm_activity_price
-- ----------------------------
DROP TABLE IF EXISTS `wm_activity_price`;
CREATE TABLE `wm_activity_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(128) DEFAULT NULL COMMENT '日期',
  `price` decimal(8,4) DEFAULT NULL COMMENT '最低价或者最高价',
  `type` varchar(11) DEFAULT NULL COMMENT '类型 min最低，max最高',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_activity_price
-- ----------------------------

-- ----------------------------
-- Table structure for wm_activity_vote
-- ----------------------------
DROP TABLE IF EXISTS `wm_activity_vote`;
CREATE TABLE `wm_activity_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activityId` varchar(128) DEFAULT NULL,
  `optionId` varchar(128) DEFAULT NULL COMMENT '选项ID',
  `userId` varchar(128) DEFAULT NULL COMMENT '投票人Id',
  `voteCount` int(11) DEFAULT NULL COMMENT '投票数',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `type` int(11) DEFAULT NULL COMMENT '1.公投。2.英雄榜',
  `remark` varchar(128) DEFAULT NULL,
  `isAward` int(11) DEFAULT NULL,
  `money` decimal(8,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_activity_vote
-- ----------------------------

-- ----------------------------
-- Table structure for wm_back_resource
-- ----------------------------
DROP TABLE IF EXISTS `wm_back_resource`;
CREATE TABLE `wm_back_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `url` varchar(64) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL COMMENT '唯一标识符',
  `permission` varchar(64) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL COMMENT '父级菜单',
  `type` int(11) DEFAULT NULL COMMENT '资源类型，1.菜单资源  2.功能资源',
  `display` tinyint(1) DEFAULT '1' COMMENT '是否显示菜单，1表示显示，-1表示不显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_back_resource
-- ----------------------------

-- ----------------------------
-- Table structure for wm_back_role
-- ----------------------------
DROP TABLE IF EXISTS `wm_back_role`;
CREATE TABLE `wm_back_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `sn` varchar(64) DEFAULT NULL,
  `status` int(2) DEFAULT '0' COMMENT '状态  0 停用  1 启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_back_role
-- ----------------------------

-- ----------------------------
-- Table structure for wm_back_role_res
-- ----------------------------
DROP TABLE IF EXISTS `wm_back_role_res`;
CREATE TABLE `wm_back_role_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `res_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_back_role_res
-- ----------------------------

-- ----------------------------
-- Table structure for wm_back_user
-- ----------------------------
DROP TABLE IF EXISTS `wm_back_user`;
CREATE TABLE `wm_back_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(24) DEFAULT NULL,
  `userPassword` varchar(64) DEFAULT NULL,
  `isEnable` varchar(255) DEFAULT '1' COMMENT '1.启用，0不启用',
  `ownerSite` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastLogin` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_back_user
-- ----------------------------
INSERT INTO `wm_back_user` VALUES ('1', 'admin', 'c79a2f0865e6a41eefbaed876657cb89', '1', null, '2019-07-30 08:42:04', '2019-07-30 08:42:04');

-- ----------------------------
-- Table structure for wm_back_user_role
-- ----------------------------
DROP TABLE IF EXISTS `wm_back_user_role`;
CREATE TABLE `wm_back_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_back_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for wm_forbiden_log
-- ----------------------------
DROP TABLE IF EXISTS `wm_forbiden_log`;
CREATE TABLE `wm_forbiden_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(128) NOT NULL,
  `startTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束时间',
  `hour` varchar(128) DEFAULT NULL COMMENT '禁言时间',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `newsId` int(11) DEFAULT NULL COMMENT '评论或者说说的ID',
  `type` int(11) DEFAULT NULL COMMENT '禁止评论还是发布说说 1.说说 2.评论',
  `isDelete` int(11) DEFAULT '0' COMMENT '是否删除，是否解禁。0.有效 1.删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_forbiden_log
-- ----------------------------

-- ----------------------------
-- Table structure for wm_grouptoken
-- ----------------------------
DROP TABLE IF EXISTS `wm_grouptoken`;
CREATE TABLE `wm_grouptoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` varchar(40) NOT NULL,
  `groupName` varchar(255) NOT NULL,
  `groupImg` varchar(400) DEFAULT NULL,
  `createId` varchar(400) NOT NULL,
  `flag` int(4) NOT NULL DEFAULT '1' COMMENT '0无效  1有效 群组状态',
  `isMajor` int(4) NOT NULL DEFAULT '0' COMMENT '大群组标识',
  `insertTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_grouptoken
-- ----------------------------

-- ----------------------------
-- Table structure for wm_integralrecord
-- ----------------------------
DROP TABLE IF EXISTS `wm_integralrecord`;
CREATE TABLE `wm_integralrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integralSendId` int(11) DEFAULT NULL COMMENT '积分红包id',
  `userId` varchar(50) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '积分交易类型：0，收入；1,支出;2.退回；3.系统调整；4.邀请成功;5.设置管理员6.签到',
  `integral` varchar(11) DEFAULT NULL COMMENT '积分个数',
  `addTime` datetime DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `operatorId` varchar(50) DEFAULT NULL COMMENT '系统操作ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_integralrecord
-- ----------------------------

-- ----------------------------
-- Table structure for wm_integralsend
-- ----------------------------
DROP TABLE IF EXISTS `wm_integralsend`;
CREATE TABLE `wm_integralsend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sendUserId` varchar(50) DEFAULT NULL COMMENT '积分发送者',
  `totalIntegral` varchar(11) DEFAULT NULL COMMENT '积分总额',
  `remainingIntegral` varchar(11) DEFAULT NULL COMMENT '剩余的积分',
  `number` varchar(11) DEFAULT NULL COMMENT '红包个数',
  `remainingNumber` varchar(11) DEFAULT NULL COMMENT '剩余红包个数',
  `addTime` datetime DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  `type` varchar(4) DEFAULT NULL COMMENT '红包类型   1：私发；2：群发',
  `overdue` tinyint(1) DEFAULT '0' COMMENT '是否过期：默认为0；1、过期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_integralsend
-- ----------------------------

-- ----------------------------
-- Table structure for wm_invite_log
-- ----------------------------
DROP TABLE IF EXISTS `wm_invite_log`;
CREATE TABLE `wm_invite_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invitee` varchar(64) DEFAULT NULL COMMENT '被邀请人',
  `inviter` varchar(64) DEFAULT NULL COMMENT '邀请人',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `reserve` varchar(255) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户邀请人记录';

-- ----------------------------
-- Records of wm_invite_log
-- ----------------------------

-- ----------------------------
-- Table structure for wm_label_value
-- ----------------------------
DROP TABLE IF EXISTS `wm_label_value`;
CREATE TABLE `wm_label_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `label` varchar(65) DEFAULT NULL COMMENT '标签',
  `value` varchar(65) DEFAULT NULL COMMENT '标签值',
  `pid` int(11) DEFAULT NULL,
  `isEnable` varchar(65) DEFAULT '1' COMMENT '是否有效',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息--作用',
  `reservedValue` varchar(65) DEFAULT NULL COMMENT '预留值3',
  `isDelete` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of wm_label_value
-- ----------------------------
INSERT INTO `wm_label_value` VALUES ('1', 'phone', '18896541282', '0', '1', '通知审核的管理员电话', '', '1');
INSERT INTO `wm_label_value` VALUES ('2', 'phoneCount', '5', '0', '1', '达到5条审核信息进行电话通知', '', '1');
INSERT INTO `wm_label_value` VALUES ('3', 'phoneMinute', '30', '0', '1', '达到5条后，密集情况下隔30分钟再发', '', '1');

-- ----------------------------
-- Table structure for wm_newscontent
-- ----------------------------
DROP TABLE IF EXISTS `wm_newscontent`;
CREATE TABLE `wm_newscontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsId` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `publishTime` datetime DEFAULT NULL,
  `userId` varchar(128) DEFAULT NULL,
  `isDelete` int(4) NOT NULL DEFAULT '0' COMMENT '0无效 1有效',
  `type` int(11) DEFAULT NULL COMMENT '1.说说 2.公投',
  `site` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_newscontent
-- ----------------------------

-- ----------------------------
-- Table structure for wm_news_comment
-- ----------------------------
DROP TABLE IF EXISTS `wm_news_comment`;
CREATE TABLE `wm_news_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsId` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1.是点赞 2.评论',
  `userId` varchar(64) DEFAULT NULL COMMENT '评论点赞的用户ID',
  `content` text COMMENT '评论的内容',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `isDelete` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_news_comment
-- ----------------------------

-- ----------------------------
-- Table structure for wm_news_content
-- ----------------------------
DROP TABLE IF EXISTS `wm_news_content`;
CREATE TABLE `wm_news_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsId` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `publishTime` datetime DEFAULT NULL,
  `userId` varchar(128) DEFAULT NULL,
  `isDelete` int(4) NOT NULL DEFAULT '0' COMMENT '0无效 1有效',
  `type` int(11) DEFAULT NULL COMMENT '1.说说 2.公投',
  `site` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_news_content
-- ----------------------------

-- ----------------------------
-- Table structure for wm_news_img
-- ----------------------------
DROP TABLE IF EXISTS `wm_news_img`;
CREATE TABLE `wm_news_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsId` varchar(128) DEFAULT NULL,
  `smallImg` varchar(128) DEFAULT NULL COMMENT '发说说内容',
  `newsImg` varchar(128) DEFAULT NULL,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `isDelete` int(11) DEFAULT NULL COMMENT '1是删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_news_img
-- ----------------------------

-- ----------------------------
-- Table structure for wm_phone_code
-- ----------------------------
DROP TABLE IF EXISTS `wm_phone_code`;
CREATE TABLE `wm_phone_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(64) NOT NULL,
  `phoneCode` varchar(64) DEFAULT NULL,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `isEnable` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT '手机号更新了几次',
  `updateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_phone_code
-- ----------------------------

-- ----------------------------
-- Table structure for wm_seed
-- ----------------------------
DROP TABLE IF EXISTS `wm_seed`;
CREATE TABLE `wm_seed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seedName` varchar(255) DEFAULT NULL COMMENT '种子名字',
  `seedKind` int(12) DEFAULT NULL,
  `seedCycle` int(12) DEFAULT NULL COMMENT '种子成熟周期(H)',
  `seedExUenc` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `type` int(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_seed
-- ----------------------------

-- ----------------------------
-- Table structure for wm_seed_user
-- ----------------------------
DROP TABLE IF EXISTS `wm_seed_user`;
CREATE TABLE `wm_seed_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(64) DEFAULT NULL,
  `integralUse` int(11) DEFAULT '0' COMMENT '积分消耗个数',
  `seedKind` int(11) NOT NULL COMMENT '种子类型',
  `cycle` varchar(16) DEFAULT NULL COMMENT '周期，在变短',
  `period` int(12) NOT NULL COMMENT '四个阶段,0为未种植,4为成熟',
  `startTime` datetime DEFAULT NULL COMMENT '开始种植时期',
  `endTime` datetime DEFAULT NULL COMMENT '成熟时期',
  `isMature` int(255) DEFAULT '0' COMMENT '是否成熟',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `isEnable` int(12) DEFAULT '0' COMMENT '是否生效,1生效用户拥有,2用户已经摘取果实',
  `star` varchar(64) DEFAULT NULL COMMENT '仓位',
  `quickCycle` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='种子系统';

-- ----------------------------
-- Records of wm_seed_user
-- ----------------------------

-- ----------------------------
-- Table structure for wm_star
-- ----------------------------
DROP TABLE IF EXISTS `wm_star`;
CREATE TABLE `wm_star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(64) DEFAULT NULL,
  `freezeUenc` varchar(255) DEFAULT NULL,
  `starKind` int(2) DEFAULT NULL,
  `isEnable` int(2) DEFAULT NULL,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_star
-- ----------------------------

-- ----------------------------
-- Table structure for wm_trade_log
-- ----------------------------
DROP TABLE IF EXISTS `wm_trade_log`;
CREATE TABLE `wm_trade_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(64) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `hash` varchar(255) DEFAULT NULL COMMENT '交易返回的hash',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `isDelete` varchar(255) DEFAULT '1' COMMENT '是否模拟删除0删除',
  `version` varchar(64) DEFAULT NULL COMMENT '记录是那批转账',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `mainAddress` varchar(64) DEFAULT NULL,
  `isTrue` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_trade_log
-- ----------------------------

-- ----------------------------
-- Table structure for wm_uenc
-- ----------------------------
DROP TABLE IF EXISTS `wm_uenc`;
CREATE TABLE `wm_uenc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(64) DEFAULT NULL,
  `freezeUenc` varchar(255) DEFAULT NULL COMMENT '被冻结的uenc',
  `uenc` varchar(255) DEFAULT NULL COMMENT '活期的uenc数量 APP',
  `walletAddress` varchar(255) DEFAULT NULL COMMENT '钱包地址',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `publicKey` varchar(255) DEFAULT NULL,
  `privateKey` varchar(255) DEFAULT NULL,
  `walletTab` varchar(255) DEFAULT NULL COMMENT '地址标记',
  `indexOf` int(11) DEFAULT NULL COMMENT '数组的下标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_uenc
-- ----------------------------

-- ----------------------------
-- Table structure for wm_uenc_detail
-- ----------------------------
DROP TABLE IF EXISTS `wm_uenc_detail`;
CREATE TABLE `wm_uenc_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` varchar(11) DEFAULT NULL COMMENT '数量',
  `type` int(11) DEFAULT NULL COMMENT '类型1.收种子获得2.手续费3.提现4.充值6开启星球7.关闭星球8.加入俱乐部。9.退出俱乐部',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `userId` varchar(64) DEFAULT NULL COMMENT '用户Id',
  `hash` varchar(255) DEFAULT NULL,
  `isDelete` varchar(255) DEFAULT '0' COMMENT '是否删除',
  `isTrue` int(11) DEFAULT NULL COMMENT '是否交易成功',
  `tradeAddress` varchar(64) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `poundage` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='uenc记录表';

-- ----------------------------
-- Records of wm_uenc_detail
-- ----------------------------

-- ----------------------------
-- Table structure for wm_uenc_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `wm_uenc_withdraw`;
CREATE TABLE `wm_uenc_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` varchar(11) DEFAULT NULL COMMENT '数量',
  `type` int(11) DEFAULT NULL COMMENT '类型1.收种子获得2.手续费3.提现4.充值6开启星球7.关闭星球8.加入俱乐部。9.退出俱乐部',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `userId` varchar(64) DEFAULT NULL COMMENT '用户Id',
  `hash` varchar(255) DEFAULT NULL,
  `isDelete` varchar(255) DEFAULT '0' COMMENT '是否删除',
  `isTrue` int(11) DEFAULT NULL COMMENT '是否交易成功',
  `tradeAddress` varchar(64) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT '0' COMMENT '对应detail表的Id',
  `updateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='uenc记录表';

-- ----------------------------
-- Records of wm_uenc_withdraw
-- ----------------------------

-- ----------------------------
-- Table structure for wm_user
-- ----------------------------
DROP TABLE IF EXISTS `wm_user`;
CREATE TABLE `wm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(40) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `nickName` varchar(50) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `state` int(4) DEFAULT NULL COMMENT '邮箱激活状态 0 无效 1 有效',
  `isDeleted` int(4) DEFAULT NULL COMMENT '删除标记，默认为0,1表删除',
  `addTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `phoneCode` varchar(10) DEFAULT NULL COMMENT '手机验证码',
  `InviteCode` varchar(255) DEFAULT NULL COMMENT '邀请码',
  `userImg` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `superAdmin` tinyint(4) DEFAULT '0' COMMENT '超级管理员：0，不是；1，是',
  `admin` tinyint(4) DEFAULT '0' COMMENT '管理员：0，不是；1，是',
  `integral` varchar(11) DEFAULT '' COMMENT '积分个数',
  `signTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `isSign` int(4) DEFAULT '0',
  `isEnable` int(4) DEFAULT '-1',
  `uImg` varchar(255) DEFAULT NULL,
  `userCode` varchar(128) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `version` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_user
-- ----------------------------

-- ----------------------------
-- Table structure for wm_userapptoken
-- ----------------------------
DROP TABLE IF EXISTS `wm_userapptoken`;
CREATE TABLE `wm_userapptoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(40) NOT NULL,
  `token` varchar(300) DEFAULT NULL,
  `insertTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_userapptoken
-- ----------------------------

-- ----------------------------
-- Table structure for wm_user_group
-- ----------------------------
DROP TABLE IF EXISTS `wm_user_group`;
CREATE TABLE `wm_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL,
  `groupId` varchar(255) NOT NULL,
  `flag` int(4) DEFAULT '0' COMMENT ' 群主是否同意入群请求 0是未处理 1是不同意 2是同意',
  `remark` varchar(255) DEFAULT '' COMMENT '申请加入群组的备注信息',
  `createTime` datetime DEFAULT NULL,
  `isProvide` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for wm_version
-- ----------------------------
DROP TABLE IF EXISTS `wm_version`;
CREATE TABLE `wm_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(255) DEFAULT NULL,
  `downloadPath` varchar(255) DEFAULT NULL COMMENT 'apk下载地址',
  `updateContent` text COMMENT '更新内容',
  `force` tinyint(4) DEFAULT '0' COMMENT '是否强制更新  默认为0, 1表示强制',
  `addTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `device` varchar(255) DEFAULT NULL COMMENT '设备',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wm_version
-- ----------------------------

-- ----------------------------
-- Procedure structure for proc_adder
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_adder`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adder`(IN a int, IN b int, OUT sum int)
BEGIN
    

    DECLARE c int;
    if a is null then set a = 0; 
    end if;
  
    if b is null then set b = 0;
    end if;
set sum  = a + b;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pro_test
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_test`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `pro_test`(IN userID varchar(20))
BEGIN
	#
 DECLARE beginTime datetime DEFAULT NOW();
 DECLARE endtime datetime DEFAULT NOW();
 DECLARE  isEffect int ;
 DECLARE indexTime int;

 SELECT addtime into beginTime from wm_integralsend where userId=userID;

 select overdue into isEffect from wm_integralsend where userId=userID;
 
 select TIMESTAMPDIFF(MINUTE,beginTime,endtime) INTO indexTime;

 IF isEffect = 0 and indexTime >= 24 THEN
   

   UPDATE wm_user set integral=1 where userId=userID;

	 UPDATE wm_integralrecord set overdue=1 where userId=userID;
 
END IF;

END
;;
DELIMITER ;

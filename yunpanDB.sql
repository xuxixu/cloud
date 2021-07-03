/*
 Navicat Premium Data Transfer

 Source Server         : Test
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : 139.9.42.164:3306
 Source Schema         : yunpanDB

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 03/07/2021 16:30:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for myfiles
-- ----------------------------
DROP TABLE IF EXISTS `myfiles`;
CREATE TABLE `myfiles`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_ext` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_size` bigint NULL DEFAULT NULL,
  `file_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL COMMENT '1：表示删除',
  `is_folder` int NULL DEFAULT NULL COMMENT '1：文件夹',
  `parent_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_2`(`user_id`) USING BTREE,
  INDEX `FK_Reference_3`(`parent_id`) USING BTREE,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`parent_id`) REFERENCES `myfiles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myfiles
-- ----------------------------

-- ----------------------------
-- Table structure for resource_share
-- ----------------------------
DROP TABLE IF EXISTS `resource_share`;
CREATE TABLE `resource_share`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `resource_list` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件id，多个使用逗号分隔',
  `share_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `browse_count` int NULL DEFAULT 0,
  `save_count` int NULL DEFAULT 0,
  `download_count` int NULL DEFAULT 0,
  `share_time` datetime NOT NULL,
  `expire_time` datetime NULL DEFAULT NULL COMMENT 'null为永久有效',
  `share_type` int NULL DEFAULT NULL COMMENT '1：公开\r\n            0：私密',
  `share_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_1`(`user_id`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource_share
-- ----------------------------

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `last_login` datetime NULL DEFAULT NULL,
  `status` int NOT NULL COMMENT '0：未激活\r\n            1：正常\r\n            2：注销',
  `is_admin` int NOT NULL DEFAULT 0 COMMENT '1：管理员\r\n            0：普通用户',
  `portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `disk_max_size` int NULL DEFAULT 5,
  `bucket_name` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OBS桶名为用户email将@替换为中划线，且不可超过63个字符',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (1, 'jerry', '11111111', 1, '13888888888', 'abc@126.com', '2021-07-03 10:45:55', NULL, 1, 0, NULL, 5, NULL);
INSERT INTO `userinfo` VALUES (2, 'petter', '22222222', 1, '13888888888', 'def@126.com', '2021-07-03 10:46:57', NULL, 1, 0, NULL, 5, NULL);

SET FOREIGN_KEY_CHECKS = 1;

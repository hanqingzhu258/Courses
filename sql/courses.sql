/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50515
 Source Host           : localhost:3306
 Source Schema         : courses

 Target Server Type    : MySQL
 Target Server Version : 50515
 File Encoding         : 65001

 Date: 08/01/2018 21:35:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of chapter
-- ----------------------------
INSERT INTO `chapter` VALUES ('b7ffaff214854796badc6ddb0f43c6c0', 'testsss', 'testsss', '2017-12-13 21:47:04', '2017-12-13 21:47:04', 0);
INSERT INTO `chapter` VALUES ('c754937d17dd4beab5a07cdd85874d63', 'string', 'zzzzzzzzzzzzz', '2017-12-05 21:36:45', '2017-12-06 08:42:22', 0);
INSERT INTO `chapter` VALUES ('ce5952e1b48144c0b41f8255b4ca9a93', 'strddddd', 'stringddddddddd', '2017-12-05 20:54:36', '2017-12-13 22:01:02', 0);

-- ----------------------------
-- Table structure for chapter_comment
-- ----------------------------
DROP TABLE IF EXISTS `chapter_comment`;
CREATE TABLE `chapter_comment`  (
  `chapter_id` varchar(33) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `comment_id` bigint(20) NOT NULL,
  `is_delete` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`chapter_id`, `comment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for chapter_exercise
-- ----------------------------
DROP TABLE IF EXISTS `chapter_exercise`;
CREATE TABLE `chapter_exercise`  (
  `chapter_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exercise_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`chapter_id`, `exercise_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for chapter_homework
-- ----------------------------
DROP TABLE IF EXISTS `chapter_homework`;
CREATE TABLE `chapter_homework`  (
  `chapter_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `homework_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`chapter_id`, `homework_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for chapter_unit
-- ----------------------------
DROP TABLE IF EXISTS `chapter_unit`;
CREATE TABLE `chapter_unit`  (
  `chapter_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`chapter_id`, `unit_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of chapter_unit
-- ----------------------------
INSERT INTO `chapter_unit` VALUES ('b7ffaff214854796badc6ddb0f43c6c0', 'bcbfe8d211f24a7ca64636a34443f613', '2017-12-13 22:47:33', '2017-12-13 22:47:33', 0);
INSERT INTO `chapter_unit` VALUES ('b7ffaff214854796badc6ddb0f43c6c0', 'e5637d3f0f9f4804bfdd0741a3b51451', '2017-12-17 19:39:45', '2017-12-17 19:39:45', 1);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `agree_count` int(11) NOT NULL DEFAULT 0,
  `is_check` tinyint(4) NOT NULL DEFAULT 0,
  `is_pass` tinyint(4) NOT NULL DEFAULT 1,
  `student_id` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chapter_id` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `reply` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `chapter_id`(`chapter_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `credit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hours` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('02acad2b6d7f468da1435055a2b72443', 'A28', '商业研究方法', '辅助课程', 'sacds', '1', '1', '2017-12-24 20:43:18', '2018-01-06 21:52:54', 0);
INSERT INTO `course` VALUES ('0a497b0c5ae443869938232979b03e9f', 'A35', '毕业论文/设计', '辅助课程', '', '1', '1', '2017-12-24 20:46:48', '2017-12-24 20:46:48', 0);
INSERT INTO `course` VALUES ('1', '1', '1', '1', '1', '1', '1', '2017-12-24 20:18:07', '2017-12-24 20:18:07', 0);
INSERT INTO `course` VALUES ('17bfbbcd244b4f5b9a15df2b43ce87b9', 'A19', 'JAVA高级应用（课程设计）', '辅助课程', '', '1', '1', '2017-12-24 20:38:20', '2017-12-24 20:38:20', 0);
INSERT INTO `course` VALUES ('1a80be5c25a641529d4f439546c0700f', 'A21', 'Python', '辅助课程', '', '1', '1', '2017-12-24 20:39:27', '2017-12-24 20:39:27', 0);
INSERT INTO `course` VALUES ('1ba8f61a23d64e6e939552e39602b06b', 'B12', '大学物理实验', '辅助课程', '', '1', '1', '2017-12-24 20:22:39', '2017-12-24 20:22:39', 0);
INSERT INTO `course` VALUES ('1e1cb4677feb488c86ba9e1b618a6357', 'B02', '英语', '辅助课程', '', '1', '1', '2017-12-24 20:16:56', '2017-12-24 20:16:56', 0);
INSERT INTO `course` VALUES ('2c6e1f38838a4e74b2a742e968867c82', 'A06', '经济学', '辅助课程', '', '1', '1', '2017-12-24 20:28:13', '2017-12-24 20:28:13', 0);
INSERT INTO `course` VALUES ('2d097c854e5849648d7f9285ca72e602', 'A18', '数据库原理与应用', '辅助课程', '', '1', '1', '2017-12-24 20:37:17', '2017-12-24 20:37:17', 0);
INSERT INTO `course` VALUES ('3067bec0fae449b4b475ffacd86aeb3c', 'A08', '供应链与物流管理', '核心课程', 'this a cool course!!!!!!!!!1', '1', '1', '2017-12-24 20:31:20', '2018-01-07 17:09:23', 0);
INSERT INTO `course` VALUES ('38381e9deba64eb5b8803df07b5a756c', 'A17', '计算机科学与基础', '辅助课程', '', '1', '1', '2017-12-24 20:36:29', '2017-12-24 20:36:29', 0);
INSERT INTO `course` VALUES ('4486c2dc6da44bf3ab4ca450ab22f50b', 'B11', '大学物理C', '辅助课程', '', '1', '1', '2017-12-24 20:22:13', '2017-12-24 20:22:13', 0);
INSERT INTO `course` VALUES ('458d0ee25a6f4c76ba7c66cb6f9fb684', 'A04', '电子商务案例分析', '辅助课程', '', '1', '1', '2017-12-24 20:27:04', '2017-12-24 20:27:04', 0);
INSERT INTO `course` VALUES ('47a4c912bd774054afc9116490af7cf8', 'A01', '电子商务概论', '核心课程', ',m.,n,年半下班vm查询nm', '1', '1', '2017-12-24 20:24:52', '2018-01-03 19:57:21', 0);
INSERT INTO `course` VALUES ('54e03bc9e2d24f90aabd13bd8d6d11dd', 'A13', '信息系统分析与设计', '核心课程', '', '1', '1', '2017-12-24 20:34:47', '2017-12-24 20:34:47', 0);
INSERT INTO `course` VALUES ('55bb7cb3be5b44349675090f61cc56e5', 'A24', '商务智能与大数据分析', '核心课程', '', '1', '1', '2017-12-24 20:41:00', '2017-12-24 20:41:00', 0);
INSERT INTO `course` VALUES ('566e51f81efe40a2961dcbbeb31d85cf', 'B07', '思想道德修养与法律基础', '辅助课程', '', '1', '1', '2017-12-24 20:20:18', '2017-12-24 20:20:18', 0);
INSERT INTO `course` VALUES ('56d754b9edcc47dc9c98a1a49ebf9745', 'A11', '电子商务服务', '辅助课程', '', '1', '1', '2017-12-24 20:33:30', '2017-12-24 20:33:30', 0);
INSERT INTO `course` VALUES ('5dbcdabac52d4a968f791a99842c3310', 'B06', '中国近代史纲要', '辅助课程', '', '1', '1', '2017-12-24 20:19:38', '2017-12-24 20:19:38', 0);
INSERT INTO `course` VALUES ('63b9db88035b4433b23979dec9cde6a6', 'A26', '离散数学', '辅助课程', '', '1', '1', '2017-12-24 20:42:12', '2017-12-24 20:42:12', 0);
INSERT INTO `course` VALUES ('63be3c4a046b4156a4ab68c58331ad46', 'B10', '高等数学A', '辅助课程', '', '1', '1', '2017-12-24 20:21:52', '2017-12-24 20:21:52', 0);
INSERT INTO `course` VALUES ('6506e68207f34345bfa72252484d8567', '1', '1', '1', '1', '1', '1', '2018-01-06 21:43:01', '2018-01-06 21:43:01', 0);
INSERT INTO `course` VALUES ('68be5e7ee8d64caca1727c4b00a67b9a', 'A12', '社会化营销', '预备课程', '', '1', '1', '2017-12-24 20:33:57', '2017-12-24 20:33:57', 0);
INSERT INTO `course` VALUES ('68f5f3cf5f1341469b54a97c7693e9bc', 'A09', '网络交易', '辅助课程', '', '1', '1', '2017-12-24 20:31:56', '2017-12-24 20:31:56', 0);
INSERT INTO `course` VALUES ('6d6d1186c4494c7a93914b3754c1eaac', 'B14', '概率论与数理统计', '辅助课程', '', '1', '1', '2017-12-24 20:23:36', '2017-12-24 20:23:36', 0);
INSERT INTO `course` VALUES ('74615fae2f434219abf8753797f77a94', 'A36', '创业管理', '辅助课程', '', '1', '1', '2017-12-24 20:47:12', '2017-12-24 20:47:12', 0);
INSERT INTO `course` VALUES ('7b72db9416c640f6b61305cc6c4b772e', 'A34', '电子商务发展专题', '辅助课程', '', '1', '1', '2017-12-24 20:46:03', '2017-12-24 20:46:03', 0);
INSERT INTO `course` VALUES ('8', 'string44', 'string444', 'string444', 'string', 'stri44ng', 'strin44g', '2017-12-26 23:04:52', '2017-12-28 18:02:22', 1);
INSERT INTO `course` VALUES ('80450753b02445eda613ebcfae9cfaa5', 'A23', '管理统计学', '核心磕碜', '', '1', '1', '2017-12-24 20:40:35', '2017-12-24 20:40:35', 0);
INSERT INTO `course` VALUES ('805396da52b3420293cae4845a0c7236', 'B04', '毛泽东思想与中国特色社会主义理论', '辅助课程', '', '1', '1', '2017-12-24 20:18:07', '2017-12-24 20:18:07', 0);
INSERT INTO `course` VALUES ('8e2abff457c84db8b4b71b44e2373a79', 'A07', '电子商务专业英语', '辅助课程', '', '1', '1', '2017-12-24 20:29:01', '2017-12-24 20:29:01', 0);
INSERT INTO `course` VALUES ('925a54e418d240ce8c309c19df4616d6', 'B03', '大学体育', '辅助课程', '', '1', '1', '2017-12-24 20:17:28', '2017-12-24 20:17:28', 0);
INSERT INTO `course` VALUES ('937a1b99a70e4bd9adcdafc2a87e38c9', 'A02', '企业管理学', '辅助课程', '', '1', '1', '2017-12-24 20:25:31', '2017-12-24 20:25:31', 0);
INSERT INTO `course` VALUES ('96fb9435f15642328520cad703e32e67', 'A05', '经济法', '辅助课程', '', '1', '1', '2017-12-24 20:27:41', '2017-12-24 20:27:41', 1);
INSERT INTO `course` VALUES ('96ffabbebc3f4ec8aeeb66f3f4f39d24', 'A27', '管理决策分析', '辅助课程', '', '1', '1', '2017-12-24 20:42:42', '2017-12-24 20:42:42', 0);
INSERT INTO `course` VALUES ('9be614b2aaeb41579810c4ada43988ad', 'B01', '形势与政策', '辅助课程', '', '0.3', '3', '2017-12-24 20:16:20', '2017-12-24 20:16:20', 0);
INSERT INTO `course` VALUES ('a5cebe6309904802b4ed65b6bba5a985', 'A07', '网络营销', '核心课程', 'hjk', '1', '1', '2017-12-24 20:29:45', '2018-01-03 19:39:40', 0);
INSERT INTO `course` VALUES ('a76d96680af840818cef65ec9b1f5893', 'A18', 'JAVA程序设计（课程设计）', '辅助课程', '', '1', '1', '2017-12-24 20:37:54', '2017-12-24 20:37:54', 0);
INSERT INTO `course` VALUES ('a8e4f84fa7044d219675f4ccc9f5c7c3', 'B08', '军事理论', '辅助课程', '', '1', '1', '2017-12-24 20:20:42', '2017-12-24 20:20:42', 0);
INSERT INTO `course` VALUES ('abd953040f24406493c5229abc67ed79', 'A15', '移动开发技术', '核心课程', '', '1', '1', '2017-12-24 20:35:12', '2017-12-24 20:35:12', 0);
INSERT INTO `course` VALUES ('ac03ee1529e34586b2b34f0a37e1f224', 'A25', '人工智能', '预备课程', '', '1', '1', '2017-12-24 20:41:39', '2017-12-24 20:41:39', 0);
INSERT INTO `course` VALUES ('ada5cddcb5764768bba89a1e9f49850d', 'B09', '大学生心理健康', '辅助课程', '', '1', '1', '2017-12-24 20:21:20', '2017-12-24 20:21:20', 0);
INSERT INTO `course` VALUES ('bee646f3d731496bb9a67e7684294670', 'A29', '管理信息学', '辅助课程', '', '1', '1', '2017-12-24 20:43:46', '2017-12-24 20:43:46', 0);
INSERT INTO `course` VALUES ('c1722db650f54ac68029b4341281e755', 'A10', '客户关系管理', '辅助课程', 'this a cool course!!!!!!', '1', '1', '2017-12-24 20:32:20', '2018-01-07 17:08:34', 0);
INSERT INTO `course` VALUES ('c22dc588c4e642e28b4fbf0e5266584e', 'A33', '电子商务综合实践实训', '核心课程', '', '1', '1', '2017-12-24 20:45:27', '2017-12-24 20:45:27', 0);
INSERT INTO `course` VALUES ('c4a70eeea2b94004a4d0440a3e137ebd', 'B13', '线性代数', '辅助课程', '', '1', '1', '2017-12-24 20:23:04', '2017-12-24 20:23:04', 0);
INSERT INTO `course` VALUES ('c4a7b01ded644212bce6e8c39963a4f0', 'A31', '个性化推荐', 'yu预备课程', '', '1', '1', '2017-12-24 20:44:51', '2017-12-24 20:44:51', 0);
INSERT INTO `course` VALUES ('c6f694ee59fb4b08aac806682beaf36d', 'A37', '创新创业教育', '辅助课程', '', '1', '1', '2017-12-24 20:47:36', '2017-12-24 20:47:36', 0);
INSERT INTO `course` VALUES ('d28d0d16aef24cadb666a35eb5c74f3d', 'A08', '网络金融与支付', '核心课程', '', '1', '1', '2017-12-24 20:30:37', '2017-12-24 20:30:37', 0);
INSERT INTO `course` VALUES ('d6d267c4fff7433f974c6898f653afc6', 'A10', '电子商务安全', '辅助课程', '', '1', '1', '2017-12-24 20:32:52', '2017-12-24 20:32:52', 0);
INSERT INTO `course` VALUES ('d9441495006543b28ef50163f11e5913', 'B15', '工程图学C', '辅助课程', '', '1', '1', '2017-12-24 20:24:08', '2017-12-24 20:24:08', 0);
INSERT INTO `course` VALUES ('de419d0bd25743f0b19ae5a97ecb45e5', 'B05', '马克思主义基本原理概论', '辅助课程', '', '1', '1', '2017-12-24 20:18:54', '2017-12-24 20:18:54', 0);
INSERT INTO `course` VALUES ('dfd1575c3b634d0cbf91f06658e1084d', 'A03', '电子商务专业导论', '辅助课程', '', '1', '1', '2017-12-24 20:26:29', '2017-12-24 20:26:29', 0);
INSERT INTO `course` VALUES ('dfd8c01f7edc4bf8873d688396552e12', 'A22', '运筹学', '核心课程', 'wsedfghj', '1', '1', '2017-12-24 20:40:08', '2018-01-06 21:07:26', 0);
INSERT INTO `course` VALUES ('ed7de5d5525a437e9b234b1934f8ed89', 'A30', '计量经济学', '辅助课程', '', '1', '1', '2017-12-24 20:44:10', '2017-12-24 20:44:10', 0);
INSERT INTO `course` VALUES ('f35a95424907463f93c9cecd6afec2a3', 'A20', 'UML及其建模工具', '辅助课程', '', '1', '1', '2017-12-24 20:39:00', '2017-12-24 20:39:00', 0);
INSERT INTO `course` VALUES ('f5f82afd1f3d421d818f5fae9ba07b68', 'A16', '程序设计语言', '辅助课程', '', '1', '1', '2017-12-24 20:35:40', '2017-12-24 20:35:40', 0);

-- ----------------------------
-- Table structure for course_chapter
-- ----------------------------
DROP TABLE IF EXISTS `course_chapter`;
CREATE TABLE `course_chapter`  (
  `course_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chapter_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`course_id`, `chapter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course_chapter
-- ----------------------------
INSERT INTO `course_chapter` VALUES ('e', 'b7ffaff214854796badc6ddb0f43c6c0', '2017-12-13 21:47:04', '2017-12-13 21:47:04', 0);

-- ----------------------------
-- Table structure for course_inform
-- ----------------------------
DROP TABLE IF EXISTS `course_inform`;
CREATE TABLE `course_inform`  (
  `course_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inform_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`course_id`, `inform_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for course_office
-- ----------------------------
DROP TABLE IF EXISTS `course_office`;
CREATE TABLE `course_office`  (
  `course_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `office_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` smallint(6) DEFAULT 0,
  PRIMARY KEY (`course_id`, `office_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course_office
-- ----------------------------
INSERT INTO `course_office` VALUES ('223a742b176b4aa68dba50c49b81dd84', '1', '2018-01-07 11:21:12', '2018-01-07 11:21:12', 0);
INSERT INTO `course_office` VALUES ('223a742b176b4aa68dba50c49b81dd84', '2', '2018-01-07 11:54:53', '2018-01-07 11:21:12', 0);
INSERT INTO `course_office` VALUES ('223a742b176b4aa68dba50c49b81dd84', '3', '2018-01-07 11:55:07', '2018-01-07 11:21:12', 0);
INSERT INTO `course_office` VALUES ('223a742b176b4aa68dba50c49b81dd84', '4', '2018-01-07 11:55:27', '2018-01-07 11:21:12', 0);

-- ----------------------------
-- Table structure for course_picture
-- ----------------------------
DROP TABLE IF EXISTS `course_picture`;
CREATE TABLE `course_picture`  (
  `course_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `picture_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`course_id`, `picture_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course_picture
-- ----------------------------
INSERT INTO `course_picture` VALUES ('2cbcb37a98f94e90b604288e45f5ed32', '1', '2017-12-26 20:35:54', '2017-12-26 20:35:54', 0);
INSERT INTO `course_picture` VALUES ('b40d0b00798f48a29c6cdf0da979703c', '1', '2017-12-26 20:43:43', '2017-12-26 20:43:43', 0);

-- ----------------------------
-- Table structure for coursegroup
-- ----------------------------
DROP TABLE IF EXISTS `coursegroup`;
CREATE TABLE `coursegroup`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coursegroup
-- ----------------------------
INSERT INTO `coursegroup` VALUES ('1', '1', '1', NULL, '2017-12-24 19:49:27', '2017-12-24 19:49:27', 0);
INSERT INTO `coursegroup` VALUES ('2', '2', '2', NULL, '2017-12-24 19:49:27', '2017-12-24 19:49:27', 0);
INSERT INTO `coursegroup` VALUES ('2aac25c733a347edad60e7e1fcc8b25d', 'B02', '数理基础类课程组', '该课程组主要包含以下课程：  高等数学A、大学物理C、大学物理实验、线性代数、概率论与数理统计、工程图学C。', '2017-12-24 19:49:27', '2017-12-24 19:55:29', 0);
INSERT INTO `coursegroup` VALUES ('3c23544462724655a43f32b2969a3b3b', 'A04', '电商系统设计与开发课程组', '该课程组主要包含以下课程组：\n  核心课程：信息系统分析与设计、移动开发技术 \n  辅助课程：程序设计语言、计算机科学基础、数据库原理与应用、JAVA程序设计（课程设计）、JAVA高级应用（课程设计）、UML及其建模工\n  具、Python*\n  课程组成员：倪志伟（组长）、伍章俊（协助）、刘林、程浩、倪丽萍、余本功、张强', '2017-12-24 19:52:19', '2017-12-24 19:52:19', 0);
INSERT INTO `coursegroup` VALUES ('57d4167b2d0a4d708c2f6a18db1f49a6', 'A06', '创新创业课程组', '该课程组主要包含以下课程：\n   核心课程：电子商务综合实践实训\n   辅助课程：电子商务发展专题、毕业论文/设计、创业管理、创新创业教育\n   课程组成员：姜元春（组长）、李应（协助）、赵菊、李锋刚、程八一', '2017-12-24 19:54:19', '2017-12-24 19:54:19', 0);
INSERT INTO `coursegroup` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', 'A05', '商务数据建模与分析课程组', '该课程组主要包含以下课程：\n  	核心课程：运筹学、管理统计学、商务智能与大数据分析、人工智能*\n        辅助课程：离散数学、管理决策分析、商业研究方法、管理信息学、计量经济学、个性化推荐*\n        课程组成员：刘心报（组长）、姜元春（协助）、裴军（协助）、孙见山、江兵、方必和、周谧、裴凤、陈夏雨、王刚、许启发、孙春华', '2017-12-24 19:53:18', '2017-12-24 19:53:18', 0);
INSERT INTO `coursegroup` VALUES ('68e5fd59723c455093b3a9dbcdcdf914', 'A02', '电子商务基础课程', '该课程组主要包含以下课程：\n  核心课程：电子商务概论\n  辅助课程：企业管理学、电子商务专业导论、电子商务案例分析、经济法（含电子商务法）、经济学、电子商务专业英语\n  课程组成员：刘业政（组长）、倪丽萍（协助）、电子商务系全体老师及学院平台课老师', '2017-12-24 19:50:23', '2018-01-03 19:03:16', 0);
INSERT INTO `coursegroup` VALUES ('764e0bb0a6004a49b2832f8ee8181731', 'A03', '电商运营与服务课程组', '该课程组主要包含以下课程：\n 核心课程：网络营销、网络金融与支付(区块链)、供应链与物流管理\n 辅助课程：网络交易、客户关系管理、电子商务安全、电子商务服务、社会化营销*\n 课程组成员：何建民（组长）、赵菊（协助）、凌海峰（协助）、李应、毛雪岷、杨爱峰、尹朋珍、许君', '2017-12-24 19:51:22', '2017-12-24 19:51:22', 0);
INSERT INTO `coursegroup` VALUES ('a678fbb965b8456abf9f13270fdf0119', 'B01', '思想政治素质类课程组', '该课程组主要包含以下课程：\n       形式与政策、英语、大学体育、毛泽东思想与中国特色社会主义理论、马克思主义基本原理概论、中国近代史纲要、思想道德修养与法律基础、军事理论、大学生心理健康。', '2017-12-24 19:47:29', '2017-12-24 19:47:29', 0);

-- ----------------------------
-- Table structure for coursegroup_course
-- ----------------------------
DROP TABLE IF EXISTS `coursegroup_course`;
CREATE TABLE `coursegroup_course`  (
  `coursegroup_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`coursegroup_id`, `course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coursegroup_course
-- ----------------------------
INSERT INTO `coursegroup_course` VALUES ('1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `coursegroup_course` VALUES ('1', '8', '2017-12-26 23:04:52', '2017-12-26 23:04:52', 0);
INSERT INTO `coursegroup_course` VALUES ('1', 'dfd8c01f7edc4bf8873d688396552e12', '2018-01-03 16:12:54', '2018-01-03 16:12:54', 1);
INSERT INTO `coursegroup_course` VALUES ('2', '8', '2017-12-28 19:17:18', '2017-12-28 19:17:18', 1);
INSERT INTO `coursegroup_course` VALUES ('2', 'dfd8c01f7edc4bf8873d688396552e12', '2018-01-03 16:20:18', '2018-01-03 16:20:18', 1);
INSERT INTO `coursegroup_course` VALUES ('2aac25c733a347edad60e7e1fcc8b25d', '1ba8f61a23d64e6e939552e39602b06b', '2017-12-24 20:22:39', '2017-12-24 20:22:39', 0);
INSERT INTO `coursegroup_course` VALUES ('2aac25c733a347edad60e7e1fcc8b25d', '4486c2dc6da44bf3ab4ca450ab22f50b', '2017-12-24 20:22:13', '2017-12-24 20:22:13', 0);
INSERT INTO `coursegroup_course` VALUES ('2aac25c733a347edad60e7e1fcc8b25d', '63be3c4a046b4156a4ab68c58331ad46', '2017-12-24 20:21:52', '2017-12-24 20:21:52', 0);
INSERT INTO `coursegroup_course` VALUES ('2aac25c733a347edad60e7e1fcc8b25d', '6d6d1186c4494c7a93914b3754c1eaac', '2017-12-24 20:23:36', '2017-12-24 20:23:36', 0);
INSERT INTO `coursegroup_course` VALUES ('2aac25c733a347edad60e7e1fcc8b25d', 'c4a70eeea2b94004a4d0440a3e137ebd', '2017-12-24 20:23:04', '2017-12-24 20:23:04', 0);
INSERT INTO `coursegroup_course` VALUES ('2aac25c733a347edad60e7e1fcc8b25d', 'd9441495006543b28ef50163f11e5913', '2017-12-24 20:24:08', '2017-12-24 20:24:08', 0);
INSERT INTO `coursegroup_course` VALUES ('2aac25c733a347edad60e7e1fcc8b25d', 'dfd8c01f7edc4bf8873d688396552e12', '2018-01-03 16:23:32', '2018-01-03 16:23:32', 1);
INSERT INTO `coursegroup_course` VALUES ('3c23544462724655a43f32b2969a3b3b', '17bfbbcd244b4f5b9a15df2b43ce87b9', '2017-12-24 20:38:20', '2017-12-24 20:38:20', 0);
INSERT INTO `coursegroup_course` VALUES ('3c23544462724655a43f32b2969a3b3b', '1a80be5c25a641529d4f439546c0700f', '2017-12-24 20:39:27', '2017-12-24 20:39:27', 0);
INSERT INTO `coursegroup_course` VALUES ('3c23544462724655a43f32b2969a3b3b', '2d097c854e5849648d7f9285ca72e602', '2017-12-24 20:37:17', '2017-12-24 20:37:17', 0);
INSERT INTO `coursegroup_course` VALUES ('3c23544462724655a43f32b2969a3b3b', '38381e9deba64eb5b8803df07b5a756c', '2017-12-24 20:36:29', '2017-12-24 20:36:29', 0);
INSERT INTO `coursegroup_course` VALUES ('3c23544462724655a43f32b2969a3b3b', '54e03bc9e2d24f90aabd13bd8d6d11dd', '2017-12-24 20:34:47', '2017-12-24 20:34:47', 0);
INSERT INTO `coursegroup_course` VALUES ('3c23544462724655a43f32b2969a3b3b', 'a76d96680af840818cef65ec9b1f5893', '2017-12-24 20:37:54', '2017-12-24 20:37:54', 0);
INSERT INTO `coursegroup_course` VALUES ('3c23544462724655a43f32b2969a3b3b', 'abd953040f24406493c5229abc67ed79', '2017-12-24 20:35:12', '2017-12-24 20:35:12', 0);
INSERT INTO `coursegroup_course` VALUES ('3c23544462724655a43f32b2969a3b3b', 'f35a95424907463f93c9cecd6afec2a3', '2017-12-24 20:39:00', '2017-12-24 20:39:00', 0);
INSERT INTO `coursegroup_course` VALUES ('3c23544462724655a43f32b2969a3b3b', 'f5f82afd1f3d421d818f5fae9ba07b68', '2017-12-24 20:35:40', '2017-12-24 20:35:40', 0);
INSERT INTO `coursegroup_course` VALUES ('57d4167b2d0a4d708c2f6a18db1f49a6', '0a497b0c5ae443869938232979b03e9f', '2017-12-24 20:46:48', '2017-12-24 20:46:48', 0);
INSERT INTO `coursegroup_course` VALUES ('57d4167b2d0a4d708c2f6a18db1f49a6', '74615fae2f434219abf8753797f77a94', '2017-12-24 20:47:12', '2017-12-24 20:47:12', 0);
INSERT INTO `coursegroup_course` VALUES ('57d4167b2d0a4d708c2f6a18db1f49a6', '7b72db9416c640f6b61305cc6c4b772e', '2017-12-24 20:46:03', '2017-12-24 20:46:03', 0);
INSERT INTO `coursegroup_course` VALUES ('57d4167b2d0a4d708c2f6a18db1f49a6', 'c22dc588c4e642e28b4fbf0e5266584e', '2017-12-24 20:45:27', '2017-12-24 20:45:27', 0);
INSERT INTO `coursegroup_course` VALUES ('57d4167b2d0a4d708c2f6a18db1f49a6', 'c6f694ee59fb4b08aac806682beaf36d', '2017-12-24 20:47:36', '2017-12-24 20:47:36', 0);
INSERT INTO `coursegroup_course` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '02acad2b6d7f468da1435055a2b72443', '2017-12-24 20:43:18', '2017-12-24 20:43:18', 0);
INSERT INTO `coursegroup_course` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '55bb7cb3be5b44349675090f61cc56e5', '2017-12-24 20:41:00', '2017-12-24 20:41:00', 0);
INSERT INTO `coursegroup_course` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '63b9db88035b4433b23979dec9cde6a6', '2017-12-24 20:42:12', '2017-12-24 20:42:12', 0);
INSERT INTO `coursegroup_course` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '80450753b02445eda613ebcfae9cfaa5', '2017-12-24 20:40:35', '2017-12-24 20:40:35', 0);
INSERT INTO `coursegroup_course` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '96ffabbebc3f4ec8aeeb66f3f4f39d24', '2017-12-24 20:42:43', '2017-12-24 20:42:43', 0);
INSERT INTO `coursegroup_course` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', 'ac03ee1529e34586b2b34f0a37e1f224', '2017-12-24 20:41:39', '2017-12-24 20:41:39', 0);
INSERT INTO `coursegroup_course` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', 'bee646f3d731496bb9a67e7684294670', '2017-12-24 20:43:46', '2017-12-24 20:43:46', 0);
INSERT INTO `coursegroup_course` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', 'c4a7b01ded644212bce6e8c39963a4f0', '2017-12-24 20:44:51', '2017-12-24 20:44:51', 0);
INSERT INTO `coursegroup_course` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', 'dfd8c01f7edc4bf8873d688396552e12', '2017-12-24 20:40:08', '2017-12-24 20:40:08', 0);
INSERT INTO `coursegroup_course` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', 'ed7de5d5525a437e9b234b1934f8ed89', '2017-12-24 20:44:10', '2017-12-24 20:44:10', 0);
INSERT INTO `coursegroup_course` VALUES ('68e5fd59723c455093b3a9dbcdcdf914', '2c6e1f38838a4e74b2a742e968867c82', '2017-12-24 20:28:13', '2017-12-24 20:28:13', 0);
INSERT INTO `coursegroup_course` VALUES ('68e5fd59723c455093b3a9dbcdcdf914', '458d0ee25a6f4c76ba7c66cb6f9fb684', '2017-12-24 20:27:04', '2017-12-24 20:27:04', 0);
INSERT INTO `coursegroup_course` VALUES ('68e5fd59723c455093b3a9dbcdcdf914', '47a4c912bd774054afc9116490af7cf8', '2017-12-24 20:24:52', '2017-12-24 20:24:52', 0);
INSERT INTO `coursegroup_course` VALUES ('68e5fd59723c455093b3a9dbcdcdf914', '8e2abff457c84db8b4b71b44e2373a79', '2017-12-24 20:29:01', '2017-12-24 20:29:01', 0);
INSERT INTO `coursegroup_course` VALUES ('68e5fd59723c455093b3a9dbcdcdf914', '937a1b99a70e4bd9adcdafc2a87e38c9', '2017-12-24 20:25:31', '2017-12-24 20:25:31', 0);
INSERT INTO `coursegroup_course` VALUES ('68e5fd59723c455093b3a9dbcdcdf914', '96fb9435f15642328520cad703e32e67', '2017-12-24 20:27:41', '2017-12-24 20:27:41', 1);
INSERT INTO `coursegroup_course` VALUES ('68e5fd59723c455093b3a9dbcdcdf914', 'dfd1575c3b634d0cbf91f06658e1084d', '2017-12-24 20:26:29', '2017-12-24 20:26:29', 0);
INSERT INTO `coursegroup_course` VALUES ('68e5fd59723c455093b3a9dbcdcdf914', 'dfd8c01f7edc4bf8873d688396552e12', '2018-01-03 16:26:50', '2018-01-03 16:26:50', 1);
INSERT INTO `coursegroup_course` VALUES ('764e0bb0a6004a49b2832f8ee8181731', '3067bec0fae449b4b475ffacd86aeb3c', '2017-12-24 20:31:20', '2017-12-24 20:31:20', 0);
INSERT INTO `coursegroup_course` VALUES ('764e0bb0a6004a49b2832f8ee8181731', '56d754b9edcc47dc9c98a1a49ebf9745', '2017-12-24 20:33:30', '2017-12-24 20:33:30', 0);
INSERT INTO `coursegroup_course` VALUES ('764e0bb0a6004a49b2832f8ee8181731', '68be5e7ee8d64caca1727c4b00a67b9a', '2017-12-24 20:33:57', '2017-12-24 20:33:57', 0);
INSERT INTO `coursegroup_course` VALUES ('764e0bb0a6004a49b2832f8ee8181731', '68f5f3cf5f1341469b54a97c7693e9bc', '2017-12-24 20:31:56', '2017-12-24 20:31:56', 0);
INSERT INTO `coursegroup_course` VALUES ('764e0bb0a6004a49b2832f8ee8181731', 'a5cebe6309904802b4ed65b6bba5a985', '2017-12-24 20:29:45', '2017-12-24 20:29:45', 0);
INSERT INTO `coursegroup_course` VALUES ('764e0bb0a6004a49b2832f8ee8181731', 'c1722db650f54ac68029b4341281e755', '2017-12-24 20:32:20', '2017-12-24 20:32:20', 0);
INSERT INTO `coursegroup_course` VALUES ('764e0bb0a6004a49b2832f8ee8181731', 'd28d0d16aef24cadb666a35eb5c74f3d', '2017-12-24 20:30:37', '2017-12-24 20:30:37', 0);
INSERT INTO `coursegroup_course` VALUES ('764e0bb0a6004a49b2832f8ee8181731', 'd6d267c4fff7433f974c6898f653afc6', '2017-12-24 20:32:52', '2017-12-24 20:32:52', 0);
INSERT INTO `coursegroup_course` VALUES ('a678fbb965b8456abf9f13270fdf0119', '1e1cb4677feb488c86ba9e1b618a6357', '2017-12-24 20:16:56', '2017-12-24 20:16:56', 0);
INSERT INTO `coursegroup_course` VALUES ('a678fbb965b8456abf9f13270fdf0119', '566e51f81efe40a2961dcbbeb31d85cf', '2017-12-24 20:20:19', '2017-12-24 20:20:19', 0);
INSERT INTO `coursegroup_course` VALUES ('a678fbb965b8456abf9f13270fdf0119', '5dbcdabac52d4a968f791a99842c3310', '2017-12-24 20:19:38', '2017-12-24 20:19:38', 0);
INSERT INTO `coursegroup_course` VALUES ('a678fbb965b8456abf9f13270fdf0119', '805396da52b3420293cae4845a0c7236', '2017-12-24 20:18:07', '2017-12-24 20:18:07', 0);
INSERT INTO `coursegroup_course` VALUES ('a678fbb965b8456abf9f13270fdf0119', '925a54e418d240ce8c309c19df4616d6', '2017-12-24 20:17:28', '2017-12-24 20:17:28', 0);
INSERT INTO `coursegroup_course` VALUES ('a678fbb965b8456abf9f13270fdf0119', '9be614b2aaeb41579810c4ada43988ad', '2017-12-24 20:16:20', '2017-12-24 20:16:20', 0);
INSERT INTO `coursegroup_course` VALUES ('a678fbb965b8456abf9f13270fdf0119', 'a8e4f84fa7044d219675f4ccc9f5c7c3', '2017-12-24 20:20:43', '2017-12-24 20:20:43', 0);
INSERT INTO `coursegroup_course` VALUES ('a678fbb965b8456abf9f13270fdf0119', 'ada5cddcb5764768bba89a1e9f49850d', '2017-12-24 20:21:20', '2017-12-24 20:21:20', 0);
INSERT INTO `coursegroup_course` VALUES ('a678fbb965b8456abf9f13270fdf0119', 'de419d0bd25743f0b19ae5a97ecb45e5', '2017-12-24 20:18:54', '2017-12-24 20:18:54', 0);

-- ----------------------------
-- Table structure for coursegroup_picture
-- ----------------------------
DROP TABLE IF EXISTS `coursegroup_picture`;
CREATE TABLE `coursegroup_picture`  (
  `coursegroup_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `picture_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`coursegroup_id`, `picture_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for coursegroup_teacher
-- ----------------------------
DROP TABLE IF EXISTS `coursegroup_teacher`;
CREATE TABLE `coursegroup_teacher`  (
  `coursegroup_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`coursegroup_id`, `teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coursegroup_teacher
-- ----------------------------
INSERT INTO `coursegroup_teacher` VALUES ('1', '25574c94dd4a43b9a83338bbf3d5f44f', '2018-01-03 16:12:55', '2018-01-03 16:12:55', 1);
INSERT INTO `coursegroup_teacher` VALUES ('1', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);
INSERT INTO `coursegroup_teacher` VALUES ('1', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `coursegroup_teacher` VALUES ('2', '25574c94dd4a43b9a83338bbf3d5f44f', '2018-01-03 16:20:18', '2018-01-03 16:20:18', 1);
INSERT INTO `coursegroup_teacher` VALUES ('2', '3', '2017-12-28 19:17:18', '2017-12-28 19:17:18', 1);
INSERT INTO `coursegroup_teacher` VALUES ('2', '4', '2017-12-28 19:17:18', '2017-12-28 19:17:18', 0);
INSERT INTO `coursegroup_teacher` VALUES ('2aac25c733a347edad60e7e1fcc8b25d', '25574c94dd4a43b9a83338bbf3d5f44f', '2018-01-03 16:23:32', '2018-01-03 16:23:32', 1);
INSERT INTO `coursegroup_teacher` VALUES ('3c23544462724655a43f32b2969a3b3b', '0ca5585c80f94896955c42bf37d552f8', '2017-12-24 20:06:57', '2017-12-24 20:06:57', 0);
INSERT INTO `coursegroup_teacher` VALUES ('3c23544462724655a43f32b2969a3b3b', '1873a5ba9b6f426b9b5e0d9b7e6ce39e', '2017-12-24 20:07:40', '2017-12-24 20:07:40', 0);
INSERT INTO `coursegroup_teacher` VALUES ('3c23544462724655a43f32b2969a3b3b', '321a1996c424434895b93ece7ab855c5', '2017-12-24 20:06:33', '2017-12-24 20:06:33', 0);
INSERT INTO `coursegroup_teacher` VALUES ('3c23544462724655a43f32b2969a3b3b', '79e96623f593463db8a64ab147e87126', '2017-12-24 20:05:53', '2017-12-24 20:05:53', 0);
INSERT INTO `coursegroup_teacher` VALUES ('3c23544462724655a43f32b2969a3b3b', '8eda7ae527fe46a3a6accafdbc2ed57f', '2017-12-24 20:06:09', '2017-12-24 20:06:09', 0);
INSERT INTO `coursegroup_teacher` VALUES ('3c23544462724655a43f32b2969a3b3b', 'bf5911ed66e246999844ee4a2253b968', '2017-12-24 20:07:58', '2017-12-24 20:07:58', 0);
INSERT INTO `coursegroup_teacher` VALUES ('57d4167b2d0a4d708c2f6a18db1f49a6', '55e954542c8247dfb02723b02b815dc4', '2017-12-24 20:14:21', '2017-12-24 20:14:21', 0);
INSERT INTO `coursegroup_teacher` VALUES ('57d4167b2d0a4d708c2f6a18db1f49a6', 'de7fdb3d03b4422aae438ebd0a5b2532', '2017-12-24 20:14:42', '2017-12-24 20:14:42', 0);
INSERT INTO `coursegroup_teacher` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '11553bf79b5c44a5acf9966cb01850fb', '2017-12-24 20:10:53', '2017-12-24 20:10:53', 0);
INSERT INTO `coursegroup_teacher` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '17dae3df2d2a49ce97dbacaae43ffab5', '2017-12-24 20:08:24', '2017-12-24 20:08:24', 0);
INSERT INTO `coursegroup_teacher` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '1f133fd5993e477bbf7e7cbf1dc140d3', '2017-12-24 20:10:32', '2017-12-24 20:10:32', 0);
INSERT INTO `coursegroup_teacher` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '1f6d8c7d89684960b064d0512bc89a51', '2017-12-24 20:12:12', '2017-12-24 20:12:12', 0);
INSERT INTO `coursegroup_teacher` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '25574c94dd4a43b9a83338bbf3d5f44f', '2017-12-24 20:11:36', '2017-12-24 20:11:36', 0);
INSERT INTO `coursegroup_teacher` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '2caefb42a6424361a7cbb7df8c61e11f', '2017-12-24 20:12:32', '2017-12-24 20:12:32', 0);
INSERT INTO `coursegroup_teacher` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '538927a853fb4dd5b6f217d13114170a', '2017-12-24 20:13:41', '2017-12-24 20:13:41', 0);
INSERT INTO `coursegroup_teacher` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '60702dbff9874c6e8e1a98631f8b60e7', '2017-12-24 20:12:50', '2017-12-24 20:12:50', 0);
INSERT INTO `coursegroup_teacher` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', '68c38c713ecc4e89977e4be00c90504a', '2017-12-24 20:13:15', '2017-12-24 20:13:15', 0);
INSERT INTO `coursegroup_teacher` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', 'a9e8bb2e27cb4961af2171a805f76f25', '2017-12-24 20:10:08', '2017-12-24 20:10:08', 0);
INSERT INTO `coursegroup_teacher` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', 'c3106a52473543a58c3282871a72d952', '2017-12-24 20:09:36', '2017-12-24 20:09:36', 0);
INSERT INTO `coursegroup_teacher` VALUES ('64c0fbe7e7244a738ea3a84d9933b5b2', 'e62c70cfeada48ef9097c409ffcab8e1', '2017-12-24 20:11:13', '2017-12-24 20:11:13', 1);
INSERT INTO `coursegroup_teacher` VALUES ('68e5fd59723c455093b3a9dbcdcdf914', '25574c94dd4a43b9a83338bbf3d5f44f', '2018-01-03 16:26:50', '2018-01-03 16:26:50', 1);
INSERT INTO `coursegroup_teacher` VALUES ('68e5fd59723c455093b3a9dbcdcdf914', '4e292a64b03f45cca5d9bde947b03295', '2017-12-24 20:00:53', '2017-12-24 20:00:53', 0);
INSERT INTO `coursegroup_teacher` VALUES ('68e5fd59723c455093b3a9dbcdcdf914', '68bf1c2b97ef4be5b58cd03aeb74dd65', '2017-12-24 20:01:38', '2017-12-24 20:01:38', 0);
INSERT INTO `coursegroup_teacher` VALUES ('68e5fd59723c455093b3a9dbcdcdf914', 'b240547d9aa944f9bfe3de8696875062', '2017-12-24 20:00:21', '2017-12-24 20:00:21', 0);
INSERT INTO `coursegroup_teacher` VALUES ('764e0bb0a6004a49b2832f8ee8181731', '039f6fa77c6b48048fa9d941f6d5e95c', '2017-12-24 20:02:02', '2017-12-24 20:02:02', 0);
INSERT INTO `coursegroup_teacher` VALUES ('764e0bb0a6004a49b2832f8ee8181731', '15f6d17221004112878a22a90bda302a', '2017-12-24 20:03:06', '2017-12-24 20:03:06', 0);
INSERT INTO `coursegroup_teacher` VALUES ('764e0bb0a6004a49b2832f8ee8181731', '1ac2eb0c730740868ac66f06321aa0af', '2017-12-24 20:04:06', '2017-12-24 20:04:06', 0);
INSERT INTO `coursegroup_teacher` VALUES ('764e0bb0a6004a49b2832f8ee8181731', '408f7e1c170745fb9d052a2206146d43', '2017-12-24 20:05:29', '2017-12-24 20:05:29', 0);
INSERT INTO `coursegroup_teacher` VALUES ('764e0bb0a6004a49b2832f8ee8181731', '644b84935201474fb959e7b6ae616cb2', '2017-12-24 20:02:33', '2017-12-24 20:02:33', 0);
INSERT INTO `coursegroup_teacher` VALUES ('764e0bb0a6004a49b2832f8ee8181731', 'a1f642a6461a4da585b3591147ab7607', '2017-12-24 20:05:12', '2017-12-24 20:05:12', 0);
INSERT INTO `coursegroup_teacher` VALUES ('764e0bb0a6004a49b2832f8ee8181731', 'bcd6e841bd55476e9588c180b0cddbce', '2017-12-24 20:04:34', '2017-12-24 20:04:34', 0);
INSERT INTO `coursegroup_teacher` VALUES ('764e0bb0a6004a49b2832f8ee8181731', 'd21b2bad365f46799bfb4fa35a8702cb', '2017-12-24 20:03:37', '2017-12-24 20:03:37', 0);
INSERT INTO `coursegroup_teacher` VALUES ('a678fbb965b8456abf9f13270fdf0119', 'ac31baa93efe4a11b8cc78675fdeeccc', '2017-12-24 19:57:48', '2017-12-24 19:57:48', 0);

-- ----------------------------
-- Table structure for exercise
-- ----------------------------
DROP TABLE IF EXISTS `exercise`;
CREATE TABLE `exercise`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(32) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `url` varchar(128) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inform
-- ----------------------------
DROP TABLE IF EXISTS `inform`;
CREATE TABLE `inform`  (
  `id` bigint(20) NOT NULL,
  `title` varchar(64) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `content` text CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for knowledgepoint
-- ----------------------------
DROP TABLE IF EXISTS `knowledgepoint`;
CREATE TABLE `knowledgepoint`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of knowledgepoint
-- ----------------------------
INSERT INTO `knowledgepoint` VALUES ('1', '知识管理', '2018-01-05 22:03:20', '2018-01-05 22:03:20', 0);
INSERT INTO `knowledgepoint` VALUES ('2', '教学管理', '2018-01-05 22:03:20', '2018-01-05 22:03:20', 0);
INSERT INTO `knowledgepoint` VALUES ('3', '给排水测试', '2018-01-05 22:03:20', '2018-01-05 22:03:20', 0);
INSERT INTO `knowledgepoint` VALUES ('4', '测试给排水', '2018-01-05 22:03:20', '2018-01-05 22:03:20', 0);
INSERT INTO `knowledgepoint` VALUES ('5', '知识的力量', '2018-01-05 22:03:20', '2018-01-05 22:03:20', 0);
INSERT INTO `knowledgepoint` VALUES ('6', 'ds', '2018-01-05 22:03:25', '2018-01-05 22:03:25', 0);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `issuper` int(1) NOT NULL,
  `isDelete` int(1) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('0d51e6a885014d34a6b0ff706a57013f', '1', '1', 0, 0, '2017-12-24 20:47:12', '2017-12-24 20:47:12');
INSERT INTO `manager` VALUES ('1279b329377c4a688b76a6066d3af5ff', '1', '1', 0, 0, '2017-12-24 20:40:08', '2018-01-06 21:07:26');
INSERT INTO `manager` VALUES ('19bf355e33ea471b8ed3a34e2ba08ff9', '1', '1', 0, 0, '2017-12-24 20:45:27', '2017-12-24 20:45:27');
INSERT INTO `manager` VALUES ('19bf40c394bb4946abf74975ca61426f', '1', '1', 0, 0, '2017-12-24 20:31:20', '2018-01-07 17:09:23');
INSERT INTO `manager` VALUES ('1e66eac6a51c4243b456e98403b4c419', '1', '1', 0, 0, '2017-12-24 20:41:39', '2017-12-24 20:41:39');
INSERT INTO `manager` VALUES ('1f447f4750fc4c858b507cd3b1807502', '1', '1', 0, 0, '2017-12-24 20:29:01', '2017-12-24 20:29:01');
INSERT INTO `manager` VALUES ('229891c88fe345d0a9791f6f5f8e6f1d', '1', '1', 0, 0, '2017-12-24 20:32:52', '2017-12-24 20:32:52');
INSERT INTO `manager` VALUES ('29fa8d10b2fa479fb1454312a5acdca0', '1', '1', 0, 0, '2017-12-24 20:19:38', '2017-12-24 20:19:38');
INSERT INTO `manager` VALUES ('2f8bc29c759c4711b8213f37da0892ed', '1', '1', 0, 0, '2017-12-24 20:16:20', '2017-12-24 20:16:20');
INSERT INTO `manager` VALUES ('328053d90a654e8eb1abf1f00d3b878c', '1', '1', 0, 0, '2017-12-24 20:20:19', '2017-12-24 20:20:19');
INSERT INTO `manager` VALUES ('3fdf771f273e40a8912d2e498aa6f0f1', '1', '1', 0, 0, '2017-12-24 20:35:40', '2017-12-24 20:35:40');
INSERT INTO `manager` VALUES ('41e231c48b80406fb0fbe640bcc97030', '1', '1', 0, 0, '2017-12-24 20:23:36', '2017-12-24 20:23:36');
INSERT INTO `manager` VALUES ('424db1dd6134472d8b5f8f43b7f89b18', '1', '1', 0, 0, '2017-12-24 20:44:10', '2017-12-24 20:44:10');
INSERT INTO `manager` VALUES ('44fc8dd7856f408dbf7ec53c1a86a4d6', '1', '1', 0, 0, '2017-12-24 20:46:03', '2017-12-24 20:46:03');
INSERT INTO `manager` VALUES ('494ae8ec8d5d45359d30df3d63e3bb8c', '1', '1', 0, 0, '2017-12-24 20:47:36', '2017-12-24 20:47:36');
INSERT INTO `manager` VALUES ('5085f4ee0f9e4467a6178bd9d7a03d71', '1', '1', 0, 0, '2017-12-24 20:43:18', '2018-01-06 21:52:54');
INSERT INTO `manager` VALUES ('50c9440a47b74e13bdd766c7cbe173e2', '1', '1', 0, 0, '2017-12-24 20:24:08', '2017-12-24 20:24:08');
INSERT INTO `manager` VALUES ('637837a658ba45f48f6a47c8cb44a06c', '1', '1', 0, 0, '2017-12-24 20:38:20', '2017-12-24 20:38:20');
INSERT INTO `manager` VALUES ('6c64129344e04c218072198b3782d6b5', '1', '1', 0, 0, '2017-12-24 20:18:54', '2017-12-24 20:18:54');
INSERT INTO `manager` VALUES ('6ccd7409235a4855a20ad5ff0ceeeaba', '1', '1', 0, 0, '2017-12-24 20:41:00', '2017-12-24 20:41:00');
INSERT INTO `manager` VALUES ('73cd3ace682a4f52ac970408c3f7cc71', '1', '1', 0, 0, '2017-12-24 20:37:17', '2017-12-24 20:37:17');
INSERT INTO `manager` VALUES ('7c3fd1c4ae564f2d8015cf748eeb1204', '1', '1', 0, 0, '2017-12-24 20:21:20', '2017-12-24 20:21:20');
INSERT INTO `manager` VALUES ('9771852a4f2f4c908e5e9ed2b1da5380', '1', '1', 0, 0, '2017-12-24 20:33:57', '2017-12-24 20:33:57');
INSERT INTO `manager` VALUES ('97fca9fb27c341308d48fd05fb9cf6cc', '1', '1', 0, 0, '2017-12-24 20:44:51', '2017-12-24 20:44:51');
INSERT INTO `manager` VALUES ('9fba454270e14aacae89957b997ba2e0', '1', '1', 0, 0, '2017-12-24 20:29:45', '2018-01-03 19:39:40');
INSERT INTO `manager` VALUES ('a32b94b35850480f9fdfb6a0db258467', '1', '1', 0, 0, '2017-12-24 20:39:27', '2017-12-24 20:39:27');
INSERT INTO `manager` VALUES ('a3725aa9a9374ff6b2124cdf5ae0809d', '1', '1', 0, 0, '2017-12-24 20:33:30', '2017-12-24 20:33:30');
INSERT INTO `manager` VALUES ('a79b4479557e4bb9819f67e1a1647480', '1', '1', 0, 0, '2017-12-24 20:43:46', '2017-12-24 20:43:46');
INSERT INTO `manager` VALUES ('a79d2fe535c64e1dbf471b03ead75828', '1', '1', 0, 0, '2017-12-24 20:18:07', '2017-12-24 20:18:07');
INSERT INTO `manager` VALUES ('a869fab9b47a4e22b134cee1037b2c21', '1', '1', 0, 0, '2017-12-24 20:46:48', '2017-12-24 20:46:48');
INSERT INTO `manager` VALUES ('a8e994579b4d480cb1e8a582b7b13d34', '1', '1', 0, 0, '2017-12-24 20:25:31', '2017-12-24 20:25:31');
INSERT INTO `manager` VALUES ('aa7759a2eaf44704a7a1833f751eec85', '1', '1', 0, 0, '2017-12-24 20:31:56', '2017-12-24 20:31:56');
INSERT INTO `manager` VALUES ('aaeed146ce6f4e2fac7dbfea6b52daa4', '1', '1', 0, 0, '2017-12-24 20:22:13', '2017-12-24 20:22:13');
INSERT INTO `manager` VALUES ('af082d369eca48f4964315266b91f66a', '1', '1', 0, 0, '2017-12-24 20:27:04', '2017-12-24 20:27:04');
INSERT INTO `manager` VALUES ('b08526c4babf41dbb32c09f4d256c5cd', 'string4444', 'string4444', 0, 0, '2017-12-26 23:04:52', '2017-12-28 18:02:23');
INSERT INTO `manager` VALUES ('b3beaabd1661409f857823d2c3beef99', '1', '1', 0, 0, '2017-12-24 20:23:04', '2017-12-24 20:23:04');
INSERT INTO `manager` VALUES ('b48073d97c5f438a8a08ffefaa6a7f23', '1', '1', 0, 0, '2017-12-24 20:16:56', '2017-12-24 20:16:56');
INSERT INTO `manager` VALUES ('b6321aac784846cba32c0bd7929d63f2', '1', '1', 0, 0, '2018-01-06 21:43:01', '2018-01-06 21:43:01');
INSERT INTO `manager` VALUES ('bf82dbf282f8439b9cfe5caa5794ef12', '1', '1', 0, 0, '2017-12-24 20:30:37', '2017-12-24 20:30:37');
INSERT INTO `manager` VALUES ('c0b3cd4e08644681be2fd91d2222ab23', '1', '1', 0, 0, '2017-12-24 20:39:00', '2017-12-24 20:39:00');
INSERT INTO `manager` VALUES ('c57b273b716e4a36b472df551d78ed14', '1', '1', 0, 0, '2017-12-24 20:17:28', '2017-12-24 20:17:28');
INSERT INTO `manager` VALUES ('c5e5b5ae76284519a8a4e46a065a0572', '1', '1', 0, 0, '2017-12-24 20:21:52', '2017-12-24 20:21:52');
INSERT INTO `manager` VALUES ('c86d41834b85403db5dc8df84cba6352', '1', '1', 0, 0, '2017-12-24 20:35:12', '2017-12-24 20:35:12');
INSERT INTO `manager` VALUES ('ca92ef19e42545a1a39bc5e508addff7', '1', '1', 0, 0, '2017-12-24 20:32:20', '2018-01-07 17:08:34');
INSERT INTO `manager` VALUES ('d0c6a67d5f06457eaf886acd2f3ed162', '1', '1', 0, 0, '2017-12-24 20:34:47', '2017-12-24 20:34:47');
INSERT INTO `manager` VALUES ('d1ecabfb49e84fd4988f41b6847e02f9', '1', '1', 0, 0, '2017-12-24 20:42:12', '2017-12-24 20:42:12');
INSERT INTO `manager` VALUES ('d41843ce70494e9b92a7eae46b1b70ca', '1', '1', 0, 0, '2017-12-24 20:26:29', '2017-12-24 20:26:29');
INSERT INTO `manager` VALUES ('d5d65db163ee4417a23a3aafa1daeebb', '1', '1', 0, 0, '2017-12-24 20:36:29', '2017-12-24 20:36:29');
INSERT INTO `manager` VALUES ('d72bad075b85470dbc41fe957a820d9f', '1', '1', 0, 0, '2017-12-24 20:22:39', '2017-12-24 20:22:39');
INSERT INTO `manager` VALUES ('d78e36df05654fcfb598afc7a6e0c39f', '1', '1', 0, 0, '2017-12-24 20:42:42', '2017-12-24 20:42:42');
INSERT INTO `manager` VALUES ('e1ca5b0f66d74d0faa28edec5d80c961', '1', '1', 0, 1, '2017-12-24 20:28:13', '2017-12-24 20:28:13');
INSERT INTO `manager` VALUES ('e680b2a717e54f559c979a041cdf5843', '1', '1', 0, 1, '2017-12-24 20:27:41', '2017-12-24 20:27:41');
INSERT INTO `manager` VALUES ('f3b82a51518d4d09ab2c41d9d708d7da', '1', '1', 0, 0, '2017-12-24 20:40:35', '2017-12-24 20:40:35');
INSERT INTO `manager` VALUES ('f3de5f23bb0148f19f0fce9c60ef63c2', '1', '1', 0, 0, '2017-12-24 20:20:43', '2017-12-24 20:20:43');
INSERT INTO `manager` VALUES ('fbb949cfe17f42c39829a962aacfe287', '1', '1', 0, 0, '2017-12-24 20:24:52', '2018-01-03 19:57:21');
INSERT INTO `manager` VALUES ('fcf5dac9920d40dc9fd53dcc4c758bcd', '1', '1', 0, 0, '2017-12-24 20:37:54', '2017-12-24 20:37:54');

-- ----------------------------
-- Table structure for manager_course
-- ----------------------------
DROP TABLE IF EXISTS `manager_course`;
CREATE TABLE `manager_course`  (
  `manager_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`manager_id`, `course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of manager_course
-- ----------------------------
INSERT INTO `manager_course` VALUES ('0d51e6a885014d34a6b0ff706a57013f', '74615fae2f434219abf8753797f77a94', '2017-12-24 20:47:12', '2017-12-24 20:47:12', 0);
INSERT INTO `manager_course` VALUES ('1279b329377c4a688b76a6066d3af5ff', 'dfd8c01f7edc4bf8873d688396552e12', '2017-12-24 20:40:08', '2017-12-24 20:40:08', 0);
INSERT INTO `manager_course` VALUES ('19bf355e33ea471b8ed3a34e2ba08ff9', 'c22dc588c4e642e28b4fbf0e5266584e', '2017-12-24 20:45:27', '2017-12-24 20:45:27', 0);
INSERT INTO `manager_course` VALUES ('19bf40c394bb4946abf74975ca61426f', '3067bec0fae449b4b475ffacd86aeb3c', '2017-12-24 20:31:20', '2017-12-24 20:31:20', 0);
INSERT INTO `manager_course` VALUES ('1e66eac6a51c4243b456e98403b4c419', 'ac03ee1529e34586b2b34f0a37e1f224', '2017-12-24 20:41:39', '2017-12-24 20:41:39', 0);
INSERT INTO `manager_course` VALUES ('1f447f4750fc4c858b507cd3b1807502', '8e2abff457c84db8b4b71b44e2373a79', '2017-12-24 20:29:01', '2017-12-24 20:29:01', 0);
INSERT INTO `manager_course` VALUES ('229891c88fe345d0a9791f6f5f8e6f1d', 'd6d267c4fff7433f974c6898f653afc6', '2017-12-24 20:32:52', '2017-12-24 20:32:52', 0);
INSERT INTO `manager_course` VALUES ('29fa8d10b2fa479fb1454312a5acdca0', '5dbcdabac52d4a968f791a99842c3310', '2017-12-24 20:19:38', '2017-12-24 20:19:38', 0);
INSERT INTO `manager_course` VALUES ('2f8bc29c759c4711b8213f37da0892ed', '9be614b2aaeb41579810c4ada43988ad', '2017-12-24 20:16:20', '2017-12-24 20:16:20', 0);
INSERT INTO `manager_course` VALUES ('328053d90a654e8eb1abf1f00d3b878c', '566e51f81efe40a2961dcbbeb31d85cf', '2017-12-24 20:20:19', '2017-12-24 20:20:19', 0);
INSERT INTO `manager_course` VALUES ('3fdf771f273e40a8912d2e498aa6f0f1', 'f5f82afd1f3d421d818f5fae9ba07b68', '2017-12-24 20:35:40', '2017-12-24 20:35:40', 0);
INSERT INTO `manager_course` VALUES ('41e231c48b80406fb0fbe640bcc97030', '6d6d1186c4494c7a93914b3754c1eaac', '2017-12-24 20:23:36', '2017-12-24 20:23:36', 0);
INSERT INTO `manager_course` VALUES ('424db1dd6134472d8b5f8f43b7f89b18', 'ed7de5d5525a437e9b234b1934f8ed89', '2017-12-24 20:44:10', '2017-12-24 20:44:10', 0);
INSERT INTO `manager_course` VALUES ('44fc8dd7856f408dbf7ec53c1a86a4d6', '7b72db9416c640f6b61305cc6c4b772e', '2017-12-24 20:46:03', '2017-12-24 20:46:03', 0);
INSERT INTO `manager_course` VALUES ('494ae8ec8d5d45359d30df3d63e3bb8c', 'c6f694ee59fb4b08aac806682beaf36d', '2017-12-24 20:47:36', '2017-12-24 20:47:36', 0);
INSERT INTO `manager_course` VALUES ('5085f4ee0f9e4467a6178bd9d7a03d71', '02acad2b6d7f468da1435055a2b72443', '2017-12-24 20:43:18', '2017-12-24 20:43:18', 0);
INSERT INTO `manager_course` VALUES ('50c9440a47b74e13bdd766c7cbe173e2', 'd9441495006543b28ef50163f11e5913', '2017-12-24 20:24:08', '2017-12-24 20:24:08', 0);
INSERT INTO `manager_course` VALUES ('637837a658ba45f48f6a47c8cb44a06c', '17bfbbcd244b4f5b9a15df2b43ce87b9', '2017-12-24 20:38:20', '2017-12-24 20:38:20', 0);
INSERT INTO `manager_course` VALUES ('6c64129344e04c218072198b3782d6b5', 'de419d0bd25743f0b19ae5a97ecb45e5', '2017-12-24 20:18:54', '2017-12-24 20:18:54', 0);
INSERT INTO `manager_course` VALUES ('6ccd7409235a4855a20ad5ff0ceeeaba', '55bb7cb3be5b44349675090f61cc56e5', '2017-12-24 20:41:00', '2017-12-24 20:41:00', 0);
INSERT INTO `manager_course` VALUES ('73cd3ace682a4f52ac970408c3f7cc71', '2d097c854e5849648d7f9285ca72e602', '2017-12-24 20:37:17', '2017-12-24 20:37:17', 0);
INSERT INTO `manager_course` VALUES ('7c3fd1c4ae564f2d8015cf748eeb1204', 'ada5cddcb5764768bba89a1e9f49850d', '2017-12-24 20:21:20', '2017-12-24 20:21:20', 0);
INSERT INTO `manager_course` VALUES ('7e6ed667d5414452a6ccfeda849613ae', 'fccc4a78cd014b2cad09f0499e35e21c', '2017-12-06 19:19:00', '2017-12-06 19:19:00', 0);
INSERT INTO `manager_course` VALUES ('9771852a4f2f4c908e5e9ed2b1da5380', '68be5e7ee8d64caca1727c4b00a67b9a', '2017-12-24 20:33:57', '2017-12-24 20:33:57', 0);
INSERT INTO `manager_course` VALUES ('97fca9fb27c341308d48fd05fb9cf6cc', 'c4a7b01ded644212bce6e8c39963a4f0', '2017-12-24 20:44:51', '2017-12-24 20:44:51', 0);
INSERT INTO `manager_course` VALUES ('9fba454270e14aacae89957b997ba2e0', 'a5cebe6309904802b4ed65b6bba5a985', '2017-12-24 20:29:45', '2017-12-24 20:29:45', 0);
INSERT INTO `manager_course` VALUES ('a32b94b35850480f9fdfb6a0db258467', '1a80be5c25a641529d4f439546c0700f', '2017-12-24 20:39:27', '2017-12-24 20:39:27', 0);
INSERT INTO `manager_course` VALUES ('a3725aa9a9374ff6b2124cdf5ae0809d', '56d754b9edcc47dc9c98a1a49ebf9745', '2017-12-24 20:33:30', '2017-12-24 20:33:30', 0);
INSERT INTO `manager_course` VALUES ('a79b4479557e4bb9819f67e1a1647480', 'bee646f3d731496bb9a67e7684294670', '2017-12-24 20:43:46', '2017-12-24 20:43:46', 0);
INSERT INTO `manager_course` VALUES ('a79d2fe535c64e1dbf471b03ead75828', '805396da52b3420293cae4845a0c7236', '2017-12-24 20:18:07', '2017-12-24 20:18:07', 0);
INSERT INTO `manager_course` VALUES ('a869fab9b47a4e22b134cee1037b2c21', '0a497b0c5ae443869938232979b03e9f', '2017-12-24 20:46:48', '2017-12-24 20:46:48', 0);
INSERT INTO `manager_course` VALUES ('a8e994579b4d480cb1e8a582b7b13d34', '937a1b99a70e4bd9adcdafc2a87e38c9', '2017-12-24 20:25:31', '2017-12-24 20:25:31', 0);
INSERT INTO `manager_course` VALUES ('aa7759a2eaf44704a7a1833f751eec85', '68f5f3cf5f1341469b54a97c7693e9bc', '2017-12-24 20:31:56', '2017-12-24 20:31:56', 0);
INSERT INTO `manager_course` VALUES ('aaeed146ce6f4e2fac7dbfea6b52daa4', '4486c2dc6da44bf3ab4ca450ab22f50b', '2017-12-24 20:22:13', '2017-12-24 20:22:13', 0);
INSERT INTO `manager_course` VALUES ('af082d369eca48f4964315266b91f66a', '458d0ee25a6f4c76ba7c66cb6f9fb684', '2017-12-24 20:27:04', '2017-12-24 20:27:04', 0);
INSERT INTO `manager_course` VALUES ('b08526c4babf41dbb32c09f4d256c5cd', '15f73a76aef8419f833cbf8edfaa5685', '2017-12-26 23:04:52', '2017-12-26 23:04:52', 0);
INSERT INTO `manager_course` VALUES ('b3beaabd1661409f857823d2c3beef99', 'c4a70eeea2b94004a4d0440a3e137ebd', '2017-12-24 20:23:04', '2017-12-24 20:23:04', 0);
INSERT INTO `manager_course` VALUES ('b48073d97c5f438a8a08ffefaa6a7f23', '1e1cb4677feb488c86ba9e1b618a6357', '2017-12-24 20:16:56', '2017-12-24 20:16:56', 0);
INSERT INTO `manager_course` VALUES ('b6321aac784846cba32c0bd7929d63f2', '6506e68207f34345bfa72252484d8567', '2018-01-06 21:43:01', '2018-01-06 21:43:01', 0);
INSERT INTO `manager_course` VALUES ('bf82dbf282f8439b9cfe5caa5794ef12', 'd28d0d16aef24cadb666a35eb5c74f3d', '2017-12-24 20:30:37', '2017-12-24 20:30:37', 0);
INSERT INTO `manager_course` VALUES ('c0b3cd4e08644681be2fd91d2222ab23', 'f35a95424907463f93c9cecd6afec2a3', '2017-12-24 20:39:00', '2017-12-24 20:39:00', 0);
INSERT INTO `manager_course` VALUES ('c57b273b716e4a36b472df551d78ed14', '925a54e418d240ce8c309c19df4616d6', '2017-12-24 20:17:28', '2017-12-24 20:17:28', 0);
INSERT INTO `manager_course` VALUES ('c5e5b5ae76284519a8a4e46a065a0572', '63be3c4a046b4156a4ab68c58331ad46', '2017-12-24 20:21:52', '2017-12-24 20:21:52', 0);
INSERT INTO `manager_course` VALUES ('c86d41834b85403db5dc8df84cba6352', 'abd953040f24406493c5229abc67ed79', '2017-12-24 20:35:12', '2017-12-24 20:35:12', 0);
INSERT INTO `manager_course` VALUES ('ca92ef19e42545a1a39bc5e508addff7', 'c1722db650f54ac68029b4341281e755', '2017-12-24 20:32:20', '2017-12-24 20:32:20', 0);
INSERT INTO `manager_course` VALUES ('d0c6a67d5f06457eaf886acd2f3ed162', '54e03bc9e2d24f90aabd13bd8d6d11dd', '2017-12-24 20:34:47', '2017-12-24 20:34:47', 0);
INSERT INTO `manager_course` VALUES ('d1ecabfb49e84fd4988f41b6847e02f9', '63b9db88035b4433b23979dec9cde6a6', '2017-12-24 20:42:12', '2017-12-24 20:42:12', 0);
INSERT INTO `manager_course` VALUES ('d41843ce70494e9b92a7eae46b1b70ca', 'dfd1575c3b634d0cbf91f06658e1084d', '2017-12-24 20:26:29', '2017-12-24 20:26:29', 0);
INSERT INTO `manager_course` VALUES ('d5d65db163ee4417a23a3aafa1daeebb', '38381e9deba64eb5b8803df07b5a756c', '2017-12-24 20:36:29', '2017-12-24 20:36:29', 0);
INSERT INTO `manager_course` VALUES ('d72bad075b85470dbc41fe957a820d9f', '1ba8f61a23d64e6e939552e39602b06b', '2017-12-24 20:22:39', '2017-12-24 20:22:39', 0);
INSERT INTO `manager_course` VALUES ('d78e36df05654fcfb598afc7a6e0c39f', '96ffabbebc3f4ec8aeeb66f3f4f39d24', '2017-12-24 20:42:43', '2017-12-24 20:42:43', 0);
INSERT INTO `manager_course` VALUES ('e1ca5b0f66d74d0faa28edec5d80c961', '2c6e1f38838a4e74b2a742e968867c82', '2017-12-24 20:28:13', '2017-12-24 20:28:13', 1);
INSERT INTO `manager_course` VALUES ('e680b2a717e54f559c979a041cdf5843', '96fb9435f15642328520cad703e32e67', '2017-12-24 20:27:41', '2017-12-24 20:27:41', 1);
INSERT INTO `manager_course` VALUES ('f3b82a51518d4d09ab2c41d9d708d7da', '80450753b02445eda613ebcfae9cfaa5', '2017-12-24 20:40:35', '2017-12-24 20:40:35', 0);
INSERT INTO `manager_course` VALUES ('f3de5f23bb0148f19f0fce9c60ef63c2', 'a8e4f84fa7044d219675f4ccc9f5c7c3', '2017-12-24 20:20:43', '2017-12-24 20:20:43', 0);
INSERT INTO `manager_course` VALUES ('fbb949cfe17f42c39829a962aacfe287', '47a4c912bd774054afc9116490af7cf8', '2017-12-24 20:24:52', '2017-12-24 20:24:52', 0);
INSERT INTO `manager_course` VALUES ('fcf5dac9920d40dc9fd53dcc4c758bcd', 'a76d96680af840818cef65ec9b1f5893', '2017-12-24 20:37:54', '2017-12-24 20:37:54', 0);

-- ----------------------------
-- Table structure for office
-- ----------------------------
DROP TABLE IF EXISTS `office`;
CREATE TABLE `office`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `view_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of office
-- ----------------------------
INSERT INTO `office` VALUES (1, '第九章作业.docx', '课程大纲', 'view\\n6fb007emrez1nyzpze4.pdf', 'n6fb007emrez1nyzpze4.docx', 'docx', '2017-12-30 22:13:43');
INSERT INTO `office` VALUES (2, '第七章 网络聚合模式.ppt', '教学日历', 'http://127.0.0.1:8080/view\\5vfiuqp7n7lku32jgdm0.pdf', 'http://127.0.0.1:8080/5vfiuqp7n7lku32jgdm0.ppt', 'ppt', '2017-12-30 22:18:50');
INSERT INTO `office` VALUES (3, '2-第3组.pptx', '考核方式与标准', 'http://z7xxaq.natappfree.cc/view\\pi8njlgusogx1ags2lwj.pdf', 'http://z7xxaq.natappfree.cc/pi8njlgusogx1ags2lwj.pptx', 'pptx', '2017-12-30 22:23:20');
INSERT INTO `office` VALUES (4, '1-课程网站设计文档.docx', '学习指南', 'http://z7xxaq.natappfree.cc/view\\ifufwybrnshvj7hduj4m.pdf', 'http://z7xxaq.natappfree.cc/ifufwybrnshvj7hduj4m.docx', 'docx', '2017-12-30 22:25:01');
INSERT INTO `office` VALUES (5, 'office图表.pptx', NULL, 'http://z7xxaq.natappfree.cc/view\\zp7u8gt1sgrbeoguc9et.pdf', 'http://z7xxaq.natappfree.cc/zp7u8gt1sgrbeoguc9et.pptx', 'pptx', '2017-12-30 22:25:28');
INSERT INTO `office` VALUES (6, 'office图表.pptx', '啦啦啦啦', 'http://z7xxaq.natappfree.cc/view\\5obah4sdjc74bzv7m2tx.pdf', 'http://z7xxaq.natappfree.cc/5obah4sdjc74bzv7m2tx.pptx', 'pptx', '2017-12-30 22:25:41');
INSERT INTO `office` VALUES (7, '新建 Microsoft Excel 工作表.xlsx', 'ewf', 'http://z7xxaq.natappfree.cc/view\\lfvx0lt2vk5eg16nlbne.pdf', 'http://z7xxaq.natappfree.cc/lfvx0lt2vk5eg16nlbne.xlsx', 'xlsx', '2017-12-30 22:28:37');
INSERT INTO `office` VALUES (8, '第五章.网络经纪模式.ppt', '网络经济模式', 'http://127.0.0.1:8080/view/20180102170020794.pdf', 'http://127.0.0.1:8080/20180102170020794.ppt', 'ppt', '2018-01-02 17:00:32');
INSERT INTO `office` VALUES (9, 'SWOT分析模型.docx', 'SWOT分析模型', 'http://127.0.0.1:8080/view/20180102200644852.pdf', 'http://127.0.0.1:8080/20180102200644852.docx', 'docx', '2018-01-02 20:06:53');

-- ----------------------------
-- Table structure for otherresource
-- ----------------------------
DROP TABLE IF EXISTS `otherresource`;
CREATE TABLE `otherresource`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chinesedescription` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(128) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `url` varchar(128) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES (1, 'logo.png', 'http://127.0.0.1:8080/pic/7ct8pgdt2na54s3sneh5.png', '2017-12-26 20:17:28', 0);
INSERT INTO `picture` VALUES (2, '关联表.png', 'http://127.0.0.1:8080/pic/sy272xgp333smfzb8b3p.png', '2017-12-26 20:59:30', 0);

-- ----------------------------
-- Table structure for ppt
-- ----------------------------
DROP TABLE IF EXISTS `ppt`;
CREATE TABLE `ppt`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chinesedescription` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_id` int(11) NOT NULL,
  `student_id` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` smallint(6) DEFAULT 0,
  `reply` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reply`(`reply`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT 1,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clazz` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `major` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `school` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `img` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'http://image.chenliangliang.xin/people',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(4) DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `introduction` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_comment
-- ----------------------------
DROP TABLE IF EXISTS `student_comment`;
CREATE TABLE `student_comment`  (
  `student_id` varchar(33) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `comment_id` bigint(20) NOT NULL,
  `is_delete` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`student_id`, `comment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course`  (
  `student_id` varchar(33) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `course_id` varchar(33) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`student_id`, `course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_picture
-- ----------------------------
DROP TABLE IF EXISTS `student_picture`;
CREATE TABLE `student_picture`  (
  `student_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `picture_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`student_id`, `picture_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `personIntroduction` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('039f6fa77c6b48048fa9d941f6d5e95c', 'T04', '何建民', '男', '教授', '\n', '2017-12-24 20:02:02', '2017-12-26 18:45:58', 0);
INSERT INTO `teacher` VALUES ('0ca5585c80f94896955c42bf37d552f8', 'T15', '程浩', '男', '教授', '', '2017-12-24 20:06:57', '2017-12-24 20:06:57', 0);
INSERT INTO `teacher` VALUES ('11553bf79b5c44a5acf9966cb01850fb', 'T22', '江兵', '男', '教授', '', '2017-12-24 20:10:53', '2017-12-24 20:10:53', 0);
INSERT INTO `teacher` VALUES ('15f6d17221004112878a22a90bda302a', 'T06', '凌海峰', '男', '教授', '', '2017-12-24 20:03:06', '2017-12-24 20:03:06', 0);
INSERT INTO `teacher` VALUES ('17dae3df2d2a49ce97dbacaae43ffab5', 'T18', '刘心报', '男', '教授', '', '2017-12-24 20:08:24', '2017-12-24 20:08:24', 0);
INSERT INTO `teacher` VALUES ('1873a5ba9b6f426b9b5e0d9b7e6ce39e', 'T16', '余本功', '男', '教授', '', '2017-12-24 20:07:40', '2017-12-24 20:07:40', 0);
INSERT INTO `teacher` VALUES ('1ac2eb0c730740868ac66f06321aa0af', 'T08', '毛雪岷', '男', '教授', '', '2017-12-24 20:04:06', '2017-12-24 20:04:06', 0);
INSERT INTO `teacher` VALUES ('1f133fd5993e477bbf7e7cbf1dc140d3', 'T21', '孙见山', '男', '教授', '', '2017-12-24 20:10:32', '2017-12-24 20:10:32', 0);
INSERT INTO `teacher` VALUES ('1f6d8c7d89684960b064d0512bc89a51', 'T25', '裴凤', '女', '教授', '', '2017-12-24 20:12:12', '2017-12-24 20:12:12', 0);
INSERT INTO `teacher` VALUES ('25574c94dd4a43b9a83338bbf3d5f44f', 'T24', '周谧', '男', '教授', '', '2017-12-24 20:11:36', '2017-12-24 20:11:36', 0);
INSERT INTO `teacher` VALUES ('2caefb42a6424361a7cbb7df8c61e11f', 'T26', '陈夏雨', '女', '教授', '', '2017-12-24 20:12:32', '2017-12-24 20:12:32', 0);
INSERT INTO `teacher` VALUES ('3', '3', '3', '3', '3', NULL, '2017-12-24 20:12:32', '2017-12-24 20:12:32', 1);
INSERT INTO `teacher` VALUES ('321a1996c424434895b93ece7ab855c5', 'T14', '刘林', '男', '教授', '', '2017-12-24 20:06:33', '2017-12-24 20:06:33', 0);
INSERT INTO `teacher` VALUES ('3f2e5e3ed2c8453d9fb6c05930a742e0', '1', 'zxs', '1', '1', '1', '2018-01-06 21:44:55', '2018-01-06 21:52:28', 1);
INSERT INTO `teacher` VALUES ('4', '4', '4', '4', '4', NULL, '2017-12-24 20:12:32', '2017-12-24 20:12:32', 0);
INSERT INTO `teacher` VALUES ('408f7e1c170745fb9d052a2206146d43', 'T11', '许君', '男', '教授', '', '2017-12-24 20:05:29', '2017-12-24 20:05:29', 0);
INSERT INTO `teacher` VALUES ('4e292a64b03f45cca5d9bde947b03295', 'T02', '倪丽萍', '女', '教授', '', '2017-12-24 20:00:53', '2017-12-24 20:00:53', 0);
INSERT INTO `teacher` VALUES ('538927a853fb4dd5b6f217d13114170a', 'T27', '孙春华', '女', '教授', '', '2017-12-24 20:13:41', '2017-12-24 20:13:41', 0);
INSERT INTO `teacher` VALUES ('55e954542c8247dfb02723b02b815dc4', 'T28', '李锋刚', '男', '教授', '', '2017-12-24 20:14:21', '2017-12-24 20:14:21', 0);
INSERT INTO `teacher` VALUES ('60702dbff9874c6e8e1a98631f8b60e7', 'T27', '王刚', '男', '教授', '', '2017-12-24 20:12:50', '2017-12-24 20:12:50', 0);
INSERT INTO `teacher` VALUES ('644b84935201474fb959e7b6ae616cb2', 'T05', '赵菊', '女', '教授', '', '2017-12-24 20:02:33', '2017-12-24 20:02:33', 0);
INSERT INTO `teacher` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', 'T03', '全体', '男女', 'xx', 'dfgfhgjhk', '2017-12-24 20:01:38', '2018-01-03 19:51:46', 0);
INSERT INTO `teacher` VALUES ('68c38c713ecc4e89977e4be00c90504a', 'T27', '许启发', '男', '教授', '', '2017-12-24 20:13:15', '2017-12-24 20:13:15', 0);
INSERT INTO `teacher` VALUES ('79e96623f593463db8a64ab147e87126', 'T12', '倪志伟', '男', '教授', '', '2017-12-24 20:05:53', '2017-12-24 20:05:53', 0);
INSERT INTO `teacher` VALUES ('8eda7ae527fe46a3a6accafdbc2ed57f', 'T13', '伍章俊', '男', '教授', '', '2017-12-24 20:06:09', '2017-12-24 20:06:09', 0);
INSERT INTO `teacher` VALUES ('9e1ec0aa47c34eea919bd404b4846194', '1', '1', 's', 'string', 'string', '2017-12-26 22:57:24', '2017-12-26 22:57:24', 0);
INSERT INTO `teacher` VALUES ('a1f642a6461a4da585b3591147ab7607', 'T10', '尹朋珍', '女', '教授', '', '2017-12-24 20:05:12', '2017-12-24 20:05:12', 0);
INSERT INTO `teacher` VALUES ('a9e8bb2e27cb4961af2171a805f76f25', 'T20', '裴军', '男', '教授', '', '2017-12-24 20:10:08', '2017-12-24 20:10:08', 0);
INSERT INTO `teacher` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', 'XXX', '佚名', '待定', '待定', 'handsome！！！', '2017-12-24 19:57:48', '2017-12-24 19:57:48', 0);
INSERT INTO `teacher` VALUES ('ac5672fe6d28436ea655c0f0de7a8810', '2', '2', 's', 'string', 'string', '2017-12-26 22:57:33', '2017-12-26 22:57:33', 0);
INSERT INTO `teacher` VALUES ('b240547d9aa944f9bfe3de8696875062', 'T01', '刘业政', '男', '正教授', '组长', '2017-12-24 20:00:21', '2018-01-03 19:08:32', 0);
INSERT INTO `teacher` VALUES ('bcd6e841bd55476e9588c180b0cddbce', 'T09', '杨爱峰', '女', '教授', '', '2017-12-24 20:04:34', '2017-12-24 20:04:34', 0);
INSERT INTO `teacher` VALUES ('bf5911ed66e246999844ee4a2253b968', 'T17', '张强', '男', '教授', '', '2017-12-24 20:07:58', '2017-12-24 20:07:58', 0);
INSERT INTO `teacher` VALUES ('c3106a52473543a58c3282871a72d952', 'T19', '姜元春', '男', '教授', '', '2017-12-24 20:09:36', '2017-12-24 20:09:36', 0);
INSERT INTO `teacher` VALUES ('d21b2bad365f46799bfb4fa35a8702cb', 'T07', '李应', '男', '教授', '', '2017-12-24 20:03:37', '2017-12-24 20:03:37', 0);
INSERT INTO `teacher` VALUES ('de7fdb3d03b4422aae438ebd0a5b2532', 'T29', '程八一', '男', '教授', '', '2017-12-24 20:14:42', '2017-12-24 20:14:42', 0);
INSERT INTO `teacher` VALUES ('e62c70cfeada48ef9097c409ffcab8e1', 'T23', '方必和', '男', '教授', '', '2017-12-24 20:11:13', '2017-12-24 20:11:13', 0);

-- ----------------------------
-- Table structure for teacher_course
-- ----------------------------
DROP TABLE IF EXISTS `teacher_course`;
CREATE TABLE `teacher_course`  (
  `teacher_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`teacher_id`, `course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher_course
-- ----------------------------
INSERT INTO `teacher_course` VALUES ('039f6fa77c6b48048fa9d941f6d5e95c', 'a5cebe6309904802b4ed65b6bba5a985', '2017-12-24 20:29:45', '2017-12-24 20:29:45', 0);
INSERT INTO `teacher_course` VALUES ('039f6fa77c6b48048fa9d941f6d5e95c', 'c22dc588c4e642e28b4fbf0e5266584e', '2017-12-24 20:45:27', '2017-12-24 20:45:27', 0);
INSERT INTO `teacher_course` VALUES ('039f6fa77c6b48048fa9d941f6d5e95c', 'dfd1575c3b634d0cbf91f06658e1084d', '2017-12-24 20:26:29', '2017-12-24 20:26:29', 0);
INSERT INTO `teacher_course` VALUES ('15f6d17221004112878a22a90bda302a', 'd6d267c4fff7433f974c6898f653afc6', '2017-12-24 20:32:52', '2017-12-24 20:32:52', 0);
INSERT INTO `teacher_course` VALUES ('25574c94dd4a43b9a83338bbf3d5f44f', 'dfd8c01f7edc4bf8873d688396552e12', '2017-12-24 20:40:08', '2017-12-24 20:40:08', 0);
INSERT INTO `teacher_course` VALUES ('3', '1', '2017-12-24 20:29:45', '2017-12-24 20:29:45', 0);
INSERT INTO `teacher_course` VALUES ('3', '8', '2017-12-27 16:45:47', '2017-12-27 16:45:47', 0);
INSERT INTO `teacher_course` VALUES ('4', '1', '2017-12-28 19:07:08', '2017-12-28 19:07:08', 0);
INSERT INTO `teacher_course` VALUES ('4', '8', '2017-12-27 16:45:47', '2017-12-27 16:45:47', 0);
INSERT INTO `teacher_course` VALUES ('4e292a64b03f45cca5d9bde947b03295', '458d0ee25a6f4c76ba7c66cb6f9fb684', '2017-12-24 20:27:04', '2017-12-24 20:27:04', 0);
INSERT INTO `teacher_course` VALUES ('644b84935201474fb959e7b6ae616cb2', '3067bec0fae449b4b475ffacd86aeb3c', '2017-12-24 20:31:20', '2017-12-24 20:31:20', 0);
INSERT INTO `teacher_course` VALUES ('644b84935201474fb959e7b6ae616cb2', '68f5f3cf5f1341469b54a97c7693e9bc', '2017-12-24 20:31:56', '2017-12-24 20:31:56', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '02acad2b6d7f468da1435055a2b72443', '2017-12-24 20:43:18', '2017-12-24 20:43:18', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '0a497b0c5ae443869938232979b03e9f', '2017-12-24 20:46:48', '2017-12-24 20:46:48', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '1a80be5c25a641529d4f439546c0700f', '2017-12-24 20:39:27', '2017-12-24 20:39:27', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '2c6e1f38838a4e74b2a742e968867c82', '2017-12-24 20:28:13', '2017-12-24 20:28:13', 1);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '2d097c854e5849648d7f9285ca72e602', '2017-12-24 20:37:17', '2017-12-24 20:37:17', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '38381e9deba64eb5b8803df07b5a756c', '2017-12-24 20:36:29', '2017-12-24 20:36:29', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '54e03bc9e2d24f90aabd13bd8d6d11dd', '2017-12-24 20:34:47', '2017-12-24 20:34:47', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '55bb7cb3be5b44349675090f61cc56e5', '2017-12-24 20:41:00', '2017-12-24 20:41:00', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '56d754b9edcc47dc9c98a1a49ebf9745', '2017-12-24 20:33:30', '2017-12-24 20:33:30', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '68be5e7ee8d64caca1727c4b00a67b9a', '2017-12-24 20:33:57', '2017-12-24 20:33:57', 1);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '74615fae2f434219abf8753797f77a94', '2017-12-24 20:47:12', '2017-12-24 20:47:12', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '7b72db9416c640f6b61305cc6c4b772e', '2017-12-24 20:46:03', '2017-12-24 20:46:03', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '80450753b02445eda613ebcfae9cfaa5', '2017-12-24 20:40:35', '2017-12-24 20:40:35', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '937a1b99a70e4bd9adcdafc2a87e38c9', '2017-12-24 20:25:31', '2017-12-24 20:25:31', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '96fb9435f15642328520cad703e32e67', '2017-12-24 20:27:41', '2017-12-24 20:27:41', 1);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', '96ffabbebc3f4ec8aeeb66f3f4f39d24', '2017-12-24 20:42:43', '2017-12-24 20:42:43', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', 'ac03ee1529e34586b2b34f0a37e1f224', '2017-12-24 20:41:39', '2017-12-24 20:41:39', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', 'bee646f3d731496bb9a67e7684294670', '2017-12-24 20:43:46', '2017-12-24 20:43:46', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', 'c1722db650f54ac68029b4341281e755', '2017-12-24 20:32:20', '2017-12-24 20:32:20', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', 'c4a7b01ded644212bce6e8c39963a4f0', '2017-12-24 20:44:51', '2017-12-24 20:44:51', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', 'c6f694ee59fb4b08aac806682beaf36d', '2017-12-24 20:47:36', '2017-12-24 20:47:36', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', 'd28d0d16aef24cadb666a35eb5c74f3d', '2017-12-24 20:30:37', '2017-12-24 20:30:37', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', 'f35a95424907463f93c9cecd6afec2a3', '2017-12-24 20:39:00', '2017-12-24 20:39:00', 0);
INSERT INTO `teacher_course` VALUES ('68bf1c2b97ef4be5b58cd03aeb74dd65', 'f5f82afd1f3d421d818f5fae9ba07b68', '2017-12-24 20:35:40', '2017-12-24 20:35:40', 0);
INSERT INTO `teacher_course` VALUES ('68c38c713ecc4e89977e4be00c90504a', 'ed7de5d5525a437e9b234b1934f8ed89', '2017-12-24 20:44:10', '2017-12-24 20:44:10', 0);
INSERT INTO `teacher_course` VALUES ('79e96623f593463db8a64ab147e87126', '8e2abff457c84db8b4b71b44e2373a79', '2017-12-24 20:29:01', '2017-12-24 20:29:01', 0);
INSERT INTO `teacher_course` VALUES ('8eda7ae527fe46a3a6accafdbc2ed57f', '17bfbbcd244b4f5b9a15df2b43ce87b9', '2017-12-24 20:38:20', '2017-12-24 20:38:20', 0);
INSERT INTO `teacher_course` VALUES ('8eda7ae527fe46a3a6accafdbc2ed57f', 'a76d96680af840818cef65ec9b1f5893', '2017-12-24 20:37:54', '2017-12-24 20:37:54', 0);
INSERT INTO `teacher_course` VALUES ('8eda7ae527fe46a3a6accafdbc2ed57f', 'abd953040f24406493c5229abc67ed79', '2017-12-24 20:35:12', '2017-12-24 20:35:12', 0);
INSERT INTO `teacher_course` VALUES ('9e1ec0aa47c34eea919bd404b4846194', '15f73a76aef8419f833cbf8edfaa5685', '2017-12-26 23:04:52', '2017-12-26 23:04:52', 1);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', '1ba8f61a23d64e6e939552e39602b06b', '2017-12-24 20:22:39', '2017-12-24 20:22:39', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', '1e1cb4677feb488c86ba9e1b618a6357', '2017-12-24 20:16:56', '2017-12-24 20:16:56', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', '4486c2dc6da44bf3ab4ca450ab22f50b', '2017-12-24 20:22:13', '2017-12-24 20:22:13', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', '566e51f81efe40a2961dcbbeb31d85cf', '2017-12-24 20:20:19', '2017-12-24 20:20:19', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', '5dbcdabac52d4a968f791a99842c3310', '2017-12-24 20:19:38', '2017-12-24 20:19:38', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', '63be3c4a046b4156a4ab68c58331ad46', '2017-12-24 20:21:52', '2017-12-24 20:21:52', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', '6d6d1186c4494c7a93914b3754c1eaac', '2017-12-24 20:23:36', '2017-12-24 20:23:36', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', '805396da52b3420293cae4845a0c7236', '2017-12-24 20:18:07', '2017-12-24 20:18:07', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', '925a54e418d240ce8c309c19df4616d6', '2017-12-24 20:17:28', '2017-12-24 20:17:28', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', '9be614b2aaeb41579810c4ada43988ad', '2017-12-24 20:16:20', '2017-12-24 20:16:20', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', 'a8e4f84fa7044d219675f4ccc9f5c7c3', '2017-12-24 20:20:43', '2017-12-24 20:20:43', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', 'ada5cddcb5764768bba89a1e9f49850d', '2017-12-24 20:21:20', '2017-12-24 20:21:20', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', 'c4a70eeea2b94004a4d0440a3e137ebd', '2017-12-24 20:23:04', '2017-12-24 20:23:04', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', 'd9441495006543b28ef50163f11e5913', '2017-12-24 20:24:08', '2017-12-24 20:24:08', 0);
INSERT INTO `teacher_course` VALUES ('ac31baa93efe4a11b8cc78675fdeeccc', 'de419d0bd25743f0b19ae5a97ecb45e5', '2017-12-24 20:18:54', '2017-12-24 20:18:54', 0);
INSERT INTO `teacher_course` VALUES ('ac5672fe6d28436ea655c0f0de7a8810', '15f73a76aef8419f833cbf8edfaa5685', '2017-12-26 23:04:52', '2017-12-26 23:04:52', 1);
INSERT INTO `teacher_course` VALUES ('b240547d9aa944f9bfe3de8696875062', '47a4c912bd774054afc9116490af7cf8', '2017-12-24 20:24:52', '2017-12-24 20:24:52', 0);
INSERT INTO `teacher_course` VALUES ('bcd6e841bd55476e9588c180b0cddbce', '63b9db88035b4433b23979dec9cde6a6', '2017-12-24 20:42:12', '2017-12-24 20:42:12', 0);
INSERT INTO `teacher_course` VALUES ('e62c70cfeada48ef9097c409ffcab8e1', 'dfd8c01f7edc4bf8873d688396552e12', '2018-01-03 16:37:05', '2018-01-03 16:37:05', 1);

-- ----------------------------
-- Table structure for teacher_picture
-- ----------------------------
DROP TABLE IF EXISTS `teacher_picture`;
CREATE TABLE `teacher_picture`  (
  `teacher_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `picture_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`teacher_id`, `picture_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES ('bcbfe8d211f24a7ca64636a34443f613', 'string', 'string', 'string', '2017-12-13 22:47:32', '2017-12-17 19:44:18', 0);
INSERT INTO `unit` VALUES ('e5637d3f0f9f4804bfdd0741a3b51451', 'aaaaaa', 'aaa', '啊啊啊啊啊啊', '2017-12-17 19:39:44', '2017-12-17 19:39:44', 0);

-- ----------------------------
-- Table structure for unit_knowledgepoint
-- ----------------------------
DROP TABLE IF EXISTS `unit_knowledgepoint`;
CREATE TABLE `unit_knowledgepoint`  (
  `unit_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `knowledgepoint_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`unit_id`, `knowledgepoint_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of unit_knowledgepoint
-- ----------------------------
INSERT INTO `unit_knowledgepoint` VALUES ('bcbfe8d211f24a7ca64636a34443f613', '4', '2018-01-05 22:03:25', '2018-01-05 22:03:25', 0);
INSERT INTO `unit_knowledgepoint` VALUES ('bcbfe8d211f24a7ca64636a34443f613', 'a8d4bedcfe4e45438b8971f43241234c', '2018-01-05 22:03:25', '2018-01-05 22:03:25', 0);
INSERT INTO `unit_knowledgepoint` VALUES ('e5637d3f0f9f4804bfdd0741a3b51451', '4', '2018-01-06 15:41:59', '2018-01-06 15:41:59', 0);
INSERT INTO `unit_knowledgepoint` VALUES ('e5637d3f0f9f4804bfdd0741a3b51451', '6', '2018-01-05 22:03:25', '2018-01-05 22:03:25', 0);
INSERT INTO `unit_knowledgepoint` VALUES ('e5637d3f0f9f4804bfdd0741a3b51451', 'a8d4bedcfe4e45438b8971f43241234c', '2018-01-05 22:03:25', '2018-01-05 22:03:25', 0);

-- ----------------------------
-- Table structure for unit_office
-- ----------------------------
DROP TABLE IF EXISTS `unit_office`;
CREATE TABLE `unit_office`  (
  `unit_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `office_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` smallint(6) DEFAULT 0,
  PRIMARY KEY (`unit_id`, `office_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for unit_otherresource
-- ----------------------------
DROP TABLE IF EXISTS `unit_otherresource`;
CREATE TABLE `unit_otherresource`  (
  `unit_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `otherresource_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`unit_id`, `otherresource_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for unit_ppt
-- ----------------------------
DROP TABLE IF EXISTS `unit_ppt`;
CREATE TABLE `unit_ppt`  (
  `unit_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ppt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`unit_id`, `ppt_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for unit_video
-- ----------------------------
DROP TABLE IF EXISTS `unit_video`;
CREATE TABLE `unit_video`  (
  `unit_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `video_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`unit_id`, `video_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chinesedescription` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

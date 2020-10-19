/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : student_manage

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2020-06-18 22:27:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `student_id` varchar(15) NOT NULL COMMENT '学号',
  `source_id` varchar(10) DEFAULT NULL COMMENT '课程号',
  `grade` varchar(20) DEFAULT NULL COMMENT '分数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1808054601', 'TB0200004', '80');
INSERT INTO `grade` VALUES ('1808054601', 'TB21018', '100');
INSERT INTO `grade` VALUES ('1808054602', 'ZX1705009', '100');
INSERT INTO `grade` VALUES ('1808054602', 'ZB1705017', null);
INSERT INTO `grade` VALUES ('1808054603', 'TB21018', '未录入');
INSERT INTO `grade` VALUES ('1808054601', 'KC001', '100');

-- ----------------------------
-- Table structure for source
-- ----------------------------
DROP TABLE IF EXISTS `source`;
CREATE TABLE `source` (
  `id` varchar(10) NOT NULL COMMENT '课程编号',
  `name` varchar(25) DEFAULT NULL COMMENT '姓名',
  `teacher_id` varchar(10) DEFAULT NULL COMMENT '老师编号',
  `address` varchar(25) DEFAULT NULL COMMENT '上课地点',
  `credit` decimal(4,2) DEFAULT NULL COMMENT '学分',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of source
-- ----------------------------
INSERT INTO `source` VALUES ('KC001', '测试课程', '002', 'J0001', '5.00');
INSERT INTO `source` VALUES ('TB0200004', '算法分析与设计', '004', '103', '5.00');
INSERT INTO `source` VALUES ('TB21018', 'JavaWeb', '006', '121', '4.00');
INSERT INTO `source` VALUES ('ZB1705015', '数字媒体处理工具', '003', '307', '10.00');
INSERT INTO `source` VALUES ('ZB1705016', '游戏美术基础', '005', '407', '15.00');
INSERT INTO `source` VALUES ('ZB1705017', '形势与政策', '001', '307', '15.00');
INSERT INTO `source` VALUES ('ZX1705005', '体育', '007', 'J1306', '10.00');
INSERT INTO `source` VALUES ('ZX1705008', '中国近代史纲要', '008', 'JS203', '10.00');
INSERT INTO `source` VALUES ('ZX1705009', '大学英语', '002', 'J1406', '10.00');
INSERT INTO `source` VALUES ('ZX1705013', '操作系统原理与Linux', '009', 'J1509', '10.00');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(20) NOT NULL COMMENT '学号',
  `password` varchar(25) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `tel` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `grade` varchar(50) DEFAULT NULL COMMENT '入学时间',
  `dept` varchar(25) DEFAULT NULL COMMENT '院系',
  `major` varchar(25) DEFAULT NULL COMMENT '专业',
  `of_class` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1808054601', '123456', '王明', '男', '18888888884', '18', '计算机信息工程学院', '软件工程', '6');
INSERT INTO `student` VALUES ('1808054602', '123456', '李阳', '男', '18888888885', '18', '计算机信息工程学院', '软件工程', '6');
INSERT INTO `student` VALUES ('1808054603', '123456', '张鹏飞\r\n', '男', '18888888886', '18', '计算机信息工程学院', '软件工程', '6');
INSERT INTO `student` VALUES ('1808054604', '123456', '李雪', '女', '18888888887', '18', '计算机信息工程学院', '软件工程', '6');
INSERT INTO `student` VALUES ('1808054605', '123456', '张三', '女', '12345678900', '18', '计算机', '软件工程', '6');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '老师编号',
  `tname` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '教师名称',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('001', '老师一');
INSERT INTO `teacher` VALUES ('002', '老师二');
INSERT INTO `teacher` VALUES ('003', '老师三');
INSERT INTO `teacher` VALUES ('004', '老师四');
INSERT INTO `teacher` VALUES ('005', '老师五');
INSERT INTO `teacher` VALUES ('006', '老师六');
INSERT INTO `teacher` VALUES ('007', '老师七');
INSERT INTO `teacher` VALUES ('008', '老师八');
INSERT INTO `teacher` VALUES ('009', '老师九');
INSERT INTO `teacher` VALUES ('010', '老师十');

/*
 Navicat MySQL Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : eas

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for eas_base_course
-- ----------------------------
DROP TABLE IF EXISTS `eas_base_course`;
CREATE TABLE `eas_base_course`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `coursename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名',
  `synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of eas_base_course
-- ----------------------------
INSERT INTO `eas_base_course` VALUES (1, 'C语言程序设计', '本课程介绍计算机结构化程序设计的思想、方法和技巧');
INSERT INTO `eas_base_course` VALUES (2, '数据结构与算法', '数据结构是计算机科学的一门非常重要的专业基础课');
INSERT INTO `eas_base_course` VALUES (3, '操作系统', '操作系统课程内容综合了基础理论教学、课程实践教学、最新技术追踪等多项内容。');
INSERT INTO `eas_base_course` VALUES (4, '计算机网络', '计算机专业学生必修的一门专业基础课和核心课程');
INSERT INTO `eas_base_course` VALUES (5, '软件工程', '该课程主要介绍软件工程的基本概念、原理和典型的技术方法。');
INSERT INTO `eas_base_course` VALUES (6, 'Linux入门', '本课程以Redhat Linux系统为基础，对Linux系统做一个简洁而全面的介绍，使学生在较短时间内对该操作系统有个大概的了解。');
INSERT INTO `eas_base_course` VALUES (7, 'java程序设计语言', '本课程介绍Java语言的基础语法，让学生了解面向对象的程序设计思想');
INSERT INTO `eas_base_course` VALUES (8, 'C++程序设计语言', '本课程介绍C++语言的基础语法，让学生了解面向对象的程序设计思想');
INSERT INTO `eas_base_course` VALUES (9, '中国近现代史纲要', '介绍中国近现代的历史');
INSERT INTO `eas_base_course` VALUES (10, '马克思主义基本原理', '介绍马克思主义的基本原理');
INSERT INTO `eas_base_course` VALUES (11, '高等数学', '大学理工科专业必修课');
INSERT INTO `eas_base_course` VALUES (12, '线性代数', '计算机发展核心课程，其矩阵运算对之后的图像处理课程有很大影响');
INSERT INTO `eas_base_course` VALUES (13, '软件工程实训', '小组成员合作开发，培养学生的开发能力以及团队协作能力');
INSERT INTO `eas_base_course` VALUES (14, '硬件实训', '每名学生独立完成心形灯的焊接，并编写程序');
INSERT INTO `eas_base_course` VALUES (15, '计算机组成原理', '计算机专业核心发展课程，帮助学生认知计算机内部的运作过程');
INSERT INTO `eas_base_course` VALUES (16, '计算机图形学', '了解计算机绘图的基本原理，能够用matlab绘制一些简单的图案');

-- ----------------------------
-- Table structure for eas_class
-- ----------------------------
DROP TABLE IF EXISTS `eas_class`;
CREATE TABLE `eas_class`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `classes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eas_class
-- ----------------------------
INSERT INTO `eas_class` VALUES (1, '计算机科学与技术17-1');
INSERT INTO `eas_class` VALUES (2, '计算机科学与技术17-2');
INSERT INTO `eas_class` VALUES (3, '计算机科学与技术17-3');
INSERT INTO `eas_class` VALUES (4, '计算机科学与技术17-4');
INSERT INTO `eas_class` VALUES (5, '国际经济与贸易17-1');
INSERT INTO `eas_class` VALUES (6, '国际经济与贸易17-2');
INSERT INTO `eas_class` VALUES (12, '无班级');

-- ----------------------------
-- Table structure for eas_course
-- ----------------------------
DROP TABLE IF EXISTS `eas_course`;
CREATE TABLE `eas_course`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_date` date NULL DEFAULT NULL COMMENT '开设日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `class_hour` smallint(6) NULL DEFAULT NULL COMMENT '总课时',
  `test_mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考核方式',
  `student_num` int(20) NULL DEFAULT NULL COMMENT '学生数量',
  `choice_num` int(20) NULL DEFAULT 0 COMMENT '选课人数',
  `complete` int(20) UNSIGNED NULL DEFAULT 0 COMMENT '是否是完成的课程',
  `t_id` int(20) UNSIGNED NOT NULL COMMENT '外键-教师号',
  `base_course_id` int(20) UNSIGNED NOT NULL COMMENT '外键-课程号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `techer_msg`(`t_id`) USING BTREE,
  INDEX `course_mag`(`base_course_id`) USING BTREE,
  CONSTRAINT `course_mag` FOREIGN KEY (`base_course_id`) REFERENCES `eas_base_course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `techer_msg` FOREIGN KEY (`t_id`) REFERENCES `eas_teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of eas_course
-- ----------------------------
INSERT INTO `eas_course` VALUES (1, '2021-05-01', '2021-05-12', 20, '线下考试', 30, 2, 1, 1, 1);
INSERT INTO `eas_course` VALUES (2, '2021-06-15', '2021-07-15', 10, '线上考试', 20, 0, 0, 1, 2);
INSERT INTO `eas_course` VALUES (4, '2021-07-03', '2021-08-03', 20, '闭卷考试', 20, 0, 0, 1, 3);

-- ----------------------------
-- Table structure for eas_notice
-- ----------------------------
DROP TABLE IF EXISTS `eas_notice`;
CREATE TABLE `eas_notice`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `type` int(20) NOT NULL DEFAULT 3 COMMENT '权限',
  `releasedate` date NOT NULL COMMENT '发布日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eas_notice
-- ----------------------------
INSERT INTO `eas_notice` VALUES (1, '毕业通知', '管理员', '123', 1, '2021-04-28');
INSERT INTO `eas_notice` VALUES (2, '2018年运动会', '管理员', '山东科技大学济南校区2018年运动会开幕式', 1, '2021-04-28');
INSERT INTO `eas_notice` VALUES (3, 'hello', '管理员', '123', 2, '2021-04-28');
INSERT INTO `eas_notice` VALUES (6, 'hello1', '管理员', '123', 3, '2021-04-29');

-- ----------------------------
-- Table structure for eas_permission
-- ----------------------------
DROP TABLE IF EXISTS `eas_permission`;
CREATE TABLE `eas_permission`  (
  `id` int(20) NOT NULL COMMENT '功能id',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能类型',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `percode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '别名',
  `parentid` int(20) NULL DEFAULT NULL COMMENT '父级编号',
  `sortstring` int(20) NULL DEFAULT NULL COMMENT '进行排序',
  `available` int(20) NULL DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eas_permission
-- ----------------------------
INSERT INTO `eas_permission` VALUES (1, '系统管理', 'menu', NULL, 'system:*', NULL, 0, 1);
INSERT INTO `eas_permission` VALUES (2, '用户管理', 'menu', 'easUser/index', 'user:query', 1, 1, 1);
INSERT INTO `eas_permission` VALUES (3, '添加用户', 'function', 'easUser/add', 'user:add', 2, 2, 1);
INSERT INTO `eas_permission` VALUES (4, '删除用户', 'function', 'easUser/delete', 'user:delete', 2, 2, 1);
INSERT INTO `eas_permission` VALUES (5, '修改用户', 'function', 'easUser/update', 'user:update', 2, 2, 1);
INSERT INTO `eas_permission` VALUES (6, '角色管理', 'menu', 'easRole/index', 'role:query', 1, 1, 1);
INSERT INTO `eas_permission` VALUES (7, '添加角色', 'function', 'easRole/add', 'role:add', 6, 3, 1);
INSERT INTO `eas_permission` VALUES (8, '删除角色', 'function', 'easRole/add', 'role:delete', 6, 3, 1);
INSERT INTO `eas_permission` VALUES (9, '修改角色', 'function', 'easRole/update', 'role:update', 6, 3, 1);
INSERT INTO `eas_permission` VALUES (10, '学生信息', 'menu', 'easStudent/index', 'student:query', 18, 1, 1);
INSERT INTO `eas_permission` VALUES (11, '添加学生', 'function', 'easStudent/add', 'student:add', 10, 4, 1);
INSERT INTO `eas_permission` VALUES (12, '删除学生', 'function', 'easStudent/delete', 'student:delete', 10, 4, 1);
INSERT INTO `eas_permission` VALUES (13, '修改学生', 'function', 'easStudent/update', 'student:update', 10, 4, 1);
INSERT INTO `eas_permission` VALUES (14, '权限管理', 'menu', 'easPermission/index', 'permission:query', 1, 1, 1);
INSERT INTO `eas_permission` VALUES (15, '添加权限', 'function', 'easPermission/add', 'permission:add', 14, 2, 1);
INSERT INTO `eas_permission` VALUES (16, '修改权限', 'function', 'easPermission/update', 'permission:update', 14, 2, 1);
INSERT INTO `eas_permission` VALUES (17, '删除权限', 'function', 'easPermission/delete', 'permission:delete', 14, 2, 1);
INSERT INTO `eas_permission` VALUES (18, '信息管理', 'menu', NULL, 'message:*', NULL, 0, 1);
INSERT INTO `eas_permission` VALUES (19, '教师信息', 'menu', 'easTeacher/index', 'teacher:query', 18, 1, 1);
INSERT INTO `eas_permission` VALUES (20, '查看教师', 'function', 'easTeacher/index', 'teacher:query', 19, 5, 1);
INSERT INTO `eas_permission` VALUES (21, '添加教师', 'function', 'easTeacher/add', 'teacher:add', 19, 5, 1);
INSERT INTO `eas_permission` VALUES (22, '删除教师', 'function', 'easTeacher/delete', 'teacher:delete', 19, 5, 1);
INSERT INTO `eas_permission` VALUES (23, '修改教师', 'function', 'easTeacher/update', 'teacher:update', 19, 5, 1);
INSERT INTO `eas_permission` VALUES (24, '查看学生', 'function', 'easStudent/index', 'student:query', 10, 4, 1);
INSERT INTO `eas_permission` VALUES (25, '基本课程管理', 'menu', 'easBaseCourse/index', 'basecourse:query', 18, 1, 1);
INSERT INTO `eas_permission` VALUES (26, '查看基本课程', 'function', 'easBaseCourse/index', 'basecourse:query', 25, 6, 1);
INSERT INTO `eas_permission` VALUES (27, '添加基本课程', 'function', 'easBaseCourse/add', 'basecourse:add', 25, 6, 1);
INSERT INTO `eas_permission` VALUES (28, '删除基本课程', 'function', 'easBaseCourse/delete', 'basecourse:delete', 25, 6, 1);
INSERT INTO `eas_permission` VALUES (29, '修改基本课程', 'function', 'easBaseCourse/update', 'basecourse:update', 25, 6, 1);
INSERT INTO `eas_permission` VALUES (30, '课程管理', 'menu', NULL, 'curriculum:*', NULL, 0, 1);
INSERT INTO `eas_permission` VALUES (31, '课程信息(管理员)', 'menu', 'easCourse/adminIndex', 'course:adminIndex', 30, 1, 1);
INSERT INTO `eas_permission` VALUES (32, '查看课程信息', 'function', 'easCourse/adminIndex', 'course:adminIndex', 31, 7, 1);
INSERT INTO `eas_permission` VALUES (33, '添加课程信息', 'function', 'easCourse/adminAdd', 'course:adminAdd', 31, 7, 1);
INSERT INTO `eas_permission` VALUES (34, '删除课程信息', 'function', 'easCourse/adminDelete', 'course:adminDelete', 31, 7, 1);
INSERT INTO `eas_permission` VALUES (35, '修改课程信息', 'function', 'easCourse/adminUpdate', 'course:adminUpdate', 31, 7, 1);
INSERT INTO `eas_permission` VALUES (36, '课程信息(学生)', 'menu', 'easCourse/studentIndex', 'course:studentIndex', 30, 1, 1);
INSERT INTO `eas_permission` VALUES (37, '选择课程', 'function', 'easCourse/studentSelect', 'course:studentSelect', 36, 8, 1);
INSERT INTO `eas_permission` VALUES (38, '退选课程', 'function', 'easCourse/studentDrop', 'course:studentDrop', 36, 8, 1);
INSERT INTO `eas_permission` VALUES (39, '查看课程', 'function', 'easCourse/studentIndex', 'course:studentIndex', 36, 8, 1);
INSERT INTO `eas_permission` VALUES (40, '课程信息(教师)', 'menu', 'easCourse/teacherIndex', 'course:teacherIndex', 30, 11, 1);
INSERT INTO `eas_permission` VALUES (41, '查看课程', 'function', 'easCourse/teacherIndex', 'course:teacherIndex', 40, 9, 1);
INSERT INTO `eas_permission` VALUES (42, '结束课程', 'function', 'easCourse/teacherEndCourse', 'course:teacherEndCourse', 40, 9, 1);
INSERT INTO `eas_permission` VALUES (43, '成绩管理', 'menu', '', 'result:*', NULL, 0, 1);
INSERT INTO `eas_permission` VALUES (44, '学生成绩列表', 'function', 'easScore/scoreIndex', 'score:scoreIndex', 43, 10, 1);
INSERT INTO `eas_permission` VALUES (45, '我的成绩', 'function', 'easScore/myScoreIndex', 'score:myScoreIndex', 43, 10, 1);
INSERT INTO `eas_permission` VALUES (46, '我的学生选课信息', 'menu', 'easScore/myStudentIndex', 'score:myStudentIndex', 30, 11, 1);
INSERT INTO `eas_permission` VALUES (47, '通知管理', 'menu', 'easNotice/index', 'notice:query', 1, 1, 1);
INSERT INTO `eas_permission` VALUES (48, '添加通知', 'function', 'easNotice/add', 'notice:add', 47, 12, 1);
INSERT INTO `eas_permission` VALUES (49, '删除通知', 'function', 'easNotice/delete', 'notice:delete', 47, 12, 1);
INSERT INTO `eas_permission` VALUES (50, '修改通知', 'function', 'easNotice/update', 'notice:update', 47, 12, 1);
INSERT INTO `eas_permission` VALUES (51, '信息报表', 'menu', '', 'echarts:*', NULL, 0, 1);
INSERT INTO `eas_permission` VALUES (52, '成绩报表', 'function', 'easEchart/scoreEchart', 'echart:score', 51, 13, 1);
INSERT INTO `eas_permission` VALUES (53, '人数报表', 'function', 'easEchart/peopleEchart', 'echart:people', 51, 13, 1);
INSERT INTO `eas_permission` VALUES (54, '班级信息', 'menu', 'easClass/index', 'class:query', 18, 1, 1);
INSERT INTO `eas_permission` VALUES (55, '查看班级信息', 'function', 'easClass/index', 'class:query', 54, 14, 1);
INSERT INTO `eas_permission` VALUES (56, '添加班级信息', 'function', 'easClass/add', 'class:add', 54, 14, 1);
INSERT INTO `eas_permission` VALUES (57, '删除班级信息', 'function', 'easClass/delete', 'class:delete', 54, 14, 1);
INSERT INTO `eas_permission` VALUES (58, '修改班级信息', 'function', 'easClass/update', 'class:update', 54, 14, 1);

-- ----------------------------
-- Table structure for eas_role
-- ----------------------------
DROP TABLE IF EXISTS `eas_role`;
CREATE TABLE `eas_role`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `available` int(20) NOT NULL DEFAULT 0 COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eas_role
-- ----------------------------
INSERT INTO `eas_role` VALUES (1, '超级管理员', 1);
INSERT INTO `eas_role` VALUES (2, '学生', 1);
INSERT INTO `eas_role` VALUES (3, '教师', 1);
INSERT INTO `eas_role` VALUES (5, '通知管理员', 1);
INSERT INTO `eas_role` VALUES (6, '课程管理员', 1);

-- ----------------------------
-- Table structure for eas_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `eas_role_permission`;
CREATE TABLE `eas_role_permission`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `eas_role_id` int(20) NOT NULL COMMENT '角色id',
  `eas_permission_id` int(20) NOT NULL COMMENT '功能id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 507 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eas_role_permission
-- ----------------------------
INSERT INTO `eas_role_permission` VALUES (404, 2, 18);
INSERT INTO `eas_role_permission` VALUES (405, 2, 10);
INSERT INTO `eas_role_permission` VALUES (406, 2, 13);
INSERT INTO `eas_role_permission` VALUES (407, 2, 24);
INSERT INTO `eas_role_permission` VALUES (408, 2, 19);
INSERT INTO `eas_role_permission` VALUES (409, 2, 20);
INSERT INTO `eas_role_permission` VALUES (410, 2, 25);
INSERT INTO `eas_role_permission` VALUES (411, 2, 26);
INSERT INTO `eas_role_permission` VALUES (412, 2, 30);
INSERT INTO `eas_role_permission` VALUES (413, 2, 36);
INSERT INTO `eas_role_permission` VALUES (414, 2, 37);
INSERT INTO `eas_role_permission` VALUES (415, 2, 38);
INSERT INTO `eas_role_permission` VALUES (416, 2, 39);
INSERT INTO `eas_role_permission` VALUES (417, 2, 43);
INSERT INTO `eas_role_permission` VALUES (418, 2, 45);
INSERT INTO `eas_role_permission` VALUES (419, 2, 51);
INSERT INTO `eas_role_permission` VALUES (420, 2, 53);
INSERT INTO `eas_role_permission` VALUES (421, 3, 18);
INSERT INTO `eas_role_permission` VALUES (422, 3, 10);
INSERT INTO `eas_role_permission` VALUES (423, 3, 24);
INSERT INTO `eas_role_permission` VALUES (424, 3, 19);
INSERT INTO `eas_role_permission` VALUES (425, 3, 20);
INSERT INTO `eas_role_permission` VALUES (426, 3, 23);
INSERT INTO `eas_role_permission` VALUES (427, 3, 25);
INSERT INTO `eas_role_permission` VALUES (428, 3, 26);
INSERT INTO `eas_role_permission` VALUES (429, 3, 30);
INSERT INTO `eas_role_permission` VALUES (430, 3, 40);
INSERT INTO `eas_role_permission` VALUES (431, 3, 41);
INSERT INTO `eas_role_permission` VALUES (432, 3, 42);
INSERT INTO `eas_role_permission` VALUES (433, 3, 46);
INSERT INTO `eas_role_permission` VALUES (434, 3, 43);
INSERT INTO `eas_role_permission` VALUES (435, 3, 44);
INSERT INTO `eas_role_permission` VALUES (436, 3, 51);
INSERT INTO `eas_role_permission` VALUES (437, 3, 52);
INSERT INTO `eas_role_permission` VALUES (438, 3, 53);
INSERT INTO `eas_role_permission` VALUES (444, 5, 1);
INSERT INTO `eas_role_permission` VALUES (445, 5, 47);
INSERT INTO `eas_role_permission` VALUES (446, 5, 48);
INSERT INTO `eas_role_permission` VALUES (447, 5, 49);
INSERT INTO `eas_role_permission` VALUES (448, 5, 50);
INSERT INTO `eas_role_permission` VALUES (449, 5, 51);
INSERT INTO `eas_role_permission` VALUES (450, 5, 52);
INSERT INTO `eas_role_permission` VALUES (451, 5, 53);
INSERT INTO `eas_role_permission` VALUES (452, 6, 30);
INSERT INTO `eas_role_permission` VALUES (453, 6, 31);
INSERT INTO `eas_role_permission` VALUES (454, 6, 32);
INSERT INTO `eas_role_permission` VALUES (455, 6, 33);
INSERT INTO `eas_role_permission` VALUES (456, 6, 34);
INSERT INTO `eas_role_permission` VALUES (457, 6, 35);
INSERT INTO `eas_role_permission` VALUES (458, 6, 51);
INSERT INTO `eas_role_permission` VALUES (459, 6, 52);
INSERT INTO `eas_role_permission` VALUES (460, 6, 53);
INSERT INTO `eas_role_permission` VALUES (461, 1, 1);
INSERT INTO `eas_role_permission` VALUES (462, 1, 2);
INSERT INTO `eas_role_permission` VALUES (463, 1, 3);
INSERT INTO `eas_role_permission` VALUES (464, 1, 4);
INSERT INTO `eas_role_permission` VALUES (465, 1, 5);
INSERT INTO `eas_role_permission` VALUES (466, 1, 6);
INSERT INTO `eas_role_permission` VALUES (467, 1, 7);
INSERT INTO `eas_role_permission` VALUES (468, 1, 8);
INSERT INTO `eas_role_permission` VALUES (469, 1, 9);
INSERT INTO `eas_role_permission` VALUES (470, 1, 14);
INSERT INTO `eas_role_permission` VALUES (471, 1, 15);
INSERT INTO `eas_role_permission` VALUES (472, 1, 16);
INSERT INTO `eas_role_permission` VALUES (473, 1, 17);
INSERT INTO `eas_role_permission` VALUES (474, 1, 47);
INSERT INTO `eas_role_permission` VALUES (475, 1, 48);
INSERT INTO `eas_role_permission` VALUES (476, 1, 49);
INSERT INTO `eas_role_permission` VALUES (477, 1, 50);
INSERT INTO `eas_role_permission` VALUES (478, 1, 18);
INSERT INTO `eas_role_permission` VALUES (479, 1, 10);
INSERT INTO `eas_role_permission` VALUES (480, 1, 11);
INSERT INTO `eas_role_permission` VALUES (481, 1, 12);
INSERT INTO `eas_role_permission` VALUES (482, 1, 13);
INSERT INTO `eas_role_permission` VALUES (483, 1, 24);
INSERT INTO `eas_role_permission` VALUES (484, 1, 19);
INSERT INTO `eas_role_permission` VALUES (485, 1, 20);
INSERT INTO `eas_role_permission` VALUES (486, 1, 21);
INSERT INTO `eas_role_permission` VALUES (487, 1, 22);
INSERT INTO `eas_role_permission` VALUES (488, 1, 23);
INSERT INTO `eas_role_permission` VALUES (489, 1, 25);
INSERT INTO `eas_role_permission` VALUES (490, 1, 26);
INSERT INTO `eas_role_permission` VALUES (491, 1, 27);
INSERT INTO `eas_role_permission` VALUES (492, 1, 28);
INSERT INTO `eas_role_permission` VALUES (493, 1, 29);
INSERT INTO `eas_role_permission` VALUES (494, 1, 54);
INSERT INTO `eas_role_permission` VALUES (495, 1, 55);
INSERT INTO `eas_role_permission` VALUES (496, 1, 56);
INSERT INTO `eas_role_permission` VALUES (497, 1, 57);
INSERT INTO `eas_role_permission` VALUES (498, 1, 58);
INSERT INTO `eas_role_permission` VALUES (499, 1, 30);
INSERT INTO `eas_role_permission` VALUES (500, 1, 31);
INSERT INTO `eas_role_permission` VALUES (501, 1, 32);
INSERT INTO `eas_role_permission` VALUES (502, 1, 33);
INSERT INTO `eas_role_permission` VALUES (503, 1, 34);
INSERT INTO `eas_role_permission` VALUES (504, 1, 35);
INSERT INTO `eas_role_permission` VALUES (505, 1, 51);
INSERT INTO `eas_role_permission` VALUES (506, 1, 52);
INSERT INTO `eas_role_permission` VALUES (507, 1, 53);

-- ----------------------------
-- Table structure for eas_score
-- ----------------------------
DROP TABLE IF EXISTS `eas_score`;
CREATE TABLE `eas_score`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `score` int(255) NOT NULL DEFAULT 0 COMMENT '考试分数',
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试结果',
  `s_id` int(20) UNSIGNED NOT NULL COMMENT '学生id',
  `c_id` int(20) UNSIGNED NOT NULL COMMENT '课程id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_msg`(`s_id`) USING BTREE,
  INDEX `course_msg`(`c_id`) USING BTREE,
  CONSTRAINT `course_msg` FOREIGN KEY (`c_id`) REFERENCES `eas_course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_msg` FOREIGN KEY (`s_id`) REFERENCES `eas_student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eas_score
-- ----------------------------
INSERT INTO `eas_score` VALUES (9, 60, '通过', 1, 1);
INSERT INTO `eas_score` VALUES (10, 0, '', 2, 1);

-- ----------------------------
-- Table structure for eas_student
-- ----------------------------
DROP TABLE IF EXISTS `eas_student`;
CREATE TABLE `eas_student`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `class_id` int(20) UNSIGNED NULL DEFAULT NULL COMMENT '班级id',
  `motto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座右铭',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `class_msg`(`class_id`) USING BTREE,
  CONSTRAINT `class_msg` FOREIGN KEY (`class_id`) REFERENCES `eas_class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `eas_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eas_student
-- ----------------------------
INSERT INTO `eas_student` VALUES (1, 'zhangsan', '张三', '女', '1999-01-23', '13863469837', 12, '哥只是个传说');
INSERT INTO `eas_student` VALUES (2, 'lisi', '李四', '男', '1998-04-15', '15653454542', 2, '略略略');

-- ----------------------------
-- Table structure for eas_teacher
-- ----------------------------
DROP TABLE IF EXISTS `eas_teacher`;
CREATE TABLE `eas_teacher`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师姓名',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '出生年月',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `motto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座右铭',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_name`(`username`) USING BTREE,
  CONSTRAINT `user_name` FOREIGN KEY (`username`) REFERENCES `eas_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eas_teacher
-- ----------------------------
INSERT INTO `eas_teacher` VALUES (1, 'wangliu', '王六', '男', '1975-01-15', '13563471234', '博士', '我是最棒的！');

-- ----------------------------
-- Table structure for eas_user
-- ----------------------------
DROP TABLE IF EXISTS `eas_user`;
CREATE TABLE `eas_user`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盐值',
  `locked` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否锁定',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eas_user  此处为账号密码，admin 123456
-- ----------------------------
INSERT INTO `eas_user` VALUES (1, 'admin', 'a66abb5684c45962d887564f08346e8d', 'admin', '0');
INSERT INTO `eas_user` VALUES (2, 'zhangsan', 'a66abb5684c45962d887564f08346e8d', 'admin', '0');
INSERT INTO `eas_user` VALUES (3, 'lisi', 'a66abb5684c45962d887564f08346e8d', 'admin', '1');
INSERT INTO `eas_user` VALUES (4, 'wangliu', 'a66abb5684c45962d887564f08346e8d', 'admin', '1');
INSERT INTO `eas_user` VALUES (5, 'zhaoyun', '267047d22dc39b27a1daffbc9f5d884a', 'zhaoyun', '1');
INSERT INTO `eas_user` VALUES (10, 'kechengadmin', 'a66abb5684c45962d887564f08346e8d', 'admin', '1');
INSERT INTO `eas_user` VALUES (13, 'tongzhiadmin', '8954eb34c3a208cf6cfb6dc1e73c050b', 'tongzhiadmin', '1');

-- ----------------------------
-- Table structure for eas_user_role
-- ----------------------------
DROP TABLE IF EXISTS `eas_user_role`;
CREATE TABLE `eas_user_role`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `eas_user_id` int(20) NOT NULL COMMENT '用户id',
  `eas_role_id` int(20) NOT NULL DEFAULT 1000 COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid`(`eas_user_id`) USING BTREE,
  INDEX `roleid`(`eas_role_id`) USING BTREE,
  CONSTRAINT `roleid` FOREIGN KEY (`eas_role_id`) REFERENCES `eas_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userid` FOREIGN KEY (`eas_user_id`) REFERENCES `eas_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eas_user_role
-- ----------------------------
INSERT INTO `eas_user_role` VALUES (1, 2, 2);
INSERT INTO `eas_user_role` VALUES (2, 1, 1);
INSERT INTO `eas_user_role` VALUES (9, 3, 2);
INSERT INTO `eas_user_role` VALUES (11, 4, 3);
INSERT INTO `eas_user_role` VALUES (14, 10, 6);
INSERT INTO `eas_user_role` VALUES (16, 13, 5);

SET FOREIGN_KEY_CHECKS = 1;

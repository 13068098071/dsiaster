/*
 Navicat Premium Data Transfer

 Source Server         : 项目
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : disaster_relief_materials

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 12/05/2022 15:50:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_department
-- ----------------------------
DROP TABLE IF EXISTS `m_department`;
CREATE TABLE `m_department`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系办公电话',
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公室地点',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `status` int(0) NOT NULL COMMENT '状态 0锁定 1有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_department
-- ----------------------------
INSERT INTO `m_department` VALUES (1, '物资管理部', '13659856352', '救灾管理办公室1号楼1单元', '2022-03-27 18:45:24', '2022-03-27 18:45:24', 1);
INSERT INTO `m_department` VALUES (2, '采购部', '15869365487', '救灾管理办公室1号楼2单元', '2022-03-27 15:56:05', '2022-03-27 15:56:05', 1);
INSERT INTO `m_department` VALUES (3, '信息技术部', '13659851475', '救灾管理办公室1号楼3单元', '2022-03-27 15:56:44', '2022-03-27 15:56:44', 1);
INSERT INTO `m_department` VALUES (4, '行政部', '15698565412', '救灾管理办公室1号楼4单元', '2022-03-27 15:57:04', '2022-03-27 15:57:04', 1);
INSERT INTO `m_department` VALUES (23, '123', '123', '123', '2022-03-28 22:01:58', '2022-03-28 22:01:58', 0);
INSERT INTO `m_department` VALUES (24, '物资管理部2', '13659856352', '救灾管理办公室1号楼1单元', '2022-03-27 18:45:24', '2022-03-27 18:45:24', 0);
INSERT INTO `m_department` VALUES (25, '苦苦12312', '13068098071', '1212312321', '2022-03-28 23:23:24', '2022-03-28 23:23:24', 0);
INSERT INTO `m_department` VALUES (26, 'asdsa', '13068090711', 'asdas', '2022-04-01 20:37:16', '2022-04-01 20:37:16', 0);
INSERT INTO `m_department` VALUES (27, '123', '13068526985', '1233', '2022-04-21 09:52:44', '2022-04-21 09:52:44', 1);

-- ----------------------------
-- Table structure for m_dict
-- ----------------------------
DROP TABLE IF EXISTS `m_dict`;
CREATE TABLE `m_dict`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_dict
-- ----------------------------
INSERT INTO `m_dict` VALUES (1, '主页', 'el-icon-house', 'icon');
INSERT INTO `m_dict` VALUES (2, '系统管理', 'el-icon-s-grid', 'icon');
INSERT INTO `m_dict` VALUES (3, '公告管理', 'el-icon-s-comment', 'icon');
INSERT INTO `m_dict` VALUES (4, '物资管理', 'el-icon-s-goods', 'icon');
INSERT INTO `m_dict` VALUES (5, '物资流向', 'el-icon-sort', 'icon');
INSERT INTO `m_dict` VALUES (6, '出库管理', 'el-icon-folder-remove', 'icon');
INSERT INTO `m_dict` VALUES (7, '入库管理', 'el-icon-folder-add', 'icon');
INSERT INTO `m_dict` VALUES (8, '监控中心', 'el-icon-s-platform', 'icon');

-- ----------------------------
-- Table structure for m_file
-- ----------------------------
DROP TABLE IF EXISTS `m_file`;
CREATE TABLE `m_file`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint(0) NULL DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_file
-- ----------------------------
INSERT INTO `m_file` VALUES (23, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (24, '8.jpg', 'jpg', 446, 'http://localhost:8889/file/1d59f808b0fb43ed8f098c61491755f9.jpg', '995a3f1bc8f3029c850ab8c108f75a6a', 1, 1);
INSERT INTO `m_file` VALUES (25, '8.jpg', 'jpg', 446, 'http://localhost:8889/file/1d59f808b0fb43ed8f098c61491755f9.jpg', '995a3f1bc8f3029c850ab8c108f75a6a', 1, 1);
INSERT INTO `m_file` VALUES (26, '8.jpg', 'jpg', 446, 'http://localhost:8889/file/1d59f808b0fb43ed8f098c61491755f9.jpg', '995a3f1bc8f3029c850ab8c108f75a6a', 1, 1);
INSERT INTO `m_file` VALUES (27, '7.jpg', 'jpg', 270, 'http://localhost:8889/file/294fc4fab6ea40f0a6c1fd47d48285d5.jpg', 'e3b6b2cd196bfdc025fd35d8bbcb8107', 1, 1);
INSERT INTO `m_file` VALUES (28, '8.jpg', 'jpg', 446, 'http://localhost:8889/file/1d59f808b0fb43ed8f098c61491755f9.jpg', '995a3f1bc8f3029c850ab8c108f75a6a', 1, 1);
INSERT INTO `m_file` VALUES (29, '2.png', 'png', 34, 'http://localhost:8889/file/abf6aaf27f434065be8022a9c95b7c5e.png', 'ad75c478cd0d2d081011126b69dd2876', 1, 1);
INSERT INTO `m_file` VALUES (30, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (31, '6.jpg', 'jpg', 579, 'http://localhost:8889/file/67132b71c20d494e942dc768bbd36f32.jpg', '34d05815bacc8ae454bf1af579a83690', 1, 1);
INSERT INTO `m_file` VALUES (32, '2.png', 'png', 34, 'http://localhost:8889/file/abf6aaf27f434065be8022a9c95b7c5e.png', 'ad75c478cd0d2d081011126b69dd2876', 1, 1);
INSERT INTO `m_file` VALUES (33, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (34, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (35, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (36, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (37, '2.png', 'png', 34, 'http://localhost:8889/file/abf6aaf27f434065be8022a9c95b7c5e.png', 'ad75c478cd0d2d081011126b69dd2876', 1, 1);
INSERT INTO `m_file` VALUES (38, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (39, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (40, '2.png', 'png', 34, 'http://localhost:8889/file/abf6aaf27f434065be8022a9c95b7c5e.png', 'ad75c478cd0d2d081011126b69dd2876', 1, 1);
INSERT INTO `m_file` VALUES (41, '2.png', 'png', 34, 'http://localhost:8889/file/abf6aaf27f434065be8022a9c95b7c5e.png', 'ad75c478cd0d2d081011126b69dd2876', 1, 1);
INSERT INTO `m_file` VALUES (42, '2.png', 'png', 34, 'http://localhost:8889/file/abf6aaf27f434065be8022a9c95b7c5e.png', 'ad75c478cd0d2d081011126b69dd2876', 1, 0);
INSERT INTO `m_file` VALUES (43, '2.png', 'png', 34, 'http://localhost:8889/file/abf6aaf27f434065be8022a9c95b7c5e.png', 'ad75c478cd0d2d081011126b69dd2876', 1, 0);
INSERT INTO `m_file` VALUES (44, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 0, 1);
INSERT INTO `m_file` VALUES (45, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (46, 'putongkouzao.jpg', 'jpg', 15, 'http://localhost:8889/file/c7a5d37f87824a608320635cc2638a2c.jpg', '36ec3260197302ede1223959f77d0800', 1, 1);
INSERT INTO `m_file` VALUES (47, '温度计.jpg', 'jpg', 19, 'http://localhost:8889/file/e3ab092cc0834b9192bd83bd00c055d2.jpg', '52c2b01e81012b828172a7e1dfcdbb52', 1, 1);
INSERT INTO `m_file` VALUES (48, '生理盐水.jpg', 'jpg', 49, 'http://localhost:8889/file/a254b11c9b024eb0aa70af39d6162ef1.jpg', '0ed4662baec5cd7ffa10117c08aca173', 1, 1);
INSERT INTO `m_file` VALUES (49, '东北大米.png', 'png', 909, 'http://localhost:8889/file/37e6a96695f8439199c2cf070d582495.png', '22624bd3416cf4b8fd2155a2acea8a90', 1, 1);
INSERT INTO `m_file` VALUES (50, '防毒面具.jpg', 'jpg', 17, 'http://localhost:8889/file/8e0d55d354e7417e81e7fd16246db043.jpg', '3f4fc753bb3c9bb18b279f2b07f2ba6c', 1, 1);
INSERT INTO `m_file` VALUES (51, '霸王洗发水.jpg', 'jpg', 56, 'http://localhost:8889/file/799d402aae424c0499c2c431fac08cc6.jpg', '26153b035c290215a122dff7d6ea1a56', 1, 1);
INSERT INTO `m_file` VALUES (52, '卫龙辣条.jpg', 'jpg', 44, 'http://localhost:8889/file/19373d83a53441cfaeffbb9c105c0042.jpg', '5500fb2363f7cbb122e860ac751ff74f', 1, 1);
INSERT INTO `m_file` VALUES (53, '医用酒精.jpg', 'jpg', 54, 'http://localhost:8889/file/7ed68f9571364496becf2dfa181d8d2f.jpg', '5931941cb02538696de82abeab2aaa2a', 1, 1);
INSERT INTO `m_file` VALUES (54, '碘伏.jpg', 'jpg', 16, 'http://localhost:8889/file/a2ca2d0211b84f94a25336fb472f68ec.jpg', '1a17ecb2bc9183b13f210df8d1fd0097', 1, 1);
INSERT INTO `m_file` VALUES (55, '呼吸机.jpg', 'jpg', 40, 'http://localhost:8889/file/1dd28278c3904667a5bf3689f755f56b.jpg', 'fbcfd5c9bc6a7b25861ae3a4af23ca5a', 1, 1);
INSERT INTO `m_file` VALUES (56, '帅气男装.jpg', 'jpg', 9, 'http://localhost:8889/file/08afdabc5fc84c189ebe6250d45b55c2.jpg', '76558011be7d8e7bede0ad97f3a585ad', 1, 1);
INSERT INTO `m_file` VALUES (57, '脑白金.png', 'png', 358, 'http://localhost:8889/file/847e0f026a1146c9a8f780bbe5f9cd0d.png', '51bf1931c8219f798405eff6a05c71f6', 1, 1);
INSERT INTO `m_file` VALUES (58, '金鸡胶囊.jpg', 'jpg', 78, 'http://localhost:8889/file/b2bc6031f1734be387341d2927d67db8.jpg', 'c6ed18fe86db6c3efef70a6ad8da3ebd', 1, 1);
INSERT INTO `m_file` VALUES (59, '感冒康胶囊.jpg', 'jpg', 55, 'http://localhost:8889/file/6d29e1b5df1b4f3387b6db207446b7fb.jpg', '74786847d6017aa0ac93ff36a3c96054', 1, 1);
INSERT INTO `m_file` VALUES (60, '康师傅矿泉水.jpg', 'jpg', 47, 'http://localhost:8889/file/f004ce67975a46eab6afb02eeb3c7d34.jpg', 'd547de4e3e9d17032f2de5124f73e295', 1, 1);
INSERT INTO `m_file` VALUES (61, '小鸟伏特加.jpg', 'jpg', 26, 'http://localhost:8889/file/6052b941cd364d08992e0c3543b5ebb8.jpg', '4fb0beeefdb1ca811b6a578b6154e3d3', 1, 1);
INSERT INTO `m_file` VALUES (62, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (63, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (64, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (65, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (66, 'putongkouzao.jpg', 'jpg', 15, 'http://localhost:8889/file/c7a5d37f87824a608320635cc2638a2c.jpg', '36ec3260197302ede1223959f77d0800', 1, 1);
INSERT INTO `m_file` VALUES (67, '霸王洗发水.jpg', 'jpg', 56, 'http://localhost:8889/file/799d402aae424c0499c2c431fac08cc6.jpg', '26153b035c290215a122dff7d6ea1a56', 1, 1);
INSERT INTO `m_file` VALUES (68, 'putongkouzao.jpg', 'jpg', 15, 'http://localhost:8889/file/c7a5d37f87824a608320635cc2638a2c.jpg', '36ec3260197302ede1223959f77d0800', 1, 1);
INSERT INTO `m_file` VALUES (69, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (70, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (71, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (72, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (73, '呼吸机.jpg', 'jpg', 40, 'http://localhost:8889/file/1dd28278c3904667a5bf3689f755f56b.jpg', 'fbcfd5c9bc6a7b25861ae3a4af23ca5a', 1, 1);
INSERT INTO `m_file` VALUES (74, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (75, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (76, '碘伏.jpg', 'jpg', 16, 'http://localhost:8889/file/a2ca2d0211b84f94a25336fb472f68ec.jpg', '1a17ecb2bc9183b13f210df8d1fd0097', 1, 1);
INSERT INTO `m_file` VALUES (77, 'putongkouzao.jpg', 'jpg', 15, 'http://localhost:8889/file/c7a5d37f87824a608320635cc2638a2c.jpg', '36ec3260197302ede1223959f77d0800', 1, 1);
INSERT INTO `m_file` VALUES (78, '呼吸机.jpg', 'jpg', 40, 'http://localhost:8889/file/1dd28278c3904667a5bf3689f755f56b.jpg', 'fbcfd5c9bc6a7b25861ae3a4af23ca5a', 1, 1);
INSERT INTO `m_file` VALUES (79, '呼吸机.jpg', 'jpg', 40, 'http://localhost:8889/file/1dd28278c3904667a5bf3689f755f56b.jpg', 'fbcfd5c9bc6a7b25861ae3a4af23ca5a', 1, 1);
INSERT INTO `m_file` VALUES (80, '霸王洗发水.jpg', 'jpg', 56, 'http://localhost:8889/file/799d402aae424c0499c2c431fac08cc6.jpg', '26153b035c290215a122dff7d6ea1a56', 1, 1);
INSERT INTO `m_file` VALUES (81, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (82, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (83, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (84, '感冒康胶囊.jpg', 'jpg', 55, 'http://localhost:8889/file/6d29e1b5df1b4f3387b6db207446b7fb.jpg', '74786847d6017aa0ac93ff36a3c96054', 1, 1);
INSERT INTO `m_file` VALUES (85, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (86, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (87, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (88, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (89, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (90, '温度计.jpg', 'jpg', 19, 'http://localhost:8889/file/e3ab092cc0834b9192bd83bd00c055d2.jpg', '52c2b01e81012b828172a7e1dfcdbb52', 1, 1);
INSERT INTO `m_file` VALUES (91, '验证码.png', 'png', 45, 'http://localhost:8889/file/acf15998028b4383a3b3486982a49b5c.png', '1507eccdc2d743d7b801b0e643b5ce2a', 1, 1);
INSERT INTO `m_file` VALUES (92, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (93, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (94, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (95, '霸王洗发水.jpg', 'jpg', 56, 'http://localhost:8889/file/799d402aae424c0499c2c431fac08cc6.jpg', '26153b035c290215a122dff7d6ea1a56', 1, 1);
INSERT INTO `m_file` VALUES (96, '呼吸机.jpg', 'jpg', 40, 'http://localhost:8889/file/1dd28278c3904667a5bf3689f755f56b.jpg', 'fbcfd5c9bc6a7b25861ae3a4af23ca5a', 1, 1);
INSERT INTO `m_file` VALUES (97, '金鸡胶囊.jpg', 'jpg', 78, 'http://localhost:8889/file/b2bc6031f1734be387341d2927d67db8.jpg', 'c6ed18fe86db6c3efef70a6ad8da3ebd', 1, 1);
INSERT INTO `m_file` VALUES (98, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (99, '呼吸机.jpg', 'jpg', 40, 'http://localhost:8889/file/1dd28278c3904667a5bf3689f755f56b.jpg', 'fbcfd5c9bc6a7b25861ae3a4af23ca5a', 1, 1);
INSERT INTO `m_file` VALUES (100, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (101, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (102, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (103, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (104, 'kouzhao.jpg', 'jpg', 345, 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', 'e60b6fcaecf4816e94b59e78fb75d090', 1, 1);
INSERT INTO `m_file` VALUES (105, '毕业设计中期检查表.doc', 'doc', 22, 'http://localhost:8889/file/5d5fcb2bb3234a219ef222addeecbf2a.doc', '62d721bdfede3828dc4c40e6a51c235a', 1, 1);
INSERT INTO `m_file` VALUES (106, '2.png', 'png', 34, 'http://localhost:8889/file/abf6aaf27f434065be8022a9c95b7c5e.png', 'ad75c478cd0d2d081011126b69dd2876', 1, 1);
INSERT INTO `m_file` VALUES (107, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (108, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (109, '8.jpg', 'jpg', 446, 'http://localhost:8889/file/1d59f808b0fb43ed8f098c61491755f9.jpg', '995a3f1bc8f3029c850ab8c108f75a6a', 1, 1);
INSERT INTO `m_file` VALUES (110, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (111, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (112, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (113, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);
INSERT INTO `m_file` VALUES (114, '2.jfif', 'jfif', 29, 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', 'a5b614b5a89b8d6e43be7c4e664873ee', 1, 1);

-- ----------------------------
-- Table structure for m_log
-- ----------------------------
DROP TABLE IF EXISTS `m_log`;
CREATE TABLE `m_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `operation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `time` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时',
  `method` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作方法',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方法参数',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者IP',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2320 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_log
-- ----------------------------
INSERT INTO `m_log` VALUES (2207, '马志超', '多条件分页查询用户信息', 35, 'com.ma.disaster.controller.UserController：getUserByPage', 'paramName:[pageNum, pageSize, username, email, sex, departmentId],args:[1, 10, , , null, null]', '127.0.0.1', '2022-04-06 20:44:12', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2208, '马志超', '分页查询部门信息', 5, 'com.ma.disaster.controller.DepartmentController：getDepartmentByPage', 'paramName:[pageNum, pageSize, name],args:[1, 10, ]', '127.0.0.1', '2022-04-06 20:44:19', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2209, '马志超', '分页查询文件信息', 11, 'com.ma.disaster.controller.FileController：findPage', 'paramName:[pageNum, pageSize, name],args:[1, 10, ]', '127.0.0.1', '2022-04-06 20:44:26', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2210, '马志超', '分页查询物资信息', 20, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-06 20:44:32', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2211, '马志超', '分页查询物资库存信息', 24, 'com.ma.disaster.controller.ProductController：findProductStocks', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 9, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=null)]', '127.0.0.1', '2022-04-06 20:44:37', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2212, '马志超', '查询物资分类信息', 79, 'com.ma.disaster.controller.CategoryController：getParentCategoryTree', 'paramName:[],args:[]', '127.0.0.1', '2022-04-06 20:44:41', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2213, '马志超', '分页查询物资库存信息', 7, 'com.ma.disaster.controller.ProductController：findProductStocks', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 9, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=null)]', '127.0.0.1', '2022-04-06 20:56:27', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2214, '马志超', '分页查询物资信息', 8, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-06 20:56:27', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2215, '马志超', '分页查询物资信息', 6, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-06 20:56:31', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2216, '马志超', '查询物资分类信息', 32, 'com.ma.disaster.controller.CategoryController：getParentCategoryTree', 'paramName:[],args:[]', '127.0.0.1', '2022-04-06 20:56:34', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2217, '马志超', '查询物资分类信息', 42, 'com.ma.disaster.controller.CategoryController：getParentCategoryTree', 'paramName:[],args:[]', '127.0.0.1', '2022-04-06 20:58:01', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2218, '马志超', '查询物资分类信息', 38, 'com.ma.disaster.controller.CategoryController：getParentCategoryTree', 'paramName:[],args:[]', '127.0.0.1', '2022-04-06 20:59:15', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2219, '马志超', '分页查询物资信息', 41, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-07 11:01:46', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2220, '马志超', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-07 11:47:21', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2221, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-07 11:47:21', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2222, '马志超', '分页查询物资信息', 13, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-07 11:47:41', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2223, '马志超', '分页查询物资信息', 158, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-07 12:58:29', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2224, '马志超', '分页查询物资信息', 13, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-07 12:59:26', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2225, '马志超', '分页查询物资信息', 10, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-07 13:07:28', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2226, '马志超', '分页查询物资信息', 9, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-07 13:07:28', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2227, '马志超', '分页查询物资信息', 3, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-07 13:07:28', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2228, '马志超', '分页查询物资信息', 8, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-07 17:00:02', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2229, '马志超', '分页查询物资信息', 11, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-07 17:00:17', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2230, '马志超', '分页查询物资信息', 13, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 16:15:35', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2231, '马志超', '分页查询物资信息', 3, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 17:14:02', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2232, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 17:14:02', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2233, '马志超', '分页查询物资信息', 6, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 17:14:02', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2234, '马志超', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 17:14:02', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2235, '马志超', '分页查询物资信息', 3, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 17:14:02', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2236, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 17:14:02', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2237, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 17:14:02', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2238, '马志超', '分页查询物资信息', 11, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 17:14:23', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2239, '马志超', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 17:14:30', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2240, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 17:14:32', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2241, '马志超', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 18:16:13', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2242, '马志超', '分页查询物资信息', 12, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 19:01:23', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2243, '马志超', '分页查询物资信息', 8, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 20:07:54', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2244, '马志超', '分页查询物资信息', 9, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 20:08:58', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2245, '马志超', '分页查询物资信息', 10, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 20:09:02', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2246, '马志超', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 20:09:17', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2247, '马志超', '分页查询物资信息', 74, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-09 20:32:14', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2248, '马志超', '分页查询物资信息', 25, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-11 15:18:24', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2249, '马志超', '分页查询物资信息', 57, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-11 15:19:15', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2250, '马志超', '分页查询物资信息', 8, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-11 15:21:58', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2251, '马志超', '分页查询物资信息', 6, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-11 15:25:33', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2252, '马志超', '分页查询物资信息', 13, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-11 15:25:40', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2253, '李四1', '分页查询物资信息', 15, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-11 16:17:49', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2254, '李四1', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-11 16:18:10', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2255, '李四1', '分页查询物资信息', 17, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-14 16:15:43', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2256, '李四1', '分页查询物资信息', 9, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-14 16:17:20', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2257, '李四1', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-14 16:17:40', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2258, '李四1', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-14 16:18:14', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2259, '马志超', '分页查询物资信息', 27, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:23:24', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2260, '马志超', '分页查询物资信息', 7, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:23:43', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2261, '马志超', '分页查询物资信息', 6, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[2, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:23:49', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2262, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[3, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:23:50', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2263, '马志超', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:23:51', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2264, '马志超', '分页查询物资信息', 52, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, 20,21,32, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=20, twoCategoryId=21, threeCategoryId=32, status=0)]', '127.0.0.1', '2022-04-15 20:23:59', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2265, '马志超', '分页查询物资信息', 45, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, , ProductVO(id=null, pNum=null, name=口罩, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:24:09', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2266, '马志超', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:25:53', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2267, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:25:54', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2268, '马志超', '分页查询物资信息', 6, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:25:54', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2269, '马志超', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:25:54', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2270, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[2, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:26:07', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2271, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[3, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:26:07', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2272, '马志超', '分页查询物资信息', 3, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:26:08', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2273, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[2, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:26:20', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2274, '马志超', '分页查询物资信息', 3, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[3, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:26:21', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2275, '马志超', '分页查询物资信息', 3, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:26:22', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2276, '马志超', '分页查询物资信息', 3, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[2, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:26:23', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2277, '马志超', '分页查询物资信息', 3, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[3, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:26:23', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2278, '马志超', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:52:45', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2279, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:53:44', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2280, '马志超', '分页查询物资信息', 60, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:55:18', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2281, '马志超', '分页查询物资信息', 8, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 20:57:02', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2282, '马志超', '分页查询物资信息', 9, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 21:07:47', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2283, '马志超', '分页查询物资信息', 174, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=null)]', '127.0.0.1', '2022-04-15 21:30:44', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2284, '马志超', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=null)]', '127.0.0.1', '2022-04-15 21:33:08', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2285, '马志超', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 21:44:10', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2286, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=null)]', '127.0.0.1', '2022-04-15 21:44:20', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2287, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-15 21:44:24', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2288, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=null)]', '127.0.0.1', '2022-04-15 21:44:25', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2289, '马志超', '分页查询物资信息', 17, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-21 09:58:20', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2290, '马志超', '分页查询物资信息', 13, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, 20,21,32, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=20, twoCategoryId=21, threeCategoryId=32, status=0)]', '127.0.0.1', '2022-04-21 09:58:31', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2291, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, 20,21,32, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=20, twoCategoryId=21, threeCategoryId=32, status=1)]', '127.0.0.1', '2022-04-21 09:58:43', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2292, '马志超', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, 20,21,32, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=20, twoCategoryId=21, threeCategoryId=32, status=2)]', '127.0.0.1', '2022-04-21 09:58:45', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2293, '马志超', '分页查询物资信息', 2, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, 20,21,32, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=20, twoCategoryId=21, threeCategoryId=32, status=2)]', '127.0.0.1', '2022-04-21 09:59:08', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2294, '马志超', '分页查询物资信息', 5, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, 20,21,32, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=20, twoCategoryId=21, threeCategoryId=32, status=2)]', '127.0.0.1', '2022-04-21 09:59:11', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2295, '马志超', '分页查询物资信息', 2, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, 20,21,32, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=20, twoCategoryId=21, threeCategoryId=32, status=2)]', '127.0.0.1', '2022-04-21 09:59:12', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2296, '马志超', '分页查询物资信息', 3, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, 20,21,32, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=20, twoCategoryId=21, threeCategoryId=32, status=2)]', '127.0.0.1', '2022-04-21 09:59:12', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2297, '马志超', '分页查询物资信息', 2, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, 20,21,32, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=20, twoCategoryId=21, threeCategoryId=32, status=2)]', '127.0.0.1', '2022-04-21 09:59:12', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2298, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, , ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=2)]', '127.0.0.1', '2022-04-21 09:59:15', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2299, '马志超', '分页查询物资信息', 2, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, , ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=1)]', '127.0.0.1', '2022-04-21 09:59:26', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2300, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, , ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-21 09:59:29', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2301, '马志超', '分页查询物资信息', 3, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[2, 10, , ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-21 09:59:31', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2302, '马志超', '分页查询物资信息', 3, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[2, 10, , ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-21 09:59:34', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2303, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, , ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=1)]', '127.0.0.1', '2022-04-21 09:59:38', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2304, '马志超', '分页查询物资信息', 2, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, , ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=2)]', '127.0.0.1', '2022-04-21 09:59:43', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2305, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=null)]', '127.0.0.1', '2022-04-21 10:01:33', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2306, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=null)]', '127.0.0.1', '2022-04-21 10:01:36', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2307, '马志超', '分页查询物资信息', 2, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=null)]', '127.0.0.1', '2022-04-21 10:02:53', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2308, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-21 10:03:12', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2309, '马志超', '分页查询物资信息', 4, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-21 10:14:10', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2310, '李四1', '分页查询物资信息', 11, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-21 10:15:22', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2311, '李四1', '分页查询物资信息', 11, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, 20,21,32, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=20, twoCategoryId=21, threeCategoryId=32, status=0)]', '127.0.0.1', '2022-04-21 10:20:13', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2312, '李四1', '分页查询物资信息', 2, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 10, 20,23,28, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=20, twoCategoryId=23, threeCategoryId=28, status=0)]', '127.0.0.1', '2022-04-21 10:20:22', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2313, '李四1', '分页查询物资信息', 2, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 5, null, ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-21 10:20:26', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2314, '李四1', '分页查询物资信息', 2, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[2, 5, , ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-21 10:20:31', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2315, '李四1', '分页查询物资信息', 2, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[3, 5, , ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-21 10:20:31', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2316, '李四1', '分页查询物资信息', 2, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[4, 5, , ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-21 10:20:32', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2317, '李四1', '分页查询物资信息', 2, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 5, , ProductVO(id=null, pNum=null, name=, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-21 10:20:35', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2318, '李四1', '分页查询物资信息', 3, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-21 10:20:38', '0|0|0|内网IP|内网IP');
INSERT INTO `m_log` VALUES (2319, '马志超', '分页查询物资信息', 58, 'com.ma.disaster.controller.ProductController：findProductList', 'paramName:[pageNum, pageSize, categorys, productVO],args:[1, 6, null, ProductVO(id=null, pNum=null, name=null, model=null, unit=null, remark=null, sort=null, createTime=null, modifiedTime=null, imageUrl=null, categoryKeys=null, oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=0)]', '127.0.0.1', '2022-04-28 07:50:22', '0|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for m_menu
-- ----------------------------
DROP TABLE IF EXISTS `m_menu`;
CREATE TABLE `m_menu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单描述',
  `pid` int(0) NULL DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `sort_num` int(0) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_menu
-- ----------------------------
INSERT INTO `m_menu` VALUES (1, '主页', '/home', 'el-icon-house', '主页面', NULL, 'Home', 0);
INSERT INTO `m_menu` VALUES (2, '系统管理', '', 'el-icon-s-grid', '系统管理', NULL, NULL, 0);
INSERT INTO `m_menu` VALUES (3, '公告管理', NULL, 'el-icon-s-comment', '公告管理', NULL, NULL, 0);
INSERT INTO `m_menu` VALUES (4, '物资管理', NULL, 'el-icon-s-goods', '物资管理', NULL, NULL, 0);
INSERT INTO `m_menu` VALUES (5, '物资流向', NULL, 'el-icon-sort', '物资流向', NULL, NULL, 0);
INSERT INTO `m_menu` VALUES (6, '出库管理', NULL, 'el-icon-folder-remove', '出库管理', NULL, NULL, 0);
INSERT INTO `m_menu` VALUES (7, '入库管理', '', 'el-icon-folder-add', '入库管理', NULL, NULL, 0);
INSERT INTO `m_menu` VALUES (46, '用户管理', '/user', 'el-icon-s-grid', '用户管理', 2, '/user', 2);
INSERT INTO `m_menu` VALUES (47, '部门管理', '/department', 'el-icon-s-grid', '部门管理', 2, '/department', 1);
INSERT INTO `m_menu` VALUES (48, '角色管理', '/role', 'el-icon-s-grid', '角色管理', 2, '/role', 1);
INSERT INTO `m_menu` VALUES (49, '图标管理', '/icon', 'el-icon-s-grid', '图标管理', 2, '/icon', 1);
INSERT INTO `m_menu` VALUES (50, '菜单管理', '/menu', 'el-icon-s-grid', '菜单管理', 2, '/menu', 1);
INSERT INTO `m_menu` VALUES (51, '文件管理', '/file', 'el-icon-s-grid', '文件管理', 2, '/file', 1);
INSERT INTO `m_menu` VALUES (52, '发布公告', '/addNotice', 'el-icon-s-comment', '发布公告', 3, '/addNotice', 1);
INSERT INTO `m_menu` VALUES (53, '公告列表', '/notice', 'el-icon-s-comment', '公告列表', 3, '/notice', 1);
INSERT INTO `m_menu` VALUES (54, '物资资料', '/product', 'el-icon-s-goods', '物资资料', 4, '/product', 1);
INSERT INTO `m_menu` VALUES (55, '物资库存', '/stocks', 'el-icon-s-goods', '物资库存', 4, '/stocks', 1);
INSERT INTO `m_menu` VALUES (56, '物资分类', '/category', 'el-icon-s-goods', '物资分类', 4, '/category', 1);
INSERT INTO `m_menu` VALUES (57, '物资来源', '/supplier', 'el-icon-sort', '物资来源', 5, '/supplier', 1);
INSERT INTO `m_menu` VALUES (58, '物资去处', '/consumer', 'el-icon-sort', '物资去处', 5, '/consumer', 1);
INSERT INTO `m_menu` VALUES (59, '出库添加', '/outAdd', 'el-icon-folder-remove', '出库添加', 6, '/outAdd', 1);
INSERT INTO `m_menu` VALUES (60, '出库列表', '/outList', 'el-icon-folder-remove', '出库列表', 6, '/outList', 1);
INSERT INTO `m_menu` VALUES (61, '入库添加', '/inAdd', 'el-icon-folder-add', '入库添加', 7, '/inAdd', 1);
INSERT INTO `m_menu` VALUES (62, '入库列表', '/inList', 'el-icon-folder-add', '入库列表', 7, '/inList', 1);
INSERT INTO `m_menu` VALUES (63, '日志管理', '/log', 'el-icon-s-platform', '日志管理', 64, '/log', 1);
INSERT INTO `m_menu` VALUES (64, '监控管理', '', 'el-icon-s-platform', '监控管理', NULL, NULL, 0);

-- ----------------------------
-- Table structure for m_product
-- ----------------------------
DROP TABLE IF EXISTS `m_product`;
CREATE TABLE `m_product`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `p_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `image_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计算单位',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `one_category_id` bigint(0) NULL DEFAULT NULL COMMENT '1级分类',
  `two_category_id` bigint(0) NULL DEFAULT NULL COMMENT '2级分类',
  `three_category_id` bigint(0) NULL DEFAULT NULL COMMENT '3级分类',
  `status` int(0) NULL DEFAULT 0 COMMENT '是否删除:1物资正常,0:物资回收,2:物资审核中',
  INDEX `id`(`id`) USING BTREE,
  INDEX `category_id`(`one_category_id`) USING BTREE,
  INDEX `two_category_id`(`two_category_id`) USING BTREE,
  INDEX `three_category_id`(`three_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_product
-- ----------------------------
INSERT INTO `m_product` VALUES (17, '3DFC8EA0-6', 'N95口罩', 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', '10个/包', '包', '救命的口罩', 1, '2020-03-18 00:00:00', '2020-08-19 17:34:24', 33, 34, 37, 0);
INSERT INTO `m_product` VALUES (18, '6EF5F2C0-9', '普通医用口罩', 'http://localhost:8889/file/c7a5d37f87824a608320635cc2638a2c.jpg', '5个/包', '包', '医用口罩也不错哦', 3, '2020-03-18 00:00:00', '2020-03-18 12:52:49', 20, 23, 25, 0);
INSERT INTO `m_product` VALUES (19, '6976D3B4-A', '普通温度计', 'http://localhost:8889/file/e3ab092cc0834b9192bd83bd00c055d2.jpg', '10只/盒', '盒', '温度计', 2, '2020-03-18 00:00:00', '2020-03-25 11:22:49', 20, 21, 38, 0);
INSERT INTO `m_product` VALUES (20, 'AB0E206E-A', '生理盐水', 'http://localhost:8889/file/a254b11c9b024eb0aa70af39d6162ef1.jpg', '500ml', '瓶', '生理盐水', 3, '2020-03-18 00:00:00', '2020-03-18 12:53:06', 20, 43, 44, 0);
INSERT INTO `m_product` VALUES (23, '6AF405A1-C', '东北大米', 'http://localhost:8889/file/37e6a96695f8439199c2cf070d582495.png', '1斤/袋', '袋', '老鼠爱大米', 4, '2020-03-18 11:55:44', '2020-03-18 11:55:44', 24, 30, 41, 0);
INSERT INTO `m_product` VALUES (25, '2C15F1B6-1', '防毒面具', 'http://localhost:8889/file/8e0d55d354e7417e81e7fd16246db043.jpg', '舒适版', '个', '防毒气的', 1, '2020-03-18 00:00:00', '2020-04-30 19:08:15', 20, 23, 39, 0);
INSERT INTO `m_product` VALUES (28, '894b8218-36ee-4a0d-9ad1-d9c5e455', '霸王洗发水', 'http://localhost:8889/file/799d402aae424c0499c2c431fac08cc6.jpg', '10ml', '瓶', '洗发水挺好的', 7, '2020-03-20 00:00:00', '2020-03-20 09:34:08', 24, 31, 52, 0);
INSERT INTO `m_product` VALUES (29, '0b9e9176-f996-4384-bb6c-209f55d0', '卫龙辣条', 'http://localhost:8889/file/19373d83a53441cfaeffbb9c105c0042.jpg', '大包', '包', '好吃', 4, '2020-03-21 12:14:43', '2020-03-21 12:14:43', 24, 30, 41, 0);
INSERT INTO `m_product` VALUES (30, '24573d5b-0c9b-403b-9a88-c214702e', '医用酒精', 'http://localhost:8889/file/7ed68f9571364496becf2dfa181d8d2f.jpg', '100ml/75%', '瓶', '100ml/75%', 3, '2020-03-22 03:21:38', '2020-03-22 03:21:38', 20, 43, 57, 0);
INSERT INTO `m_product` VALUES (31, 'c98183c8-bc47-4505-abbb-1dc219b5', '碘伏', 'http://localhost:8889/file/a2ca2d0211b84f94a25336fb472f68ec.jpg', '500ml', '瓶', '碘伏', 3, '2020-03-22 03:36:15', '2020-03-22 03:36:15', 20, 43, 57, 0);
INSERT INTO `m_product` VALUES (32, 'f248ee7a-c30c-447c-ae9c-0a1c09e9', '呼吸机', 'http://localhost:8889/file/1dd28278c3904667a5bf3689f755f56b.jpg', '100伏特', '台', 'test', 2, '2020-03-22 00:00:00', '2020-04-14 13:21:00', 20, 21, 32, 0);
INSERT INTO `m_product` VALUES (34, 'beb944c4-01ae-497b-bfdd-2132032f', '帅气男装', 'http://localhost:8889/file/08afdabc5fc84c189ebe6250d45b55c2.jpg', '175cm', '件', '帅气男装', 2, '2020-03-25 11:04:41', '2020-03-25 11:04:41', 24, 27, 40, 0);
INSERT INTO `m_product` VALUES (37, 'cf5a5f37-b299-4d96-bcb2-c4a46737', '脑白金', 'http://localhost:8889/file/847e0f026a1146c9a8f780bbe5f9cd0d.png', '600ml', '包', '脑白金', 2, '2020-03-25 11:16:42', '2020-03-25 11:16:42', 20, 43, 44, 0);
INSERT INTO `m_product` VALUES (38, '3fa0d5c1-4922-4078-8c7c-8d1cfeb5', '金鸡胶囊', 'http://localhost:8889/file/b2bc6031f1734be387341d2927d67db8.jpg', '10个/包', '包', '金鸡胶囊', 2, '2020-03-25 11:17:38', '2020-03-25 11:17:38', 20, 43, 53, 0);
INSERT INTO `m_product` VALUES (39, 'de16b9e6-bb49-4547-ab91-db7ae7b6', '感冒康胶囊', 'http://localhost:8889/file/6d29e1b5df1b4f3387b6db207446b7fb.jpg', '10片/包', '包', '感冒康胶囊', 3, '2020-03-25 11:18:31', '2020-03-25 11:18:31', 20, 43, 53, 0);
INSERT INTO `m_product` VALUES (40, '0e17f606-9aaa-48a7-b4e9-ef18462e', '康师傅矿泉水', 'http://localhost:8889/file/f004ce67975a46eab6afb02eeb3c7d34.jpg', '10瓶/箱', '箱', '矿泉水', 2, '2020-03-25 00:00:00', '2020-04-28 17:18:03', 24, 30, 62, 0);
INSERT INTO `m_product` VALUES (46, '15bc064e-991d-40e3-bcd6-f6aff0e3', '小鸟伏特加', 'http://localhost:8889/file/6052b941cd364d08992e0c3543b5ebb8.jpg', '500ml', '瓶', 'ZBC', 1, '2020-05-10 10:37:53', '2020-05-10 10:37:53', 20, 43, 44, 0);
INSERT INTO `m_product` VALUES (53, 'b5d8c5d9-3963-4cb2-8a83-80d55002', '1231', 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', '123', '123', '123', 1, '2022-04-05 16:30:47', '2022-04-05 16:36:53', 20, 21, 32, 1);
INSERT INTO `m_product` VALUES (54, 'e4138b6c-47de-43c9-b29d-97b82768', '12321', 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', '12312', '12312', '12312', 1, '2022-04-21 09:59:08', '2022-04-21 09:59:08', 20, 23, 28, 2);

-- ----------------------------
-- Table structure for m_role
-- ----------------------------
DROP TABLE IF EXISTS `m_role`;
CREATE TABLE `m_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述',
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_role
-- ----------------------------
INSERT INTO `m_role` VALUES (1, '管理员', '管理员具有全局功能', 'ROLE_ADMIN');
INSERT INTO `m_role` VALUES (2, '普通用户', '具有查看入库功能', 'ROLE_PERSON');

-- ----------------------------
-- Table structure for m_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `m_role_menu`;
CREATE TABLE `m_role_menu`  (
  `role_id` int(0) NOT NULL COMMENT '角色id',
  `menu_id` int(0) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_role_menu
-- ----------------------------
INSERT INTO `m_role_menu` VALUES (1, 1);
INSERT INTO `m_role_menu` VALUES (1, 2);
INSERT INTO `m_role_menu` VALUES (1, 3);
INSERT INTO `m_role_menu` VALUES (1, 4);
INSERT INTO `m_role_menu` VALUES (1, 5);
INSERT INTO `m_role_menu` VALUES (1, 6);
INSERT INTO `m_role_menu` VALUES (1, 7);
INSERT INTO `m_role_menu` VALUES (1, 46);
INSERT INTO `m_role_menu` VALUES (1, 47);
INSERT INTO `m_role_menu` VALUES (1, 48);
INSERT INTO `m_role_menu` VALUES (1, 49);
INSERT INTO `m_role_menu` VALUES (1, 50);
INSERT INTO `m_role_menu` VALUES (1, 51);
INSERT INTO `m_role_menu` VALUES (1, 52);
INSERT INTO `m_role_menu` VALUES (1, 53);
INSERT INTO `m_role_menu` VALUES (1, 54);
INSERT INTO `m_role_menu` VALUES (1, 55);
INSERT INTO `m_role_menu` VALUES (1, 56);
INSERT INTO `m_role_menu` VALUES (1, 57);
INSERT INTO `m_role_menu` VALUES (1, 58);
INSERT INTO `m_role_menu` VALUES (1, 59);
INSERT INTO `m_role_menu` VALUES (1, 60);
INSERT INTO `m_role_menu` VALUES (1, 61);
INSERT INTO `m_role_menu` VALUES (1, 62);
INSERT INTO `m_role_menu` VALUES (1, 63);
INSERT INTO `m_role_menu` VALUES (1, 64);
INSERT INTO `m_role_menu` VALUES (2, 1);
INSERT INTO `m_role_menu` VALUES (2, 2);
INSERT INTO `m_role_menu` VALUES (2, 3);
INSERT INTO `m_role_menu` VALUES (2, 4);
INSERT INTO `m_role_menu` VALUES (2, 5);
INSERT INTO `m_role_menu` VALUES (2, 7);
INSERT INTO `m_role_menu` VALUES (2, 46);
INSERT INTO `m_role_menu` VALUES (2, 47);
INSERT INTO `m_role_menu` VALUES (2, 49);
INSERT INTO `m_role_menu` VALUES (2, 51);
INSERT INTO `m_role_menu` VALUES (2, 53);
INSERT INTO `m_role_menu` VALUES (2, 54);
INSERT INTO `m_role_menu` VALUES (2, 55);
INSERT INTO `m_role_menu` VALUES (2, 56);
INSERT INTO `m_role_menu` VALUES (2, 57);
INSERT INTO `m_role_menu` VALUES (2, 61);
INSERT INTO `m_role_menu` VALUES (2, 62);

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `status` int(0) NOT NULL DEFAULT 1 COMMENT '状态 0删除 1有效 ',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `sex` int(0) NULL DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `type` int(0) NOT NULL DEFAULT 1 COMMENT '0:超级管理员，1：系统用户',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `birth` date NULL DEFAULT NULL,
  `department_id` bigint(0) NULL DEFAULT 1 COMMENT '部门id',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 208 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_user
-- ----------------------------
INSERT INTO `m_user` VALUES (1, '马志超', '马志超', '1756146332@qq.com', 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', '13068098072', 1, '2022-03-24 16:32:08', '2022-03-24 16:32:12', 0, 1, '123456', '2022-03-17', 1, 'ROLE_ADMIN');
INSERT INTO `m_user` VALUES (2, '李四1', '李四1', '1622656+', 'https://hexo-ma.oss-cn-beijing.aliyuncs.com/img/壁纸/7b641a0f33b9fa57ae97c4dfea070e25--2888376614.jpg', '465456465', 1, '2022-03-27 19:46:58', '2022-03-27 19:46:58', 1, 2, '12345', '2022-03-16', 2, 'ROLE_PERSON');
INSERT INTO `m_user` VALUES (200, '我的家', NULL, NULL, 'https://hexo-ma.oss-cn-beijing.aliyuncs.com/img/壁纸/7b641a0f33b9fa57ae97c4dfea070e25--2888376614.jpg', NULL, 0, '2022-04-02 11:20:34', '2022-04-02 11:20:34', NULL, 2, '123456', NULL, 1, 'ROLE_PERSON');
INSERT INTO `m_user` VALUES (202, '123', '123', '123', 'http://localhost:8889/file/abf6aaf27f434065be8022a9c95b7c5e.png', '123', 1, '2022-04-03 15:01:39', '2022-04-03 15:01:39', NULL, 2, '123', '2022-04-17', 1, 'ROLE_PERSON');
INSERT INTO `m_user` VALUES (203, '123', '123', '123', 'http://localhost:8889/file/f3e5aa8049d24d79967a5098efe9f984.jpg', '123', 1, '2022-04-05 11:25:27', '2022-04-05 11:25:27', NULL, 2, '123', '2022-04-11', 1, 'ROLE_PERSON');
INSERT INTO `m_user` VALUES (204, '123', '123', '123', 'http://localhost:8889/file/c7a5d37f87824a608320635cc2638a2c.jpg', '123', 0, '2022-04-05 11:27:04', '2022-04-05 11:27:04', NULL, 2, '123', '2022-04-26', 1, 'ROLE_PERSON');
INSERT INTO `m_user` VALUES (205, '123', '123', '123', NULL, '113', 0, '2022-04-05 11:29:55', '2022-04-05 11:29:55', NULL, 2, '123', '2022-04-24', 1, 'ROLE_PERSON');
INSERT INTO `m_user` VALUES (206, '123', '123', '123', 'http://localhost:8889/file/1d59f808b0fb43ed8f098c61491755f9.jpg', '123', 0, '2022-04-11 14:38:16', '2022-04-11 14:38:16', NULL, 1, '123', '2022-04-18', 1, 'ROLE_PERSON');
INSERT INTO `m_user` VALUES (207, '123', '123', '123@qq.com', 'http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif', '13068098523', 1, '2022-04-21 09:48:14', '2022-04-21 09:48:14', NULL, 1, '123', '2022-04-26', 1, 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for p_category
-- ----------------------------
DROP TABLE IF EXISTS `p_category`;
CREATE TABLE `p_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0锁定 1有效',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  `pid` bigint(0) NULL DEFAULT NULL COMMENT '父级分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_category
-- ----------------------------
INSERT INTO `p_category` VALUES (20, '医疗物资', '11111122', 1, 2, '2020-03-17 00:00:00', '2020-03-22 23:00:38', 0);
INSERT INTO `p_category` VALUES (21, '仪器', '仪器', 1, 1, '2020-03-17 00:00:00', '2020-08-19 17:37:27', 20);
INSERT INTO `p_category` VALUES (23, '防护品', '防护品', 1, 2, '2020-03-17 11:33:48', '2020-03-17 11:33:48', 20);
INSERT INTO `p_category` VALUES (24, '生活用品', '生活用品', 1, 3, '2020-03-17 00:00:00', '2020-03-22 23:00:43', 0);
INSERT INTO `p_category` VALUES (27, '衣服用品', '衣服用品', 1, 2, '2020-03-17 11:38:50', '2020-03-17 11:38:50', 24);
INSERT INTO `p_category` VALUES (28, '防护服', '防护服', 1, 3, '2020-03-17 11:44:38', '2020-03-17 11:44:38', 23);
INSERT INTO `p_category` VALUES (30, '粮油类', '粮油类', 1, 2, '2020-03-17 11:51:29', '2020-03-17 11:51:29', 24);
INSERT INTO `p_category` VALUES (31, '洗化用品', '洗化用品', 1, 3, '2020-03-17 11:51:50', '2020-03-17 11:51:50', 24);
INSERT INTO `p_category` VALUES (32, '呼吸机', '呼吸机', 1, 1, '2020-03-17 00:00:00', '2020-03-17 13:43:01', 21);
INSERT INTO `p_category` VALUES (33, '交通运输', '交通运输。。。2323。', 1, 1, '2020-03-17 00:00:00', '2020-12-17 19:46:33', 0);
INSERT INTO `p_category` VALUES (34, '车辆', '小车车', 1, 2, '2020-03-17 11:56:51', '2020-03-17 11:56:51', 33);
INSERT INTO `p_category` VALUES (37, '运输车', '运输车', 1, 1, '2020-03-17 00:00:00', '2020-03-23 10:46:10', 34);
INSERT INTO `p_category` VALUES (38, '温度器', '温度器', 1, 1, '2020-03-18 01:43:52', '2020-03-18 01:43:52', 21);
INSERT INTO `p_category` VALUES (39, '防毒面具', '防毒面具', 1, 5, '2020-03-18 01:44:27', '2020-03-18 01:44:27', 23);
INSERT INTO `p_category` VALUES (40, '衣服', '衣服', 1, 1, '2020-03-18 01:50:33', '2020-03-18 01:50:33', 27);
INSERT INTO `p_category` VALUES (41, '大米', '大米', 1, 2, '2020-03-18 01:50:49', '2020-03-18 01:50:49', 30);
INSERT INTO `p_category` VALUES (43, '药品', '药品', 1, 2, '2020-03-18 01:57:42', '2020-03-18 01:57:42', 20);
INSERT INTO `p_category` VALUES (44, '输液', '输液', 1, 2, '2020-03-18 01:58:31', '2020-03-18 01:58:31', 43);
INSERT INTO `p_category` VALUES (45, '消毒液', '消毒液', 1, 2, '2020-03-18 01:59:03', '2020-03-18 01:59:03', 43);
INSERT INTO `p_category` VALUES (46, '血压仪', '血压仪', 1, 2, '2020-03-18 01:59:30', '2020-03-18 01:59:30', 21);
INSERT INTO `p_category` VALUES (50, 'test', 'test', 1, 1, '2020-03-19 01:05:24', '2020-03-19 01:05:24', 49);
INSERT INTO `p_category` VALUES (51, 'test3', 'test3', 1, 3, '2020-03-19 01:05:45', '2020-03-19 01:05:45', 50);
INSERT INTO `p_category` VALUES (52, '洗发水', '洗发的', 1, 1, '2020-03-20 08:15:45', '2020-03-20 08:15:45', 31);
INSERT INTO `p_category` VALUES (53, '解热镇痛药', '解热镇痛药', 1, 1, '2020-03-21 03:37:18', '2020-03-21 03:37:18', 43);
INSERT INTO `p_category` VALUES (54, '外用及器具', '外用及器具', 1, 1, '2020-03-21 03:38:13', '2020-03-21 03:38:13', 20);
INSERT INTO `p_category` VALUES (55, '导尿管', '导尿管', 1, 2, '2020-03-21 03:38:30', '2020-03-21 03:38:30', 54);
INSERT INTO `p_category` VALUES (56, '三角巾急救包', '三角巾急救包', 1, 2, '2020-03-21 03:38:51', '2020-03-21 03:38:51', 54);
INSERT INTO `p_category` VALUES (57, '消毒药品类', '消毒药品类', 1, 2, '2020-03-21 03:40:09', '2020-03-21 03:40:09', 43);
INSERT INTO `p_category` VALUES (58, '外科手术服', '外科手术服', 1, 2, '2020-03-21 03:41:20', '2020-03-21 03:41:20', 23);
INSERT INTO `p_category` VALUES (62, '食用油', '实用油', 1, 2, '2020-03-25 11:13:39', '2020-03-25 11:13:39', 30);

-- ----------------------------
-- Table structure for p_consumer
-- ----------------------------
DROP TABLE IF EXISTS `p_consumer`;
CREATE TABLE `p_consumer`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物资消费方',
  `address` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `sort` int(0) NULL DEFAULT NULL,
  `contact` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_consumer
-- ----------------------------
INSERT INTO `p_consumer` VALUES (7, '324234234', '天津市/市辖区/和平区', '2020-04-25 20:12:06', '2020-05-10 09:21:37', '15079437282', 1, '老王');
INSERT INTO `p_consumer` VALUES (8, '435353451', '江西省/九江市/共青城市', '2020-04-25 20:12:43', '2022-04-09 18:51:09', '15079437282', 2, '11');
INSERT INTO `p_consumer` VALUES (9, '3424243424', '山西省/大同市/矿区', '2020-04-25 20:13:20', '2020-05-10 09:21:33', '15079437282', 1, '小李');
INSERT INTO `p_consumer` VALUES (11, '3424', '江西省/抚州市/黎川县', '2020-04-25 20:28:26', '2020-05-10 09:21:47', '15079437282', 1, '44');
INSERT INTO `p_consumer` VALUES (13, '32424', '天津市/市辖区/和平区', '2020-04-25 21:38:42', '2020-04-25 21:38:42', '15079437282', 2, '22');
INSERT INTO `p_consumer` VALUES (14, '34242', '江西省/抚州市/黎川县', '2020-04-25 21:38:59', '2020-04-25 21:38:59', '15079437282', 3, '444');
INSERT INTO `p_consumer` VALUES (15, '5他', '河北省/石家庄市/长安区', '2020-04-25 21:39:25', '2020-04-25 21:39:25', '15079437282', 2, '555');
INSERT INTO `p_consumer` VALUES (16, '3243242', '山东省/青岛市/历下区', '2020-04-25 21:40:43', '2020-04-25 21:40:43', '15079437282', 1, '555');
INSERT INTO `p_consumer` VALUES (17, '一栋705宿舍', '江西省/九江市/共青城市', '2020-04-25 21:56:04', '2020-04-25 21:56:04', '15079437282', 3, '章宇康');
INSERT INTO `p_consumer` VALUES (18, '反反复复', '内蒙古自治区/赤峰市/阿鲁科尔沁旗', '2020-04-25 22:05:47', '2020-04-25 22:05:47', '15079437282', 2, '反反复复');
INSERT INTO `p_consumer` VALUES (19, 'test224444', '江西省/九江市/共青城市', '2020-04-26 09:47:37', '2020-04-26 09:47:50', '15079437282', 3, 'test');
INSERT INTO `p_consumer` VALUES (20, '324234', '天津市/市辖区/和平区', '2020-05-25 11:00:23', '2020-05-25 11:00:23', '15079437282', 1, '32424');
INSERT INTO `p_consumer` VALUES (21, 'test111', '福建省/莆田市/秀屿区', '2020-05-25 11:01:18', '2020-05-25 11:01:55', '15079437282', 2, 'testman');
INSERT INTO `p_consumer` VALUES (22, '6666666', '天津市/市辖区/和平区', '2020-05-25 11:16:12', '2020-05-25 11:16:12', '15079437282', 1, '23423424');
INSERT INTO `p_consumer` VALUES (23, '6666666', '天津市/市辖区/和平区', '2020-05-25 11:17:15', '2020-05-25 11:17:15', '15079437282', 1, '23423424');
INSERT INTO `p_consumer` VALUES (24, 'hemei', '河北省/唐山市/古冶区', '2020-05-25 11:27:42', '2020-05-25 11:27:42', '15079437282', 1, 'hemei');
INSERT INTO `p_consumer` VALUES (25, 'hemei', '河北省/唐山市/古冶区', '2020-05-25 11:32:39', '2020-05-25 11:32:39', '15079437282', 1, 'hemei');
INSERT INTO `p_consumer` VALUES (26, '武汉汉口校医院', '天津市/市辖区/和平区', '2020-05-25 15:46:07', '2020-05-25 15:46:07', '15079437282', 1, '李大牛');
INSERT INTO `p_consumer` VALUES (27, 'ma', '北京市/市辖区/东城区', '2022-04-15 21:33:38', '2022-04-15 21:33:38', '13068526985', 1, '马志超');
INSERT INTO `p_consumer` VALUES (28, '123', '北京市/市辖区/东城区', '2022-04-21 10:02:23', '2022-04-21 10:02:23', '13068098071', 1, '123');

-- ----------------------------
-- Table structure for p_in_stock
-- ----------------------------
DROP TABLE IF EXISTS `p_in_stock`;
CREATE TABLE `p_in_stock`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `in_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库单编号',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型：1：捐赠，2：下拨，3：采购,4:退货入库',
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '入库单创建时间',
  `modified` datetime(0) NULL DEFAULT NULL COMMENT '入库单修改时间',
  `product_number` int(0) NULL DEFAULT NULL COMMENT '物资总数',
  `supplier_id` bigint(0) NULL DEFAULT NULL COMMENT '来源',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述信息',
  `status` int(0) NULL DEFAULT 2 COMMENT '0:正常入库单,1:已进入回收,2:等待审核',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operator_id`(`operator`) USING BTREE,
  INDEX `supplier_id`(`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_in_stock
-- ----------------------------
INSERT INTO `p_in_stock` VALUES (84, 'a2ea9b97-ad12-4d85-a9b4-1a644d86', 2, 'zhangyukang', '2020-05-09 20:01:48', '2022-04-15 11:22:42', 13, 23, '333333', 0);
INSERT INTO `p_in_stock` VALUES (85, '78473f1a-405a-4f5e-b08c-42a7b2e8', 2, 'zhangyukang', '2020-05-10 09:27:45', '2020-05-10 09:27:45', 48, 23, '324324242424', 0);
INSERT INTO `p_in_stock` VALUES (86, '31ff3701-c44f-4b98-91e0-1d41d8b2', 1, 'zhangyukang', '2020-05-11 09:59:30', '2020-05-11 09:59:30', 51, 23, '32424', 0);
INSERT INTO `p_in_stock` VALUES (87, '38ed0881-20ed-4cec-a321-eb8f4c3b', 1, 'zhangyukang', '2020-05-11 10:04:05', '2022-04-15 11:21:25', 30, 23, '232323232', 0);
INSERT INTO `p_in_stock` VALUES (90, 'db1c2afe-8117-43fd-adf7-866ef7e4', 1, '系统测试人员', '2020-05-18 10:11:11', '2020-05-16 17:37:12', 4, 23, '2222222', 0);
INSERT INTO `p_in_stock` VALUES (91, 'df793f2b-ea13-4d93-b22c-60454f32', 2, '系统测试人员', '2020-05-18 10:11:09', '2020-05-18 10:11:00', 25, 23, '2342424', 0);
INSERT INTO `p_in_stock` VALUES (92, 'c2054c39-a88b-4f47-9f9e-5c57f9e6', 1, '系统测试人员', '2020-05-18 10:42:04', '2020-05-18 10:41:55', 3, 23, '222222', 0);
INSERT INTO `p_in_stock` VALUES (93, '08a51486-49e9-402e-a10e-3e6a45df', 1, '系统测试人员', '2020-05-18 11:01:16', '2020-05-18 11:01:09', 4, 23, '2222222', 0);
INSERT INTO `p_in_stock` VALUES (99, 'bb5de246-bd56-4987-b027-8fbcf3c3', 2, '系统测试人员', '2020-05-18 12:21:41', '2020-05-18 11:43:49', 6, 23, '33333', 0);
INSERT INTO `p_in_stock` VALUES (100, '7657f747-ab27-49d7-b1ce-d6d47ecf', 1, '系统测试人员', '2020-05-18 12:21:40', '2020-05-18 12:21:29', 2, 23, '23432424', 1);
INSERT INTO `p_in_stock` VALUES (101, '03fbc3b3-e28b-418c-a457-87c376c3', 1, '系统测试人员', '2020-05-18 13:16:38', '2020-05-18 13:16:28', 12, 23, '454545454545', 0);
INSERT INTO `p_in_stock` VALUES (102, 'd83621b8-b5c7-4499-a8a0-56af2849', 1, '系统测试人员', '2020-05-18 13:18:51', '2020-05-18 13:18:41', 18, 23, '33333', 0);
INSERT INTO `p_in_stock` VALUES (105, '5ad278ed-ce30-4f0d-bb67-7f9070fc', 1, 'zhangyukang', '2020-05-25 11:45:10', '2020-05-25 10:27:06', 6, 23, '32432424', 0);
INSERT INTO `p_in_stock` VALUES (106, 'efeef1d2-b8c9-4eb5-8ea2-b0695fb9', 1, 'zhangyukang', '2020-05-26 09:35:23', '2020-05-26 09:35:17', 10, 23, '2342424', 0);
INSERT INTO `p_in_stock` VALUES (107, '4d7d332469eb4f2987cbc38fea2b', 1, 'admin', '2020-12-17 19:27:30', '2020-12-17 19:26:39', 1, 23, '2313123', 0);
INSERT INTO `p_in_stock` VALUES (108, '69edf117b8dd478abc37d33bca41', 2, 'admin', '2020-12-17 19:30:44', '2020-12-17 19:28:52', 6, 23, '231313', 0);
INSERT INTO `p_in_stock` VALUES (109, '5e69ad91b41a439b8b4a809e84b4', 4, 'admin', '2020-12-17 19:30:42', '2020-12-17 19:30:28', 9, 23, '232323', 0);
INSERT INTO `p_in_stock` VALUES (110, '532f9951e1d54f4f98263002bea6', 1, 'admin', '2022-04-07 21:00:57', '2020-12-17 21:00:50', 2, 23, '33333', 0);
INSERT INTO `p_in_stock` VALUES (126, '005fdc04f5034c93a6f3468981d5', 1, '马志超', '2022-04-15 20:56:00', '2022-04-15 20:56:52', 8, 24, '12231', 0);
INSERT INTO `p_in_stock` VALUES (127, 'b676f771680848ed9edddadbb34b', 1, '马志超', '2022-04-21 10:04:01', '2022-04-21 10:04:06', 10, 26, '12312', 0);
INSERT INTO `p_in_stock` VALUES (128, '67d14291c46345e99f8af18d0a33', 1, '李四1', '2022-04-21 10:21:19', '2022-04-21 10:22:34', 10, 27, '10011', 0);

-- ----------------------------
-- Table structure for p_in_stock_info
-- ----------------------------
DROP TABLE IF EXISTS `p_in_stock_info`;
CREATE TABLE `p_in_stock_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `in_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库单编号',
  `p_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `product_number` int(0) NULL DEFAULT NULL COMMENT '数量',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 378 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_in_stock_info
-- ----------------------------
INSERT INTO `p_in_stock_info` VALUES (282, 'a2ea9b97-ad12-4d85-a9b4-1a644d86', '3DFC8EA0-6', 2, '2020-05-09 20:01:49', '2020-05-09 20:01:49');
INSERT INTO `p_in_stock_info` VALUES (283, 'a2ea9b97-ad12-4d85-a9b4-1a644d86', '2C15F1B6-1', 2, '2020-05-09 20:01:49', '2020-05-09 20:01:49');
INSERT INTO `p_in_stock_info` VALUES (284, 'a2ea9b97-ad12-4d85-a9b4-1a644d86', '6976D3B4-A', 3, '2020-05-09 20:01:49', '2020-05-09 20:01:49');
INSERT INTO `p_in_stock_info` VALUES (285, 'a2ea9b97-ad12-4d85-a9b4-1a644d86', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 3, '2020-05-09 20:01:49', '2020-05-09 20:01:49');
INSERT INTO `p_in_stock_info` VALUES (286, 'a2ea9b97-ad12-4d85-a9b4-1a644d86', 'beb944c4-01ae-497b-bfdd-2132032f', 3, '2020-05-09 20:01:49', '2020-05-09 20:01:49');
INSERT INTO `p_in_stock_info` VALUES (287, '78473f1a-405a-4f5e-b08c-42a7b2e8', '3DFC8EA0-6', 2, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `p_in_stock_info` VALUES (288, '78473f1a-405a-4f5e-b08c-42a7b2e8', '2C15F1B6-1', 1, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `p_in_stock_info` VALUES (289, '78473f1a-405a-4f5e-b08c-42a7b2e8', '6976D3B4-A', 2, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `p_in_stock_info` VALUES (290, '78473f1a-405a-4f5e-b08c-42a7b2e8', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 2, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `p_in_stock_info` VALUES (291, '78473f1a-405a-4f5e-b08c-42a7b2e8', 'beb944c4-01ae-497b-bfdd-2132032f', 3, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `p_in_stock_info` VALUES (292, '78473f1a-405a-4f5e-b08c-42a7b2e8', '24573d5b-0c9b-403b-9a88-c214702e', 3, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `p_in_stock_info` VALUES (293, '78473f1a-405a-4f5e-b08c-42a7b2e8', 'c98183c8-bc47-4505-abbb-1dc219b5', 2, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `p_in_stock_info` VALUES (294, '78473f1a-405a-4f5e-b08c-42a7b2e8', 'de16b9e6-bb49-4547-ab91-db7ae7b6', 3, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `p_in_stock_info` VALUES (295, '78473f1a-405a-4f5e-b08c-42a7b2e8', '6AF405A1-C', 10, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `p_in_stock_info` VALUES (296, '78473f1a-405a-4f5e-b08c-42a7b2e8', '0b9e9176-f996-4384-bb6c-209f55d0', 10, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `p_in_stock_info` VALUES (297, '78473f1a-405a-4f5e-b08c-42a7b2e8', '894b8218-36ee-4a0d-9ad1-d9c5e455', 10, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `p_in_stock_info` VALUES (298, '31ff3701-c44f-4b98-91e0-1d41d8b2', '3DFC8EA0-6', 10, '2020-05-11 09:59:31', '2020-05-11 09:59:31');
INSERT INTO `p_in_stock_info` VALUES (299, '31ff3701-c44f-4b98-91e0-1d41d8b2', '2C15F1B6-1', 10, '2020-05-11 09:59:32', '2020-05-11 09:59:32');
INSERT INTO `p_in_stock_info` VALUES (300, '31ff3701-c44f-4b98-91e0-1d41d8b2', '15bc064e-991d-40e3-bcd6-f6aff0e3', 10, '2020-05-11 09:59:32', '2020-05-11 09:59:32');
INSERT INTO `p_in_stock_info` VALUES (301, '31ff3701-c44f-4b98-91e0-1d41d8b2', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 10, '2020-05-11 09:59:32', '2020-05-11 09:59:32');
INSERT INTO `p_in_stock_info` VALUES (302, '31ff3701-c44f-4b98-91e0-1d41d8b2', 'beb944c4-01ae-497b-bfdd-2132032f', 10, '2020-05-11 09:59:32', '2020-05-11 09:59:32');
INSERT INTO `p_in_stock_info` VALUES (303, '31ff3701-c44f-4b98-91e0-1d41d8b2', '0e17f606-9aaa-48a7-b4e9-ef18462e', 1, '2020-05-11 09:59:32', '2020-05-11 09:59:32');
INSERT INTO `p_in_stock_info` VALUES (304, '38ed0881-20ed-4cec-a321-eb8f4c3b', '3DFC8EA0-6', 10, '2020-05-11 10:04:05', '2020-05-11 10:04:05');
INSERT INTO `p_in_stock_info` VALUES (305, '38ed0881-20ed-4cec-a321-eb8f4c3b', '24573d5b-0c9b-403b-9a88-c214702e', 10, '2020-05-11 10:04:06', '2020-05-11 10:04:06');
INSERT INTO `p_in_stock_info` VALUES (306, '38ed0881-20ed-4cec-a321-eb8f4c3b', '6EF5F2C0-9', 10, '2020-05-11 10:04:06', '2020-05-11 10:04:06');
INSERT INTO `p_in_stock_info` VALUES (315, 'db1c2afe-8117-43fd-adf7-866ef7e4', '3DFC8EA0-6', 2, '2020-05-16 17:37:12', '2020-05-16 17:37:12');
INSERT INTO `p_in_stock_info` VALUES (316, 'db1c2afe-8117-43fd-adf7-866ef7e4', '2C15F1B6-1', 2, '2020-05-16 17:37:13', '2020-05-16 17:37:13');
INSERT INTO `p_in_stock_info` VALUES (317, 'df793f2b-ea13-4d93-b22c-60454f32', '3DFC8EA0-6', 3, '2020-05-18 10:11:00', '2020-05-18 10:11:00');
INSERT INTO `p_in_stock_info` VALUES (318, 'df793f2b-ea13-4d93-b22c-60454f32', '2C15F1B6-1', 3, '2020-05-18 10:11:00', '2020-05-18 10:11:00');
INSERT INTO `p_in_stock_info` VALUES (319, 'df793f2b-ea13-4d93-b22c-60454f32', '15bc064e-991d-40e3-bcd6-f6aff0e3', 3, '2020-05-18 10:11:00', '2020-05-18 10:11:00');
INSERT INTO `p_in_stock_info` VALUES (320, 'df793f2b-ea13-4d93-b22c-60454f32', '6976D3B4-A', 3, '2020-05-18 10:11:00', '2020-05-18 10:11:00');
INSERT INTO `p_in_stock_info` VALUES (321, 'df793f2b-ea13-4d93-b22c-60454f32', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 10, '2020-05-18 10:11:00', '2020-05-18 10:11:00');
INSERT INTO `p_in_stock_info` VALUES (322, 'df793f2b-ea13-4d93-b22c-60454f32', 'beb944c4-01ae-497b-bfdd-2132032f', 3, '2020-05-18 10:11:00', '2020-05-18 10:11:00');
INSERT INTO `p_in_stock_info` VALUES (323, 'c2054c39-a88b-4f47-9f9e-5c57f9e6', '3DFC8EA0-6', 3, '2020-05-18 10:41:55', '2020-05-18 10:41:55');
INSERT INTO `p_in_stock_info` VALUES (324, '08a51486-49e9-402e-a10e-3e6a45df', '3DFC8EA0-6', 2, '2020-05-18 11:01:09', '2020-05-18 11:01:09');
INSERT INTO `p_in_stock_info` VALUES (325, '08a51486-49e9-402e-a10e-3e6a45df', '2C15F1B6-1', 2, '2020-05-18 11:01:09', '2020-05-18 11:01:09');
INSERT INTO `p_in_stock_info` VALUES (335, 'bb5de246-bd56-4987-b027-8fbcf3c3', '2C15F1B6-1', 3, '2020-05-18 11:43:50', '2020-05-18 11:43:50');
INSERT INTO `p_in_stock_info` VALUES (336, 'bb5de246-bd56-4987-b027-8fbcf3c3', '15bc064e-991d-40e3-bcd6-f6aff0e3', 3, '2020-05-18 11:43:50', '2020-05-18 11:43:50');
INSERT INTO `p_in_stock_info` VALUES (337, '7657f747-ab27-49d7-b1ce-d6d47ecf', '3DFC8EA0-6', 1, '2020-05-18 12:21:29', '2020-05-18 12:21:29');
INSERT INTO `p_in_stock_info` VALUES (338, '7657f747-ab27-49d7-b1ce-d6d47ecf', '2C15F1B6-1', 1, '2020-05-18 12:21:29', '2020-05-18 12:21:29');
INSERT INTO `p_in_stock_info` VALUES (339, '03fbc3b3-e28b-418c-a457-87c376c3', '3DFC8EA0-6', 4, '2020-05-18 13:16:28', '2020-05-18 13:16:28');
INSERT INTO `p_in_stock_info` VALUES (340, '03fbc3b3-e28b-418c-a457-87c376c3', '2C15F1B6-1', 4, '2020-05-18 13:16:28', '2020-05-18 13:16:28');
INSERT INTO `p_in_stock_info` VALUES (341, '03fbc3b3-e28b-418c-a457-87c376c3', '15bc064e-991d-40e3-bcd6-f6aff0e3', 4, '2020-05-18 13:16:28', '2020-05-18 13:16:28');
INSERT INTO `p_in_stock_info` VALUES (342, 'd83621b8-b5c7-4499-a8a0-56af2849', '3DFC8EA0-6', 3, '2020-05-18 13:18:41', '2020-05-18 13:18:41');
INSERT INTO `p_in_stock_info` VALUES (343, 'd83621b8-b5c7-4499-a8a0-56af2849', '2C15F1B6-1', 3, '2020-05-18 13:18:42', '2020-05-18 13:18:42');
INSERT INTO `p_in_stock_info` VALUES (344, 'd83621b8-b5c7-4499-a8a0-56af2849', '15bc064e-991d-40e3-bcd6-f6aff0e3', 3, '2020-05-18 13:18:42', '2020-05-18 13:18:42');
INSERT INTO `p_in_stock_info` VALUES (345, 'd83621b8-b5c7-4499-a8a0-56af2849', '6976D3B4-A', 3, '2020-05-18 13:18:42', '2020-05-18 13:18:42');
INSERT INTO `p_in_stock_info` VALUES (346, 'd83621b8-b5c7-4499-a8a0-56af2849', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 3, '2020-05-18 13:18:42', '2020-05-18 13:18:42');
INSERT INTO `p_in_stock_info` VALUES (347, 'd83621b8-b5c7-4499-a8a0-56af2849', 'beb944c4-01ae-497b-bfdd-2132032f', 3, '2020-05-18 13:18:42', '2020-05-18 13:18:42');
INSERT INTO `p_in_stock_info` VALUES (348, '51fa7a04-535f-43b5-8972-23d0e55a', '3DFC8EA0-6', 2, '2020-05-18 13:42:29', '2020-05-18 13:42:29');
INSERT INTO `p_in_stock_info` VALUES (349, '51fa7a04-535f-43b5-8972-23d0e55a', '2C15F1B6-1', 2, '2020-05-18 13:42:29', '2020-05-18 13:42:29');
INSERT INTO `p_in_stock_info` VALUES (350, '51fa7a04-535f-43b5-8972-23d0e55a', '15bc064e-991d-40e3-bcd6-f6aff0e3', 2, '2020-05-18 13:42:29', '2020-05-18 13:42:29');
INSERT INTO `p_in_stock_info` VALUES (351, 'c96eaa3e-22ee-4f6b-98bd-87d34372', '3DFC8EA0-6', 3, '2020-05-24 21:46:06', '2020-05-24 21:46:06');
INSERT INTO `p_in_stock_info` VALUES (352, 'c96eaa3e-22ee-4f6b-98bd-87d34372', '2C15F1B6-1', 3, '2020-05-24 21:46:06', '2020-05-24 21:46:06');
INSERT INTO `p_in_stock_info` VALUES (353, '5ad278ed-ce30-4f0d-bb67-7f9070fc', '3DFC8EA0-6', 1, '2020-05-25 10:27:07', '2020-05-25 10:27:07');
INSERT INTO `p_in_stock_info` VALUES (354, '5ad278ed-ce30-4f0d-bb67-7f9070fc', '2C15F1B6-1', 1, '2020-05-25 10:27:07', '2020-05-25 10:27:07');
INSERT INTO `p_in_stock_info` VALUES (355, '5ad278ed-ce30-4f0d-bb67-7f9070fc', '15bc064e-991d-40e3-bcd6-f6aff0e3', 1, '2020-05-25 10:27:07', '2020-05-25 10:27:07');
INSERT INTO `p_in_stock_info` VALUES (356, '5ad278ed-ce30-4f0d-bb67-7f9070fc', '6976D3B4-A', 1, '2020-05-25 10:27:07', '2020-05-25 10:27:07');
INSERT INTO `p_in_stock_info` VALUES (357, '5ad278ed-ce30-4f0d-bb67-7f9070fc', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 1, '2020-05-25 10:27:07', '2020-05-25 10:27:07');
INSERT INTO `p_in_stock_info` VALUES (358, '5ad278ed-ce30-4f0d-bb67-7f9070fc', 'beb944c4-01ae-497b-bfdd-2132032f', 1, '2020-05-25 10:27:07', '2020-05-25 10:27:07');
INSERT INTO `p_in_stock_info` VALUES (359, 'efeef1d2-b8c9-4eb5-8ea2-b0695fb9', '6EF5F2C0-9', 10, '2020-05-26 09:35:17', '2020-05-26 09:35:17');
INSERT INTO `p_in_stock_info` VALUES (360, '4d7d332469eb4f2987cbc38fea2b', '3DFC8EA0-6', 1, '2020-12-17 19:26:39', '2020-12-17 19:26:39');
INSERT INTO `p_in_stock_info` VALUES (361, '69edf117b8dd478abc37d33bca41', '3DFC8EA0-6', 1, '2020-12-17 19:28:52', '2020-12-17 19:28:52');
INSERT INTO `p_in_stock_info` VALUES (362, '69edf117b8dd478abc37d33bca41', '2C15F1B6-1', 1, '2020-12-17 19:28:52', '2020-12-17 19:28:52');
INSERT INTO `p_in_stock_info` VALUES (363, '69edf117b8dd478abc37d33bca41', '15bc064e-991d-40e3-bcd6-f6aff0e3', 1, '2020-12-17 19:28:52', '2020-12-17 19:28:52');
INSERT INTO `p_in_stock_info` VALUES (364, '69edf117b8dd478abc37d33bca41', '6976D3B4-A', 1, '2020-12-17 19:28:52', '2020-12-17 19:28:52');
INSERT INTO `p_in_stock_info` VALUES (365, '69edf117b8dd478abc37d33bca41', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 1, '2020-12-17 19:28:52', '2020-12-17 19:28:52');
INSERT INTO `p_in_stock_info` VALUES (366, '69edf117b8dd478abc37d33bca41', 'beb944c4-01ae-497b-bfdd-2132032f', 1, '2020-12-17 19:28:52', '2020-12-17 19:28:52');
INSERT INTO `p_in_stock_info` VALUES (367, '5e69ad91b41a439b8b4a809e84b4', '3DFC8EA0-6', 1, '2020-12-17 19:30:28', '2020-12-17 19:30:28');
INSERT INTO `p_in_stock_info` VALUES (368, '5e69ad91b41a439b8b4a809e84b4', '2C15F1B6-1', 1, '2020-12-17 19:30:28', '2020-12-17 19:30:28');
INSERT INTO `p_in_stock_info` VALUES (369, '5e69ad91b41a439b8b4a809e84b4', '15bc064e-991d-40e3-bcd6-f6aff0e3', 1, '2020-12-17 19:30:28', '2020-12-17 19:30:28');
INSERT INTO `p_in_stock_info` VALUES (370, '5e69ad91b41a439b8b4a809e84b4', '6976D3B4-A', 2, '2020-12-17 19:30:28', '2020-12-17 19:30:28');
INSERT INTO `p_in_stock_info` VALUES (371, '5e69ad91b41a439b8b4a809e84b4', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 2, '2020-12-17 19:30:28', '2020-12-17 19:30:28');
INSERT INTO `p_in_stock_info` VALUES (372, '5e69ad91b41a439b8b4a809e84b4', 'beb944c4-01ae-497b-bfdd-2132032f', 2, '2020-12-17 19:30:28', '2020-12-17 19:30:28');
INSERT INTO `p_in_stock_info` VALUES (373, '532f9951e1d54f4f98263002bea6', '2C15F1B6-1', 1, '2020-12-17 21:00:50', '2020-12-17 21:00:50');
INSERT INTO `p_in_stock_info` VALUES (374, '532f9951e1d54f4f98263002bea6', '15bc064e-991d-40e3-bcd6-f6aff0e3', 1, '2020-12-17 21:00:50', '2020-12-17 21:00:50');
INSERT INTO `p_in_stock_info` VALUES (375, '005fdc04f5034c93a6f3468981d5', '3DFC8EA0-6', 8, '2022-04-15 20:56:00', '2022-04-15 20:56:00');
INSERT INTO `p_in_stock_info` VALUES (376, 'b676f771680848ed9edddadbb34b', '3DFC8EA0-6', 10, '2022-04-21 10:04:01', '2022-04-21 10:04:01');
INSERT INTO `p_in_stock_info` VALUES (377, '67d14291c46345e99f8af18d0a33', '3DFC8EA0-6', 10, '2022-04-21 10:21:19', '2022-04-21 10:21:19');

-- ----------------------------
-- Table structure for p_notice
-- ----------------------------
DROP TABLE IF EXISTS `p_notice`;
CREATE TABLE `p_notice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告摘要',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告内容',
  `sorted` int(0) NULL DEFAULT NULL COMMENT '公告权重',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '公告状态：1存在，0删除',
  `start_time` date NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` date NULL DEFAULT NULL COMMENT '截止时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_notice
-- ----------------------------
INSERT INTO `p_notice` VALUES (14, '123', '123', '123213', 1, 1, NULL, NULL, '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (15, '123', '123', '### 12321', 1, 1, '2022-04-04', '2022-04-07', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (16, '123', '123', '### 12321', 1, 1, '2022-04-04', '2022-04-07', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (17, '123', '123', '### 12321', 1, 1, '2022-04-04', '2022-04-07', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (18, '123', '123', '### 12321', 1, 1, '2022-04-04', '2022-04-07', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (19, '马志超1', '我的名字', '我的名字我的家', 2, 1, '2022-04-06', '2022-04-13', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (20, '马志超123', '我的家', '撒大声地撒\n## 123123\n![2.jfif](http://localhost:8889/file/58d5c05461ba4c58a92d70ff280a2ba6.jfif)', 1, 1, '2022-04-06', '2022-05-01', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (21, '123', '123', '23', 1, 1, '2022-04-06', '2022-04-14', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (22, '123', '12312', '23', 1, 1, '2022-04-12', '2022-04-13', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (23, '123', '12312', '23', 1, 1, '2022-04-12', '2022-04-13', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (24, '123', '1231', '23', 1, 1, '2022-05-01', '2022-05-16', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (25, '123', '123', '123123', 1, 1, '2022-05-02', '2022-05-09', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (26, '123', '123', '12312', 1, 1, '2022-04-01', '2022-04-08', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (27, '123', '213', '123', 1, 1, '2022-04-01', '2022-04-08', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (28, '123', '123', '1231', 1, 1, '2022-04-08', '2022-04-15', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (29, '123', '1231', '123', 1, 1, '2022-04-08', '2022-04-15', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (30, '123', '123123', '12321', 1, 1, '2022-04-01', '2022-04-08', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (31, '123', '123', '#### 四12312级标题', 1, 1, '2022-03-31', '2022-04-13', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (32, '123', '123', '1232', 1, 1, '2022-04-01', '2022-04-15', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (33, '123', '123', '12321', 1, 1, '2022-04-08', '2022-04-15', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (34, '123', '12312', '3123', 1, 0, '2022-04-05', '2022-04-12', '2022-04-09 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `p_notice` VALUES (35, '12312', '123123', '12312321**12321312**\n@@卫栖梧\n# 1231231', 1, 1, '2022-04-05', '2022-04-22', '2022-04-21 00:00:00', '2022-04-21 00:00:00');

-- ----------------------------
-- Table structure for p_out_stock
-- ----------------------------
DROP TABLE IF EXISTS `p_out_stock`;
CREATE TABLE `p_out_stock`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `out_num` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '出库单',
  `type` int(0) NOT NULL COMMENT '出库类型:0:直接出库,1:审核出库',
  `operator` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '出库时间',
  `product_number` int(0) NULL DEFAULT NULL COMMENT '出库总数',
  `consumer_id` bigint(0) NOT NULL COMMENT '消费者id',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态:0:正常入库,1:已进入回收,2:等待审核',
  `priority` int(0) NOT NULL COMMENT '紧急程度:1:不急,2:常规,3:紧急4:特急',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_out_stock
-- ----------------------------
INSERT INTO `p_out_stock` VALUES (2, '11fdsafsafasf', 0, '324', '2020-05-10 15:16:03', 3, 8, '3', 1, 4);
INSERT INTO `p_out_stock` VALUES (4, '8d468e4b-0c45-4807-9e0e-6c2c65d6', 0, 'zhangyukang', '2022-04-15 11:35:13', 7, 25, '2342424', 0, 1);
INSERT INTO `p_out_stock` VALUES (5, '2d7158d3-2b15-473e-8cbe-6f6bd45a', 0, 'zhangyukang', '2022-04-15 11:42:27', 10, 24, '4545454545', 0, 4);
INSERT INTO `p_out_stock` VALUES (6, 'bd5032d0-c84a-4413-a72d-ba80d33f', 0, 'zhangyukang', '2022-04-15 11:37:56', 93, 9, '23424234324', 2, 1);
INSERT INTO `p_out_stock` VALUES (7, 'c23e95d0-0607-4e00-9041-cc97d299', 0, 'zhangyukang', '2020-05-25 15:46:07', 6, 26, 'testtest', 0, 2);
INSERT INTO `p_out_stock` VALUES (9, '982e449e-1ab0-4456-8e9a-5403a685', 0, 'zhangyukang', '2020-05-26 09:32:43', 30, 9, '3434343', 0, 1);
INSERT INTO `p_out_stock` VALUES (10, '622e8b6d-924a-4dfe-bc51-2143cf3c', 0, 'zhangyukang', '2020-05-26 09:34:30', 13, 8, '23232323', 0, 1);
INSERT INTO `p_out_stock` VALUES (11, '55e4942f-3c0a-4bc2-85f7-2f2a7bff', 0, 'zhangyukang', '2020-12-15 18:12:44', 2, 9, '34243424', 0, 3);
INSERT INTO `p_out_stock` VALUES (12, '453544fd-53ec-430f-9899-73f2edf5', 0, 'zhangyukang', '2020-05-26 10:00:04', 4, 8, '11111111', 0, 1);
INSERT INTO `p_out_stock` VALUES (13, '4d7e5874-7d9c-4fca-ac08-ee4f4975', 3, 'zhangyukang', '2020-05-26 10:02:11', 3, 8, '123213', 0, 1);
INSERT INTO `p_out_stock` VALUES (14, '4fd659439b27492cb414533b7854', 0, '马志超', '2022-04-15 21:34:03', 2, 27, '21312312', 0, 1);
INSERT INTO `p_out_stock` VALUES (15, '32022d4a42e140a1805eb75835fa', 0, '马志超', '2022-04-21 10:03:00', 10, 28, '12312', 0, 1);

-- ----------------------------
-- Table structure for p_out_stock_info
-- ----------------------------
DROP TABLE IF EXISTS `p_out_stock_info`;
CREATE TABLE `p_out_stock_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `out_num` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `p_num` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `product_number` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_out_stock_info
-- ----------------------------
INSERT INTO `p_out_stock_info` VALUES (1, '8d468e4b-0c45-4807-9e0e-6c2c65d6', '3DFC8EA0-6', 1, '2020-05-25 11:32:39', '2020-05-25 11:32:39');
INSERT INTO `p_out_stock_info` VALUES (2, '8d468e4b-0c45-4807-9e0e-6c2c65d6', '6EF5F2C0-9', 2, '2020-05-25 11:32:39', '2020-05-25 11:32:39');
INSERT INTO `p_out_stock_info` VALUES (3, '8d468e4b-0c45-4807-9e0e-6c2c65d6', '6976D3B4-A', 4, '2020-05-25 11:32:39', '2020-05-25 11:32:39');
INSERT INTO `p_out_stock_info` VALUES (4, '2d7158d3-2b15-473e-8cbe-6f6bd45a', '3DFC8EA0-6', 1, '2020-05-25 11:41:02', '2020-05-25 11:41:02');
INSERT INTO `p_out_stock_info` VALUES (5, '2d7158d3-2b15-473e-8cbe-6f6bd45a', '6EF5F2C0-9', 1, '2020-05-25 11:41:02', '2020-05-25 11:41:02');
INSERT INTO `p_out_stock_info` VALUES (6, '2d7158d3-2b15-473e-8cbe-6f6bd45a', '6976D3B4-A', 1, '2020-05-25 11:41:02', '2020-05-25 11:41:02');
INSERT INTO `p_out_stock_info` VALUES (7, '2d7158d3-2b15-473e-8cbe-6f6bd45a', 'AB0E206E-A', 3, '2020-05-25 11:41:02', '2020-05-25 11:41:02');
INSERT INTO `p_out_stock_info` VALUES (8, '2d7158d3-2b15-473e-8cbe-6f6bd45a', '6AF405A1-C', 1, '2020-05-25 11:41:02', '2020-05-25 11:41:02');
INSERT INTO `p_out_stock_info` VALUES (9, '2d7158d3-2b15-473e-8cbe-6f6bd45a', '2C15F1B6-1', 3, '2020-05-25 11:41:02', '2020-05-25 11:41:02');
INSERT INTO `p_out_stock_info` VALUES (10, 'bd5032d0-c84a-4413-a72d-ba80d33f', '3DFC8EA0-6', 80, '2020-05-25 12:08:07', '2020-05-25 12:08:07');
INSERT INTO `p_out_stock_info` VALUES (11, 'bd5032d0-c84a-4413-a72d-ba80d33f', '6EF5F2C0-9', 13, '2020-05-25 12:08:07', '2020-05-25 12:08:07');
INSERT INTO `p_out_stock_info` VALUES (12, 'c23e95d0-0607-4e00-9041-cc97d299', '3DFC8EA0-6', 1, '2020-05-25 15:46:07', '2020-05-25 15:46:07');
INSERT INTO `p_out_stock_info` VALUES (13, 'c23e95d0-0607-4e00-9041-cc97d299', '6EF5F2C0-9', 1, '2020-05-25 15:46:07', '2020-05-25 15:46:07');
INSERT INTO `p_out_stock_info` VALUES (14, 'c23e95d0-0607-4e00-9041-cc97d299', '6976D3B4-A', 1, '2020-05-25 15:46:07', '2020-05-25 15:46:07');
INSERT INTO `p_out_stock_info` VALUES (15, 'c23e95d0-0607-4e00-9041-cc97d299', 'AB0E206E-A', 1, '2020-05-25 15:46:07', '2020-05-25 15:46:07');
INSERT INTO `p_out_stock_info` VALUES (16, 'c23e95d0-0607-4e00-9041-cc97d299', '6AF405A1-C', 1, '2020-05-25 15:46:07', '2020-05-25 15:46:07');
INSERT INTO `p_out_stock_info` VALUES (17, 'c23e95d0-0607-4e00-9041-cc97d299', '2C15F1B6-1', 1, '2020-05-25 15:46:07', '2020-05-25 15:46:07');
INSERT INTO `p_out_stock_info` VALUES (21, '982e449e-1ab0-4456-8e9a-5403a685', '3DFC8EA0-6', 30, '2020-05-26 09:32:25', '2020-05-26 09:32:25');
INSERT INTO `p_out_stock_info` VALUES (22, '622e8b6d-924a-4dfe-bc51-2143cf3c', '6EF5F2C0-9', 13, '2020-05-26 09:34:23', '2020-05-26 09:34:23');
INSERT INTO `p_out_stock_info` VALUES (23, '55e4942f-3c0a-4bc2-85f7-2f2a7bff', '3DFC8EA0-6', 1, '2020-05-26 09:52:09', '2020-05-26 09:52:09');
INSERT INTO `p_out_stock_info` VALUES (24, '55e4942f-3c0a-4bc2-85f7-2f2a7bff', '6EF5F2C0-9', 1, '2020-05-26 09:52:09', '2020-05-26 09:52:09');
INSERT INTO `p_out_stock_info` VALUES (25, '453544fd-53ec-430f-9899-73f2edf5', '6AF405A1-C', 1, '2020-05-26 09:59:57', '2020-05-26 09:59:57');
INSERT INTO `p_out_stock_info` VALUES (26, '453544fd-53ec-430f-9899-73f2edf5', '2C15F1B6-1', 1, '2020-05-26 09:59:57', '2020-05-26 09:59:57');
INSERT INTO `p_out_stock_info` VALUES (27, '453544fd-53ec-430f-9899-73f2edf5', '6976D3B4-A', 1, '2020-05-26 09:59:57', '2020-05-26 09:59:57');
INSERT INTO `p_out_stock_info` VALUES (28, '453544fd-53ec-430f-9899-73f2edf5', '6EF5F2C0-9', 1, '2020-05-26 09:59:57', '2020-05-26 09:59:57');
INSERT INTO `p_out_stock_info` VALUES (29, '4d7e5874-7d9c-4fca-ac08-ee4f4975', '3DFC8EA0-6', 1, '2020-05-26 10:02:01', '2020-05-26 10:02:01');
INSERT INTO `p_out_stock_info` VALUES (30, '4d7e5874-7d9c-4fca-ac08-ee4f4975', '6EF5F2C0-9', 1, '2020-05-26 10:02:03', '2020-05-26 10:02:03');
INSERT INTO `p_out_stock_info` VALUES (31, '4d7e5874-7d9c-4fca-ac08-ee4f4975', '6976D3B4-A', 1, '2020-05-26 10:02:03', '2020-05-26 10:02:03');
INSERT INTO `p_out_stock_info` VALUES (32, '4fd659439b27492cb414533b7854', '3DFC8EA0-6', 2, '2022-04-15 21:33:38', '2022-04-15 21:33:38');
INSERT INTO `p_out_stock_info` VALUES (33, '32022d4a42e140a1805eb75835fa', '3DFC8EA0-6', 10, '2022-04-21 10:02:23', '2022-04-21 10:02:23');

-- ----------------------------
-- Table structure for p_stock
-- ----------------------------
DROP TABLE IF EXISTS `p_stock`;
CREATE TABLE `p_stock`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `p_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stock` bigint(0) NULL DEFAULT NULL COMMENT '商品库存结余',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_stock
-- ----------------------------
INSERT INTO `p_stock` VALUES (43, '3DFC8EA0-6', 30);
INSERT INTO `p_stock` VALUES (44, '2C15F1B6-1', 131);
INSERT INTO `p_stock` VALUES (45, '6976D3B4-A', 103);
INSERT INTO `p_stock` VALUES (46, '967CE098-3', 4);
INSERT INTO `p_stock` VALUES (47, '79f01380-43c7-4506-9e0c-e2640288', 5);
INSERT INTO `p_stock` VALUES (48, 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 120);
INSERT INTO `p_stock` VALUES (49, '6AF405A1-C', 17);
INSERT INTO `p_stock` VALUES (50, '0b9e9176-f996-4384-bb6c-209f55d0', 16);
INSERT INTO `p_stock` VALUES (51, '894b8218-36ee-4a0d-9ad1-d9c5e455', 14);
INSERT INTO `p_stock` VALUES (52, 'beb944c4-01ae-497b-bfdd-2132032f', 102);
INSERT INTO `p_stock` VALUES (53, 'cf5a5f37-b299-4d96-bcb2-c4a46737', 5);
INSERT INTO `p_stock` VALUES (54, '3fa0d5c1-4922-4078-8c7c-8d1cfeb5', 2);
INSERT INTO `p_stock` VALUES (55, '0e17f606-9aaa-48a7-b4e9-ef18462e', 2);
INSERT INTO `p_stock` VALUES (56, 'd9155553-fe5c-4d35-bb9a-1e1ab8d4', 2);
INSERT INTO `p_stock` VALUES (57, '6EF5F2C0-9', 35);
INSERT INTO `p_stock` VALUES (58, 'AB0E206E-A', 3);
INSERT INTO `p_stock` VALUES (59, '24573d5b-0c9b-403b-9a88-c214702e', 91);
INSERT INTO `p_stock` VALUES (60, 'c98183c8-bc47-4505-abbb-1dc219b5', 7);
INSERT INTO `p_stock` VALUES (61, 'de16b9e6-bb49-4547-ab91-db7ae7b6', 9);
INSERT INTO `p_stock` VALUES (62, '15bc064e-991d-40e3-bcd6-f6aff0e3', 31);

-- ----------------------------
-- Table structure for p_supplier
-- ----------------------------
DROP TABLE IF EXISTS `p_supplier`;
CREATE TABLE `p_supplier`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商地址',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商邮箱',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商电话',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_supplier
-- ----------------------------
INSERT INTO `p_supplier` VALUES (23, '我的家', '北京市/市辖区/东城区', '1475682256@qq.com', '13068529852', '2022-04-07 16:16:32', '2022-04-07 16:16:32', 1, '马志超');
INSERT INTO `p_supplier` VALUES (24, '123123', '北京市/市辖区/东城区', '112312@qq.com', '13068099805', '2022-04-15 20:56:00', '2022-04-15 20:56:00', 1, '马志超');
INSERT INTO `p_supplier` VALUES (25, '12312', '北京市/市辖区/东城区', '1232@qq.com', '13069852369', '2022-04-21 10:01:14', '2022-04-21 10:01:14', 1, '12312');
INSERT INTO `p_supplier` VALUES (26, '123', '北京市/市辖区/东城区', '123@qq.com', '13068052631', '2022-04-21 10:04:01', '2022-04-21 10:04:01', 2, '123');
INSERT INTO `p_supplier` VALUES (27, '100', '北京市/市辖区/东城区', '100@qq.com', '13026598563', '2022-04-21 10:21:19', '2022-04-21 10:21:19', 1, '100');

SET FOREIGN_KEY_CHECKS = 1;

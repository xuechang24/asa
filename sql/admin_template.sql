/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.31.185
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : localhost:3306
 Source Schema         : admin_template

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 19/04/2025 09:34:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for back_user
-- ----------------------------
DROP TABLE IF EXISTS `back_user`;
CREATE TABLE `back_user`  (
  `id` bigint NOT NULL COMMENT '用户 ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delete_flag` tinyint NULL DEFAULT NULL COMMENT '逻辑删除标志，0 表示未删除， 1 表示删除',
  `version` tinyint NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of back_user
-- ----------------------------
INSERT INTO `back_user` VALUES (1909678895066636289, 'zhangsan', '11111111111', '224728', '2025-04-09 02:45:03', '2025-04-09 18:53:45', 0, 1);
INSERT INTO `back_user` VALUES (1909698559586910209, 'xuechang24', '13192019566', '224728', '2025-04-09 04:03:12', '2025-04-09 04:03:12', 0, 1);

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `storage_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `delete_flag` tinyint NULL DEFAULT NULL COMMENT '逻辑删除标志，0 表示未删除， 1 表示删除',
  `version` tinyint NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES (53, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f8yMKAUvOjAAEXJp4ztPo491.jpg', '2025-04-14 16:35:14', '2025-04-14 16:35:14', 0, 1);
INSERT INTO `files` VALUES (54, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f8yPOAM2TcAAB8KEOF8VU430.jpg', '2025-04-14 16:36:04', '2025-04-14 16:36:04', 1, 1);
INSERT INTO `files` VALUES (55, 'sunflowers1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f8yP6AKUm8AAKXaJzmEhg298.jpg', '2025-04-14 16:36:14', '2025-04-14 16:36:14', 0, 1);
INSERT INTO `files` VALUES (56, 'tulips1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f8yQOAJkVHAAXe4A5w_IE262.jpg', '2025-04-14 16:36:19', '2025-04-14 16:36:19', 1, 1);
INSERT INTO `files` VALUES (57, 'df54eaa0b48e23cfa2d3cab046962a21.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f8zJCATtb2AAX8IYURBIE286.jpg', '2025-04-14 16:51:29', '2025-04-14 16:51:29', 0, 1);
INSERT INTO `files` VALUES (58, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f81EiAJp1KAAB8KEOF8VU779.jpg', '2025-04-14 17:24:25', '2025-04-14 17:24:25', 0, 1);
INSERT INTO `files` VALUES (59, 'sunflowers1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f81ICAYqBpAAKXaJzmEhg676.jpg', '2025-04-14 17:25:20', '2025-04-14 17:25:20', 0, 1);
INSERT INTO `files` VALUES (60, 'tulips1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f81JuAXuRGAAXe4A5w_IE231.jpg', '2025-04-14 17:25:47', '2025-04-14 17:25:47', 0, 1);
INSERT INTO `files` VALUES (61, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f81LuADfTtAAB8KEOF8VU418.jpg', '2025-04-14 17:26:19', '2025-04-14 17:26:19', 1, 1);
INSERT INTO `files` VALUES (62, 'df54eaa0b48e23cfa2d3cab046962a21.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f81ciAQ3DiAAX8IYURBIE835.jpg', '2025-04-14 17:30:49', '2025-04-14 17:30:49', 0, 1);
INSERT INTO `files` VALUES (63, 'sunflowers1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f90ueAb6TQAAKXaJzmEhg515.jpg', '2025-04-15 11:30:47', '2025-04-15 11:30:47', 0, 1);
INSERT INTO `files` VALUES (64, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f90xKAEowRAAB8KEOF8VU866.jpg', '2025-04-15 11:31:30', '2025-04-15 11:31:30', 0, 1);
INSERT INTO `files` VALUES (65, 'tulips1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f90zKAdlc2AAXe4A5w_IE741.jpg', '2025-04-15 11:32:01', '2025-04-15 11:32:01', 0, 1);
INSERT INTO `files` VALUES (66, 'sunflowers1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f91CWANOM8AAKXaJzmEhg102.jpg', '2025-04-15 11:36:04', '2025-04-15 11:36:04', 0, 1);
INSERT INTO `files` VALUES (67, 'sunflowers1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f91ICAV4tkAAKXaJzmEhg767.jpg', '2025-04-15 11:37:35', '2025-04-15 11:37:35', 0, 1);
INSERT INTO `files` VALUES (68, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f91M-AGhziAAEXJp4ztPo171.jpg', '2025-04-15 11:38:55', '2025-04-15 11:38:55', 0, 1);
INSERT INTO `files` VALUES (69, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f91RGAelZ1AAEXJp4ztPo528.jpg', '2025-04-15 11:40:01', '2025-04-15 11:40:01', 0, 1);
INSERT INTO `files` VALUES (70, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f91SiAXKMkAAB8KEOF8VU055.jpg', '2025-04-15 11:40:23', '2025-04-15 11:40:23', 0, 1);
INSERT INTO `files` VALUES (71, 'dandelion1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f91bWAeHkFAAYbbc58RiE262.jpg', '2025-04-15 11:42:45', '2025-04-15 11:42:45', 0, 1);
INSERT INTO `files` VALUES (72, 'sunflowers1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f91gWACwxmAAKXaJzmEhg935.jpg', '2025-04-15 11:44:04', '2025-04-15 11:44:04', 0, 1);
INSERT INTO `files` VALUES (73, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f91m-AbB-SAAEXJp4ztPo674.jpg', '2025-04-15 11:45:51', '2025-04-15 11:45:51', 0, 1);
INSERT INTO `files` VALUES (74, 'dandelion1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f91sSAKg2gAAYbbc58RiE099.jpg', '2025-04-15 11:47:16', '2025-04-15 11:47:16', 0, 1);
INSERT INTO `files` VALUES (75, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f91wCAD9ucAAB8KEOF8VU923.jpg', '2025-04-15 11:48:15', '2025-04-15 11:48:15', 0, 1);
INSERT INTO `files` VALUES (76, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f910CAFviDAAB8KEOF8VU764.jpg', '2025-04-15 11:49:20', '2025-04-15 11:49:20', 0, 1);
INSERT INTO `files` VALUES (77, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f9116AX_C9AAB8KEOF8VU904.jpg', '2025-04-15 11:49:49', '2025-04-15 11:49:49', 0, 1);
INSERT INTO `files` VALUES (78, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f916yASwvOAAB8KEOF8VU248.jpg', '2025-04-15 11:51:08', '2025-04-15 11:51:08', 0, 1);
INSERT INTO `files` VALUES (79, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f92AGABxRdAAB8KEOF8VU422.jpg', '2025-04-15 11:52:32', '2025-04-15 11:52:32', 0, 1);
INSERT INTO `files` VALUES (80, 'sunflowers1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f92DmAU1WDAAKXaJzmEhg107.jpg', '2025-04-15 11:53:29', '2025-04-15 11:53:29', 0, 1);
INSERT INTO `files` VALUES (81, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f92FeAKsNvAAB8KEOF8VU238.jpg', '2025-04-15 11:53:59', '2025-04-15 11:53:59', 0, 1);
INSERT INTO `files` VALUES (82, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f92HuAE1ahAAB8KEOF8VU720.jpg', '2025-04-15 11:54:34', '2025-04-15 11:54:34', 0, 1);
INSERT INTO `files` VALUES (83, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f92KKAYR-4AAEXJp4ztPo392.jpg', '2025-04-15 11:55:13', '2025-04-15 11:55:13', 0, 1);
INSERT INTO `files` VALUES (84, 'dandelion1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-QBiAMtZxAAYbbc58RiE408.jpg', '2025-04-15 19:16:40', '2025-04-15 19:16:40', 0, 1);
INSERT INTO `files` VALUES (85, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-QLyATiArAAEXJp4ztPo350.jpg', '2025-04-15 19:19:24', '2025-04-15 19:19:24', 0, 1);
INSERT INTO `files` VALUES (86, 'dandelion1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-Qc2AfMZoAAYbbc58RiE229.jpg', '2025-04-15 19:23:57', '2025-04-15 19:23:57', 0, 1);
INSERT INTO `files` VALUES (87, 'dandelion1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-QdaAcSrYAAYbbc58RiE064.jpg', '2025-04-15 19:24:06', '2025-04-15 19:24:06', 0, 1);
INSERT INTO `files` VALUES (88, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-Qr6ALWDgAAB8KEOF8VU911.jpg', '2025-04-15 19:27:59', '2025-04-15 19:27:59', 0, 1);
INSERT INTO `files` VALUES (89, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-Q2-AdtwDAAB8KEOF8VU788.jpg', '2025-04-15 19:30:56', '2025-04-15 19:30:56', 0, 1);
INSERT INTO `files` VALUES (90, 'tulips1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-Q9yABM2RAAXe4A5w_IE498.jpg', '2025-04-15 19:32:44', '2025-04-15 19:32:44', 1, 1);
INSERT INTO `files` VALUES (91, 'sunflowers1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-Q-mAaVq4AAKXaJzmEhg110.jpg', '2025-04-15 19:32:57', '2025-04-15 19:32:57', 0, 1);
INSERT INTO `files` VALUES (92, 'dandelion1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-RByAXAKvAAYbbc58RiE326.jpg', '2025-04-15 19:33:48', '2025-04-15 19:33:48', 1, 1);
INSERT INTO `files` VALUES (93, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-RCuADcvNAAB8KEOF8VU036.jpg', '2025-04-15 19:34:03', '2025-04-15 19:34:03', 0, 1);
INSERT INTO `files` VALUES (94, 'dandelion1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-RG-AcIMwAAYbbc58RiE928.jpg', '2025-04-15 19:35:11', '2025-04-15 19:35:11', 1, 1);
INSERT INTO `files` VALUES (95, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-RHeAV0a3AAEXJp4ztPo034.jpg', '2025-04-15 19:35:19', '2025-04-15 19:35:19', 0, 1);
INSERT INTO `files` VALUES (96, 'sunflowers1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-RPWAOpdnAAKXaJzmEhg796.jpg', '2025-04-15 19:37:25', '2025-04-15 19:37:25', 1, 1);
INSERT INTO `files` VALUES (97, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/00/wKgPH2f-RTmAdpghAAB8KEOF8VU850.jpg', '2025-04-15 19:38:33', '2025-04-15 19:38:33', 0, 1);
INSERT INTO `files` VALUES (98, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-RUGALGLuAAB8KEOF8VU948.jpg', '2025-04-15 19:38:41', '2025-04-15 19:38:41', 1, 1);
INSERT INTO `files` VALUES (99, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-RXeAY4BHAAB8KEOF8VU556.jpg', '2025-04-15 19:39:35', '2025-04-15 19:39:35', 1, 1);
INSERT INTO `files` VALUES (100, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-RcyACYy5AAB8KEOF8VU948.jpg', '2025-04-15 19:41:01', '2025-04-15 19:41:01', 1, 1);
INSERT INTO `files` VALUES (101, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-RfeANZlSAAB8KEOF8VU726.jpg', '2025-04-15 19:41:43', '2025-04-15 19:41:43', 0, 1);
INSERT INTO `files` VALUES (102, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-RhGAaQXeAAB8KEOF8VU293.jpg', '2025-04-15 19:42:09', '2025-04-15 19:42:09', 0, 1);
INSERT INTO `files` VALUES (103, 'sunflowers1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-RhmAT2yjAAKXaJzmEhg822.jpg', '2025-04-15 19:42:17', '2025-04-15 19:42:17', 1, 1);
INSERT INTO `files` VALUES (104, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-Rk-AR4gmAAB8KEOF8VU033.jpg', '2025-04-15 19:43:12', '2025-04-15 19:43:12', 1, 1);
INSERT INTO `files` VALUES (105, 'tulips1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-Rl-AH0_eAAXe4A5w_IE272.jpg', '2025-04-15 19:43:27', '2025-04-15 19:43:27', 0, 1);
INSERT INTO `files` VALUES (106, 'roses1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-R2OAcSjTAAB8KEOF8VU888.jpg', '2025-04-15 19:47:47', '2025-04-15 19:47:47', 1, 1);
INSERT INTO `files` VALUES (107, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-R4eAVcb6AAEXJp4ztPo358.jpg', '2025-04-15 19:48:23', '2025-04-15 19:48:23', 1, 1);
INSERT INTO `files` VALUES (108, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-R9CAJ-CeAAEXJp4ztPo474.jpg', '2025-04-15 19:49:36', '2025-04-15 19:49:36', 0, 1);
INSERT INTO `files` VALUES (109, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-R9iAPU29AAEXJp4ztPo546.jpg', '2025-04-15 19:49:44', '2025-04-15 19:49:44', 0, 1);
INSERT INTO `files` VALUES (110, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-SA2AW81xAAEXJp4ztPo641.jpg', '2025-04-15 19:50:37', '2025-04-15 19:50:37', 0, 1);
INSERT INTO `files` VALUES (111, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-SFeAQ2PqAAEXJp4ztPo541.jpg', '2025-04-15 19:51:51', '2025-04-15 19:51:51', 0, 1);
INSERT INTO `files` VALUES (112, 'df54eaa0b48e23cfa2d3cab046962a21.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-SW-ALO5vAAX8IYURBIE429.jpg', '2025-04-15 19:56:31', '2025-04-15 19:56:31', 0, 1);
INSERT INTO `files` VALUES (113, 'df54eaa0b48e23cfa2d3cab046962a21.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-SbeAaIM1AAX8IYURBIE546.jpg', '2025-04-15 19:57:43', '2025-04-15 19:57:43', 0, 1);
INSERT INTO `files` VALUES (114, 'df54eaa0b48e23cfa2d3cab046962a21.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-Sd-ATsPOAAX8IYURBIE265.jpg', '2025-04-15 19:58:23', '2025-04-15 19:58:23', 0, 1);
INSERT INTO `files` VALUES (115, 'df54eaa0b48e23cfa2d3cab046962a21.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-SxKAQE4xAAX8IYURBIE313.jpg', '2025-04-15 20:03:30', '2025-04-15 20:03:30', 1, 1);
INSERT INTO `files` VALUES (116, 'df54eaa0b48e23cfa2d3cab046962a21.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-S06AC49yAAX8IYURBIE763.jpg', '2025-04-15 20:04:30', '2025-04-15 20:04:30', 1, 1);
INSERT INTO `files` VALUES (117, 'df54eaa0b48e23cfa2d3cab046962a21.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-S4CAAf9bAAX8IYURBIE245.jpg', '2025-04-15 20:05:20', '2025-04-15 20:05:20', 1, 1);
INSERT INTO `files` VALUES (118, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-TT2Adh6fAAEXJp4ztPo139.jpg', '2025-04-15 20:12:46', '2025-04-15 20:12:46', 0, 1);
INSERT INTO `files` VALUES (119, 'daisy1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-TXaAQ-WxAAEXJp4ztPo967.jpg', '2025-04-15 20:13:42', '2025-04-15 20:13:42', 0, 1);
INSERT INTO `files` VALUES (120, 'sunflowers1.jpg', 'http://124.71.79.248:8886/group1/M00/00/01/wKgPH2f-UeGALjrCAAKXaJzmEhg384.jpg', '2025-04-15 20:32:33', '2025-04-15 20:32:33', 0, 1);

-- ----------------------------
-- Table structure for question_item
-- ----------------------------
DROP TABLE IF EXISTS `question_item`;
CREATE TABLE `question_item`  (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `delete_flag` tinyint NULL DEFAULT NULL COMMENT '逻辑删除标志，0 表示未删除， 1 表示删除',
  `version` tinyint NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_item
-- ----------------------------
INSERT INTO `question_item` VALUES (1, '雏菊daisy', '2025-04-14 19:52:46', '2025-04-14 19:52:46', 0, 1);
INSERT INTO `question_item` VALUES (2, '向日葵dandelion', '2025-04-14 19:53:24', '2025-04-14 19:53:24', 0, 1);
INSERT INTO `question_item` VALUES (3, '玫瑰花roses', '2025-04-14 19:53:37', '2025-04-14 19:53:37', 0, 1);
INSERT INTO `question_item` VALUES (4, '向日葵sunflowers', '2025-04-14 19:53:48', '2025-04-14 19:53:48', 0, 1);
INSERT INTO `question_item` VALUES (5, '郁金香tulips', '2025-04-14 19:54:01', '2025-04-14 19:54:01', 0, 1);

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `delete_flag` tinyint NULL DEFAULT NULL COMMENT '逻辑删除标志，0 表示未删除， 1 表示删除',
  `version` tinyint NULL DEFAULT NULL COMMENT '版本号',
  `item_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, '关羽daisy雏菊的问题1：11111111111', '1111111111111111111', '2025-04-14 22:22:31', '2025-04-14 22:22:31', 0, 1, 1);
INSERT INTO `questions` VALUES (2, '关羽daisy雏菊的问题2：2222222222222222', '222222222222222222222', '2025-04-14 22:22:56', '2025-04-14 22:22:56', 0, 1, 1);
INSERT INTO `questions` VALUES (3, '关羽daisy雏菊的问题3：3333333333333333333', '3333333333333333333333333333', '2025-04-14 22:23:13', '2025-04-14 22:23:13', 0, 1, 1);
INSERT INTO `questions` VALUES (8, '向日葵的问题1xxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '2025-04-14 23:21:42', '2025-04-14 23:21:42', 0, 1, 2);
INSERT INTO `questions` VALUES (9, '向日葵的问题2yyyyyyyyyyyyyyyyyyy', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy', '2025-04-14 23:22:55', '2025-04-14 23:22:55', 0, 1, 2);
INSERT INTO `questions` VALUES (10, '玫瑰花的问题1 1111111111111111111', '11111111111', '2025-04-14 23:23:39', '2025-04-14 23:23:39', 0, 1, 3);
INSERT INTO `questions` VALUES (12, '郁金香的问题2 222222222222', '2222222222222222222222', '2025-04-15 00:01:27', '2025-04-15 00:01:27', 0, 1, 5);
INSERT INTO `questions` VALUES (13, '向日葵的问题1 1aaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2025-04-15 03:53:11', '2025-04-15 03:53:11', 0, 1, 4);
INSERT INTO `questions` VALUES (14, '11111111111111111111111111111111111', '111111111111111111111111111111111111111111111111', '2025-04-15 04:15:24', '2025-04-15 04:15:24', 1, 1, 3);

SET FOREIGN_KEY_CHECKS = 1;

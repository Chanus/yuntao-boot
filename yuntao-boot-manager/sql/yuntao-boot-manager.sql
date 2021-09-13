/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : yuntao-boot

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 13/09/2021 21:07:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_activation
-- ----------------------------
DROP TABLE IF EXISTS `sys_activation`;
CREATE TABLE `sys_activation` (
  `activation_key` varchar(500) NOT NULL COMMENT '激活码秘钥',
  `activation_code` varchar(1000) NOT NULL COMMENT '激活码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统激活码表';

-- ----------------------------
-- Records of sys_activation
-- ----------------------------
BEGIN;
INSERT INTO `sys_activation` VALUES ('MrT+Uh2Ixxymi7vmd/7rVV8hwzF42puc2cHUy0NU3CRo/RNE8v66YyTFzhguc/FhcVZzGXbj4Hhb0ndYEK/qBbpll3PSEYiUjtuRuR80e195hmvCGVAWO/XnMn0wdWsu2Xd0u7bxK9Eht3KFVae6m+4qA0TADaMG6V+Upya133Dfb/Qj4On+sBkpcIEzSlRpmgPKsIiA6Rg8A9xdKWryx8yrRKS7wlhDDZK4eL3NLV1OWVZr/JgC34Ll1UPhJkzlJ+7+qZczJ/pq75UvBDzkilvBgcrQGICmCFEmYfSkDK0=', 'Rlt1ezax+1sCQQxuRIKQoe7trhtET6stf95jx/fUq2xbIRiQl41EjPxXNTPWD8ev1ZdBgqcWrDtMeBYsl5Ah+iQLAyesVorpvICtBcNGAO9ltScL/3ulTLu3a47TYJQKL32mjwgYfUfcEoJhL4hPSd07mgWcXJuObLu4YYr/4FJU9aveo8p6KzUF8ow6gF1d6O0jXfqwWFQfvO7+A+J2GofzjFPxaKXdPRECuOwJ/0/BOY1j2Gk9CeJ2shYGoI3LZnrCITbwZmeyAPJRXZD0YemYQNBtal6XCspEJ+aASWPiwhApD2QsVPrA1pYy6WFVChM1UIYu0PYi/++ZxwvwOTRYCgN9MKusqxAr8sCPXhfKfkIpVF/3kjR7H9bEIBSEmaG8PvpG6WWPKZ6+p27/5z9ljGeKhSeVl6LnhMpShHlnPd6vxwsooIq78+cZaGiLkH/+zW9AaLjTrWefnp4eQH9No2NTduONBnc2nzvehlsuqDzBm0xkuj3VQbw6Tm2d');
COMMIT;

-- ----------------------------
-- Table structure for sys_china_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_china_area`;
CREATE TABLE `sys_china_area` (
  `area_id` int(10) unsigned NOT NULL COMMENT '行政区划代码',
  `area_parent_id` int(10) unsigned NOT NULL COMMENT '上级行政区划代码',
  `area_name` varchar(20) NOT NULL COMMENT '行政区名称',
  `area_level` char(1) NOT NULL COMMENT '行政区级别：1-省、直辖市、自治区，2-市，3-区、县',
  PRIMARY KEY (`area_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='中国行政区划表';

-- ----------------------------
-- Records of sys_china_area
-- ----------------------------
BEGIN;
INSERT INTO `sys_china_area` VALUES (110000, 0, '北京市', '1');
INSERT INTO `sys_china_area` VALUES (110101, 110000, '东城区', '3');
INSERT INTO `sys_china_area` VALUES (110102, 110000, '西城区', '3');
INSERT INTO `sys_china_area` VALUES (110105, 110000, '朝阳区', '3');
INSERT INTO `sys_china_area` VALUES (110106, 110000, '丰台区', '3');
INSERT INTO `sys_china_area` VALUES (110107, 110000, '石景山区', '3');
INSERT INTO `sys_china_area` VALUES (110108, 110000, '海淀区', '3');
INSERT INTO `sys_china_area` VALUES (110109, 110000, '门头沟区', '3');
INSERT INTO `sys_china_area` VALUES (110111, 110000, '房山区', '3');
INSERT INTO `sys_china_area` VALUES (110112, 110000, '通州区', '3');
INSERT INTO `sys_china_area` VALUES (110113, 110000, '顺义区', '3');
INSERT INTO `sys_china_area` VALUES (110114, 110000, '昌平区', '3');
INSERT INTO `sys_china_area` VALUES (110115, 110000, '大兴区', '3');
INSERT INTO `sys_china_area` VALUES (110116, 110000, '怀柔区', '3');
INSERT INTO `sys_china_area` VALUES (110117, 110000, '平谷区', '3');
INSERT INTO `sys_china_area` VALUES (110118, 110000, '密云区', '3');
INSERT INTO `sys_china_area` VALUES (110119, 110000, '延庆区', '3');
INSERT INTO `sys_china_area` VALUES (120000, 0, '天津市', '1');
INSERT INTO `sys_china_area` VALUES (120101, 120000, '和平区', '3');
INSERT INTO `sys_china_area` VALUES (120102, 120000, '河东区', '3');
INSERT INTO `sys_china_area` VALUES (120103, 120000, '河西区', '3');
INSERT INTO `sys_china_area` VALUES (120104, 120000, '南开区', '3');
INSERT INTO `sys_china_area` VALUES (120105, 120000, '河北区', '3');
INSERT INTO `sys_china_area` VALUES (120106, 120000, '红桥区', '3');
INSERT INTO `sys_china_area` VALUES (120110, 120000, '东丽区', '3');
INSERT INTO `sys_china_area` VALUES (120111, 120000, '西青区', '3');
INSERT INTO `sys_china_area` VALUES (120112, 120000, '津南区', '3');
INSERT INTO `sys_china_area` VALUES (120113, 120000, '北辰区', '3');
INSERT INTO `sys_china_area` VALUES (120114, 120000, '武清区', '3');
INSERT INTO `sys_china_area` VALUES (120115, 120000, '宝坻区', '3');
INSERT INTO `sys_china_area` VALUES (120116, 120000, '滨海新区', '3');
INSERT INTO `sys_china_area` VALUES (120117, 120000, '宁河区', '3');
INSERT INTO `sys_china_area` VALUES (120118, 120000, '静海区', '3');
INSERT INTO `sys_china_area` VALUES (120119, 120000, '蓟州区', '3');
INSERT INTO `sys_china_area` VALUES (130000, 0, '河北省', '1');
INSERT INTO `sys_china_area` VALUES (130100, 130000, '石家庄市', '2');
INSERT INTO `sys_china_area` VALUES (130102, 130100, '长安区', '3');
INSERT INTO `sys_china_area` VALUES (130104, 130100, '桥西区', '3');
INSERT INTO `sys_china_area` VALUES (130105, 130100, '新华区', '3');
INSERT INTO `sys_china_area` VALUES (130107, 130100, '井陉矿区', '3');
INSERT INTO `sys_china_area` VALUES (130108, 130100, '裕华区', '3');
INSERT INTO `sys_china_area` VALUES (130109, 130100, '藁城区', '3');
INSERT INTO `sys_china_area` VALUES (130110, 130100, '鹿泉区', '3');
INSERT INTO `sys_china_area` VALUES (130111, 130100, '栾城区', '3');
INSERT INTO `sys_china_area` VALUES (130121, 130100, '井陉县', '3');
INSERT INTO `sys_china_area` VALUES (130123, 130100, '正定县', '3');
INSERT INTO `sys_china_area` VALUES (130125, 130100, '行唐县', '3');
INSERT INTO `sys_china_area` VALUES (130126, 130100, '灵寿县', '3');
INSERT INTO `sys_china_area` VALUES (130127, 130100, '高邑县', '3');
INSERT INTO `sys_china_area` VALUES (130128, 130100, '深泽县', '3');
INSERT INTO `sys_china_area` VALUES (130129, 130100, '赞皇县', '3');
INSERT INTO `sys_china_area` VALUES (130130, 130100, '无极县', '3');
INSERT INTO `sys_china_area` VALUES (130131, 130100, '平山县', '3');
INSERT INTO `sys_china_area` VALUES (130132, 130100, '元氏县', '3');
INSERT INTO `sys_china_area` VALUES (130133, 130100, '赵县', '3');
INSERT INTO `sys_china_area` VALUES (130181, 130100, '辛集市', '3');
INSERT INTO `sys_china_area` VALUES (130183, 130100, '晋州市', '3');
INSERT INTO `sys_china_area` VALUES (130184, 130100, '新乐市', '3');
INSERT INTO `sys_china_area` VALUES (130200, 130000, '唐山市', '2');
INSERT INTO `sys_china_area` VALUES (130202, 130200, '路南区', '3');
INSERT INTO `sys_china_area` VALUES (130203, 130200, '路北区', '3');
INSERT INTO `sys_china_area` VALUES (130204, 130200, '古冶区', '3');
INSERT INTO `sys_china_area` VALUES (130205, 130200, '开平区', '3');
INSERT INTO `sys_china_area` VALUES (130207, 130200, '丰南区', '3');
INSERT INTO `sys_china_area` VALUES (130208, 130200, '丰润区', '3');
INSERT INTO `sys_china_area` VALUES (130209, 130200, '曹妃甸区', '3');
INSERT INTO `sys_china_area` VALUES (130224, 130200, '滦南县', '3');
INSERT INTO `sys_china_area` VALUES (130225, 130200, '乐亭县', '3');
INSERT INTO `sys_china_area` VALUES (130227, 130200, '迁西县', '3');
INSERT INTO `sys_china_area` VALUES (130229, 130200, '玉田县', '3');
INSERT INTO `sys_china_area` VALUES (130281, 130200, '遵化市', '3');
INSERT INTO `sys_china_area` VALUES (130283, 130200, '迁安市', '3');
INSERT INTO `sys_china_area` VALUES (130284, 130200, '滦州市', '3');
INSERT INTO `sys_china_area` VALUES (130300, 130000, '秦皇岛市', '2');
INSERT INTO `sys_china_area` VALUES (130302, 130300, '海港区', '3');
INSERT INTO `sys_china_area` VALUES (130303, 130300, '山海关区', '3');
INSERT INTO `sys_china_area` VALUES (130304, 130300, '北戴河区', '3');
INSERT INTO `sys_china_area` VALUES (130306, 130300, '抚宁区', '3');
INSERT INTO `sys_china_area` VALUES (130321, 130300, '青龙满族自治县', '3');
INSERT INTO `sys_china_area` VALUES (130322, 130300, '昌黎县', '3');
INSERT INTO `sys_china_area` VALUES (130324, 130300, '卢龙县', '3');
INSERT INTO `sys_china_area` VALUES (130400, 130000, '邯郸市', '2');
INSERT INTO `sys_china_area` VALUES (130402, 130400, '邯山区', '3');
INSERT INTO `sys_china_area` VALUES (130403, 130400, '丛台区', '3');
INSERT INTO `sys_china_area` VALUES (130404, 130400, '复兴区', '3');
INSERT INTO `sys_china_area` VALUES (130406, 130400, '峰峰矿区', '3');
INSERT INTO `sys_china_area` VALUES (130407, 130400, '肥乡区', '3');
INSERT INTO `sys_china_area` VALUES (130408, 130400, '永年区', '3');
INSERT INTO `sys_china_area` VALUES (130423, 130400, '临漳县', '3');
INSERT INTO `sys_china_area` VALUES (130424, 130400, '成安县', '3');
INSERT INTO `sys_china_area` VALUES (130425, 130400, '大名县', '3');
INSERT INTO `sys_china_area` VALUES (130426, 130400, '涉县', '3');
INSERT INTO `sys_china_area` VALUES (130427, 130400, '磁县', '3');
INSERT INTO `sys_china_area` VALUES (130430, 130400, '邱县', '3');
INSERT INTO `sys_china_area` VALUES (130431, 130400, '鸡泽县', '3');
INSERT INTO `sys_china_area` VALUES (130432, 130400, '广平县', '3');
INSERT INTO `sys_china_area` VALUES (130433, 130400, '馆陶县', '3');
INSERT INTO `sys_china_area` VALUES (130434, 130400, '魏县', '3');
INSERT INTO `sys_china_area` VALUES (130435, 130400, '曲周县', '3');
INSERT INTO `sys_china_area` VALUES (130481, 130400, '武安市', '3');
INSERT INTO `sys_china_area` VALUES (130500, 130000, '邢台市', '2');
INSERT INTO `sys_china_area` VALUES (130502, 130500, '桥东区', '3');
INSERT INTO `sys_china_area` VALUES (130503, 130500, '桥西区', '3');
INSERT INTO `sys_china_area` VALUES (130521, 130500, '邢台县', '3');
INSERT INTO `sys_china_area` VALUES (130522, 130500, '临城县', '3');
INSERT INTO `sys_china_area` VALUES (130523, 130500, '内丘县', '3');
INSERT INTO `sys_china_area` VALUES (130524, 130500, '柏乡县', '3');
INSERT INTO `sys_china_area` VALUES (130525, 130500, '隆尧县', '3');
INSERT INTO `sys_china_area` VALUES (130526, 130500, '任县', '3');
INSERT INTO `sys_china_area` VALUES (130527, 130500, '南和县', '3');
INSERT INTO `sys_china_area` VALUES (130528, 130500, '宁晋县', '3');
INSERT INTO `sys_china_area` VALUES (130529, 130500, '巨鹿县', '3');
INSERT INTO `sys_china_area` VALUES (130530, 130500, '新河县', '3');
INSERT INTO `sys_china_area` VALUES (130531, 130500, '广宗县', '3');
INSERT INTO `sys_china_area` VALUES (130532, 130500, '平乡县', '3');
INSERT INTO `sys_china_area` VALUES (130533, 130500, '威县', '3');
INSERT INTO `sys_china_area` VALUES (130534, 130500, '清河县', '3');
INSERT INTO `sys_china_area` VALUES (130535, 130500, '临西县', '3');
INSERT INTO `sys_china_area` VALUES (130581, 130500, '南宫市', '3');
INSERT INTO `sys_china_area` VALUES (130582, 130500, '沙河市', '3');
INSERT INTO `sys_china_area` VALUES (130600, 130000, '保定市', '2');
INSERT INTO `sys_china_area` VALUES (130602, 130600, '竞秀区', '3');
INSERT INTO `sys_china_area` VALUES (130606, 130600, '莲池区', '3');
INSERT INTO `sys_china_area` VALUES (130607, 130600, '满城区', '3');
INSERT INTO `sys_china_area` VALUES (130608, 130600, '清苑区', '3');
INSERT INTO `sys_china_area` VALUES (130609, 130600, '徐水区', '3');
INSERT INTO `sys_china_area` VALUES (130623, 130600, '涞水县', '3');
INSERT INTO `sys_china_area` VALUES (130624, 130600, '阜平县', '3');
INSERT INTO `sys_china_area` VALUES (130626, 130600, '定兴县', '3');
INSERT INTO `sys_china_area` VALUES (130627, 130600, '唐县', '3');
INSERT INTO `sys_china_area` VALUES (130628, 130600, '高阳县', '3');
INSERT INTO `sys_china_area` VALUES (130629, 130600, '容城县', '3');
INSERT INTO `sys_china_area` VALUES (130630, 130600, '涞源县', '3');
INSERT INTO `sys_china_area` VALUES (130631, 130600, '望都县', '3');
INSERT INTO `sys_china_area` VALUES (130632, 130600, '安新县', '3');
INSERT INTO `sys_china_area` VALUES (130633, 130600, '易县', '3');
INSERT INTO `sys_china_area` VALUES (130634, 130600, '曲阳县', '3');
INSERT INTO `sys_china_area` VALUES (130635, 130600, '蠡县', '3');
INSERT INTO `sys_china_area` VALUES (130636, 130600, '顺平县', '3');
INSERT INTO `sys_china_area` VALUES (130637, 130600, '博野县', '3');
INSERT INTO `sys_china_area` VALUES (130638, 130600, '雄县', '3');
INSERT INTO `sys_china_area` VALUES (130681, 130600, '涿州市', '3');
INSERT INTO `sys_china_area` VALUES (130682, 130600, '定州市', '3');
INSERT INTO `sys_china_area` VALUES (130683, 130600, '安国市', '3');
INSERT INTO `sys_china_area` VALUES (130684, 130600, '高碑店市', '3');
INSERT INTO `sys_china_area` VALUES (130700, 130000, '张家口市', '2');
INSERT INTO `sys_china_area` VALUES (130702, 130700, '桥东区', '3');
INSERT INTO `sys_china_area` VALUES (130703, 130700, '桥西区', '3');
INSERT INTO `sys_china_area` VALUES (130705, 130700, '宣化区', '3');
INSERT INTO `sys_china_area` VALUES (130706, 130700, '下花园区', '3');
INSERT INTO `sys_china_area` VALUES (130708, 130700, '万全区', '3');
INSERT INTO `sys_china_area` VALUES (130709, 130700, '崇礼区', '3');
INSERT INTO `sys_china_area` VALUES (130722, 130700, '张北县', '3');
INSERT INTO `sys_china_area` VALUES (130723, 130700, '康保县', '3');
INSERT INTO `sys_china_area` VALUES (130724, 130700, '沽源县', '3');
INSERT INTO `sys_china_area` VALUES (130725, 130700, '尚义县', '3');
INSERT INTO `sys_china_area` VALUES (130726, 130700, '蔚县', '3');
INSERT INTO `sys_china_area` VALUES (130727, 130700, '阳原县', '3');
INSERT INTO `sys_china_area` VALUES (130728, 130700, '怀安县', '3');
INSERT INTO `sys_china_area` VALUES (130730, 130700, '怀来县', '3');
INSERT INTO `sys_china_area` VALUES (130731, 130700, '涿鹿县', '3');
INSERT INTO `sys_china_area` VALUES (130732, 130700, '赤城县', '3');
INSERT INTO `sys_china_area` VALUES (130800, 130000, '承德市', '2');
INSERT INTO `sys_china_area` VALUES (130802, 130800, '双桥区', '3');
INSERT INTO `sys_china_area` VALUES (130803, 130800, '双滦区', '3');
INSERT INTO `sys_china_area` VALUES (130804, 130800, '鹰手营子矿区', '3');
INSERT INTO `sys_china_area` VALUES (130821, 130800, '承德县', '3');
INSERT INTO `sys_china_area` VALUES (130822, 130800, '兴隆县', '3');
INSERT INTO `sys_china_area` VALUES (130824, 130800, '滦平县', '3');
INSERT INTO `sys_china_area` VALUES (130825, 130800, '隆化县', '3');
INSERT INTO `sys_china_area` VALUES (130826, 130800, '丰宁满族自治县', '3');
INSERT INTO `sys_china_area` VALUES (130827, 130800, '宽城满族自治县', '3');
INSERT INTO `sys_china_area` VALUES (130828, 130800, '围场满族蒙古族自治县', '3');
INSERT INTO `sys_china_area` VALUES (130881, 130800, '平泉市', '3');
INSERT INTO `sys_china_area` VALUES (130900, 130000, '沧州市', '2');
INSERT INTO `sys_china_area` VALUES (130902, 130900, '新华区', '3');
INSERT INTO `sys_china_area` VALUES (130903, 130900, '运河区', '3');
INSERT INTO `sys_china_area` VALUES (130921, 130900, '沧县', '3');
INSERT INTO `sys_china_area` VALUES (130922, 130900, '青县', '3');
INSERT INTO `sys_china_area` VALUES (130923, 130900, '东光县', '3');
INSERT INTO `sys_china_area` VALUES (130924, 130900, '海兴县', '3');
INSERT INTO `sys_china_area` VALUES (130925, 130900, '盐山县', '3');
INSERT INTO `sys_china_area` VALUES (130926, 130900, '肃宁县', '3');
INSERT INTO `sys_china_area` VALUES (130927, 130900, '南皮县', '3');
INSERT INTO `sys_china_area` VALUES (130928, 130900, '吴桥县', '3');
INSERT INTO `sys_china_area` VALUES (130929, 130900, '献县', '3');
INSERT INTO `sys_china_area` VALUES (130930, 130900, '孟村回族自治县', '3');
INSERT INTO `sys_china_area` VALUES (130981, 130900, '泊头市', '3');
INSERT INTO `sys_china_area` VALUES (130982, 130900, '任丘市', '3');
INSERT INTO `sys_china_area` VALUES (130983, 130900, '黄骅市', '3');
INSERT INTO `sys_china_area` VALUES (130984, 130900, '河间市', '3');
INSERT INTO `sys_china_area` VALUES (131000, 130000, '廊坊市', '2');
INSERT INTO `sys_china_area` VALUES (131002, 131000, '安次区', '3');
INSERT INTO `sys_china_area` VALUES (131003, 131000, '广阳区', '3');
INSERT INTO `sys_china_area` VALUES (131022, 131000, '固安县', '3');
INSERT INTO `sys_china_area` VALUES (131023, 131000, '永清县', '3');
INSERT INTO `sys_china_area` VALUES (131024, 131000, '香河县', '3');
INSERT INTO `sys_china_area` VALUES (131025, 131000, '大城县', '3');
INSERT INTO `sys_china_area` VALUES (131026, 131000, '文安县', '3');
INSERT INTO `sys_china_area` VALUES (131028, 131000, '大厂回族自治县', '3');
INSERT INTO `sys_china_area` VALUES (131081, 131000, '霸州市', '3');
INSERT INTO `sys_china_area` VALUES (131082, 131000, '三河市', '3');
INSERT INTO `sys_china_area` VALUES (131100, 130000, '衡水市', '2');
INSERT INTO `sys_china_area` VALUES (131102, 131100, '桃城区', '3');
INSERT INTO `sys_china_area` VALUES (131103, 131100, '冀州区', '3');
INSERT INTO `sys_china_area` VALUES (131121, 131100, '枣强县', '3');
INSERT INTO `sys_china_area` VALUES (131122, 131100, '武邑县', '3');
INSERT INTO `sys_china_area` VALUES (131123, 131100, '武强县', '3');
INSERT INTO `sys_china_area` VALUES (131124, 131100, '饶阳县', '3');
INSERT INTO `sys_china_area` VALUES (131125, 131100, '安平县', '3');
INSERT INTO `sys_china_area` VALUES (131126, 131100, '故城县', '3');
INSERT INTO `sys_china_area` VALUES (131127, 131100, '景县', '3');
INSERT INTO `sys_china_area` VALUES (131128, 131100, '阜城县', '3');
INSERT INTO `sys_china_area` VALUES (131182, 131100, '深州市', '3');
INSERT INTO `sys_china_area` VALUES (140000, 0, '山西省', '1');
INSERT INTO `sys_china_area` VALUES (140100, 140000, '太原市', '2');
INSERT INTO `sys_china_area` VALUES (140105, 140100, '小店区', '3');
INSERT INTO `sys_china_area` VALUES (140106, 140100, '迎泽区', '3');
INSERT INTO `sys_china_area` VALUES (140107, 140100, '杏花岭区', '3');
INSERT INTO `sys_china_area` VALUES (140108, 140100, '尖草坪区', '3');
INSERT INTO `sys_china_area` VALUES (140109, 140100, '万柏林区', '3');
INSERT INTO `sys_china_area` VALUES (140110, 140100, '晋源区', '3');
INSERT INTO `sys_china_area` VALUES (140121, 140100, '清徐县', '3');
INSERT INTO `sys_china_area` VALUES (140122, 140100, '阳曲县', '3');
INSERT INTO `sys_china_area` VALUES (140123, 140100, '娄烦县', '3');
INSERT INTO `sys_china_area` VALUES (140181, 140100, '古交市', '3');
INSERT INTO `sys_china_area` VALUES (140200, 140000, '大同市', '2');
INSERT INTO `sys_china_area` VALUES (140212, 140200, '新荣区', '3');
INSERT INTO `sys_china_area` VALUES (140213, 140200, '平城区', '3');
INSERT INTO `sys_china_area` VALUES (140214, 140200, '云冈区', '3');
INSERT INTO `sys_china_area` VALUES (140215, 140200, '云州区', '3');
INSERT INTO `sys_china_area` VALUES (140221, 140200, '阳高县', '3');
INSERT INTO `sys_china_area` VALUES (140222, 140200, '天镇县', '3');
INSERT INTO `sys_china_area` VALUES (140223, 140200, '广灵县', '3');
INSERT INTO `sys_china_area` VALUES (140224, 140200, '灵丘县', '3');
INSERT INTO `sys_china_area` VALUES (140225, 140200, '浑源县', '3');
INSERT INTO `sys_china_area` VALUES (140226, 140200, '左云县', '3');
INSERT INTO `sys_china_area` VALUES (140300, 140000, '阳泉市', '2');
INSERT INTO `sys_china_area` VALUES (140302, 140300, '城区', '3');
INSERT INTO `sys_china_area` VALUES (140303, 140300, '矿区', '3');
INSERT INTO `sys_china_area` VALUES (140311, 140300, '郊区', '3');
INSERT INTO `sys_china_area` VALUES (140321, 140300, '平定县', '3');
INSERT INTO `sys_china_area` VALUES (140322, 140300, '盂县', '3');
INSERT INTO `sys_china_area` VALUES (140400, 140000, '长治市', '2');
INSERT INTO `sys_china_area` VALUES (140403, 140400, '潞州区', '3');
INSERT INTO `sys_china_area` VALUES (140404, 140400, '上党区', '3');
INSERT INTO `sys_china_area` VALUES (140405, 140400, '屯留区', '3');
INSERT INTO `sys_china_area` VALUES (140406, 140400, '潞城区', '3');
INSERT INTO `sys_china_area` VALUES (140423, 140400, '襄垣县', '3');
INSERT INTO `sys_china_area` VALUES (140425, 140400, '平顺县', '3');
INSERT INTO `sys_china_area` VALUES (140426, 140400, '黎城县', '3');
INSERT INTO `sys_china_area` VALUES (140427, 140400, '壶关县', '3');
INSERT INTO `sys_china_area` VALUES (140428, 140400, '长子县', '3');
INSERT INTO `sys_china_area` VALUES (140429, 140400, '武乡县', '3');
INSERT INTO `sys_china_area` VALUES (140430, 140400, '沁县', '3');
INSERT INTO `sys_china_area` VALUES (140431, 140400, '沁源县', '3');
INSERT INTO `sys_china_area` VALUES (140500, 140000, '晋城市', '2');
INSERT INTO `sys_china_area` VALUES (140502, 140500, '城区', '3');
INSERT INTO `sys_china_area` VALUES (140521, 140500, '沁水县', '3');
INSERT INTO `sys_china_area` VALUES (140522, 140500, '阳城县', '3');
INSERT INTO `sys_china_area` VALUES (140524, 140500, '陵川县', '3');
INSERT INTO `sys_china_area` VALUES (140525, 140500, '泽州县', '3');
INSERT INTO `sys_china_area` VALUES (140581, 140500, '高平市', '3');
INSERT INTO `sys_china_area` VALUES (140600, 140000, '朔州市', '2');
INSERT INTO `sys_china_area` VALUES (140602, 140600, '朔城区', '3');
INSERT INTO `sys_china_area` VALUES (140603, 140600, '平鲁区', '3');
INSERT INTO `sys_china_area` VALUES (140621, 140600, '山阴县', '3');
INSERT INTO `sys_china_area` VALUES (140622, 140600, '应县', '3');
INSERT INTO `sys_china_area` VALUES (140623, 140600, '右玉县', '3');
INSERT INTO `sys_china_area` VALUES (140681, 140600, '怀仁市', '3');
INSERT INTO `sys_china_area` VALUES (140700, 140000, '晋中市', '2');
INSERT INTO `sys_china_area` VALUES (140702, 140700, '榆次区', '3');
INSERT INTO `sys_china_area` VALUES (140703, 140700, '太谷区', '3');
INSERT INTO `sys_china_area` VALUES (140721, 140700, '榆社县', '3');
INSERT INTO `sys_china_area` VALUES (140722, 140700, '左权县', '3');
INSERT INTO `sys_china_area` VALUES (140723, 140700, '和顺县', '3');
INSERT INTO `sys_china_area` VALUES (140724, 140700, '昔阳县', '3');
INSERT INTO `sys_china_area` VALUES (140725, 140700, '寿阳县', '3');
INSERT INTO `sys_china_area` VALUES (140727, 140700, '祁县', '3');
INSERT INTO `sys_china_area` VALUES (140728, 140700, '平遥县', '3');
INSERT INTO `sys_china_area` VALUES (140729, 140700, '灵石县', '3');
INSERT INTO `sys_china_area` VALUES (140781, 140700, '介休市', '3');
INSERT INTO `sys_china_area` VALUES (140800, 140000, '运城市', '2');
INSERT INTO `sys_china_area` VALUES (140802, 140800, '盐湖区', '3');
INSERT INTO `sys_china_area` VALUES (140821, 140800, '临猗县', '3');
INSERT INTO `sys_china_area` VALUES (140822, 140800, '万荣县', '3');
INSERT INTO `sys_china_area` VALUES (140823, 140800, '闻喜县', '3');
INSERT INTO `sys_china_area` VALUES (140824, 140800, '稷山县', '3');
INSERT INTO `sys_china_area` VALUES (140825, 140800, '新绛县', '3');
INSERT INTO `sys_china_area` VALUES (140826, 140800, '绛县', '3');
INSERT INTO `sys_china_area` VALUES (140827, 140800, '垣曲县', '3');
INSERT INTO `sys_china_area` VALUES (140828, 140800, '夏县', '3');
INSERT INTO `sys_china_area` VALUES (140829, 140800, '平陆县', '3');
INSERT INTO `sys_china_area` VALUES (140830, 140800, '芮城县', '3');
INSERT INTO `sys_china_area` VALUES (140881, 140800, '永济市', '3');
INSERT INTO `sys_china_area` VALUES (140882, 140800, '河津市', '3');
INSERT INTO `sys_china_area` VALUES (140900, 140000, '忻州市', '2');
INSERT INTO `sys_china_area` VALUES (140902, 140900, '忻府区', '3');
INSERT INTO `sys_china_area` VALUES (140921, 140900, '定襄县', '3');
INSERT INTO `sys_china_area` VALUES (140922, 140900, '五台县', '3');
INSERT INTO `sys_china_area` VALUES (140923, 140900, '代县', '3');
INSERT INTO `sys_china_area` VALUES (140924, 140900, '繁峙县', '3');
INSERT INTO `sys_china_area` VALUES (140925, 140900, '宁武县', '3');
INSERT INTO `sys_china_area` VALUES (140926, 140900, '静乐县', '3');
INSERT INTO `sys_china_area` VALUES (140927, 140900, '神池县', '3');
INSERT INTO `sys_china_area` VALUES (140928, 140900, '五寨县', '3');
INSERT INTO `sys_china_area` VALUES (140929, 140900, '岢岚县', '3');
INSERT INTO `sys_china_area` VALUES (140930, 140900, '河曲县', '3');
INSERT INTO `sys_china_area` VALUES (140931, 140900, '保德县', '3');
INSERT INTO `sys_china_area` VALUES (140932, 140900, '偏关县', '3');
INSERT INTO `sys_china_area` VALUES (140981, 140900, '原平市', '3');
INSERT INTO `sys_china_area` VALUES (141000, 140000, '临汾市', '2');
INSERT INTO `sys_china_area` VALUES (141002, 141000, '尧都区', '3');
INSERT INTO `sys_china_area` VALUES (141021, 141000, '曲沃县', '3');
INSERT INTO `sys_china_area` VALUES (141022, 141000, '翼城县', '3');
INSERT INTO `sys_china_area` VALUES (141023, 141000, '襄汾县', '3');
INSERT INTO `sys_china_area` VALUES (141024, 141000, '洪洞县', '3');
INSERT INTO `sys_china_area` VALUES (141025, 141000, '古县', '3');
INSERT INTO `sys_china_area` VALUES (141026, 141000, '安泽县', '3');
INSERT INTO `sys_china_area` VALUES (141027, 141000, '浮山县', '3');
INSERT INTO `sys_china_area` VALUES (141028, 141000, '吉县', '3');
INSERT INTO `sys_china_area` VALUES (141029, 141000, '乡宁县', '3');
INSERT INTO `sys_china_area` VALUES (141030, 141000, '大宁县', '3');
INSERT INTO `sys_china_area` VALUES (141031, 141000, '隰县', '3');
INSERT INTO `sys_china_area` VALUES (141032, 141000, '永和县', '3');
INSERT INTO `sys_china_area` VALUES (141033, 141000, '蒲县', '3');
INSERT INTO `sys_china_area` VALUES (141034, 141000, '汾西县', '3');
INSERT INTO `sys_china_area` VALUES (141081, 141000, '侯马市', '3');
INSERT INTO `sys_china_area` VALUES (141082, 141000, '霍州市', '3');
INSERT INTO `sys_china_area` VALUES (141100, 140000, '吕梁市', '2');
INSERT INTO `sys_china_area` VALUES (141102, 141100, '离石区', '3');
INSERT INTO `sys_china_area` VALUES (141121, 141100, '文水县', '3');
INSERT INTO `sys_china_area` VALUES (141122, 141100, '交城县', '3');
INSERT INTO `sys_china_area` VALUES (141123, 141100, '兴县', '3');
INSERT INTO `sys_china_area` VALUES (141124, 141100, '临县', '3');
INSERT INTO `sys_china_area` VALUES (141125, 141100, '柳林县', '3');
INSERT INTO `sys_china_area` VALUES (141126, 141100, '石楼县', '3');
INSERT INTO `sys_china_area` VALUES (141127, 141100, '岚县', '3');
INSERT INTO `sys_china_area` VALUES (141128, 141100, '方山县', '3');
INSERT INTO `sys_china_area` VALUES (141129, 141100, '中阳县', '3');
INSERT INTO `sys_china_area` VALUES (141130, 141100, '交口县', '3');
INSERT INTO `sys_china_area` VALUES (141181, 141100, '孝义市', '3');
INSERT INTO `sys_china_area` VALUES (141182, 141100, '汾阳市', '3');
INSERT INTO `sys_china_area` VALUES (150000, 0, '内蒙古自治区', '1');
INSERT INTO `sys_china_area` VALUES (150100, 150000, '呼和浩特市', '2');
INSERT INTO `sys_china_area` VALUES (150102, 150100, '新城区', '3');
INSERT INTO `sys_china_area` VALUES (150103, 150100, '回民区', '3');
INSERT INTO `sys_china_area` VALUES (150104, 150100, '玉泉区', '3');
INSERT INTO `sys_china_area` VALUES (150105, 150100, '赛罕区', '3');
INSERT INTO `sys_china_area` VALUES (150121, 150100, '土默特左旗', '3');
INSERT INTO `sys_china_area` VALUES (150122, 150100, '托克托县', '3');
INSERT INTO `sys_china_area` VALUES (150123, 150100, '和林格尔县', '3');
INSERT INTO `sys_china_area` VALUES (150124, 150100, '清水河县', '3');
INSERT INTO `sys_china_area` VALUES (150125, 150100, '武川县', '3');
INSERT INTO `sys_china_area` VALUES (150200, 150000, '包头市', '2');
INSERT INTO `sys_china_area` VALUES (150202, 150200, '东河区', '3');
INSERT INTO `sys_china_area` VALUES (150203, 150200, '昆都仑区', '3');
INSERT INTO `sys_china_area` VALUES (150204, 150200, '青山区', '3');
INSERT INTO `sys_china_area` VALUES (150205, 150200, '石拐区', '3');
INSERT INTO `sys_china_area` VALUES (150206, 150200, '白云鄂博矿区', '3');
INSERT INTO `sys_china_area` VALUES (150207, 150200, '九原区', '3');
INSERT INTO `sys_china_area` VALUES (150221, 150200, '土默特右旗', '3');
INSERT INTO `sys_china_area` VALUES (150222, 150200, '固阳县', '3');
INSERT INTO `sys_china_area` VALUES (150223, 150200, '达尔罕茂明安联合旗', '3');
INSERT INTO `sys_china_area` VALUES (150300, 150000, '乌海市', '2');
INSERT INTO `sys_china_area` VALUES (150302, 150300, '海勃湾区', '3');
INSERT INTO `sys_china_area` VALUES (150303, 150300, '海南区', '3');
INSERT INTO `sys_china_area` VALUES (150304, 150300, '乌达区', '3');
INSERT INTO `sys_china_area` VALUES (150400, 150000, '赤峰市', '2');
INSERT INTO `sys_china_area` VALUES (150402, 150400, '红山区', '3');
INSERT INTO `sys_china_area` VALUES (150403, 150400, '元宝山区', '3');
INSERT INTO `sys_china_area` VALUES (150404, 150400, '松山区', '3');
INSERT INTO `sys_china_area` VALUES (150421, 150400, '阿鲁科尔沁旗', '3');
INSERT INTO `sys_china_area` VALUES (150422, 150400, '巴林左旗', '3');
INSERT INTO `sys_china_area` VALUES (150423, 150400, '巴林右旗', '3');
INSERT INTO `sys_china_area` VALUES (150424, 150400, '林西县', '3');
INSERT INTO `sys_china_area` VALUES (150425, 150400, '克什克腾旗', '3');
INSERT INTO `sys_china_area` VALUES (150426, 150400, '翁牛特旗', '3');
INSERT INTO `sys_china_area` VALUES (150428, 150400, '喀喇沁旗', '3');
INSERT INTO `sys_china_area` VALUES (150429, 150400, '宁城县', '3');
INSERT INTO `sys_china_area` VALUES (150430, 150400, '敖汉旗', '3');
INSERT INTO `sys_china_area` VALUES (150500, 150000, '通辽市', '2');
INSERT INTO `sys_china_area` VALUES (150502, 150500, '科尔沁区', '3');
INSERT INTO `sys_china_area` VALUES (150521, 150500, '科尔沁左翼中旗', '3');
INSERT INTO `sys_china_area` VALUES (150522, 150500, '科尔沁左翼后旗', '3');
INSERT INTO `sys_china_area` VALUES (150523, 150500, '开鲁县', '3');
INSERT INTO `sys_china_area` VALUES (150524, 150500, '库伦旗', '3');
INSERT INTO `sys_china_area` VALUES (150525, 150500, '奈曼旗', '3');
INSERT INTO `sys_china_area` VALUES (150526, 150500, '扎鲁特旗', '3');
INSERT INTO `sys_china_area` VALUES (150581, 150500, '霍林郭勒市', '3');
INSERT INTO `sys_china_area` VALUES (150600, 150000, '鄂尔多斯市', '2');
INSERT INTO `sys_china_area` VALUES (150602, 150600, '东胜区', '3');
INSERT INTO `sys_china_area` VALUES (150603, 150600, '康巴什区', '3');
INSERT INTO `sys_china_area` VALUES (150621, 150600, '达拉特旗', '3');
INSERT INTO `sys_china_area` VALUES (150622, 150600, '准格尔旗', '3');
INSERT INTO `sys_china_area` VALUES (150623, 150600, '鄂托克前旗', '3');
INSERT INTO `sys_china_area` VALUES (150624, 150600, '鄂托克旗', '3');
INSERT INTO `sys_china_area` VALUES (150625, 150600, '杭锦旗', '3');
INSERT INTO `sys_china_area` VALUES (150626, 150600, '乌审旗', '3');
INSERT INTO `sys_china_area` VALUES (150627, 150600, '伊金霍洛旗', '3');
INSERT INTO `sys_china_area` VALUES (150700, 150000, '呼伦贝尔市', '2');
INSERT INTO `sys_china_area` VALUES (150702, 150700, '海拉尔区', '3');
INSERT INTO `sys_china_area` VALUES (150703, 150700, '扎赉诺尔区', '3');
INSERT INTO `sys_china_area` VALUES (150721, 150700, '阿荣旗', '3');
INSERT INTO `sys_china_area` VALUES (150722, 150700, '莫力达瓦达斡尔族自治旗', '3');
INSERT INTO `sys_china_area` VALUES (150723, 150700, '鄂伦春自治旗', '3');
INSERT INTO `sys_china_area` VALUES (150724, 150700, '鄂温克族自治旗', '3');
INSERT INTO `sys_china_area` VALUES (150725, 150700, '陈巴尔虎旗', '3');
INSERT INTO `sys_china_area` VALUES (150726, 150700, '新巴尔虎左旗', '3');
INSERT INTO `sys_china_area` VALUES (150727, 150700, '新巴尔虎右旗', '3');
INSERT INTO `sys_china_area` VALUES (150781, 150700, '满洲里市', '3');
INSERT INTO `sys_china_area` VALUES (150782, 150700, '牙克石市', '3');
INSERT INTO `sys_china_area` VALUES (150783, 150700, '扎兰屯市', '3');
INSERT INTO `sys_china_area` VALUES (150784, 150700, '额尔古纳市', '3');
INSERT INTO `sys_china_area` VALUES (150785, 150700, '根河市', '3');
INSERT INTO `sys_china_area` VALUES (150800, 150000, '巴彦淖尔市', '2');
INSERT INTO `sys_china_area` VALUES (150802, 150800, '临河区', '3');
INSERT INTO `sys_china_area` VALUES (150821, 150800, '五原县', '3');
INSERT INTO `sys_china_area` VALUES (150822, 150800, '磴口县', '3');
INSERT INTO `sys_china_area` VALUES (150823, 150800, '乌拉特前旗', '3');
INSERT INTO `sys_china_area` VALUES (150824, 150800, '乌拉特中旗', '3');
INSERT INTO `sys_china_area` VALUES (150825, 150800, '乌拉特后旗', '3');
INSERT INTO `sys_china_area` VALUES (150826, 150800, '杭锦后旗', '3');
INSERT INTO `sys_china_area` VALUES (150900, 150000, '乌兰察布市', '2');
INSERT INTO `sys_china_area` VALUES (150902, 150900, '集宁区', '3');
INSERT INTO `sys_china_area` VALUES (150921, 150900, '卓资县', '3');
INSERT INTO `sys_china_area` VALUES (150922, 150900, '化德县', '3');
INSERT INTO `sys_china_area` VALUES (150923, 150900, '商都县', '3');
INSERT INTO `sys_china_area` VALUES (150924, 150900, '兴和县', '3');
INSERT INTO `sys_china_area` VALUES (150925, 150900, '凉城县', '3');
INSERT INTO `sys_china_area` VALUES (150926, 150900, '察哈尔右翼前旗', '3');
INSERT INTO `sys_china_area` VALUES (150927, 150900, '察哈尔右翼中旗', '3');
INSERT INTO `sys_china_area` VALUES (150928, 150900, '察哈尔右翼后旗', '3');
INSERT INTO `sys_china_area` VALUES (150929, 150900, '四子王旗', '3');
INSERT INTO `sys_china_area` VALUES (150981, 150900, '丰镇市', '3');
INSERT INTO `sys_china_area` VALUES (152200, 150000, '兴安盟', '2');
INSERT INTO `sys_china_area` VALUES (152201, 152200, '乌兰浩特市', '3');
INSERT INTO `sys_china_area` VALUES (152202, 152200, '阿尔山市', '3');
INSERT INTO `sys_china_area` VALUES (152221, 152200, '科尔沁右翼前旗', '3');
INSERT INTO `sys_china_area` VALUES (152222, 152200, '科尔沁右翼中旗', '3');
INSERT INTO `sys_china_area` VALUES (152223, 152200, '扎赉特旗', '3');
INSERT INTO `sys_china_area` VALUES (152224, 152200, '突泉县', '3');
INSERT INTO `sys_china_area` VALUES (152500, 150000, '锡林郭勒盟', '2');
INSERT INTO `sys_china_area` VALUES (152501, 152500, '二连浩特市', '3');
INSERT INTO `sys_china_area` VALUES (152502, 152500, '锡林浩特市', '3');
INSERT INTO `sys_china_area` VALUES (152522, 152500, '阿巴嘎旗', '3');
INSERT INTO `sys_china_area` VALUES (152523, 152500, '苏尼特左旗', '3');
INSERT INTO `sys_china_area` VALUES (152524, 152500, '苏尼特右旗', '3');
INSERT INTO `sys_china_area` VALUES (152525, 152500, '东乌珠穆沁旗', '3');
INSERT INTO `sys_china_area` VALUES (152526, 152500, '西乌珠穆沁旗', '3');
INSERT INTO `sys_china_area` VALUES (152527, 152500, '太仆寺旗', '3');
INSERT INTO `sys_china_area` VALUES (152528, 152500, '镶黄旗', '3');
INSERT INTO `sys_china_area` VALUES (152529, 152500, '正镶白旗', '3');
INSERT INTO `sys_china_area` VALUES (152530, 152500, '正蓝旗', '3');
INSERT INTO `sys_china_area` VALUES (152531, 152500, '多伦县', '3');
INSERT INTO `sys_china_area` VALUES (152900, 150000, '阿拉善盟', '2');
INSERT INTO `sys_china_area` VALUES (152921, 152900, '阿拉善左旗', '3');
INSERT INTO `sys_china_area` VALUES (152922, 152900, '阿拉善右旗', '3');
INSERT INTO `sys_china_area` VALUES (152923, 152900, '额济纳旗', '3');
INSERT INTO `sys_china_area` VALUES (210000, 0, '辽宁省', '1');
INSERT INTO `sys_china_area` VALUES (210100, 210000, '沈阳市', '2');
INSERT INTO `sys_china_area` VALUES (210102, 210100, '和平区', '3');
INSERT INTO `sys_china_area` VALUES (210103, 210100, '沈河区', '3');
INSERT INTO `sys_china_area` VALUES (210104, 210100, '大东区', '3');
INSERT INTO `sys_china_area` VALUES (210105, 210100, '皇姑区', '3');
INSERT INTO `sys_china_area` VALUES (210106, 210100, '铁西区', '3');
INSERT INTO `sys_china_area` VALUES (210111, 210100, '苏家屯区', '3');
INSERT INTO `sys_china_area` VALUES (210112, 210100, '浑南区', '3');
INSERT INTO `sys_china_area` VALUES (210113, 210100, '沈北新区', '3');
INSERT INTO `sys_china_area` VALUES (210114, 210100, '于洪区', '3');
INSERT INTO `sys_china_area` VALUES (210115, 210100, '辽中区', '3');
INSERT INTO `sys_china_area` VALUES (210123, 210100, '康平县', '3');
INSERT INTO `sys_china_area` VALUES (210124, 210100, '法库县', '3');
INSERT INTO `sys_china_area` VALUES (210181, 210100, '新民市', '3');
INSERT INTO `sys_china_area` VALUES (210200, 210000, '大连市', '2');
INSERT INTO `sys_china_area` VALUES (210202, 210200, '中山区', '3');
INSERT INTO `sys_china_area` VALUES (210203, 210200, '西岗区', '3');
INSERT INTO `sys_china_area` VALUES (210204, 210200, '沙河口区', '3');
INSERT INTO `sys_china_area` VALUES (210211, 210200, '甘井子区', '3');
INSERT INTO `sys_china_area` VALUES (210212, 210200, '旅顺口区', '3');
INSERT INTO `sys_china_area` VALUES (210213, 210200, '金州区', '3');
INSERT INTO `sys_china_area` VALUES (210214, 210200, '普兰店区', '3');
INSERT INTO `sys_china_area` VALUES (210224, 210200, '长海县', '3');
INSERT INTO `sys_china_area` VALUES (210281, 210200, '瓦房店市', '3');
INSERT INTO `sys_china_area` VALUES (210283, 210200, '庄河市', '3');
INSERT INTO `sys_china_area` VALUES (210300, 210000, '鞍山市', '2');
INSERT INTO `sys_china_area` VALUES (210302, 210300, '铁东区', '3');
INSERT INTO `sys_china_area` VALUES (210303, 210300, '铁西区', '3');
INSERT INTO `sys_china_area` VALUES (210304, 210300, '立山区', '3');
INSERT INTO `sys_china_area` VALUES (210311, 210300, '千山区', '3');
INSERT INTO `sys_china_area` VALUES (210321, 210300, '台安县', '3');
INSERT INTO `sys_china_area` VALUES (210323, 210300, '岫岩满族自治县', '3');
INSERT INTO `sys_china_area` VALUES (210381, 210300, '海城市', '3');
INSERT INTO `sys_china_area` VALUES (210400, 210000, '抚顺市', '2');
INSERT INTO `sys_china_area` VALUES (210402, 210400, '新抚区', '3');
INSERT INTO `sys_china_area` VALUES (210403, 210400, '东洲区', '3');
INSERT INTO `sys_china_area` VALUES (210404, 210400, '望花区', '3');
INSERT INTO `sys_china_area` VALUES (210411, 210400, '顺城区', '3');
INSERT INTO `sys_china_area` VALUES (210421, 210400, '抚顺县', '3');
INSERT INTO `sys_china_area` VALUES (210422, 210400, '新宾满族自治县', '3');
INSERT INTO `sys_china_area` VALUES (210423, 210400, '清原满族自治县', '3');
INSERT INTO `sys_china_area` VALUES (210500, 210000, '本溪市', '2');
INSERT INTO `sys_china_area` VALUES (210502, 210500, '平山区', '3');
INSERT INTO `sys_china_area` VALUES (210503, 210500, '溪湖区', '3');
INSERT INTO `sys_china_area` VALUES (210504, 210500, '明山区', '3');
INSERT INTO `sys_china_area` VALUES (210505, 210500, '南芬区', '3');
INSERT INTO `sys_china_area` VALUES (210521, 210500, '本溪满族自治县', '3');
INSERT INTO `sys_china_area` VALUES (210522, 210500, '桓仁满族自治县', '3');
INSERT INTO `sys_china_area` VALUES (210600, 210000, '丹东市', '2');
INSERT INTO `sys_china_area` VALUES (210602, 210600, '元宝区', '3');
INSERT INTO `sys_china_area` VALUES (210603, 210600, '振兴区', '3');
INSERT INTO `sys_china_area` VALUES (210604, 210600, '振安区', '3');
INSERT INTO `sys_china_area` VALUES (210624, 210600, '宽甸满族自治县', '3');
INSERT INTO `sys_china_area` VALUES (210681, 210600, '东港市', '3');
INSERT INTO `sys_china_area` VALUES (210682, 210600, '凤城市', '3');
INSERT INTO `sys_china_area` VALUES (210700, 210000, '锦州市', '2');
INSERT INTO `sys_china_area` VALUES (210702, 210700, '古塔区', '3');
INSERT INTO `sys_china_area` VALUES (210703, 210700, '凌河区', '3');
INSERT INTO `sys_china_area` VALUES (210711, 210700, '太和区', '3');
INSERT INTO `sys_china_area` VALUES (210726, 210700, '黑山县', '3');
INSERT INTO `sys_china_area` VALUES (210727, 210700, '义县', '3');
INSERT INTO `sys_china_area` VALUES (210781, 210700, '凌海市', '3');
INSERT INTO `sys_china_area` VALUES (210782, 210700, '北镇市', '3');
INSERT INTO `sys_china_area` VALUES (210800, 210000, '营口市', '2');
INSERT INTO `sys_china_area` VALUES (210802, 210800, '站前区', '3');
INSERT INTO `sys_china_area` VALUES (210803, 210800, '西市区', '3');
INSERT INTO `sys_china_area` VALUES (210804, 210800, '鲅鱼圈区', '3');
INSERT INTO `sys_china_area` VALUES (210811, 210800, '老边区', '3');
INSERT INTO `sys_china_area` VALUES (210881, 210800, '盖州市', '3');
INSERT INTO `sys_china_area` VALUES (210882, 210800, '大石桥市', '3');
INSERT INTO `sys_china_area` VALUES (210900, 210000, '阜新市', '2');
INSERT INTO `sys_china_area` VALUES (210902, 210900, '海州区', '3');
INSERT INTO `sys_china_area` VALUES (210903, 210900, '新邱区', '3');
INSERT INTO `sys_china_area` VALUES (210904, 210900, '太平区', '3');
INSERT INTO `sys_china_area` VALUES (210905, 210900, '清河门区', '3');
INSERT INTO `sys_china_area` VALUES (210911, 210900, '细河区', '3');
INSERT INTO `sys_china_area` VALUES (210921, 210900, '阜新蒙古族自治县', '3');
INSERT INTO `sys_china_area` VALUES (210922, 210900, '彰武县', '3');
INSERT INTO `sys_china_area` VALUES (211000, 210000, '辽阳市', '2');
INSERT INTO `sys_china_area` VALUES (211002, 211000, '白塔区', '3');
INSERT INTO `sys_china_area` VALUES (211003, 211000, '文圣区', '3');
INSERT INTO `sys_china_area` VALUES (211004, 211000, '宏伟区', '3');
INSERT INTO `sys_china_area` VALUES (211005, 211000, '弓长岭区', '3');
INSERT INTO `sys_china_area` VALUES (211011, 211000, '太子河区', '3');
INSERT INTO `sys_china_area` VALUES (211021, 211000, '辽阳县', '3');
INSERT INTO `sys_china_area` VALUES (211081, 211000, '灯塔市', '3');
INSERT INTO `sys_china_area` VALUES (211100, 210000, '盘锦市', '2');
INSERT INTO `sys_china_area` VALUES (211102, 211100, '双台子区', '3');
INSERT INTO `sys_china_area` VALUES (211103, 211100, '兴隆台区', '3');
INSERT INTO `sys_china_area` VALUES (211104, 211100, '大洼区', '3');
INSERT INTO `sys_china_area` VALUES (211122, 211100, '盘山县', '3');
INSERT INTO `sys_china_area` VALUES (211200, 210000, '铁岭市', '2');
INSERT INTO `sys_china_area` VALUES (211202, 211200, '银州区', '3');
INSERT INTO `sys_china_area` VALUES (211204, 211200, '清河区', '3');
INSERT INTO `sys_china_area` VALUES (211221, 211200, '铁岭县', '3');
INSERT INTO `sys_china_area` VALUES (211223, 211200, '西丰县', '3');
INSERT INTO `sys_china_area` VALUES (211224, 211200, '昌图县', '3');
INSERT INTO `sys_china_area` VALUES (211281, 211200, '调兵山市', '3');
INSERT INTO `sys_china_area` VALUES (211282, 211200, '开原市', '3');
INSERT INTO `sys_china_area` VALUES (211300, 210000, '朝阳市', '2');
INSERT INTO `sys_china_area` VALUES (211302, 211300, '双塔区', '3');
INSERT INTO `sys_china_area` VALUES (211303, 211300, '龙城区', '3');
INSERT INTO `sys_china_area` VALUES (211321, 211300, '朝阳县', '3');
INSERT INTO `sys_china_area` VALUES (211322, 211300, '建平县', '3');
INSERT INTO `sys_china_area` VALUES (211324, 211300, '喀喇沁左翼蒙古族自治县', '3');
INSERT INTO `sys_china_area` VALUES (211381, 211300, '北票市', '3');
INSERT INTO `sys_china_area` VALUES (211382, 211300, '凌源市', '3');
INSERT INTO `sys_china_area` VALUES (211400, 210000, '葫芦岛市', '2');
INSERT INTO `sys_china_area` VALUES (211402, 211400, '连山区', '3');
INSERT INTO `sys_china_area` VALUES (211403, 211400, '龙港区', '3');
INSERT INTO `sys_china_area` VALUES (211404, 211400, '南票区', '3');
INSERT INTO `sys_china_area` VALUES (211421, 211400, '绥中县', '3');
INSERT INTO `sys_china_area` VALUES (211422, 211400, '建昌县', '3');
INSERT INTO `sys_china_area` VALUES (211481, 211400, '兴城市', '3');
INSERT INTO `sys_china_area` VALUES (220000, 0, '吉林省', '1');
INSERT INTO `sys_china_area` VALUES (220100, 220000, '长春市', '2');
INSERT INTO `sys_china_area` VALUES (220102, 220100, '南关区', '3');
INSERT INTO `sys_china_area` VALUES (220103, 220100, '宽城区', '3');
INSERT INTO `sys_china_area` VALUES (220104, 220100, '朝阳区', '3');
INSERT INTO `sys_china_area` VALUES (220105, 220100, '二道区', '3');
INSERT INTO `sys_china_area` VALUES (220106, 220100, '绿园区', '3');
INSERT INTO `sys_china_area` VALUES (220112, 220100, '双阳区', '3');
INSERT INTO `sys_china_area` VALUES (220113, 220100, '九台区', '3');
INSERT INTO `sys_china_area` VALUES (220122, 220100, '农安县', '3');
INSERT INTO `sys_china_area` VALUES (220182, 220100, '榆树市', '3');
INSERT INTO `sys_china_area` VALUES (220183, 220100, '德惠市', '3');
INSERT INTO `sys_china_area` VALUES (220200, 220000, '吉林市', '2');
INSERT INTO `sys_china_area` VALUES (220202, 220200, '昌邑区', '3');
INSERT INTO `sys_china_area` VALUES (220203, 220200, '龙潭区', '3');
INSERT INTO `sys_china_area` VALUES (220204, 220200, '船营区', '3');
INSERT INTO `sys_china_area` VALUES (220211, 220200, '丰满区', '3');
INSERT INTO `sys_china_area` VALUES (220221, 220200, '永吉县', '3');
INSERT INTO `sys_china_area` VALUES (220281, 220200, '蛟河市', '3');
INSERT INTO `sys_china_area` VALUES (220282, 220200, '桦甸市', '3');
INSERT INTO `sys_china_area` VALUES (220283, 220200, '舒兰市', '3');
INSERT INTO `sys_china_area` VALUES (220284, 220200, '磐石市', '3');
INSERT INTO `sys_china_area` VALUES (220300, 220000, '四平市', '2');
INSERT INTO `sys_china_area` VALUES (220302, 220300, '铁西区', '3');
INSERT INTO `sys_china_area` VALUES (220303, 220300, '铁东区', '3');
INSERT INTO `sys_china_area` VALUES (220322, 220300, '梨树县', '3');
INSERT INTO `sys_china_area` VALUES (220323, 220300, '伊通满族自治县', '3');
INSERT INTO `sys_china_area` VALUES (220381, 220300, '公主岭市', '3');
INSERT INTO `sys_china_area` VALUES (220382, 220300, '双辽市', '3');
INSERT INTO `sys_china_area` VALUES (220400, 220000, '辽源市', '2');
INSERT INTO `sys_china_area` VALUES (220402, 220400, '龙山区', '3');
INSERT INTO `sys_china_area` VALUES (220403, 220400, '西安区', '3');
INSERT INTO `sys_china_area` VALUES (220421, 220400, '东丰县', '3');
INSERT INTO `sys_china_area` VALUES (220422, 220400, '东辽县', '3');
INSERT INTO `sys_china_area` VALUES (220500, 220000, '通化市', '2');
INSERT INTO `sys_china_area` VALUES (220502, 220500, '东昌区', '3');
INSERT INTO `sys_china_area` VALUES (220503, 220500, '二道江区', '3');
INSERT INTO `sys_china_area` VALUES (220521, 220500, '通化县', '3');
INSERT INTO `sys_china_area` VALUES (220523, 220500, '辉南县', '3');
INSERT INTO `sys_china_area` VALUES (220524, 220500, '柳河县', '3');
INSERT INTO `sys_china_area` VALUES (220581, 220500, '梅河口市', '3');
INSERT INTO `sys_china_area` VALUES (220582, 220500, '集安市', '3');
INSERT INTO `sys_china_area` VALUES (220600, 220000, '白山市', '2');
INSERT INTO `sys_china_area` VALUES (220602, 220600, '浑江区', '3');
INSERT INTO `sys_china_area` VALUES (220605, 220600, '江源区', '3');
INSERT INTO `sys_china_area` VALUES (220621, 220600, '抚松县', '3');
INSERT INTO `sys_china_area` VALUES (220622, 220600, '靖宇县', '3');
INSERT INTO `sys_china_area` VALUES (220623, 220600, '长白朝鲜族自治县', '3');
INSERT INTO `sys_china_area` VALUES (220681, 220600, '临江市', '3');
INSERT INTO `sys_china_area` VALUES (220700, 220000, '松原市', '2');
INSERT INTO `sys_china_area` VALUES (220702, 220700, '宁江区', '3');
INSERT INTO `sys_china_area` VALUES (220721, 220700, '前郭尔罗斯蒙古族自治县', '3');
INSERT INTO `sys_china_area` VALUES (220722, 220700, '长岭县', '3');
INSERT INTO `sys_china_area` VALUES (220723, 220700, '乾安县', '3');
INSERT INTO `sys_china_area` VALUES (220781, 220700, '扶余市', '3');
INSERT INTO `sys_china_area` VALUES (220800, 220000, '白城市', '2');
INSERT INTO `sys_china_area` VALUES (220802, 220800, '洮北区', '3');
INSERT INTO `sys_china_area` VALUES (220821, 220800, '镇赉县', '3');
INSERT INTO `sys_china_area` VALUES (220822, 220800, '通榆县', '3');
INSERT INTO `sys_china_area` VALUES (220881, 220800, '洮南市', '3');
INSERT INTO `sys_china_area` VALUES (220882, 220800, '大安市', '3');
INSERT INTO `sys_china_area` VALUES (222400, 220000, '延边朝鲜族自治州', '2');
INSERT INTO `sys_china_area` VALUES (222401, 222400, '延吉市', '3');
INSERT INTO `sys_china_area` VALUES (222402, 222400, '图们市', '3');
INSERT INTO `sys_china_area` VALUES (222403, 222400, '敦化市', '3');
INSERT INTO `sys_china_area` VALUES (222404, 222400, '珲春市', '3');
INSERT INTO `sys_china_area` VALUES (222405, 222400, '龙井市', '3');
INSERT INTO `sys_china_area` VALUES (222406, 222400, '和龙市', '3');
INSERT INTO `sys_china_area` VALUES (222424, 222400, '汪清县', '3');
INSERT INTO `sys_china_area` VALUES (222426, 222400, '安图县', '3');
INSERT INTO `sys_china_area` VALUES (230000, 0, '黑龙江省', '1');
INSERT INTO `sys_china_area` VALUES (230100, 230000, '哈尔滨市', '2');
INSERT INTO `sys_china_area` VALUES (230102, 230100, '道里区', '3');
INSERT INTO `sys_china_area` VALUES (230103, 230100, '南岗区', '3');
INSERT INTO `sys_china_area` VALUES (230104, 230100, '道外区', '3');
INSERT INTO `sys_china_area` VALUES (230108, 230100, '平房区', '3');
INSERT INTO `sys_china_area` VALUES (230109, 230100, '松北区', '3');
INSERT INTO `sys_china_area` VALUES (230110, 230100, '香坊区', '3');
INSERT INTO `sys_china_area` VALUES (230111, 230100, '呼兰区', '3');
INSERT INTO `sys_china_area` VALUES (230112, 230100, '阿城区', '3');
INSERT INTO `sys_china_area` VALUES (230113, 230100, '双城区', '3');
INSERT INTO `sys_china_area` VALUES (230123, 230100, '依兰县', '3');
INSERT INTO `sys_china_area` VALUES (230124, 230100, '方正县', '3');
INSERT INTO `sys_china_area` VALUES (230125, 230100, '宾县', '3');
INSERT INTO `sys_china_area` VALUES (230126, 230100, '巴彦县', '3');
INSERT INTO `sys_china_area` VALUES (230127, 230100, '木兰县', '3');
INSERT INTO `sys_china_area` VALUES (230128, 230100, '通河县', '3');
INSERT INTO `sys_china_area` VALUES (230129, 230100, '延寿县', '3');
INSERT INTO `sys_china_area` VALUES (230183, 230100, '尚志市', '3');
INSERT INTO `sys_china_area` VALUES (230184, 230100, '五常市', '3');
INSERT INTO `sys_china_area` VALUES (230200, 230000, '齐齐哈尔市', '2');
INSERT INTO `sys_china_area` VALUES (230202, 230200, '龙沙区', '3');
INSERT INTO `sys_china_area` VALUES (230203, 230200, '建华区', '3');
INSERT INTO `sys_china_area` VALUES (230204, 230200, '铁锋区', '3');
INSERT INTO `sys_china_area` VALUES (230205, 230200, '昂昂溪区', '3');
INSERT INTO `sys_china_area` VALUES (230206, 230200, '富拉尔基区', '3');
INSERT INTO `sys_china_area` VALUES (230207, 230200, '碾子山区', '3');
INSERT INTO `sys_china_area` VALUES (230208, 230200, '梅里斯达斡尔族区', '3');
INSERT INTO `sys_china_area` VALUES (230221, 230200, '龙江县', '3');
INSERT INTO `sys_china_area` VALUES (230223, 230200, '依安县', '3');
INSERT INTO `sys_china_area` VALUES (230224, 230200, '泰来县', '3');
INSERT INTO `sys_china_area` VALUES (230225, 230200, '甘南县', '3');
INSERT INTO `sys_china_area` VALUES (230227, 230200, '富裕县', '3');
INSERT INTO `sys_china_area` VALUES (230229, 230200, '克山县', '3');
INSERT INTO `sys_china_area` VALUES (230230, 230200, '克东县', '3');
INSERT INTO `sys_china_area` VALUES (230231, 230200, '拜泉县', '3');
INSERT INTO `sys_china_area` VALUES (230281, 230200, '讷河市', '3');
INSERT INTO `sys_china_area` VALUES (230300, 230000, '鸡西市', '2');
INSERT INTO `sys_china_area` VALUES (230302, 230300, '鸡冠区', '3');
INSERT INTO `sys_china_area` VALUES (230303, 230300, '恒山区', '3');
INSERT INTO `sys_china_area` VALUES (230304, 230300, '滴道区', '3');
INSERT INTO `sys_china_area` VALUES (230305, 230300, '梨树区', '3');
INSERT INTO `sys_china_area` VALUES (230306, 230300, '城子河区', '3');
INSERT INTO `sys_china_area` VALUES (230307, 230300, '麻山区', '3');
INSERT INTO `sys_china_area` VALUES (230321, 230300, '鸡东县', '3');
INSERT INTO `sys_china_area` VALUES (230381, 230300, '虎林市', '3');
INSERT INTO `sys_china_area` VALUES (230382, 230300, '密山市', '3');
INSERT INTO `sys_china_area` VALUES (230400, 230000, '鹤岗市', '2');
INSERT INTO `sys_china_area` VALUES (230402, 230400, '向阳区', '3');
INSERT INTO `sys_china_area` VALUES (230403, 230400, '工农区', '3');
INSERT INTO `sys_china_area` VALUES (230404, 230400, '南山区', '3');
INSERT INTO `sys_china_area` VALUES (230405, 230400, '兴安区', '3');
INSERT INTO `sys_china_area` VALUES (230406, 230400, '东山区', '3');
INSERT INTO `sys_china_area` VALUES (230407, 230400, '兴山区', '3');
INSERT INTO `sys_china_area` VALUES (230421, 230400, '萝北县', '3');
INSERT INTO `sys_china_area` VALUES (230422, 230400, '绥滨县', '3');
INSERT INTO `sys_china_area` VALUES (230500, 230000, '双鸭山市', '2');
INSERT INTO `sys_china_area` VALUES (230502, 230500, '尖山区', '3');
INSERT INTO `sys_china_area` VALUES (230503, 230500, '岭东区', '3');
INSERT INTO `sys_china_area` VALUES (230505, 230500, '四方台区', '3');
INSERT INTO `sys_china_area` VALUES (230506, 230500, '宝山区', '3');
INSERT INTO `sys_china_area` VALUES (230521, 230500, '集贤县', '3');
INSERT INTO `sys_china_area` VALUES (230522, 230500, '友谊县', '3');
INSERT INTO `sys_china_area` VALUES (230523, 230500, '宝清县', '3');
INSERT INTO `sys_china_area` VALUES (230524, 230500, '饶河县', '3');
INSERT INTO `sys_china_area` VALUES (230600, 230000, '大庆市', '2');
INSERT INTO `sys_china_area` VALUES (230602, 230600, '萨尔图区', '3');
INSERT INTO `sys_china_area` VALUES (230603, 230600, '龙凤区', '3');
INSERT INTO `sys_china_area` VALUES (230604, 230600, '让胡路区', '3');
INSERT INTO `sys_china_area` VALUES (230605, 230600, '红岗区', '3');
INSERT INTO `sys_china_area` VALUES (230606, 230600, '大同区', '3');
INSERT INTO `sys_china_area` VALUES (230621, 230600, '肇州县', '3');
INSERT INTO `sys_china_area` VALUES (230622, 230600, '肇源县', '3');
INSERT INTO `sys_china_area` VALUES (230623, 230600, '林甸县', '3');
INSERT INTO `sys_china_area` VALUES (230624, 230600, '杜尔伯特蒙古族自治县', '3');
INSERT INTO `sys_china_area` VALUES (230700, 230000, '伊春市', '2');
INSERT INTO `sys_china_area` VALUES (230717, 230700, '伊美区', '3');
INSERT INTO `sys_china_area` VALUES (230718, 230700, '乌翠区', '3');
INSERT INTO `sys_china_area` VALUES (230719, 230700, '友好区', '3');
INSERT INTO `sys_china_area` VALUES (230722, 230700, '嘉荫县', '3');
INSERT INTO `sys_china_area` VALUES (230723, 230700, '汤旺县', '3');
INSERT INTO `sys_china_area` VALUES (230724, 230700, '丰林县', '3');
INSERT INTO `sys_china_area` VALUES (230725, 230700, '大箐山县', '3');
INSERT INTO `sys_china_area` VALUES (230726, 230700, '南岔县', '3');
INSERT INTO `sys_china_area` VALUES (230751, 230700, '金林区', '3');
INSERT INTO `sys_china_area` VALUES (230781, 230700, '铁力市', '3');
INSERT INTO `sys_china_area` VALUES (230800, 230000, '佳木斯市', '2');
INSERT INTO `sys_china_area` VALUES (230803, 230800, '向阳区', '3');
INSERT INTO `sys_china_area` VALUES (230804, 230800, '前进区', '3');
INSERT INTO `sys_china_area` VALUES (230805, 230800, '东风区', '3');
INSERT INTO `sys_china_area` VALUES (230811, 230800, '郊区', '3');
INSERT INTO `sys_china_area` VALUES (230822, 230800, '桦南县', '3');
INSERT INTO `sys_china_area` VALUES (230826, 230800, '桦川县', '3');
INSERT INTO `sys_china_area` VALUES (230828, 230800, '汤原县', '3');
INSERT INTO `sys_china_area` VALUES (230881, 230800, '同江市', '3');
INSERT INTO `sys_china_area` VALUES (230882, 230800, '富锦市', '3');
INSERT INTO `sys_china_area` VALUES (230883, 230800, '抚远市', '3');
INSERT INTO `sys_china_area` VALUES (230900, 230000, '七台河市', '2');
INSERT INTO `sys_china_area` VALUES (230902, 230900, '新兴区', '3');
INSERT INTO `sys_china_area` VALUES (230903, 230900, '桃山区', '3');
INSERT INTO `sys_china_area` VALUES (230904, 230900, '茄子河区', '3');
INSERT INTO `sys_china_area` VALUES (230921, 230900, '勃利县', '3');
INSERT INTO `sys_china_area` VALUES (231000, 230000, '牡丹江市', '2');
INSERT INTO `sys_china_area` VALUES (231002, 231000, '东安区', '3');
INSERT INTO `sys_china_area` VALUES (231003, 231000, '阳明区', '3');
INSERT INTO `sys_china_area` VALUES (231004, 231000, '爱民区', '3');
INSERT INTO `sys_china_area` VALUES (231005, 231000, '西安区', '3');
INSERT INTO `sys_china_area` VALUES (231025, 231000, '林口县', '3');
INSERT INTO `sys_china_area` VALUES (231081, 231000, '绥芬河市', '3');
INSERT INTO `sys_china_area` VALUES (231083, 231000, '海林市', '3');
INSERT INTO `sys_china_area` VALUES (231084, 231000, '宁安市', '3');
INSERT INTO `sys_china_area` VALUES (231085, 231000, '穆棱市', '3');
INSERT INTO `sys_china_area` VALUES (231086, 231000, '东宁市', '3');
INSERT INTO `sys_china_area` VALUES (231100, 230000, '黑河市', '2');
INSERT INTO `sys_china_area` VALUES (231102, 231100, '爱辉区', '3');
INSERT INTO `sys_china_area` VALUES (231123, 231100, '逊克县', '3');
INSERT INTO `sys_china_area` VALUES (231124, 231100, '孙吴县', '3');
INSERT INTO `sys_china_area` VALUES (231181, 231100, '北安市', '3');
INSERT INTO `sys_china_area` VALUES (231182, 231100, '五大连池市', '3');
INSERT INTO `sys_china_area` VALUES (231183, 231100, '嫩江市', '3');
INSERT INTO `sys_china_area` VALUES (231200, 230000, '绥化市', '2');
INSERT INTO `sys_china_area` VALUES (231202, 231200, '北林区', '3');
INSERT INTO `sys_china_area` VALUES (231221, 231200, '望奎县', '3');
INSERT INTO `sys_china_area` VALUES (231222, 231200, '兰西县', '3');
INSERT INTO `sys_china_area` VALUES (231223, 231200, '青冈县', '3');
INSERT INTO `sys_china_area` VALUES (231224, 231200, '庆安县', '3');
INSERT INTO `sys_china_area` VALUES (231225, 231200, '明水县', '3');
INSERT INTO `sys_china_area` VALUES (231226, 231200, '绥棱县', '3');
INSERT INTO `sys_china_area` VALUES (231281, 231200, '安达市', '3');
INSERT INTO `sys_china_area` VALUES (231282, 231200, '肇东市', '3');
INSERT INTO `sys_china_area` VALUES (231283, 231200, '海伦市', '3');
INSERT INTO `sys_china_area` VALUES (232700, 230000, '大兴安岭地区', '2');
INSERT INTO `sys_china_area` VALUES (232701, 232700, '漠河市', '3');
INSERT INTO `sys_china_area` VALUES (232721, 232700, '呼玛县', '3');
INSERT INTO `sys_china_area` VALUES (232722, 232700, '塔河县', '3');
INSERT INTO `sys_china_area` VALUES (310000, 0, '上海市', '1');
INSERT INTO `sys_china_area` VALUES (310101, 310000, '黄浦区', '3');
INSERT INTO `sys_china_area` VALUES (310104, 310000, '徐汇区', '3');
INSERT INTO `sys_china_area` VALUES (310105, 310000, '长宁区', '3');
INSERT INTO `sys_china_area` VALUES (310106, 310000, '静安区', '3');
INSERT INTO `sys_china_area` VALUES (310107, 310000, '普陀区', '3');
INSERT INTO `sys_china_area` VALUES (310109, 310000, '虹口区', '3');
INSERT INTO `sys_china_area` VALUES (310110, 310000, '杨浦区', '3');
INSERT INTO `sys_china_area` VALUES (310112, 310000, '闵行区', '3');
INSERT INTO `sys_china_area` VALUES (310113, 310000, '宝山区', '3');
INSERT INTO `sys_china_area` VALUES (310114, 310000, '嘉定区', '3');
INSERT INTO `sys_china_area` VALUES (310115, 310000, '浦东新区', '3');
INSERT INTO `sys_china_area` VALUES (310116, 310000, '金山区', '3');
INSERT INTO `sys_china_area` VALUES (310117, 310000, '松江区', '3');
INSERT INTO `sys_china_area` VALUES (310118, 310000, '青浦区', '3');
INSERT INTO `sys_china_area` VALUES (310120, 310000, '奉贤区', '3');
INSERT INTO `sys_china_area` VALUES (310151, 310000, '崇明区', '3');
INSERT INTO `sys_china_area` VALUES (320000, 0, '江苏省', '1');
INSERT INTO `sys_china_area` VALUES (320100, 320000, '南京市', '2');
INSERT INTO `sys_china_area` VALUES (320102, 320100, '玄武区', '3');
INSERT INTO `sys_china_area` VALUES (320104, 320100, '秦淮区', '3');
INSERT INTO `sys_china_area` VALUES (320105, 320100, '建邺区', '3');
INSERT INTO `sys_china_area` VALUES (320106, 320100, '鼓楼区', '3');
INSERT INTO `sys_china_area` VALUES (320111, 320100, '浦口区', '3');
INSERT INTO `sys_china_area` VALUES (320113, 320100, '栖霞区', '3');
INSERT INTO `sys_china_area` VALUES (320114, 320100, '雨花台区', '3');
INSERT INTO `sys_china_area` VALUES (320115, 320100, '江宁区', '3');
INSERT INTO `sys_china_area` VALUES (320116, 320100, '六合区', '3');
INSERT INTO `sys_china_area` VALUES (320117, 320100, '溧水区', '3');
INSERT INTO `sys_china_area` VALUES (320118, 320100, '高淳区', '3');
INSERT INTO `sys_china_area` VALUES (320200, 320000, '无锡市', '2');
INSERT INTO `sys_china_area` VALUES (320205, 320200, '锡山区', '3');
INSERT INTO `sys_china_area` VALUES (320206, 320200, '惠山区', '3');
INSERT INTO `sys_china_area` VALUES (320211, 320200, '滨湖区', '3');
INSERT INTO `sys_china_area` VALUES (320213, 320200, '梁溪区', '3');
INSERT INTO `sys_china_area` VALUES (320214, 320200, '新吴区', '3');
INSERT INTO `sys_china_area` VALUES (320281, 320200, '江阴市', '3');
INSERT INTO `sys_china_area` VALUES (320282, 320200, '宜兴市', '3');
INSERT INTO `sys_china_area` VALUES (320300, 320000, '徐州市', '2');
INSERT INTO `sys_china_area` VALUES (320302, 320300, '鼓楼区', '3');
INSERT INTO `sys_china_area` VALUES (320303, 320300, '云龙区', '3');
INSERT INTO `sys_china_area` VALUES (320305, 320300, '贾汪区', '3');
INSERT INTO `sys_china_area` VALUES (320311, 320300, '泉山区', '3');
INSERT INTO `sys_china_area` VALUES (320312, 320300, '铜山区', '3');
INSERT INTO `sys_china_area` VALUES (320321, 320300, '丰县', '3');
INSERT INTO `sys_china_area` VALUES (320322, 320300, '沛县', '3');
INSERT INTO `sys_china_area` VALUES (320324, 320300, '睢宁县', '3');
INSERT INTO `sys_china_area` VALUES (320381, 320300, '新沂市', '3');
INSERT INTO `sys_china_area` VALUES (320382, 320300, '邳州市', '3');
INSERT INTO `sys_china_area` VALUES (320400, 320000, '常州市', '2');
INSERT INTO `sys_china_area` VALUES (320402, 320400, '天宁区', '3');
INSERT INTO `sys_china_area` VALUES (320404, 320400, '钟楼区', '3');
INSERT INTO `sys_china_area` VALUES (320411, 320400, '新北区', '3');
INSERT INTO `sys_china_area` VALUES (320412, 320400, '武进区', '3');
INSERT INTO `sys_china_area` VALUES (320413, 320400, '金坛区', '3');
INSERT INTO `sys_china_area` VALUES (320481, 320400, '溧阳市', '3');
INSERT INTO `sys_china_area` VALUES (320500, 320000, '苏州市', '2');
INSERT INTO `sys_china_area` VALUES (320505, 320500, '虎丘区', '3');
INSERT INTO `sys_china_area` VALUES (320506, 320500, '吴中区', '3');
INSERT INTO `sys_china_area` VALUES (320507, 320500, '相城区', '3');
INSERT INTO `sys_china_area` VALUES (320508, 320500, '姑苏区', '3');
INSERT INTO `sys_china_area` VALUES (320509, 320500, '吴江区', '3');
INSERT INTO `sys_china_area` VALUES (320581, 320500, '常熟市', '3');
INSERT INTO `sys_china_area` VALUES (320582, 320500, '张家港市', '3');
INSERT INTO `sys_china_area` VALUES (320583, 320500, '昆山市', '3');
INSERT INTO `sys_china_area` VALUES (320585, 320500, '太仓市', '3');
INSERT INTO `sys_china_area` VALUES (320600, 320000, '南通市', '2');
INSERT INTO `sys_china_area` VALUES (320602, 320600, '崇川区', '3');
INSERT INTO `sys_china_area` VALUES (320611, 320600, '港闸区', '3');
INSERT INTO `sys_china_area` VALUES (320612, 320600, '通州区', '3');
INSERT INTO `sys_china_area` VALUES (320623, 320600, '如东县', '3');
INSERT INTO `sys_china_area` VALUES (320681, 320600, '启东市', '3');
INSERT INTO `sys_china_area` VALUES (320682, 320600, '如皋市', '3');
INSERT INTO `sys_china_area` VALUES (320684, 320600, '海门市', '3');
INSERT INTO `sys_china_area` VALUES (320685, 320600, '海安市', '3');
INSERT INTO `sys_china_area` VALUES (320700, 320000, '连云港市', '2');
INSERT INTO `sys_china_area` VALUES (320703, 320700, '连云区', '3');
INSERT INTO `sys_china_area` VALUES (320706, 320700, '海州区', '3');
INSERT INTO `sys_china_area` VALUES (320707, 320700, '赣榆区', '3');
INSERT INTO `sys_china_area` VALUES (320722, 320700, '东海县', '3');
INSERT INTO `sys_china_area` VALUES (320723, 320700, '灌云县', '3');
INSERT INTO `sys_china_area` VALUES (320724, 320700, '灌南县', '3');
INSERT INTO `sys_china_area` VALUES (320800, 320000, '淮安市', '2');
INSERT INTO `sys_china_area` VALUES (320803, 320800, '淮安区', '3');
INSERT INTO `sys_china_area` VALUES (320804, 320800, '淮阴区', '3');
INSERT INTO `sys_china_area` VALUES (320812, 320800, '清江浦区', '3');
INSERT INTO `sys_china_area` VALUES (320813, 320800, '洪泽区', '3');
INSERT INTO `sys_china_area` VALUES (320826, 320800, '涟水县', '3');
INSERT INTO `sys_china_area` VALUES (320830, 320800, '盱眙县', '3');
INSERT INTO `sys_china_area` VALUES (320831, 320800, '金湖县', '3');
INSERT INTO `sys_china_area` VALUES (320900, 320000, '盐城市', '2');
INSERT INTO `sys_china_area` VALUES (320902, 320900, '亭湖区', '3');
INSERT INTO `sys_china_area` VALUES (320903, 320900, '盐都区', '3');
INSERT INTO `sys_china_area` VALUES (320904, 320900, '大丰区', '3');
INSERT INTO `sys_china_area` VALUES (320921, 320900, '响水县', '3');
INSERT INTO `sys_china_area` VALUES (320922, 320900, '滨海县', '3');
INSERT INTO `sys_china_area` VALUES (320923, 320900, '阜宁县', '3');
INSERT INTO `sys_china_area` VALUES (320924, 320900, '射阳县', '3');
INSERT INTO `sys_china_area` VALUES (320925, 320900, '建湖县', '3');
INSERT INTO `sys_china_area` VALUES (320981, 320900, '东台市', '3');
INSERT INTO `sys_china_area` VALUES (321000, 320000, '扬州市', '2');
INSERT INTO `sys_china_area` VALUES (321002, 321000, '广陵区', '3');
INSERT INTO `sys_china_area` VALUES (321003, 321000, '邗江区', '3');
INSERT INTO `sys_china_area` VALUES (321012, 321000, '江都区', '3');
INSERT INTO `sys_china_area` VALUES (321023, 321000, '宝应县', '3');
INSERT INTO `sys_china_area` VALUES (321081, 321000, '仪征市', '3');
INSERT INTO `sys_china_area` VALUES (321084, 321000, '高邮市', '3');
INSERT INTO `sys_china_area` VALUES (321100, 320000, '镇江市', '2');
INSERT INTO `sys_china_area` VALUES (321102, 321100, '京口区', '3');
INSERT INTO `sys_china_area` VALUES (321111, 321100, '润州区', '3');
INSERT INTO `sys_china_area` VALUES (321112, 321100, '丹徒区', '3');
INSERT INTO `sys_china_area` VALUES (321181, 321100, '丹阳市', '3');
INSERT INTO `sys_china_area` VALUES (321182, 321100, '扬中市', '3');
INSERT INTO `sys_china_area` VALUES (321183, 321100, '句容市', '3');
INSERT INTO `sys_china_area` VALUES (321200, 320000, '泰州市', '2');
INSERT INTO `sys_china_area` VALUES (321202, 321200, '海陵区', '3');
INSERT INTO `sys_china_area` VALUES (321203, 321200, '高港区', '3');
INSERT INTO `sys_china_area` VALUES (321204, 321200, '姜堰区', '3');
INSERT INTO `sys_china_area` VALUES (321281, 321200, '兴化市', '3');
INSERT INTO `sys_china_area` VALUES (321282, 321200, '靖江市', '3');
INSERT INTO `sys_china_area` VALUES (321283, 321200, '泰兴市', '3');
INSERT INTO `sys_china_area` VALUES (321300, 320000, '宿迁市', '2');
INSERT INTO `sys_china_area` VALUES (321302, 321300, '宿城区', '3');
INSERT INTO `sys_china_area` VALUES (321311, 321300, '宿豫区', '3');
INSERT INTO `sys_china_area` VALUES (321322, 321300, '沭阳县', '3');
INSERT INTO `sys_china_area` VALUES (321323, 321300, '泗阳县', '3');
INSERT INTO `sys_china_area` VALUES (321324, 321300, '泗洪县', '3');
INSERT INTO `sys_china_area` VALUES (330000, 0, '浙江省', '1');
INSERT INTO `sys_china_area` VALUES (330100, 330000, '杭州市', '2');
INSERT INTO `sys_china_area` VALUES (330102, 330100, '上城区', '3');
INSERT INTO `sys_china_area` VALUES (330103, 330100, '下城区', '3');
INSERT INTO `sys_china_area` VALUES (330104, 330100, '江干区', '3');
INSERT INTO `sys_china_area` VALUES (330105, 330100, '拱墅区', '3');
INSERT INTO `sys_china_area` VALUES (330106, 330100, '西湖区', '3');
INSERT INTO `sys_china_area` VALUES (330108, 330100, '滨江区', '3');
INSERT INTO `sys_china_area` VALUES (330109, 330100, '萧山区', '3');
INSERT INTO `sys_china_area` VALUES (330110, 330100, '余杭区', '3');
INSERT INTO `sys_china_area` VALUES (330111, 330100, '富阳区', '3');
INSERT INTO `sys_china_area` VALUES (330112, 330100, '临安区', '3');
INSERT INTO `sys_china_area` VALUES (330122, 330100, '桐庐县', '3');
INSERT INTO `sys_china_area` VALUES (330127, 330100, '淳安县', '3');
INSERT INTO `sys_china_area` VALUES (330182, 330100, '建德市', '3');
INSERT INTO `sys_china_area` VALUES (330200, 330000, '宁波市', '2');
INSERT INTO `sys_china_area` VALUES (330203, 330200, '海曙区', '3');
INSERT INTO `sys_china_area` VALUES (330205, 330200, '江北区', '3');
INSERT INTO `sys_china_area` VALUES (330206, 330200, '北仑区', '3');
INSERT INTO `sys_china_area` VALUES (330211, 330200, '镇海区', '3');
INSERT INTO `sys_china_area` VALUES (330212, 330200, '鄞州区', '3');
INSERT INTO `sys_china_area` VALUES (330213, 330200, '奉化区', '3');
INSERT INTO `sys_china_area` VALUES (330225, 330200, '象山县', '3');
INSERT INTO `sys_china_area` VALUES (330226, 330200, '宁海县', '3');
INSERT INTO `sys_china_area` VALUES (330281, 330200, '余姚市', '3');
INSERT INTO `sys_china_area` VALUES (330282, 330200, '慈溪市', '3');
INSERT INTO `sys_china_area` VALUES (330300, 330000, '温州市', '2');
INSERT INTO `sys_china_area` VALUES (330302, 330300, '鹿城区', '3');
INSERT INTO `sys_china_area` VALUES (330303, 330300, '龙湾区', '3');
INSERT INTO `sys_china_area` VALUES (330304, 330300, '瓯海区', '3');
INSERT INTO `sys_china_area` VALUES (330305, 330300, '洞头区', '3');
INSERT INTO `sys_china_area` VALUES (330324, 330300, '永嘉县', '3');
INSERT INTO `sys_china_area` VALUES (330326, 330300, '平阳县', '3');
INSERT INTO `sys_china_area` VALUES (330327, 330300, '苍南县', '3');
INSERT INTO `sys_china_area` VALUES (330328, 330300, '文成县', '3');
INSERT INTO `sys_china_area` VALUES (330329, 330300, '泰顺县', '3');
INSERT INTO `sys_china_area` VALUES (330381, 330300, '瑞安市', '3');
INSERT INTO `sys_china_area` VALUES (330382, 330300, '乐清市', '3');
INSERT INTO `sys_china_area` VALUES (330383, 330300, '龙港市', '3');
INSERT INTO `sys_china_area` VALUES (330400, 330000, '嘉兴市', '2');
INSERT INTO `sys_china_area` VALUES (330402, 330400, '南湖区', '3');
INSERT INTO `sys_china_area` VALUES (330411, 330400, '秀洲区', '3');
INSERT INTO `sys_china_area` VALUES (330421, 330400, '嘉善县', '3');
INSERT INTO `sys_china_area` VALUES (330424, 330400, '海盐县', '3');
INSERT INTO `sys_china_area` VALUES (330481, 330400, '海宁市', '3');
INSERT INTO `sys_china_area` VALUES (330482, 330400, '平湖市', '3');
INSERT INTO `sys_china_area` VALUES (330483, 330400, '桐乡市', '3');
INSERT INTO `sys_china_area` VALUES (330500, 330000, '湖州市', '2');
INSERT INTO `sys_china_area` VALUES (330502, 330500, '吴兴区', '3');
INSERT INTO `sys_china_area` VALUES (330503, 330500, '南浔区', '3');
INSERT INTO `sys_china_area` VALUES (330521, 330500, '德清县', '3');
INSERT INTO `sys_china_area` VALUES (330522, 330500, '长兴县', '3');
INSERT INTO `sys_china_area` VALUES (330523, 330500, '安吉县', '3');
INSERT INTO `sys_china_area` VALUES (330600, 330000, '绍兴市', '2');
INSERT INTO `sys_china_area` VALUES (330602, 330600, '越城区', '3');
INSERT INTO `sys_china_area` VALUES (330603, 330600, '柯桥区', '3');
INSERT INTO `sys_china_area` VALUES (330604, 330600, '上虞区', '3');
INSERT INTO `sys_china_area` VALUES (330624, 330600, '新昌县', '3');
INSERT INTO `sys_china_area` VALUES (330681, 330600, '诸暨市', '3');
INSERT INTO `sys_china_area` VALUES (330683, 330600, '嵊州市', '3');
INSERT INTO `sys_china_area` VALUES (330700, 330000, '金华市', '2');
INSERT INTO `sys_china_area` VALUES (330702, 330700, '婺城区', '3');
INSERT INTO `sys_china_area` VALUES (330703, 330700, '金东区', '3');
INSERT INTO `sys_china_area` VALUES (330723, 330700, '武义县', '3');
INSERT INTO `sys_china_area` VALUES (330726, 330700, '浦江县', '3');
INSERT INTO `sys_china_area` VALUES (330727, 330700, '磐安县', '3');
INSERT INTO `sys_china_area` VALUES (330781, 330700, '兰溪市', '3');
INSERT INTO `sys_china_area` VALUES (330782, 330700, '义乌市', '3');
INSERT INTO `sys_china_area` VALUES (330783, 330700, '东阳市', '3');
INSERT INTO `sys_china_area` VALUES (330784, 330700, '永康市', '3');
INSERT INTO `sys_china_area` VALUES (330800, 330000, '衢州市', '2');
INSERT INTO `sys_china_area` VALUES (330802, 330800, '柯城区', '3');
INSERT INTO `sys_china_area` VALUES (330803, 330800, '衢江区', '3');
INSERT INTO `sys_china_area` VALUES (330822, 330800, '常山县', '3');
INSERT INTO `sys_china_area` VALUES (330824, 330800, '开化县', '3');
INSERT INTO `sys_china_area` VALUES (330825, 330800, '龙游县', '3');
INSERT INTO `sys_china_area` VALUES (330881, 330800, '江山市', '3');
INSERT INTO `sys_china_area` VALUES (330900, 330000, '舟山市', '2');
INSERT INTO `sys_china_area` VALUES (330902, 330900, '定海区', '3');
INSERT INTO `sys_china_area` VALUES (330903, 330900, '普陀区', '3');
INSERT INTO `sys_china_area` VALUES (330921, 330900, '岱山县', '3');
INSERT INTO `sys_china_area` VALUES (330922, 330900, '嵊泗县', '3');
INSERT INTO `sys_china_area` VALUES (331000, 330000, '台州市', '2');
INSERT INTO `sys_china_area` VALUES (331002, 331000, '椒江区', '3');
INSERT INTO `sys_china_area` VALUES (331003, 331000, '黄岩区', '3');
INSERT INTO `sys_china_area` VALUES (331004, 331000, '路桥区', '3');
INSERT INTO `sys_china_area` VALUES (331022, 331000, '三门县', '3');
INSERT INTO `sys_china_area` VALUES (331023, 331000, '天台县', '3');
INSERT INTO `sys_china_area` VALUES (331024, 331000, '仙居县', '3');
INSERT INTO `sys_china_area` VALUES (331081, 331000, '温岭市', '3');
INSERT INTO `sys_china_area` VALUES (331082, 331000, '临海市', '3');
INSERT INTO `sys_china_area` VALUES (331083, 331000, '玉环市', '3');
INSERT INTO `sys_china_area` VALUES (331100, 330000, '丽水市', '2');
INSERT INTO `sys_china_area` VALUES (331102, 331100, '莲都区', '3');
INSERT INTO `sys_china_area` VALUES (331121, 331100, '青田县', '3');
INSERT INTO `sys_china_area` VALUES (331122, 331100, '缙云县', '3');
INSERT INTO `sys_china_area` VALUES (331123, 331100, '遂昌县', '3');
INSERT INTO `sys_china_area` VALUES (331124, 331100, '松阳县', '3');
INSERT INTO `sys_china_area` VALUES (331125, 331100, '云和县', '3');
INSERT INTO `sys_china_area` VALUES (331126, 331100, '庆元县', '3');
INSERT INTO `sys_china_area` VALUES (331127, 331100, '景宁畲族自治县', '3');
INSERT INTO `sys_china_area` VALUES (331181, 331100, '龙泉市', '3');
INSERT INTO `sys_china_area` VALUES (340000, 0, '安徽省', '1');
INSERT INTO `sys_china_area` VALUES (340100, 340000, '合肥市', '2');
INSERT INTO `sys_china_area` VALUES (340102, 340100, '瑶海区', '3');
INSERT INTO `sys_china_area` VALUES (340103, 340100, '庐阳区', '3');
INSERT INTO `sys_china_area` VALUES (340104, 340100, '蜀山区', '3');
INSERT INTO `sys_china_area` VALUES (340111, 340100, '包河区', '3');
INSERT INTO `sys_china_area` VALUES (340121, 340100, '长丰县', '3');
INSERT INTO `sys_china_area` VALUES (340122, 340100, '肥东县', '3');
INSERT INTO `sys_china_area` VALUES (340123, 340100, '肥西县', '3');
INSERT INTO `sys_china_area` VALUES (340124, 340100, '庐江县', '3');
INSERT INTO `sys_china_area` VALUES (340181, 340100, '巢湖市', '3');
INSERT INTO `sys_china_area` VALUES (340200, 340000, '芜湖市', '2');
INSERT INTO `sys_china_area` VALUES (340202, 340200, '镜湖区', '3');
INSERT INTO `sys_china_area` VALUES (340203, 340200, '弋江区', '3');
INSERT INTO `sys_china_area` VALUES (340207, 340200, '鸠江区', '3');
INSERT INTO `sys_china_area` VALUES (340208, 340200, '三山区', '3');
INSERT INTO `sys_china_area` VALUES (340221, 340200, '芜湖县', '3');
INSERT INTO `sys_china_area` VALUES (340222, 340200, '繁昌县', '3');
INSERT INTO `sys_china_area` VALUES (340223, 340200, '南陵县', '3');
INSERT INTO `sys_china_area` VALUES (340281, 340200, '无为市', '3');
INSERT INTO `sys_china_area` VALUES (340300, 340000, '蚌埠市', '2');
INSERT INTO `sys_china_area` VALUES (340302, 340300, '龙子湖区', '3');
INSERT INTO `sys_china_area` VALUES (340303, 340300, '蚌山区', '3');
INSERT INTO `sys_china_area` VALUES (340304, 340300, '禹会区', '3');
INSERT INTO `sys_china_area` VALUES (340311, 340300, '淮上区', '3');
INSERT INTO `sys_china_area` VALUES (340321, 340300, '怀远县', '3');
INSERT INTO `sys_china_area` VALUES (340322, 340300, '五河县', '3');
INSERT INTO `sys_china_area` VALUES (340323, 340300, '固镇县', '3');
INSERT INTO `sys_china_area` VALUES (340400, 340000, '淮南市', '2');
INSERT INTO `sys_china_area` VALUES (340402, 340400, '大通区', '3');
INSERT INTO `sys_china_area` VALUES (340403, 340400, '田家庵区', '3');
INSERT INTO `sys_china_area` VALUES (340404, 340400, '谢家集区', '3');
INSERT INTO `sys_china_area` VALUES (340405, 340400, '八公山区', '3');
INSERT INTO `sys_china_area` VALUES (340406, 340400, '潘集区', '3');
INSERT INTO `sys_china_area` VALUES (340421, 340400, '凤台县', '3');
INSERT INTO `sys_china_area` VALUES (340422, 340400, '寿县', '3');
INSERT INTO `sys_china_area` VALUES (340500, 340000, '马鞍山市', '2');
INSERT INTO `sys_china_area` VALUES (340503, 340500, '花山区', '3');
INSERT INTO `sys_china_area` VALUES (340504, 340500, '雨山区', '3');
INSERT INTO `sys_china_area` VALUES (340506, 340500, '博望区', '3');
INSERT INTO `sys_china_area` VALUES (340521, 340500, '当涂县', '3');
INSERT INTO `sys_china_area` VALUES (340522, 340500, '含山县', '3');
INSERT INTO `sys_china_area` VALUES (340523, 340500, '和县', '3');
INSERT INTO `sys_china_area` VALUES (340600, 340000, '淮北市', '2');
INSERT INTO `sys_china_area` VALUES (340602, 340600, '杜集区', '3');
INSERT INTO `sys_china_area` VALUES (340603, 340600, '相山区', '3');
INSERT INTO `sys_china_area` VALUES (340604, 340600, '烈山区', '3');
INSERT INTO `sys_china_area` VALUES (340621, 340600, '濉溪县', '3');
INSERT INTO `sys_china_area` VALUES (340700, 340000, '铜陵市', '2');
INSERT INTO `sys_china_area` VALUES (340705, 340700, '铜官区', '3');
INSERT INTO `sys_china_area` VALUES (340706, 340700, '义安区', '3');
INSERT INTO `sys_china_area` VALUES (340711, 340700, '郊区', '3');
INSERT INTO `sys_china_area` VALUES (340722, 340700, '枞阳县', '3');
INSERT INTO `sys_china_area` VALUES (340800, 340000, '安庆市', '2');
INSERT INTO `sys_china_area` VALUES (340802, 340800, '迎江区', '3');
INSERT INTO `sys_china_area` VALUES (340803, 340800, '大观区', '3');
INSERT INTO `sys_china_area` VALUES (340811, 340800, '宜秀区', '3');
INSERT INTO `sys_china_area` VALUES (340822, 340800, '怀宁县', '3');
INSERT INTO `sys_china_area` VALUES (340825, 340800, '太湖县', '3');
INSERT INTO `sys_china_area` VALUES (340826, 340800, '宿松县', '3');
INSERT INTO `sys_china_area` VALUES (340827, 340800, '望江县', '3');
INSERT INTO `sys_china_area` VALUES (340828, 340800, '岳西县', '3');
INSERT INTO `sys_china_area` VALUES (340881, 340800, '桐城市', '3');
INSERT INTO `sys_china_area` VALUES (340882, 340800, '潜山市', '3');
INSERT INTO `sys_china_area` VALUES (341000, 340000, '黄山市', '2');
INSERT INTO `sys_china_area` VALUES (341002, 341000, '屯溪区', '3');
INSERT INTO `sys_china_area` VALUES (341003, 341000, '黄山区', '3');
INSERT INTO `sys_china_area` VALUES (341004, 341000, '徽州区', '3');
INSERT INTO `sys_china_area` VALUES (341021, 341000, '歙县', '3');
INSERT INTO `sys_china_area` VALUES (341022, 341000, '休宁县', '3');
INSERT INTO `sys_china_area` VALUES (341023, 341000, '黟县', '3');
INSERT INTO `sys_china_area` VALUES (341024, 341000, '祁门县', '3');
INSERT INTO `sys_china_area` VALUES (341100, 340000, '滁州市', '2');
INSERT INTO `sys_china_area` VALUES (341102, 341100, '琅琊区', '3');
INSERT INTO `sys_china_area` VALUES (341103, 341100, '南谯区', '3');
INSERT INTO `sys_china_area` VALUES (341122, 341100, '来安县', '3');
INSERT INTO `sys_china_area` VALUES (341124, 341100, '全椒县', '3');
INSERT INTO `sys_china_area` VALUES (341125, 341100, '定远县', '3');
INSERT INTO `sys_china_area` VALUES (341126, 341100, '凤阳县', '3');
INSERT INTO `sys_china_area` VALUES (341181, 341100, '天长市', '3');
INSERT INTO `sys_china_area` VALUES (341182, 341100, '明光市', '3');
INSERT INTO `sys_china_area` VALUES (341200, 340000, '阜阳市', '2');
INSERT INTO `sys_china_area` VALUES (341202, 341200, '颍州区', '3');
INSERT INTO `sys_china_area` VALUES (341203, 341200, '颍东区', '3');
INSERT INTO `sys_china_area` VALUES (341204, 341200, '颍泉区', '3');
INSERT INTO `sys_china_area` VALUES (341221, 341200, '临泉县', '3');
INSERT INTO `sys_china_area` VALUES (341222, 341200, '太和县', '3');
INSERT INTO `sys_china_area` VALUES (341225, 341200, '阜南县', '3');
INSERT INTO `sys_china_area` VALUES (341226, 341200, '颍上县', '3');
INSERT INTO `sys_china_area` VALUES (341282, 341200, '界首市', '3');
INSERT INTO `sys_china_area` VALUES (341300, 340000, '宿州市', '2');
INSERT INTO `sys_china_area` VALUES (341302, 341300, '埇桥区', '3');
INSERT INTO `sys_china_area` VALUES (341321, 341300, '砀山县', '3');
INSERT INTO `sys_china_area` VALUES (341322, 341300, '萧县', '3');
INSERT INTO `sys_china_area` VALUES (341323, 341300, '灵璧县', '3');
INSERT INTO `sys_china_area` VALUES (341324, 341300, '泗县', '3');
INSERT INTO `sys_china_area` VALUES (341500, 340000, '六安市', '2');
INSERT INTO `sys_china_area` VALUES (341502, 341500, '金安区', '3');
INSERT INTO `sys_china_area` VALUES (341503, 341500, '裕安区', '3');
INSERT INTO `sys_china_area` VALUES (341504, 341500, '叶集区', '3');
INSERT INTO `sys_china_area` VALUES (341522, 341500, '霍邱县', '3');
INSERT INTO `sys_china_area` VALUES (341523, 341500, '舒城县', '3');
INSERT INTO `sys_china_area` VALUES (341524, 341500, '金寨县', '3');
INSERT INTO `sys_china_area` VALUES (341525, 341500, '霍山县', '3');
INSERT INTO `sys_china_area` VALUES (341600, 340000, '亳州市', '2');
INSERT INTO `sys_china_area` VALUES (341602, 341600, '谯城区', '3');
INSERT INTO `sys_china_area` VALUES (341621, 341600, '涡阳县', '3');
INSERT INTO `sys_china_area` VALUES (341622, 341600, '蒙城县', '3');
INSERT INTO `sys_china_area` VALUES (341623, 341600, '利辛县', '3');
INSERT INTO `sys_china_area` VALUES (341700, 340000, '池州市', '2');
INSERT INTO `sys_china_area` VALUES (341702, 341700, '贵池区', '3');
INSERT INTO `sys_china_area` VALUES (341721, 341700, '东至县', '3');
INSERT INTO `sys_china_area` VALUES (341722, 341700, '石台县', '3');
INSERT INTO `sys_china_area` VALUES (341723, 341700, '青阳县', '3');
INSERT INTO `sys_china_area` VALUES (341800, 340000, '宣城市', '2');
INSERT INTO `sys_china_area` VALUES (341802, 341800, '宣州区', '3');
INSERT INTO `sys_china_area` VALUES (341821, 341800, '郎溪县', '3');
INSERT INTO `sys_china_area` VALUES (341823, 341800, '泾县', '3');
INSERT INTO `sys_china_area` VALUES (341824, 341800, '绩溪县', '3');
INSERT INTO `sys_china_area` VALUES (341825, 341800, '旌德县', '3');
INSERT INTO `sys_china_area` VALUES (341881, 341800, '宁国市', '3');
INSERT INTO `sys_china_area` VALUES (341882, 341800, '广德市', '3');
INSERT INTO `sys_china_area` VALUES (350000, 0, '福建省', '1');
INSERT INTO `sys_china_area` VALUES (350100, 350000, '福州市', '2');
INSERT INTO `sys_china_area` VALUES (350102, 350100, '鼓楼区', '3');
INSERT INTO `sys_china_area` VALUES (350103, 350100, '台江区', '3');
INSERT INTO `sys_china_area` VALUES (350104, 350100, '仓山区', '3');
INSERT INTO `sys_china_area` VALUES (350105, 350100, '马尾区', '3');
INSERT INTO `sys_china_area` VALUES (350111, 350100, '晋安区', '3');
INSERT INTO `sys_china_area` VALUES (350112, 350100, '长乐区', '3');
INSERT INTO `sys_china_area` VALUES (350121, 350100, '闽侯县', '3');
INSERT INTO `sys_china_area` VALUES (350122, 350100, '连江县', '3');
INSERT INTO `sys_china_area` VALUES (350123, 350100, '罗源县', '3');
INSERT INTO `sys_china_area` VALUES (350124, 350100, '闽清县', '3');
INSERT INTO `sys_china_area` VALUES (350125, 350100, '永泰县', '3');
INSERT INTO `sys_china_area` VALUES (350128, 350100, '平潭县', '3');
INSERT INTO `sys_china_area` VALUES (350181, 350100, '福清市', '3');
INSERT INTO `sys_china_area` VALUES (350200, 350000, '厦门市', '2');
INSERT INTO `sys_china_area` VALUES (350203, 350200, '思明区', '3');
INSERT INTO `sys_china_area` VALUES (350205, 350200, '海沧区', '3');
INSERT INTO `sys_china_area` VALUES (350206, 350200, '湖里区', '3');
INSERT INTO `sys_china_area` VALUES (350211, 350200, '集美区', '3');
INSERT INTO `sys_china_area` VALUES (350212, 350200, '同安区', '3');
INSERT INTO `sys_china_area` VALUES (350213, 350200, '翔安区', '3');
INSERT INTO `sys_china_area` VALUES (350300, 350000, '莆田市', '2');
INSERT INTO `sys_china_area` VALUES (350302, 350300, '城厢区', '3');
INSERT INTO `sys_china_area` VALUES (350303, 350300, '涵江区', '3');
INSERT INTO `sys_china_area` VALUES (350304, 350300, '荔城区', '3');
INSERT INTO `sys_china_area` VALUES (350305, 350300, '秀屿区', '3');
INSERT INTO `sys_china_area` VALUES (350322, 350300, '仙游县', '3');
INSERT INTO `sys_china_area` VALUES (350400, 350000, '三明市', '2');
INSERT INTO `sys_china_area` VALUES (350402, 350400, '梅列区', '3');
INSERT INTO `sys_china_area` VALUES (350403, 350400, '三元区', '3');
INSERT INTO `sys_china_area` VALUES (350421, 350400, '明溪县', '3');
INSERT INTO `sys_china_area` VALUES (350423, 350400, '清流县', '3');
INSERT INTO `sys_china_area` VALUES (350424, 350400, '宁化县', '3');
INSERT INTO `sys_china_area` VALUES (350425, 350400, '大田县', '3');
INSERT INTO `sys_china_area` VALUES (350426, 350400, '尤溪县', '3');
INSERT INTO `sys_china_area` VALUES (350427, 350400, '沙县', '3');
INSERT INTO `sys_china_area` VALUES (350428, 350400, '将乐县', '3');
INSERT INTO `sys_china_area` VALUES (350429, 350400, '泰宁县', '3');
INSERT INTO `sys_china_area` VALUES (350430, 350400, '建宁县', '3');
INSERT INTO `sys_china_area` VALUES (350481, 350400, '永安市', '3');
INSERT INTO `sys_china_area` VALUES (350500, 350000, '泉州市', '2');
INSERT INTO `sys_china_area` VALUES (350502, 350500, '鲤城区', '3');
INSERT INTO `sys_china_area` VALUES (350503, 350500, '丰泽区', '3');
INSERT INTO `sys_china_area` VALUES (350504, 350500, '洛江区', '3');
INSERT INTO `sys_china_area` VALUES (350505, 350500, '泉港区', '3');
INSERT INTO `sys_china_area` VALUES (350521, 350500, '惠安县', '3');
INSERT INTO `sys_china_area` VALUES (350524, 350500, '安溪县', '3');
INSERT INTO `sys_china_area` VALUES (350525, 350500, '永春县', '3');
INSERT INTO `sys_china_area` VALUES (350526, 350500, '德化县', '3');
INSERT INTO `sys_china_area` VALUES (350527, 350500, '金门县', '3');
INSERT INTO `sys_china_area` VALUES (350581, 350500, '石狮市', '3');
INSERT INTO `sys_china_area` VALUES (350582, 350500, '晋江市', '3');
INSERT INTO `sys_china_area` VALUES (350583, 350500, '南安市', '3');
INSERT INTO `sys_china_area` VALUES (350600, 350000, '漳州市', '2');
INSERT INTO `sys_china_area` VALUES (350602, 350600, '芗城区', '3');
INSERT INTO `sys_china_area` VALUES (350603, 350600, '龙文区', '3');
INSERT INTO `sys_china_area` VALUES (350622, 350600, '云霄县', '3');
INSERT INTO `sys_china_area` VALUES (350623, 350600, '漳浦县', '3');
INSERT INTO `sys_china_area` VALUES (350624, 350600, '诏安县', '3');
INSERT INTO `sys_china_area` VALUES (350625, 350600, '长泰县', '3');
INSERT INTO `sys_china_area` VALUES (350626, 350600, '东山县', '3');
INSERT INTO `sys_china_area` VALUES (350627, 350600, '南靖县', '3');
INSERT INTO `sys_china_area` VALUES (350628, 350600, '平和县', '3');
INSERT INTO `sys_china_area` VALUES (350629, 350600, '华安县', '3');
INSERT INTO `sys_china_area` VALUES (350681, 350600, '龙海市', '3');
INSERT INTO `sys_china_area` VALUES (350700, 350000, '南平市', '2');
INSERT INTO `sys_china_area` VALUES (350702, 350700, '延平区', '3');
INSERT INTO `sys_china_area` VALUES (350703, 350700, '建阳区', '3');
INSERT INTO `sys_china_area` VALUES (350721, 350700, '顺昌县', '3');
INSERT INTO `sys_china_area` VALUES (350722, 350700, '浦城县', '3');
INSERT INTO `sys_china_area` VALUES (350723, 350700, '光泽县', '3');
INSERT INTO `sys_china_area` VALUES (350724, 350700, '松溪县', '3');
INSERT INTO `sys_china_area` VALUES (350725, 350700, '政和县', '3');
INSERT INTO `sys_china_area` VALUES (350781, 350700, '邵武市', '3');
INSERT INTO `sys_china_area` VALUES (350782, 350700, '武夷山市', '3');
INSERT INTO `sys_china_area` VALUES (350783, 350700, '建瓯市', '3');
INSERT INTO `sys_china_area` VALUES (350800, 350000, '龙岩市', '2');
INSERT INTO `sys_china_area` VALUES (350802, 350800, '新罗区', '3');
INSERT INTO `sys_china_area` VALUES (350803, 350800, '永定区', '3');
INSERT INTO `sys_china_area` VALUES (350821, 350800, '长汀县', '3');
INSERT INTO `sys_china_area` VALUES (350823, 350800, '上杭县', '3');
INSERT INTO `sys_china_area` VALUES (350824, 350800, '武平县', '3');
INSERT INTO `sys_china_area` VALUES (350825, 350800, '连城县', '3');
INSERT INTO `sys_china_area` VALUES (350881, 350800, '漳平市', '3');
INSERT INTO `sys_china_area` VALUES (350900, 350000, '宁德市', '2');
INSERT INTO `sys_china_area` VALUES (350902, 350900, '蕉城区', '3');
INSERT INTO `sys_china_area` VALUES (350921, 350900, '霞浦县', '3');
INSERT INTO `sys_china_area` VALUES (350922, 350900, '古田县', '3');
INSERT INTO `sys_china_area` VALUES (350923, 350900, '屏南县', '3');
INSERT INTO `sys_china_area` VALUES (350924, 350900, '寿宁县', '3');
INSERT INTO `sys_china_area` VALUES (350925, 350900, '周宁县', '3');
INSERT INTO `sys_china_area` VALUES (350926, 350900, '柘荣县', '3');
INSERT INTO `sys_china_area` VALUES (350981, 350900, '福安市', '3');
INSERT INTO `sys_china_area` VALUES (350982, 350900, '福鼎市', '3');
INSERT INTO `sys_china_area` VALUES (360000, 0, '江西省', '1');
INSERT INTO `sys_china_area` VALUES (360100, 360000, '南昌市', '2');
INSERT INTO `sys_china_area` VALUES (360102, 360100, '东湖区', '3');
INSERT INTO `sys_china_area` VALUES (360103, 360100, '西湖区', '3');
INSERT INTO `sys_china_area` VALUES (360104, 360100, '青云谱区', '3');
INSERT INTO `sys_china_area` VALUES (360111, 360100, '青山湖区', '3');
INSERT INTO `sys_china_area` VALUES (360112, 360100, '新建区', '3');
INSERT INTO `sys_china_area` VALUES (360113, 360100, '红谷滩区', '3');
INSERT INTO `sys_china_area` VALUES (360121, 360100, '南昌县', '3');
INSERT INTO `sys_china_area` VALUES (360123, 360100, '安义县', '3');
INSERT INTO `sys_china_area` VALUES (360124, 360100, '进贤县', '3');
INSERT INTO `sys_china_area` VALUES (360200, 360000, '景德镇市', '2');
INSERT INTO `sys_china_area` VALUES (360202, 360200, '昌江区', '3');
INSERT INTO `sys_china_area` VALUES (360203, 360200, '珠山区', '3');
INSERT INTO `sys_china_area` VALUES (360222, 360200, '浮梁县', '3');
INSERT INTO `sys_china_area` VALUES (360281, 360200, '乐平市', '3');
INSERT INTO `sys_china_area` VALUES (360300, 360000, '萍乡市', '2');
INSERT INTO `sys_china_area` VALUES (360302, 360300, '安源区', '3');
INSERT INTO `sys_china_area` VALUES (360313, 360300, '湘东区', '3');
INSERT INTO `sys_china_area` VALUES (360321, 360300, '莲花县', '3');
INSERT INTO `sys_china_area` VALUES (360322, 360300, '上栗县', '3');
INSERT INTO `sys_china_area` VALUES (360323, 360300, '芦溪县', '3');
INSERT INTO `sys_china_area` VALUES (360400, 360000, '九江市', '2');
INSERT INTO `sys_china_area` VALUES (360402, 360400, '濂溪区', '3');
INSERT INTO `sys_china_area` VALUES (360403, 360400, '浔阳区', '3');
INSERT INTO `sys_china_area` VALUES (360404, 360400, '柴桑区', '3');
INSERT INTO `sys_china_area` VALUES (360423, 360400, '武宁县', '3');
INSERT INTO `sys_china_area` VALUES (360424, 360400, '修水县', '3');
INSERT INTO `sys_china_area` VALUES (360425, 360400, '永修县', '3');
INSERT INTO `sys_china_area` VALUES (360426, 360400, '德安县', '3');
INSERT INTO `sys_china_area` VALUES (360428, 360400, '都昌县', '3');
INSERT INTO `sys_china_area` VALUES (360429, 360400, '湖口县', '3');
INSERT INTO `sys_china_area` VALUES (360430, 360400, '彭泽县', '3');
INSERT INTO `sys_china_area` VALUES (360481, 360400, '瑞昌市', '3');
INSERT INTO `sys_china_area` VALUES (360482, 360400, '共青城市', '3');
INSERT INTO `sys_china_area` VALUES (360483, 360400, '庐山市', '3');
INSERT INTO `sys_china_area` VALUES (360500, 360000, '新余市', '2');
INSERT INTO `sys_china_area` VALUES (360502, 360500, '渝水区', '3');
INSERT INTO `sys_china_area` VALUES (360521, 360500, '分宜县', '3');
INSERT INTO `sys_china_area` VALUES (360600, 360000, '鹰潭市', '2');
INSERT INTO `sys_china_area` VALUES (360602, 360600, '月湖区', '3');
INSERT INTO `sys_china_area` VALUES (360603, 360600, '余江区', '3');
INSERT INTO `sys_china_area` VALUES (360681, 360600, '贵溪市', '3');
INSERT INTO `sys_china_area` VALUES (360700, 360000, '赣州市', '2');
INSERT INTO `sys_china_area` VALUES (360702, 360700, '章贡区', '3');
INSERT INTO `sys_china_area` VALUES (360703, 360700, '南康区', '3');
INSERT INTO `sys_china_area` VALUES (360704, 360700, '赣县区', '3');
INSERT INTO `sys_china_area` VALUES (360722, 360700, '信丰县', '3');
INSERT INTO `sys_china_area` VALUES (360723, 360700, '大余县', '3');
INSERT INTO `sys_china_area` VALUES (360724, 360700, '上犹县', '3');
INSERT INTO `sys_china_area` VALUES (360725, 360700, '崇义县', '3');
INSERT INTO `sys_china_area` VALUES (360726, 360700, '安远县', '3');
INSERT INTO `sys_china_area` VALUES (360727, 360700, '龙南县', '3');
INSERT INTO `sys_china_area` VALUES (360728, 360700, '定南县', '3');
INSERT INTO `sys_china_area` VALUES (360729, 360700, '全南县', '3');
INSERT INTO `sys_china_area` VALUES (360730, 360700, '宁都县', '3');
INSERT INTO `sys_china_area` VALUES (360731, 360700, '于都县', '3');
INSERT INTO `sys_china_area` VALUES (360732, 360700, '兴国县', '3');
INSERT INTO `sys_china_area` VALUES (360733, 360700, '会昌县', '3');
INSERT INTO `sys_china_area` VALUES (360734, 360700, '寻乌县', '3');
INSERT INTO `sys_china_area` VALUES (360735, 360700, '石城县', '3');
INSERT INTO `sys_china_area` VALUES (360781, 360700, '瑞金市', '3');
INSERT INTO `sys_china_area` VALUES (360800, 360000, '吉安市', '2');
INSERT INTO `sys_china_area` VALUES (360802, 360800, '吉州区', '3');
INSERT INTO `sys_china_area` VALUES (360803, 360800, '青原区', '3');
INSERT INTO `sys_china_area` VALUES (360821, 360800, '吉安县', '3');
INSERT INTO `sys_china_area` VALUES (360822, 360800, '吉水县', '3');
INSERT INTO `sys_china_area` VALUES (360823, 360800, '峡江县', '3');
INSERT INTO `sys_china_area` VALUES (360824, 360800, '新干县', '3');
INSERT INTO `sys_china_area` VALUES (360825, 360800, '永丰县', '3');
INSERT INTO `sys_china_area` VALUES (360826, 360800, '泰和县', '3');
INSERT INTO `sys_china_area` VALUES (360827, 360800, '遂川县', '3');
INSERT INTO `sys_china_area` VALUES (360828, 360800, '万安县', '3');
INSERT INTO `sys_china_area` VALUES (360829, 360800, '安福县', '3');
INSERT INTO `sys_china_area` VALUES (360830, 360800, '永新县', '3');
INSERT INTO `sys_china_area` VALUES (360881, 360800, '井冈山市', '3');
INSERT INTO `sys_china_area` VALUES (360900, 360000, '宜春市', '2');
INSERT INTO `sys_china_area` VALUES (360902, 360900, '袁州区', '3');
INSERT INTO `sys_china_area` VALUES (360921, 360900, '奉新县', '3');
INSERT INTO `sys_china_area` VALUES (360922, 360900, '万载县', '3');
INSERT INTO `sys_china_area` VALUES (360923, 360900, '上高县', '3');
INSERT INTO `sys_china_area` VALUES (360924, 360900, '宜丰县', '3');
INSERT INTO `sys_china_area` VALUES (360925, 360900, '靖安县', '3');
INSERT INTO `sys_china_area` VALUES (360926, 360900, '铜鼓县', '3');
INSERT INTO `sys_china_area` VALUES (360981, 360900, '丰城市', '3');
INSERT INTO `sys_china_area` VALUES (360982, 360900, '樟树市', '3');
INSERT INTO `sys_china_area` VALUES (360983, 360900, '高安市', '3');
INSERT INTO `sys_china_area` VALUES (361000, 360000, '抚州市', '2');
INSERT INTO `sys_china_area` VALUES (361002, 361000, '临川区', '3');
INSERT INTO `sys_china_area` VALUES (361003, 361000, '东乡区', '3');
INSERT INTO `sys_china_area` VALUES (361021, 361000, '南城县', '3');
INSERT INTO `sys_china_area` VALUES (361022, 361000, '黎川县', '3');
INSERT INTO `sys_china_area` VALUES (361023, 361000, '南丰县', '3');
INSERT INTO `sys_china_area` VALUES (361024, 361000, '崇仁县', '3');
INSERT INTO `sys_china_area` VALUES (361025, 361000, '乐安县', '3');
INSERT INTO `sys_china_area` VALUES (361026, 361000, '宜黄县', '3');
INSERT INTO `sys_china_area` VALUES (361027, 361000, '金溪县', '3');
INSERT INTO `sys_china_area` VALUES (361028, 361000, '资溪县', '3');
INSERT INTO `sys_china_area` VALUES (361030, 361000, '广昌县', '3');
INSERT INTO `sys_china_area` VALUES (361100, 360000, '上饶市', '2');
INSERT INTO `sys_china_area` VALUES (361102, 361100, '信州区', '3');
INSERT INTO `sys_china_area` VALUES (361103, 361100, '广丰区', '3');
INSERT INTO `sys_china_area` VALUES (361104, 361100, '广信区', '3');
INSERT INTO `sys_china_area` VALUES (361123, 361100, '玉山县', '3');
INSERT INTO `sys_china_area` VALUES (361124, 361100, '铅山县', '3');
INSERT INTO `sys_china_area` VALUES (361125, 361100, '横峰县', '3');
INSERT INTO `sys_china_area` VALUES (361126, 361100, '弋阳县', '3');
INSERT INTO `sys_china_area` VALUES (361127, 361100, '余干县', '3');
INSERT INTO `sys_china_area` VALUES (361128, 361100, '鄱阳县', '3');
INSERT INTO `sys_china_area` VALUES (361129, 361100, '万年县', '3');
INSERT INTO `sys_china_area` VALUES (361130, 361100, '婺源县', '3');
INSERT INTO `sys_china_area` VALUES (361181, 361100, '德兴市', '3');
INSERT INTO `sys_china_area` VALUES (370000, 0, '山东省', '1');
INSERT INTO `sys_china_area` VALUES (370100, 370000, '济南市', '2');
INSERT INTO `sys_china_area` VALUES (370102, 370100, '历下区', '3');
INSERT INTO `sys_china_area` VALUES (370103, 370100, '市中区', '3');
INSERT INTO `sys_china_area` VALUES (370104, 370100, '槐荫区', '3');
INSERT INTO `sys_china_area` VALUES (370105, 370100, '天桥区', '3');
INSERT INTO `sys_china_area` VALUES (370112, 370100, '历城区', '3');
INSERT INTO `sys_china_area` VALUES (370113, 370100, '长清区', '3');
INSERT INTO `sys_china_area` VALUES (370114, 370100, '章丘区', '3');
INSERT INTO `sys_china_area` VALUES (370115, 370100, '济阳区', '3');
INSERT INTO `sys_china_area` VALUES (370116, 370100, '莱芜区', '3');
INSERT INTO `sys_china_area` VALUES (370117, 370100, '钢城区', '3');
INSERT INTO `sys_china_area` VALUES (370124, 370100, '平阴县', '3');
INSERT INTO `sys_china_area` VALUES (370126, 370100, '商河县', '3');
INSERT INTO `sys_china_area` VALUES (370200, 370000, '青岛市', '2');
INSERT INTO `sys_china_area` VALUES (370202, 370200, '市南区', '3');
INSERT INTO `sys_china_area` VALUES (370203, 370200, '市北区', '3');
INSERT INTO `sys_china_area` VALUES (370211, 370200, '黄岛区', '3');
INSERT INTO `sys_china_area` VALUES (370212, 370200, '崂山区', '3');
INSERT INTO `sys_china_area` VALUES (370213, 370200, '李沧区', '3');
INSERT INTO `sys_china_area` VALUES (370214, 370200, '城阳区', '3');
INSERT INTO `sys_china_area` VALUES (370215, 370200, '即墨区', '3');
INSERT INTO `sys_china_area` VALUES (370281, 370200, '胶州市', '3');
INSERT INTO `sys_china_area` VALUES (370283, 370200, '平度市', '3');
INSERT INTO `sys_china_area` VALUES (370285, 370200, '莱西市', '3');
INSERT INTO `sys_china_area` VALUES (370300, 370000, '淄博市', '2');
INSERT INTO `sys_china_area` VALUES (370302, 370300, '淄川区', '3');
INSERT INTO `sys_china_area` VALUES (370303, 370300, '张店区', '3');
INSERT INTO `sys_china_area` VALUES (370304, 370300, '博山区', '3');
INSERT INTO `sys_china_area` VALUES (370305, 370300, '临淄区', '3');
INSERT INTO `sys_china_area` VALUES (370306, 370300, '周村区', '3');
INSERT INTO `sys_china_area` VALUES (370321, 370300, '桓台县', '3');
INSERT INTO `sys_china_area` VALUES (370322, 370300, '高青县', '3');
INSERT INTO `sys_china_area` VALUES (370323, 370300, '沂源县', '3');
INSERT INTO `sys_china_area` VALUES (370400, 370000, '枣庄市', '2');
INSERT INTO `sys_china_area` VALUES (370402, 370400, '市中区', '3');
INSERT INTO `sys_china_area` VALUES (370403, 370400, '薛城区', '3');
INSERT INTO `sys_china_area` VALUES (370404, 370400, '峄城区', '3');
INSERT INTO `sys_china_area` VALUES (370405, 370400, '台儿庄区', '3');
INSERT INTO `sys_china_area` VALUES (370406, 370400, '山亭区', '3');
INSERT INTO `sys_china_area` VALUES (370481, 370400, '滕州市', '3');
INSERT INTO `sys_china_area` VALUES (370500, 370000, '东营市', '2');
INSERT INTO `sys_china_area` VALUES (370502, 370500, '东营区', '3');
INSERT INTO `sys_china_area` VALUES (370503, 370500, '河口区', '3');
INSERT INTO `sys_china_area` VALUES (370505, 370500, '垦利区', '3');
INSERT INTO `sys_china_area` VALUES (370522, 370500, '利津县', '3');
INSERT INTO `sys_china_area` VALUES (370523, 370500, '广饶县', '3');
INSERT INTO `sys_china_area` VALUES (370600, 370000, '烟台市', '2');
INSERT INTO `sys_china_area` VALUES (370602, 370600, '芝罘区', '3');
INSERT INTO `sys_china_area` VALUES (370611, 370600, '福山区', '3');
INSERT INTO `sys_china_area` VALUES (370612, 370600, '牟平区', '3');
INSERT INTO `sys_china_area` VALUES (370613, 370600, '莱山区', '3');
INSERT INTO `sys_china_area` VALUES (370634, 370600, '长岛县', '3');
INSERT INTO `sys_china_area` VALUES (370681, 370600, '龙口市', '3');
INSERT INTO `sys_china_area` VALUES (370682, 370600, '莱阳市', '3');
INSERT INTO `sys_china_area` VALUES (370683, 370600, '莱州市', '3');
INSERT INTO `sys_china_area` VALUES (370684, 370600, '蓬莱市', '3');
INSERT INTO `sys_china_area` VALUES (370685, 370600, '招远市', '3');
INSERT INTO `sys_china_area` VALUES (370686, 370600, '栖霞市', '3');
INSERT INTO `sys_china_area` VALUES (370687, 370600, '海阳市', '3');
INSERT INTO `sys_china_area` VALUES (370700, 370000, '潍坊市', '2');
INSERT INTO `sys_china_area` VALUES (370702, 370700, '潍城区', '3');
INSERT INTO `sys_china_area` VALUES (370703, 370700, '寒亭区', '3');
INSERT INTO `sys_china_area` VALUES (370704, 370700, '坊子区', '3');
INSERT INTO `sys_china_area` VALUES (370705, 370700, '奎文区', '3');
INSERT INTO `sys_china_area` VALUES (370724, 370700, '临朐县', '3');
INSERT INTO `sys_china_area` VALUES (370725, 370700, '昌乐县', '3');
INSERT INTO `sys_china_area` VALUES (370781, 370700, '青州市', '3');
INSERT INTO `sys_china_area` VALUES (370782, 370700, '诸城市', '3');
INSERT INTO `sys_china_area` VALUES (370783, 370700, '寿光市', '3');
INSERT INTO `sys_china_area` VALUES (370784, 370700, '安丘市', '3');
INSERT INTO `sys_china_area` VALUES (370785, 370700, '高密市', '3');
INSERT INTO `sys_china_area` VALUES (370786, 370700, '昌邑市', '3');
INSERT INTO `sys_china_area` VALUES (370800, 370000, '济宁市', '2');
INSERT INTO `sys_china_area` VALUES (370811, 370800, '任城区', '3');
INSERT INTO `sys_china_area` VALUES (370812, 370800, '兖州区', '3');
INSERT INTO `sys_china_area` VALUES (370826, 370800, '微山县', '3');
INSERT INTO `sys_china_area` VALUES (370827, 370800, '鱼台县', '3');
INSERT INTO `sys_china_area` VALUES (370828, 370800, '金乡县', '3');
INSERT INTO `sys_china_area` VALUES (370829, 370800, '嘉祥县', '3');
INSERT INTO `sys_china_area` VALUES (370830, 370800, '汶上县', '3');
INSERT INTO `sys_china_area` VALUES (370831, 370800, '泗水县', '3');
INSERT INTO `sys_china_area` VALUES (370832, 370800, '梁山县', '3');
INSERT INTO `sys_china_area` VALUES (370881, 370800, '曲阜市', '3');
INSERT INTO `sys_china_area` VALUES (370883, 370800, '邹城市', '3');
INSERT INTO `sys_china_area` VALUES (370900, 370000, '泰安市', '2');
INSERT INTO `sys_china_area` VALUES (370902, 370900, '泰山区', '3');
INSERT INTO `sys_china_area` VALUES (370911, 370900, '岱岳区', '3');
INSERT INTO `sys_china_area` VALUES (370921, 370900, '宁阳县', '3');
INSERT INTO `sys_china_area` VALUES (370923, 370900, '东平县', '3');
INSERT INTO `sys_china_area` VALUES (370982, 370900, '新泰市', '3');
INSERT INTO `sys_china_area` VALUES (370983, 370900, '肥城市', '3');
INSERT INTO `sys_china_area` VALUES (371000, 370000, '威海市', '2');
INSERT INTO `sys_china_area` VALUES (371002, 371000, '环翠区', '3');
INSERT INTO `sys_china_area` VALUES (371003, 371000, '文登区', '3');
INSERT INTO `sys_china_area` VALUES (371082, 371000, '荣成市', '3');
INSERT INTO `sys_china_area` VALUES (371083, 371000, '乳山市', '3');
INSERT INTO `sys_china_area` VALUES (371100, 370000, '日照市', '2');
INSERT INTO `sys_china_area` VALUES (371102, 371100, '东港区', '3');
INSERT INTO `sys_china_area` VALUES (371103, 371100, '岚山区', '3');
INSERT INTO `sys_china_area` VALUES (371121, 371100, '五莲县', '3');
INSERT INTO `sys_china_area` VALUES (371122, 371100, '莒县', '3');
INSERT INTO `sys_china_area` VALUES (371300, 370000, '临沂市', '2');
INSERT INTO `sys_china_area` VALUES (371302, 371300, '兰山区', '3');
INSERT INTO `sys_china_area` VALUES (371311, 371300, '罗庄区', '3');
INSERT INTO `sys_china_area` VALUES (371312, 371300, '河东区', '3');
INSERT INTO `sys_china_area` VALUES (371321, 371300, '沂南县', '3');
INSERT INTO `sys_china_area` VALUES (371322, 371300, '郯城县', '3');
INSERT INTO `sys_china_area` VALUES (371323, 371300, '沂水县', '3');
INSERT INTO `sys_china_area` VALUES (371324, 371300, '兰陵县', '3');
INSERT INTO `sys_china_area` VALUES (371325, 371300, '费县', '3');
INSERT INTO `sys_china_area` VALUES (371326, 371300, '平邑县', '3');
INSERT INTO `sys_china_area` VALUES (371327, 371300, '莒南县', '3');
INSERT INTO `sys_china_area` VALUES (371328, 371300, '蒙阴县', '3');
INSERT INTO `sys_china_area` VALUES (371329, 371300, '临沭县', '3');
INSERT INTO `sys_china_area` VALUES (371400, 370000, '德州市', '2');
INSERT INTO `sys_china_area` VALUES (371402, 371400, '德城区', '3');
INSERT INTO `sys_china_area` VALUES (371403, 371400, '陵城区', '3');
INSERT INTO `sys_china_area` VALUES (371422, 371400, '宁津县', '3');
INSERT INTO `sys_china_area` VALUES (371423, 371400, '庆云县', '3');
INSERT INTO `sys_china_area` VALUES (371424, 371400, '临邑县', '3');
INSERT INTO `sys_china_area` VALUES (371425, 371400, '齐河县', '3');
INSERT INTO `sys_china_area` VALUES (371426, 371400, '平原县', '3');
INSERT INTO `sys_china_area` VALUES (371427, 371400, '夏津县', '3');
INSERT INTO `sys_china_area` VALUES (371428, 371400, '武城县', '3');
INSERT INTO `sys_china_area` VALUES (371481, 371400, '乐陵市', '3');
INSERT INTO `sys_china_area` VALUES (371482, 371400, '禹城市', '3');
INSERT INTO `sys_china_area` VALUES (371500, 370000, '聊城市', '2');
INSERT INTO `sys_china_area` VALUES (371502, 371500, '东昌府区', '3');
INSERT INTO `sys_china_area` VALUES (371503, 371500, '茌平区', '3');
INSERT INTO `sys_china_area` VALUES (371521, 371500, '阳谷县', '3');
INSERT INTO `sys_china_area` VALUES (371522, 371500, '莘县', '3');
INSERT INTO `sys_china_area` VALUES (371524, 371500, '东阿县', '3');
INSERT INTO `sys_china_area` VALUES (371525, 371500, '冠县', '3');
INSERT INTO `sys_china_area` VALUES (371526, 371500, '高唐县', '3');
INSERT INTO `sys_china_area` VALUES (371581, 371500, '临清市', '3');
INSERT INTO `sys_china_area` VALUES (371600, 370000, '滨州市', '2');
INSERT INTO `sys_china_area` VALUES (371602, 371600, '滨城区', '3');
INSERT INTO `sys_china_area` VALUES (371603, 371600, '沾化区', '3');
INSERT INTO `sys_china_area` VALUES (371621, 371600, '惠民县', '3');
INSERT INTO `sys_china_area` VALUES (371622, 371600, '阳信县', '3');
INSERT INTO `sys_china_area` VALUES (371623, 371600, '无棣县', '3');
INSERT INTO `sys_china_area` VALUES (371625, 371600, '博兴县', '3');
INSERT INTO `sys_china_area` VALUES (371681, 371600, '邹平市', '3');
INSERT INTO `sys_china_area` VALUES (371700, 370000, '菏泽市', '2');
INSERT INTO `sys_china_area` VALUES (371702, 371700, '牡丹区', '3');
INSERT INTO `sys_china_area` VALUES (371703, 371700, '定陶区', '3');
INSERT INTO `sys_china_area` VALUES (371721, 371700, '曹县', '3');
INSERT INTO `sys_china_area` VALUES (371722, 371700, '单县', '3');
INSERT INTO `sys_china_area` VALUES (371723, 371700, '成武县', '3');
INSERT INTO `sys_china_area` VALUES (371724, 371700, '巨野县', '3');
INSERT INTO `sys_china_area` VALUES (371725, 371700, '郓城县', '3');
INSERT INTO `sys_china_area` VALUES (371726, 371700, '鄄城县', '3');
INSERT INTO `sys_china_area` VALUES (371728, 371700, '东明县', '3');
INSERT INTO `sys_china_area` VALUES (410000, 0, '河南省', '1');
INSERT INTO `sys_china_area` VALUES (410100, 410000, '郑州市', '2');
INSERT INTO `sys_china_area` VALUES (410102, 410100, '中原区', '3');
INSERT INTO `sys_china_area` VALUES (410103, 410100, '二七区', '3');
INSERT INTO `sys_china_area` VALUES (410104, 410100, '管城回族区', '3');
INSERT INTO `sys_china_area` VALUES (410105, 410100, '金水区', '3');
INSERT INTO `sys_china_area` VALUES (410106, 410100, '上街区', '3');
INSERT INTO `sys_china_area` VALUES (410108, 410100, '惠济区', '3');
INSERT INTO `sys_china_area` VALUES (410122, 410100, '中牟县', '3');
INSERT INTO `sys_china_area` VALUES (410181, 410100, '巩义市', '3');
INSERT INTO `sys_china_area` VALUES (410182, 410100, '荥阳市', '3');
INSERT INTO `sys_china_area` VALUES (410183, 410100, '新密市', '3');
INSERT INTO `sys_china_area` VALUES (410184, 410100, '新郑市', '3');
INSERT INTO `sys_china_area` VALUES (410185, 410100, '登封市', '3');
INSERT INTO `sys_china_area` VALUES (410200, 410000, '开封市', '2');
INSERT INTO `sys_china_area` VALUES (410202, 410200, '龙亭区', '3');
INSERT INTO `sys_china_area` VALUES (410203, 410200, '顺河回族区', '3');
INSERT INTO `sys_china_area` VALUES (410204, 410200, '鼓楼区', '3');
INSERT INTO `sys_china_area` VALUES (410205, 410200, '禹王台区', '3');
INSERT INTO `sys_china_area` VALUES (410212, 410200, '祥符区', '3');
INSERT INTO `sys_china_area` VALUES (410221, 410200, '杞县', '3');
INSERT INTO `sys_china_area` VALUES (410222, 410200, '通许县', '3');
INSERT INTO `sys_china_area` VALUES (410223, 410200, '尉氏县', '3');
INSERT INTO `sys_china_area` VALUES (410225, 410200, '兰考县', '3');
INSERT INTO `sys_china_area` VALUES (410300, 410000, '洛阳市', '2');
INSERT INTO `sys_china_area` VALUES (410302, 410300, '老城区', '3');
INSERT INTO `sys_china_area` VALUES (410303, 410300, '西工区', '3');
INSERT INTO `sys_china_area` VALUES (410304, 410300, '瀍河回族区', '3');
INSERT INTO `sys_china_area` VALUES (410305, 410300, '涧西区', '3');
INSERT INTO `sys_china_area` VALUES (410306, 410300, '吉利区', '3');
INSERT INTO `sys_china_area` VALUES (410311, 410300, '洛龙区', '3');
INSERT INTO `sys_china_area` VALUES (410322, 410300, '孟津县', '3');
INSERT INTO `sys_china_area` VALUES (410323, 410300, '新安县', '3');
INSERT INTO `sys_china_area` VALUES (410324, 410300, '栾川县', '3');
INSERT INTO `sys_china_area` VALUES (410325, 410300, '嵩县', '3');
INSERT INTO `sys_china_area` VALUES (410326, 410300, '汝阳县', '3');
INSERT INTO `sys_china_area` VALUES (410327, 410300, '宜阳县', '3');
INSERT INTO `sys_china_area` VALUES (410328, 410300, '洛宁县', '3');
INSERT INTO `sys_china_area` VALUES (410329, 410300, '伊川县', '3');
INSERT INTO `sys_china_area` VALUES (410381, 410300, '偃师市', '3');
INSERT INTO `sys_china_area` VALUES (410400, 410000, '平顶山市', '2');
INSERT INTO `sys_china_area` VALUES (410402, 410400, '新华区', '3');
INSERT INTO `sys_china_area` VALUES (410403, 410400, '卫东区', '3');
INSERT INTO `sys_china_area` VALUES (410404, 410400, '石龙区', '3');
INSERT INTO `sys_china_area` VALUES (410411, 410400, '湛河区', '3');
INSERT INTO `sys_china_area` VALUES (410421, 410400, '宝丰县', '3');
INSERT INTO `sys_china_area` VALUES (410422, 410400, '叶县', '3');
INSERT INTO `sys_china_area` VALUES (410423, 410400, '鲁山县', '3');
INSERT INTO `sys_china_area` VALUES (410425, 410400, '郏县', '3');
INSERT INTO `sys_china_area` VALUES (410481, 410400, '舞钢市', '3');
INSERT INTO `sys_china_area` VALUES (410482, 410400, '汝州市', '3');
INSERT INTO `sys_china_area` VALUES (410500, 410000, '安阳市', '2');
INSERT INTO `sys_china_area` VALUES (410502, 410500, '文峰区', '3');
INSERT INTO `sys_china_area` VALUES (410503, 410500, '北关区', '3');
INSERT INTO `sys_china_area` VALUES (410505, 410500, '殷都区', '3');
INSERT INTO `sys_china_area` VALUES (410506, 410500, '龙安区', '3');
INSERT INTO `sys_china_area` VALUES (410522, 410500, '安阳县', '3');
INSERT INTO `sys_china_area` VALUES (410523, 410500, '汤阴县', '3');
INSERT INTO `sys_china_area` VALUES (410526, 410500, '滑县', '3');
INSERT INTO `sys_china_area` VALUES (410527, 410500, '内黄县', '3');
INSERT INTO `sys_china_area` VALUES (410581, 410500, '林州市', '3');
INSERT INTO `sys_china_area` VALUES (410600, 410000, '鹤壁市', '2');
INSERT INTO `sys_china_area` VALUES (410602, 410600, '鹤山区', '3');
INSERT INTO `sys_china_area` VALUES (410603, 410600, '山城区', '3');
INSERT INTO `sys_china_area` VALUES (410611, 410600, '淇滨区', '3');
INSERT INTO `sys_china_area` VALUES (410621, 410600, '浚县', '3');
INSERT INTO `sys_china_area` VALUES (410622, 410600, '淇县', '3');
INSERT INTO `sys_china_area` VALUES (410700, 410000, '新乡市', '2');
INSERT INTO `sys_china_area` VALUES (410702, 410700, '红旗区', '3');
INSERT INTO `sys_china_area` VALUES (410703, 410700, '卫滨区', '3');
INSERT INTO `sys_china_area` VALUES (410704, 410700, '凤泉区', '3');
INSERT INTO `sys_china_area` VALUES (410711, 410700, '牧野区', '3');
INSERT INTO `sys_china_area` VALUES (410721, 410700, '新乡县', '3');
INSERT INTO `sys_china_area` VALUES (410724, 410700, '获嘉县', '3');
INSERT INTO `sys_china_area` VALUES (410725, 410700, '原阳县', '3');
INSERT INTO `sys_china_area` VALUES (410726, 410700, '延津县', '3');
INSERT INTO `sys_china_area` VALUES (410727, 410700, '封丘县', '3');
INSERT INTO `sys_china_area` VALUES (410781, 410700, '卫辉市', '3');
INSERT INTO `sys_china_area` VALUES (410782, 410700, '辉县市', '3');
INSERT INTO `sys_china_area` VALUES (410783, 410700, '长垣市', '3');
INSERT INTO `sys_china_area` VALUES (410800, 410000, '焦作市', '2');
INSERT INTO `sys_china_area` VALUES (410802, 410800, '解放区', '3');
INSERT INTO `sys_china_area` VALUES (410803, 410800, '中站区', '3');
INSERT INTO `sys_china_area` VALUES (410804, 410800, '马村区', '3');
INSERT INTO `sys_china_area` VALUES (410811, 410800, '山阳区', '3');
INSERT INTO `sys_china_area` VALUES (410821, 410800, '修武县', '3');
INSERT INTO `sys_china_area` VALUES (410822, 410800, '博爱县', '3');
INSERT INTO `sys_china_area` VALUES (410823, 410800, '武陟县', '3');
INSERT INTO `sys_china_area` VALUES (410825, 410800, '温县', '3');
INSERT INTO `sys_china_area` VALUES (410882, 410800, '沁阳市', '3');
INSERT INTO `sys_china_area` VALUES (410883, 410800, '孟州市', '3');
INSERT INTO `sys_china_area` VALUES (410900, 410000, '濮阳市', '2');
INSERT INTO `sys_china_area` VALUES (410902, 410900, '华龙区', '3');
INSERT INTO `sys_china_area` VALUES (410922, 410900, '清丰县', '3');
INSERT INTO `sys_china_area` VALUES (410923, 410900, '南乐县', '3');
INSERT INTO `sys_china_area` VALUES (410926, 410900, '范县', '3');
INSERT INTO `sys_china_area` VALUES (410927, 410900, '台前县', '3');
INSERT INTO `sys_china_area` VALUES (410928, 410900, '濮阳县', '3');
INSERT INTO `sys_china_area` VALUES (411000, 410000, '许昌市', '2');
INSERT INTO `sys_china_area` VALUES (411002, 411000, '魏都区', '3');
INSERT INTO `sys_china_area` VALUES (411003, 411000, '建安区', '3');
INSERT INTO `sys_china_area` VALUES (411024, 411000, '鄢陵县', '3');
INSERT INTO `sys_china_area` VALUES (411025, 411000, '襄城县', '3');
INSERT INTO `sys_china_area` VALUES (411081, 411000, '禹州市', '3');
INSERT INTO `sys_china_area` VALUES (411082, 411000, '长葛市', '3');
INSERT INTO `sys_china_area` VALUES (411100, 410000, '漯河市', '2');
INSERT INTO `sys_china_area` VALUES (411102, 411100, '源汇区', '3');
INSERT INTO `sys_china_area` VALUES (411103, 411100, '郾城区', '3');
INSERT INTO `sys_china_area` VALUES (411104, 411100, '召陵区', '3');
INSERT INTO `sys_china_area` VALUES (411121, 411100, '舞阳县', '3');
INSERT INTO `sys_china_area` VALUES (411122, 411100, '临颍县', '3');
INSERT INTO `sys_china_area` VALUES (411200, 410000, '三门峡市', '2');
INSERT INTO `sys_china_area` VALUES (411202, 411200, '湖滨区', '3');
INSERT INTO `sys_china_area` VALUES (411203, 411200, '陕州区', '3');
INSERT INTO `sys_china_area` VALUES (411221, 411200, '渑池县', '3');
INSERT INTO `sys_china_area` VALUES (411224, 411200, '卢氏县', '3');
INSERT INTO `sys_china_area` VALUES (411281, 411200, '义马市', '3');
INSERT INTO `sys_china_area` VALUES (411282, 411200, '灵宝市', '3');
INSERT INTO `sys_china_area` VALUES (411300, 410000, '南阳市', '2');
INSERT INTO `sys_china_area` VALUES (411302, 411300, '宛城区', '3');
INSERT INTO `sys_china_area` VALUES (411303, 411300, '卧龙区', '3');
INSERT INTO `sys_china_area` VALUES (411321, 411300, '南召县', '3');
INSERT INTO `sys_china_area` VALUES (411322, 411300, '方城县', '3');
INSERT INTO `sys_china_area` VALUES (411323, 411300, '西峡县', '3');
INSERT INTO `sys_china_area` VALUES (411324, 411300, '镇平县', '3');
INSERT INTO `sys_china_area` VALUES (411325, 411300, '内乡县', '3');
INSERT INTO `sys_china_area` VALUES (411326, 411300, '淅川县', '3');
INSERT INTO `sys_china_area` VALUES (411327, 411300, '社旗县', '3');
INSERT INTO `sys_china_area` VALUES (411328, 411300, '唐河县', '3');
INSERT INTO `sys_china_area` VALUES (411329, 411300, '新野县', '3');
INSERT INTO `sys_china_area` VALUES (411330, 411300, '桐柏县', '3');
INSERT INTO `sys_china_area` VALUES (411381, 411300, '邓州市', '3');
INSERT INTO `sys_china_area` VALUES (411400, 410000, '商丘市', '2');
INSERT INTO `sys_china_area` VALUES (411402, 411400, '梁园区', '3');
INSERT INTO `sys_china_area` VALUES (411403, 411400, '睢阳区', '3');
INSERT INTO `sys_china_area` VALUES (411421, 411400, '民权县', '3');
INSERT INTO `sys_china_area` VALUES (411422, 411400, '睢县', '3');
INSERT INTO `sys_china_area` VALUES (411423, 411400, '宁陵县', '3');
INSERT INTO `sys_china_area` VALUES (411424, 411400, '柘城县', '3');
INSERT INTO `sys_china_area` VALUES (411425, 411400, '虞城县', '3');
INSERT INTO `sys_china_area` VALUES (411426, 411400, '夏邑县', '3');
INSERT INTO `sys_china_area` VALUES (411481, 411400, '永城市', '3');
INSERT INTO `sys_china_area` VALUES (411500, 410000, '信阳市', '2');
INSERT INTO `sys_china_area` VALUES (411502, 411500, '浉河区', '3');
INSERT INTO `sys_china_area` VALUES (411503, 411500, '平桥区', '3');
INSERT INTO `sys_china_area` VALUES (411521, 411500, '罗山县', '3');
INSERT INTO `sys_china_area` VALUES (411522, 411500, '光山县', '3');
INSERT INTO `sys_china_area` VALUES (411523, 411500, '新县', '3');
INSERT INTO `sys_china_area` VALUES (411524, 411500, '商城县', '3');
INSERT INTO `sys_china_area` VALUES (411525, 411500, '固始县', '3');
INSERT INTO `sys_china_area` VALUES (411526, 411500, '潢川县', '3');
INSERT INTO `sys_china_area` VALUES (411527, 411500, '淮滨县', '3');
INSERT INTO `sys_china_area` VALUES (411528, 411500, '息县', '3');
INSERT INTO `sys_china_area` VALUES (411600, 410000, '周口市', '2');
INSERT INTO `sys_china_area` VALUES (411602, 411600, '川汇区', '3');
INSERT INTO `sys_china_area` VALUES (411603, 411600, '淮阳区', '3');
INSERT INTO `sys_china_area` VALUES (411621, 411600, '扶沟县', '3');
INSERT INTO `sys_china_area` VALUES (411622, 411600, '西华县', '3');
INSERT INTO `sys_china_area` VALUES (411623, 411600, '商水县', '3');
INSERT INTO `sys_china_area` VALUES (411624, 411600, '沈丘县', '3');
INSERT INTO `sys_china_area` VALUES (411625, 411600, '郸城县', '3');
INSERT INTO `sys_china_area` VALUES (411627, 411600, '太康县', '3');
INSERT INTO `sys_china_area` VALUES (411628, 411600, '鹿邑县', '3');
INSERT INTO `sys_china_area` VALUES (411681, 411600, '项城市', '3');
INSERT INTO `sys_china_area` VALUES (411700, 410000, '驻马店市', '2');
INSERT INTO `sys_china_area` VALUES (411702, 411700, '驿城区', '3');
INSERT INTO `sys_china_area` VALUES (411721, 411700, '西平县', '3');
INSERT INTO `sys_china_area` VALUES (411722, 411700, '上蔡县', '3');
INSERT INTO `sys_china_area` VALUES (411723, 411700, '平舆县', '3');
INSERT INTO `sys_china_area` VALUES (411724, 411700, '正阳县', '3');
INSERT INTO `sys_china_area` VALUES (411725, 411700, '确山县', '3');
INSERT INTO `sys_china_area` VALUES (411726, 411700, '泌阳县', '3');
INSERT INTO `sys_china_area` VALUES (411727, 411700, '汝南县', '3');
INSERT INTO `sys_china_area` VALUES (411728, 411700, '遂平县', '3');
INSERT INTO `sys_china_area` VALUES (411729, 411700, '新蔡县', '3');
INSERT INTO `sys_china_area` VALUES (419001, 410000, '济源市', '2');
INSERT INTO `sys_china_area` VALUES (420000, 0, '湖北省', '1');
INSERT INTO `sys_china_area` VALUES (420100, 420000, '武汉市', '2');
INSERT INTO `sys_china_area` VALUES (420102, 420100, '江岸区', '3');
INSERT INTO `sys_china_area` VALUES (420103, 420100, '江汉区', '3');
INSERT INTO `sys_china_area` VALUES (420104, 420100, '硚口区', '3');
INSERT INTO `sys_china_area` VALUES (420105, 420100, '汉阳区', '3');
INSERT INTO `sys_china_area` VALUES (420106, 420100, '武昌区', '3');
INSERT INTO `sys_china_area` VALUES (420107, 420100, '青山区', '3');
INSERT INTO `sys_china_area` VALUES (420111, 420100, '洪山区', '3');
INSERT INTO `sys_china_area` VALUES (420112, 420100, '东西湖区', '3');
INSERT INTO `sys_china_area` VALUES (420113, 420100, '汉南区', '3');
INSERT INTO `sys_china_area` VALUES (420114, 420100, '蔡甸区', '3');
INSERT INTO `sys_china_area` VALUES (420115, 420100, '江夏区', '3');
INSERT INTO `sys_china_area` VALUES (420116, 420100, '黄陂区', '3');
INSERT INTO `sys_china_area` VALUES (420117, 420100, '新洲区', '3');
INSERT INTO `sys_china_area` VALUES (420200, 420000, '黄石市', '2');
INSERT INTO `sys_china_area` VALUES (420202, 420200, '黄石港区', '3');
INSERT INTO `sys_china_area` VALUES (420203, 420200, '西塞山区', '3');
INSERT INTO `sys_china_area` VALUES (420204, 420200, '下陆区', '3');
INSERT INTO `sys_china_area` VALUES (420205, 420200, '铁山区', '3');
INSERT INTO `sys_china_area` VALUES (420222, 420200, '阳新县', '3');
INSERT INTO `sys_china_area` VALUES (420281, 420200, '大冶市', '3');
INSERT INTO `sys_china_area` VALUES (420300, 420000, '十堰市', '2');
INSERT INTO `sys_china_area` VALUES (420302, 420300, '茅箭区', '3');
INSERT INTO `sys_china_area` VALUES (420303, 420300, '张湾区', '3');
INSERT INTO `sys_china_area` VALUES (420304, 420300, '郧阳区', '3');
INSERT INTO `sys_china_area` VALUES (420322, 420300, '郧西县', '3');
INSERT INTO `sys_china_area` VALUES (420323, 420300, '竹山县', '3');
INSERT INTO `sys_china_area` VALUES (420324, 420300, '竹溪县', '3');
INSERT INTO `sys_china_area` VALUES (420325, 420300, '房县', '3');
INSERT INTO `sys_china_area` VALUES (420381, 420300, '丹江口市', '3');
INSERT INTO `sys_china_area` VALUES (420500, 420000, '宜昌市', '2');
INSERT INTO `sys_china_area` VALUES (420502, 420500, '西陵区', '3');
INSERT INTO `sys_china_area` VALUES (420503, 420500, '伍家岗区', '3');
INSERT INTO `sys_china_area` VALUES (420504, 420500, '点军区', '3');
INSERT INTO `sys_china_area` VALUES (420505, 420500, '猇亭区', '3');
INSERT INTO `sys_china_area` VALUES (420506, 420500, '夷陵区', '3');
INSERT INTO `sys_china_area` VALUES (420525, 420500, '远安县', '3');
INSERT INTO `sys_china_area` VALUES (420526, 420500, '兴山县', '3');
INSERT INTO `sys_china_area` VALUES (420527, 420500, '秭归县', '3');
INSERT INTO `sys_china_area` VALUES (420528, 420500, '长阳土家族自治县', '3');
INSERT INTO `sys_china_area` VALUES (420529, 420500, '五峰土家族自治县', '3');
INSERT INTO `sys_china_area` VALUES (420581, 420500, '宜都市', '3');
INSERT INTO `sys_china_area` VALUES (420582, 420500, '当阳市', '3');
INSERT INTO `sys_china_area` VALUES (420583, 420500, '枝江市', '3');
INSERT INTO `sys_china_area` VALUES (420600, 420000, '襄阳市', '2');
INSERT INTO `sys_china_area` VALUES (420602, 420600, '襄城区', '3');
INSERT INTO `sys_china_area` VALUES (420606, 420600, '樊城区', '3');
INSERT INTO `sys_china_area` VALUES (420607, 420600, '襄州区', '3');
INSERT INTO `sys_china_area` VALUES (420624, 420600, '南漳县', '3');
INSERT INTO `sys_china_area` VALUES (420625, 420600, '谷城县', '3');
INSERT INTO `sys_china_area` VALUES (420626, 420600, '保康县', '3');
INSERT INTO `sys_china_area` VALUES (420682, 420600, '老河口市', '3');
INSERT INTO `sys_china_area` VALUES (420683, 420600, '枣阳市', '3');
INSERT INTO `sys_china_area` VALUES (420684, 420600, '宜城市', '3');
INSERT INTO `sys_china_area` VALUES (420700, 420000, '鄂州市', '2');
INSERT INTO `sys_china_area` VALUES (420702, 420700, '梁子湖区', '3');
INSERT INTO `sys_china_area` VALUES (420703, 420700, '华容区', '3');
INSERT INTO `sys_china_area` VALUES (420704, 420700, '鄂城区', '3');
INSERT INTO `sys_china_area` VALUES (420800, 420000, '荆门市', '2');
INSERT INTO `sys_china_area` VALUES (420802, 420800, '东宝区', '3');
INSERT INTO `sys_china_area` VALUES (420804, 420800, '掇刀区', '3');
INSERT INTO `sys_china_area` VALUES (420822, 420800, '沙洋县', '3');
INSERT INTO `sys_china_area` VALUES (420881, 420800, '钟祥市', '3');
INSERT INTO `sys_china_area` VALUES (420882, 420800, '京山市', '3');
INSERT INTO `sys_china_area` VALUES (420900, 420000, '孝感市', '2');
INSERT INTO `sys_china_area` VALUES (420902, 420900, '孝南区', '3');
INSERT INTO `sys_china_area` VALUES (420921, 420900, '孝昌县', '3');
INSERT INTO `sys_china_area` VALUES (420922, 420900, '大悟县', '3');
INSERT INTO `sys_china_area` VALUES (420923, 420900, '云梦县', '3');
INSERT INTO `sys_china_area` VALUES (420981, 420900, '应城市', '3');
INSERT INTO `sys_china_area` VALUES (420982, 420900, '安陆市', '3');
INSERT INTO `sys_china_area` VALUES (420984, 420900, '汉川市', '3');
INSERT INTO `sys_china_area` VALUES (421000, 420000, '荆州市', '2');
INSERT INTO `sys_china_area` VALUES (421002, 421000, '沙市区', '3');
INSERT INTO `sys_china_area` VALUES (421003, 421000, '荆州区', '3');
INSERT INTO `sys_china_area` VALUES (421022, 421000, '公安县', '3');
INSERT INTO `sys_china_area` VALUES (421023, 421000, '监利县', '3');
INSERT INTO `sys_china_area` VALUES (421024, 421000, '江陵县', '3');
INSERT INTO `sys_china_area` VALUES (421081, 421000, '石首市', '3');
INSERT INTO `sys_china_area` VALUES (421083, 421000, '洪湖市', '3');
INSERT INTO `sys_china_area` VALUES (421087, 421000, '松滋市', '3');
INSERT INTO `sys_china_area` VALUES (421100, 420000, '黄冈市', '2');
INSERT INTO `sys_china_area` VALUES (421102, 421100, '黄州区', '3');
INSERT INTO `sys_china_area` VALUES (421121, 421100, '团风县', '3');
INSERT INTO `sys_china_area` VALUES (421122, 421100, '红安县', '3');
INSERT INTO `sys_china_area` VALUES (421123, 421100, '罗田县', '3');
INSERT INTO `sys_china_area` VALUES (421124, 421100, '英山县', '3');
INSERT INTO `sys_china_area` VALUES (421125, 421100, '浠水县', '3');
INSERT INTO `sys_china_area` VALUES (421126, 421100, '蕲春县', '3');
INSERT INTO `sys_china_area` VALUES (421127, 421100, '黄梅县', '3');
INSERT INTO `sys_china_area` VALUES (421181, 421100, '麻城市', '3');
INSERT INTO `sys_china_area` VALUES (421182, 421100, '武穴市', '3');
INSERT INTO `sys_china_area` VALUES (421200, 420000, '咸宁市', '2');
INSERT INTO `sys_china_area` VALUES (421202, 421200, '咸安区', '3');
INSERT INTO `sys_china_area` VALUES (421221, 421200, '嘉鱼县', '3');
INSERT INTO `sys_china_area` VALUES (421222, 421200, '通城县', '3');
INSERT INTO `sys_china_area` VALUES (421223, 421200, '崇阳县', '3');
INSERT INTO `sys_china_area` VALUES (421224, 421200, '通山县', '3');
INSERT INTO `sys_china_area` VALUES (421281, 421200, '赤壁市', '3');
INSERT INTO `sys_china_area` VALUES (421300, 420000, '随州市', '2');
INSERT INTO `sys_china_area` VALUES (421303, 421300, '曾都区', '3');
INSERT INTO `sys_china_area` VALUES (421321, 421300, '随县', '3');
INSERT INTO `sys_china_area` VALUES (421381, 421300, '广水市', '3');
INSERT INTO `sys_china_area` VALUES (422800, 420000, '恩施土家族苗族自治州', '2');
INSERT INTO `sys_china_area` VALUES (422801, 422800, '恩施市', '3');
INSERT INTO `sys_china_area` VALUES (422802, 422800, '利川市', '3');
INSERT INTO `sys_china_area` VALUES (422822, 422800, '建始县', '3');
INSERT INTO `sys_china_area` VALUES (422823, 422800, '巴东县', '3');
INSERT INTO `sys_china_area` VALUES (422825, 422800, '宣恩县', '3');
INSERT INTO `sys_china_area` VALUES (422826, 422800, '咸丰县', '3');
INSERT INTO `sys_china_area` VALUES (422827, 422800, '来凤县', '3');
INSERT INTO `sys_china_area` VALUES (422828, 422800, '鹤峰县', '3');
INSERT INTO `sys_china_area` VALUES (429004, 420000, '仙桃市', '2');
INSERT INTO `sys_china_area` VALUES (429005, 420000, '潜江市', '2');
INSERT INTO `sys_china_area` VALUES (429006, 420000, '天门市', '2');
INSERT INTO `sys_china_area` VALUES (429021, 420000, '神农架林区', '2');
INSERT INTO `sys_china_area` VALUES (430000, 0, '湖南省', '1');
INSERT INTO `sys_china_area` VALUES (430100, 430000, '长沙市', '2');
INSERT INTO `sys_china_area` VALUES (430102, 430100, '芙蓉区', '3');
INSERT INTO `sys_china_area` VALUES (430103, 430100, '天心区', '3');
INSERT INTO `sys_china_area` VALUES (430104, 430100, '岳麓区', '3');
INSERT INTO `sys_china_area` VALUES (430105, 430100, '开福区', '3');
INSERT INTO `sys_china_area` VALUES (430111, 430100, '雨花区', '3');
INSERT INTO `sys_china_area` VALUES (430112, 430100, '望城区', '3');
INSERT INTO `sys_china_area` VALUES (430121, 430100, '长沙县', '3');
INSERT INTO `sys_china_area` VALUES (430181, 430100, '浏阳市', '3');
INSERT INTO `sys_china_area` VALUES (430182, 430100, '宁乡市', '3');
INSERT INTO `sys_china_area` VALUES (430200, 430000, '株洲市', '2');
INSERT INTO `sys_china_area` VALUES (430202, 430200, '荷塘区', '3');
INSERT INTO `sys_china_area` VALUES (430203, 430200, '芦淞区', '3');
INSERT INTO `sys_china_area` VALUES (430204, 430200, '石峰区', '3');
INSERT INTO `sys_china_area` VALUES (430211, 430200, '天元区', '3');
INSERT INTO `sys_china_area` VALUES (430212, 430200, '渌口区', '3');
INSERT INTO `sys_china_area` VALUES (430223, 430200, '攸县', '3');
INSERT INTO `sys_china_area` VALUES (430224, 430200, '茶陵县', '3');
INSERT INTO `sys_china_area` VALUES (430225, 430200, '炎陵县', '3');
INSERT INTO `sys_china_area` VALUES (430281, 430200, '醴陵市', '3');
INSERT INTO `sys_china_area` VALUES (430300, 430000, '湘潭市', '2');
INSERT INTO `sys_china_area` VALUES (430302, 430300, '雨湖区', '3');
INSERT INTO `sys_china_area` VALUES (430304, 430300, '岳塘区', '3');
INSERT INTO `sys_china_area` VALUES (430321, 430300, '湘潭县', '3');
INSERT INTO `sys_china_area` VALUES (430381, 430300, '湘乡市', '3');
INSERT INTO `sys_china_area` VALUES (430382, 430300, '韶山市', '3');
INSERT INTO `sys_china_area` VALUES (430400, 430000, '衡阳市', '2');
INSERT INTO `sys_china_area` VALUES (430405, 430400, '珠晖区', '3');
INSERT INTO `sys_china_area` VALUES (430406, 430400, '雁峰区', '3');
INSERT INTO `sys_china_area` VALUES (430407, 430400, '石鼓区', '3');
INSERT INTO `sys_china_area` VALUES (430408, 430400, '蒸湘区', '3');
INSERT INTO `sys_china_area` VALUES (430412, 430400, '南岳区', '3');
INSERT INTO `sys_china_area` VALUES (430421, 430400, '衡阳县', '3');
INSERT INTO `sys_china_area` VALUES (430422, 430400, '衡南县', '3');
INSERT INTO `sys_china_area` VALUES (430423, 430400, '衡山县', '3');
INSERT INTO `sys_china_area` VALUES (430424, 430400, '衡东县', '3');
INSERT INTO `sys_china_area` VALUES (430426, 430400, '祁东县', '3');
INSERT INTO `sys_china_area` VALUES (430481, 430400, '耒阳市', '3');
INSERT INTO `sys_china_area` VALUES (430482, 430400, '常宁市', '3');
INSERT INTO `sys_china_area` VALUES (430500, 430000, '邵阳市', '2');
INSERT INTO `sys_china_area` VALUES (430502, 430500, '双清区', '3');
INSERT INTO `sys_china_area` VALUES (430503, 430500, '大祥区', '3');
INSERT INTO `sys_china_area` VALUES (430511, 430500, '北塔区', '3');
INSERT INTO `sys_china_area` VALUES (430522, 430500, '新邵县', '3');
INSERT INTO `sys_china_area` VALUES (430523, 430500, '邵阳县', '3');
INSERT INTO `sys_china_area` VALUES (430524, 430500, '隆回县', '3');
INSERT INTO `sys_china_area` VALUES (430525, 430500, '洞口县', '3');
INSERT INTO `sys_china_area` VALUES (430527, 430500, '绥宁县', '3');
INSERT INTO `sys_china_area` VALUES (430528, 430500, '新宁县', '3');
INSERT INTO `sys_china_area` VALUES (430529, 430500, '城步苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (430581, 430500, '武冈市', '3');
INSERT INTO `sys_china_area` VALUES (430582, 430500, '邵东市', '3');
INSERT INTO `sys_china_area` VALUES (430600, 430000, '岳阳市', '2');
INSERT INTO `sys_china_area` VALUES (430602, 430600, '岳阳楼区', '3');
INSERT INTO `sys_china_area` VALUES (430603, 430600, '云溪区', '3');
INSERT INTO `sys_china_area` VALUES (430611, 430600, '君山区', '3');
INSERT INTO `sys_china_area` VALUES (430621, 430600, '岳阳县', '3');
INSERT INTO `sys_china_area` VALUES (430623, 430600, '华容县', '3');
INSERT INTO `sys_china_area` VALUES (430624, 430600, '湘阴县', '3');
INSERT INTO `sys_china_area` VALUES (430626, 430600, '平江县', '3');
INSERT INTO `sys_china_area` VALUES (430681, 430600, '汨罗市', '3');
INSERT INTO `sys_china_area` VALUES (430682, 430600, '临湘市', '3');
INSERT INTO `sys_china_area` VALUES (430700, 430000, '常德市', '2');
INSERT INTO `sys_china_area` VALUES (430702, 430700, '武陵区', '3');
INSERT INTO `sys_china_area` VALUES (430703, 430700, '鼎城区', '3');
INSERT INTO `sys_china_area` VALUES (430721, 430700, '安乡县', '3');
INSERT INTO `sys_china_area` VALUES (430722, 430700, '汉寿县', '3');
INSERT INTO `sys_china_area` VALUES (430723, 430700, '澧县', '3');
INSERT INTO `sys_china_area` VALUES (430724, 430700, '临澧县', '3');
INSERT INTO `sys_china_area` VALUES (430725, 430700, '桃源县', '3');
INSERT INTO `sys_china_area` VALUES (430726, 430700, '石门县', '3');
INSERT INTO `sys_china_area` VALUES (430781, 430700, '津市市', '3');
INSERT INTO `sys_china_area` VALUES (430800, 430000, '张家界市', '2');
INSERT INTO `sys_china_area` VALUES (430802, 430800, '永定区', '3');
INSERT INTO `sys_china_area` VALUES (430811, 430800, '武陵源区', '3');
INSERT INTO `sys_china_area` VALUES (430821, 430800, '慈利县', '3');
INSERT INTO `sys_china_area` VALUES (430822, 430800, '桑植县', '3');
INSERT INTO `sys_china_area` VALUES (430900, 430000, '益阳市', '2');
INSERT INTO `sys_china_area` VALUES (430902, 430900, '资阳区', '3');
INSERT INTO `sys_china_area` VALUES (430903, 430900, '赫山区', '3');
INSERT INTO `sys_china_area` VALUES (430921, 430900, '南县', '3');
INSERT INTO `sys_china_area` VALUES (430922, 430900, '桃江县', '3');
INSERT INTO `sys_china_area` VALUES (430923, 430900, '安化县', '3');
INSERT INTO `sys_china_area` VALUES (430981, 430900, '沅江市', '3');
INSERT INTO `sys_china_area` VALUES (431000, 430000, '郴州市', '2');
INSERT INTO `sys_china_area` VALUES (431002, 431000, '北湖区', '3');
INSERT INTO `sys_china_area` VALUES (431003, 431000, '苏仙区', '3');
INSERT INTO `sys_china_area` VALUES (431021, 431000, '桂阳县', '3');
INSERT INTO `sys_china_area` VALUES (431022, 431000, '宜章县', '3');
INSERT INTO `sys_china_area` VALUES (431023, 431000, '永兴县', '3');
INSERT INTO `sys_china_area` VALUES (431024, 431000, '嘉禾县', '3');
INSERT INTO `sys_china_area` VALUES (431025, 431000, '临武县', '3');
INSERT INTO `sys_china_area` VALUES (431026, 431000, '汝城县', '3');
INSERT INTO `sys_china_area` VALUES (431027, 431000, '桂东县', '3');
INSERT INTO `sys_china_area` VALUES (431028, 431000, '安仁县', '3');
INSERT INTO `sys_china_area` VALUES (431081, 431000, '资兴市', '3');
INSERT INTO `sys_china_area` VALUES (431100, 430000, '永州市', '2');
INSERT INTO `sys_china_area` VALUES (431102, 431100, '零陵区', '3');
INSERT INTO `sys_china_area` VALUES (431103, 431100, '冷水滩区', '3');
INSERT INTO `sys_china_area` VALUES (431121, 431100, '祁阳县', '3');
INSERT INTO `sys_china_area` VALUES (431122, 431100, '东安县', '3');
INSERT INTO `sys_china_area` VALUES (431123, 431100, '双牌县', '3');
INSERT INTO `sys_china_area` VALUES (431124, 431100, '道县', '3');
INSERT INTO `sys_china_area` VALUES (431125, 431100, '江永县', '3');
INSERT INTO `sys_china_area` VALUES (431126, 431100, '宁远县', '3');
INSERT INTO `sys_china_area` VALUES (431127, 431100, '蓝山县', '3');
INSERT INTO `sys_china_area` VALUES (431128, 431100, '新田县', '3');
INSERT INTO `sys_china_area` VALUES (431129, 431100, '江华瑶族自治县', '3');
INSERT INTO `sys_china_area` VALUES (431200, 430000, '怀化市', '2');
INSERT INTO `sys_china_area` VALUES (431202, 431200, '鹤城区', '3');
INSERT INTO `sys_china_area` VALUES (431221, 431200, '中方县', '3');
INSERT INTO `sys_china_area` VALUES (431222, 431200, '沅陵县', '3');
INSERT INTO `sys_china_area` VALUES (431223, 431200, '辰溪县', '3');
INSERT INTO `sys_china_area` VALUES (431224, 431200, '溆浦县', '3');
INSERT INTO `sys_china_area` VALUES (431225, 431200, '会同县', '3');
INSERT INTO `sys_china_area` VALUES (431226, 431200, '麻阳苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (431227, 431200, '新晃侗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (431228, 431200, '芷江侗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (431229, 431200, '靖州苗族侗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (431230, 431200, '通道侗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (431281, 431200, '洪江市', '3');
INSERT INTO `sys_china_area` VALUES (431300, 430000, '娄底市', '2');
INSERT INTO `sys_china_area` VALUES (431302, 431300, '娄星区', '3');
INSERT INTO `sys_china_area` VALUES (431321, 431300, '双峰县', '3');
INSERT INTO `sys_china_area` VALUES (431322, 431300, '新化县', '3');
INSERT INTO `sys_china_area` VALUES (431381, 431300, '冷水江市', '3');
INSERT INTO `sys_china_area` VALUES (431382, 431300, '涟源市', '3');
INSERT INTO `sys_china_area` VALUES (433100, 430000, '湘西土家族苗族自治州', '2');
INSERT INTO `sys_china_area` VALUES (433101, 433100, '吉首市', '3');
INSERT INTO `sys_china_area` VALUES (433122, 433100, '泸溪县', '3');
INSERT INTO `sys_china_area` VALUES (433123, 433100, '凤凰县', '3');
INSERT INTO `sys_china_area` VALUES (433124, 433100, '花垣县', '3');
INSERT INTO `sys_china_area` VALUES (433125, 433100, '保靖县', '3');
INSERT INTO `sys_china_area` VALUES (433126, 433100, '古丈县', '3');
INSERT INTO `sys_china_area` VALUES (433127, 433100, '永顺县', '3');
INSERT INTO `sys_china_area` VALUES (433130, 433100, '龙山县', '3');
INSERT INTO `sys_china_area` VALUES (440000, 0, '广东省', '1');
INSERT INTO `sys_china_area` VALUES (440100, 440000, '广州市', '2');
INSERT INTO `sys_china_area` VALUES (440103, 440100, '荔湾区', '3');
INSERT INTO `sys_china_area` VALUES (440104, 440100, '越秀区', '3');
INSERT INTO `sys_china_area` VALUES (440105, 440100, '海珠区', '3');
INSERT INTO `sys_china_area` VALUES (440106, 440100, '天河区', '3');
INSERT INTO `sys_china_area` VALUES (440111, 440100, '白云区', '3');
INSERT INTO `sys_china_area` VALUES (440112, 440100, '黄埔区', '3');
INSERT INTO `sys_china_area` VALUES (440113, 440100, '番禺区', '3');
INSERT INTO `sys_china_area` VALUES (440114, 440100, '花都区', '3');
INSERT INTO `sys_china_area` VALUES (440115, 440100, '南沙区', '3');
INSERT INTO `sys_china_area` VALUES (440117, 440100, '从化区', '3');
INSERT INTO `sys_china_area` VALUES (440118, 440100, '增城区', '3');
INSERT INTO `sys_china_area` VALUES (440200, 440000, '韶关市', '2');
INSERT INTO `sys_china_area` VALUES (440203, 440200, '武江区', '3');
INSERT INTO `sys_china_area` VALUES (440204, 440200, '浈江区', '3');
INSERT INTO `sys_china_area` VALUES (440205, 440200, '曲江区', '3');
INSERT INTO `sys_china_area` VALUES (440222, 440200, '始兴县', '3');
INSERT INTO `sys_china_area` VALUES (440224, 440200, '仁化县', '3');
INSERT INTO `sys_china_area` VALUES (440229, 440200, '翁源县', '3');
INSERT INTO `sys_china_area` VALUES (440232, 440200, '乳源瑶族自治县', '3');
INSERT INTO `sys_china_area` VALUES (440233, 440200, '新丰县', '3');
INSERT INTO `sys_china_area` VALUES (440281, 440200, '乐昌市', '3');
INSERT INTO `sys_china_area` VALUES (440282, 440200, '南雄市', '3');
INSERT INTO `sys_china_area` VALUES (440300, 440000, '深圳市', '2');
INSERT INTO `sys_china_area` VALUES (440303, 440300, '罗湖区', '3');
INSERT INTO `sys_china_area` VALUES (440304, 440300, '福田区', '3');
INSERT INTO `sys_china_area` VALUES (440305, 440300, '南山区', '3');
INSERT INTO `sys_china_area` VALUES (440306, 440300, '宝安区', '3');
INSERT INTO `sys_china_area` VALUES (440307, 440300, '龙岗区', '3');
INSERT INTO `sys_china_area` VALUES (440308, 440300, '盐田区', '3');
INSERT INTO `sys_china_area` VALUES (440309, 440300, '龙华区', '3');
INSERT INTO `sys_china_area` VALUES (440310, 440300, '坪山区', '3');
INSERT INTO `sys_china_area` VALUES (440311, 440300, '光明区', '3');
INSERT INTO `sys_china_area` VALUES (440400, 440000, '珠海市', '2');
INSERT INTO `sys_china_area` VALUES (440402, 440400, '香洲区', '3');
INSERT INTO `sys_china_area` VALUES (440403, 440400, '斗门区', '3');
INSERT INTO `sys_china_area` VALUES (440404, 440400, '金湾区', '3');
INSERT INTO `sys_china_area` VALUES (440500, 440000, '汕头市', '2');
INSERT INTO `sys_china_area` VALUES (440507, 440500, '龙湖区', '3');
INSERT INTO `sys_china_area` VALUES (440511, 440500, '金平区', '3');
INSERT INTO `sys_china_area` VALUES (440512, 440500, '濠江区', '3');
INSERT INTO `sys_china_area` VALUES (440513, 440500, '潮阳区', '3');
INSERT INTO `sys_china_area` VALUES (440514, 440500, '潮南区', '3');
INSERT INTO `sys_china_area` VALUES (440515, 440500, '澄海区', '3');
INSERT INTO `sys_china_area` VALUES (440523, 440500, '南澳县', '3');
INSERT INTO `sys_china_area` VALUES (440600, 440000, '佛山市', '2');
INSERT INTO `sys_china_area` VALUES (440604, 440600, '禅城区', '3');
INSERT INTO `sys_china_area` VALUES (440605, 440600, '南海区', '3');
INSERT INTO `sys_china_area` VALUES (440606, 440600, '顺德区', '3');
INSERT INTO `sys_china_area` VALUES (440607, 440600, '三水区', '3');
INSERT INTO `sys_china_area` VALUES (440608, 440600, '高明区', '3');
INSERT INTO `sys_china_area` VALUES (440700, 440000, '江门市', '2');
INSERT INTO `sys_china_area` VALUES (440703, 440700, '蓬江区', '3');
INSERT INTO `sys_china_area` VALUES (440704, 440700, '江海区', '3');
INSERT INTO `sys_china_area` VALUES (440705, 440700, '新会区', '3');
INSERT INTO `sys_china_area` VALUES (440781, 440700, '台山市', '3');
INSERT INTO `sys_china_area` VALUES (440783, 440700, '开平市', '3');
INSERT INTO `sys_china_area` VALUES (440784, 440700, '鹤山市', '3');
INSERT INTO `sys_china_area` VALUES (440785, 440700, '恩平市', '3');
INSERT INTO `sys_china_area` VALUES (440800, 440000, '湛江市', '2');
INSERT INTO `sys_china_area` VALUES (440802, 440800, '赤坎区', '3');
INSERT INTO `sys_china_area` VALUES (440803, 440800, '霞山区', '3');
INSERT INTO `sys_china_area` VALUES (440804, 440800, '坡头区', '3');
INSERT INTO `sys_china_area` VALUES (440811, 440800, '麻章区', '3');
INSERT INTO `sys_china_area` VALUES (440823, 440800, '遂溪县', '3');
INSERT INTO `sys_china_area` VALUES (440825, 440800, '徐闻县', '3');
INSERT INTO `sys_china_area` VALUES (440881, 440800, '廉江市', '3');
INSERT INTO `sys_china_area` VALUES (440882, 440800, '雷州市', '3');
INSERT INTO `sys_china_area` VALUES (440883, 440800, '吴川市', '3');
INSERT INTO `sys_china_area` VALUES (440900, 440000, '茂名市', '2');
INSERT INTO `sys_china_area` VALUES (440902, 440900, '茂南区', '3');
INSERT INTO `sys_china_area` VALUES (440904, 440900, '电白区', '3');
INSERT INTO `sys_china_area` VALUES (440981, 440900, '高州市', '3');
INSERT INTO `sys_china_area` VALUES (440982, 440900, '化州市', '3');
INSERT INTO `sys_china_area` VALUES (440983, 440900, '信宜市', '3');
INSERT INTO `sys_china_area` VALUES (441200, 440000, '肇庆市', '2');
INSERT INTO `sys_china_area` VALUES (441202, 441200, '端州区', '3');
INSERT INTO `sys_china_area` VALUES (441203, 441200, '鼎湖区', '3');
INSERT INTO `sys_china_area` VALUES (441204, 441200, '高要区', '3');
INSERT INTO `sys_china_area` VALUES (441223, 441200, '广宁县', '3');
INSERT INTO `sys_china_area` VALUES (441224, 441200, '怀集县', '3');
INSERT INTO `sys_china_area` VALUES (441225, 441200, '封开县', '3');
INSERT INTO `sys_china_area` VALUES (441226, 441200, '德庆县', '3');
INSERT INTO `sys_china_area` VALUES (441284, 441200, '四会市', '3');
INSERT INTO `sys_china_area` VALUES (441300, 440000, '惠州市', '2');
INSERT INTO `sys_china_area` VALUES (441302, 441300, '惠城区', '3');
INSERT INTO `sys_china_area` VALUES (441303, 441300, '惠阳区', '3');
INSERT INTO `sys_china_area` VALUES (441322, 441300, '博罗县', '3');
INSERT INTO `sys_china_area` VALUES (441323, 441300, '惠东县', '3');
INSERT INTO `sys_china_area` VALUES (441324, 441300, '龙门县', '3');
INSERT INTO `sys_china_area` VALUES (441400, 440000, '梅州市', '2');
INSERT INTO `sys_china_area` VALUES (441402, 441400, '梅江区', '3');
INSERT INTO `sys_china_area` VALUES (441403, 441400, '梅县区', '3');
INSERT INTO `sys_china_area` VALUES (441422, 441400, '大埔县', '3');
INSERT INTO `sys_china_area` VALUES (441423, 441400, '丰顺县', '3');
INSERT INTO `sys_china_area` VALUES (441424, 441400, '五华县', '3');
INSERT INTO `sys_china_area` VALUES (441426, 441400, '平远县', '3');
INSERT INTO `sys_china_area` VALUES (441427, 441400, '蕉岭县', '3');
INSERT INTO `sys_china_area` VALUES (441481, 441400, '兴宁市', '3');
INSERT INTO `sys_china_area` VALUES (441500, 440000, '汕尾市', '2');
INSERT INTO `sys_china_area` VALUES (441502, 441500, '城区', '3');
INSERT INTO `sys_china_area` VALUES (441521, 441500, '海丰县', '3');
INSERT INTO `sys_china_area` VALUES (441523, 441500, '陆河县', '3');
INSERT INTO `sys_china_area` VALUES (441581, 441500, '陆丰市', '3');
INSERT INTO `sys_china_area` VALUES (441600, 440000, '河源市', '2');
INSERT INTO `sys_china_area` VALUES (441602, 441600, '源城区', '3');
INSERT INTO `sys_china_area` VALUES (441621, 441600, '紫金县', '3');
INSERT INTO `sys_china_area` VALUES (441622, 441600, '龙川县', '3');
INSERT INTO `sys_china_area` VALUES (441623, 441600, '连平县', '3');
INSERT INTO `sys_china_area` VALUES (441624, 441600, '和平县', '3');
INSERT INTO `sys_china_area` VALUES (441625, 441600, '东源县', '3');
INSERT INTO `sys_china_area` VALUES (441700, 440000, '阳江市', '2');
INSERT INTO `sys_china_area` VALUES (441702, 441700, '江城区', '3');
INSERT INTO `sys_china_area` VALUES (441704, 441700, '阳东区', '3');
INSERT INTO `sys_china_area` VALUES (441721, 441700, '阳西县', '3');
INSERT INTO `sys_china_area` VALUES (441781, 441700, '阳春市', '3');
INSERT INTO `sys_china_area` VALUES (441800, 440000, '清远市', '2');
INSERT INTO `sys_china_area` VALUES (441802, 441800, '清城区', '3');
INSERT INTO `sys_china_area` VALUES (441803, 441800, '清新区', '3');
INSERT INTO `sys_china_area` VALUES (441821, 441800, '佛冈县', '3');
INSERT INTO `sys_china_area` VALUES (441823, 441800, '阳山县', '3');
INSERT INTO `sys_china_area` VALUES (441825, 441800, '连山壮族瑶族自治县', '3');
INSERT INTO `sys_china_area` VALUES (441826, 441800, '连南瑶族自治县', '3');
INSERT INTO `sys_china_area` VALUES (441881, 441800, '英德市', '3');
INSERT INTO `sys_china_area` VALUES (441882, 441800, '连州市', '3');
INSERT INTO `sys_china_area` VALUES (441900, 440000, '东莞市', '2');
INSERT INTO `sys_china_area` VALUES (442000, 440000, '中山市', '2');
INSERT INTO `sys_china_area` VALUES (445100, 440000, '潮州市', '2');
INSERT INTO `sys_china_area` VALUES (445102, 445100, '湘桥区', '3');
INSERT INTO `sys_china_area` VALUES (445103, 445100, '潮安区', '3');
INSERT INTO `sys_china_area` VALUES (445122, 445100, '饶平县', '3');
INSERT INTO `sys_china_area` VALUES (445200, 440000, '揭阳市', '2');
INSERT INTO `sys_china_area` VALUES (445202, 445200, '榕城区', '3');
INSERT INTO `sys_china_area` VALUES (445203, 445200, '揭东区', '3');
INSERT INTO `sys_china_area` VALUES (445222, 445200, '揭西县', '3');
INSERT INTO `sys_china_area` VALUES (445224, 445200, '惠来县', '3');
INSERT INTO `sys_china_area` VALUES (445281, 445200, '普宁市', '3');
INSERT INTO `sys_china_area` VALUES (445300, 440000, '云浮市', '2');
INSERT INTO `sys_china_area` VALUES (445302, 445300, '云城区', '3');
INSERT INTO `sys_china_area` VALUES (445303, 445300, '云安区', '3');
INSERT INTO `sys_china_area` VALUES (445321, 445300, '新兴县', '3');
INSERT INTO `sys_china_area` VALUES (445322, 445300, '郁南县', '3');
INSERT INTO `sys_china_area` VALUES (445381, 445300, '罗定市', '3');
INSERT INTO `sys_china_area` VALUES (450000, 0, '广西壮族自治区', '1');
INSERT INTO `sys_china_area` VALUES (450100, 450000, '南宁市', '2');
INSERT INTO `sys_china_area` VALUES (450102, 450100, '兴宁区', '3');
INSERT INTO `sys_china_area` VALUES (450103, 450100, '青秀区', '3');
INSERT INTO `sys_china_area` VALUES (450105, 450100, '江南区', '3');
INSERT INTO `sys_china_area` VALUES (450107, 450100, '西乡塘区', '3');
INSERT INTO `sys_china_area` VALUES (450108, 450100, '良庆区', '3');
INSERT INTO `sys_china_area` VALUES (450109, 450100, '邕宁区', '3');
INSERT INTO `sys_china_area` VALUES (450110, 450100, '武鸣区', '3');
INSERT INTO `sys_china_area` VALUES (450123, 450100, '隆安县', '3');
INSERT INTO `sys_china_area` VALUES (450124, 450100, '马山县', '3');
INSERT INTO `sys_china_area` VALUES (450125, 450100, '上林县', '3');
INSERT INTO `sys_china_area` VALUES (450126, 450100, '宾阳县', '3');
INSERT INTO `sys_china_area` VALUES (450127, 450100, '横县', '3');
INSERT INTO `sys_china_area` VALUES (450200, 450000, '柳州市', '2');
INSERT INTO `sys_china_area` VALUES (450202, 450200, '城中区', '3');
INSERT INTO `sys_china_area` VALUES (450203, 450200, '鱼峰区', '3');
INSERT INTO `sys_china_area` VALUES (450204, 450200, '柳南区', '3');
INSERT INTO `sys_china_area` VALUES (450205, 450200, '柳北区', '3');
INSERT INTO `sys_china_area` VALUES (450206, 450200, '柳江区', '3');
INSERT INTO `sys_china_area` VALUES (450222, 450200, '柳城县', '3');
INSERT INTO `sys_china_area` VALUES (450223, 450200, '鹿寨县', '3');
INSERT INTO `sys_china_area` VALUES (450224, 450200, '融安县', '3');
INSERT INTO `sys_china_area` VALUES (450225, 450200, '融水苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (450226, 450200, '三江侗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (450300, 450000, '桂林市', '2');
INSERT INTO `sys_china_area` VALUES (450302, 450300, '秀峰区', '3');
INSERT INTO `sys_china_area` VALUES (450303, 450300, '叠彩区', '3');
INSERT INTO `sys_china_area` VALUES (450304, 450300, '象山区', '3');
INSERT INTO `sys_china_area` VALUES (450305, 450300, '七星区', '3');
INSERT INTO `sys_china_area` VALUES (450311, 450300, '雁山区', '3');
INSERT INTO `sys_china_area` VALUES (450312, 450300, '临桂区', '3');
INSERT INTO `sys_china_area` VALUES (450321, 450300, '阳朔县', '3');
INSERT INTO `sys_china_area` VALUES (450323, 450300, '灵川县', '3');
INSERT INTO `sys_china_area` VALUES (450324, 450300, '全州县', '3');
INSERT INTO `sys_china_area` VALUES (450325, 450300, '兴安县', '3');
INSERT INTO `sys_china_area` VALUES (450326, 450300, '永福县', '3');
INSERT INTO `sys_china_area` VALUES (450327, 450300, '灌阳县', '3');
INSERT INTO `sys_china_area` VALUES (450328, 450300, '龙胜各族自治县', '3');
INSERT INTO `sys_china_area` VALUES (450329, 450300, '资源县', '3');
INSERT INTO `sys_china_area` VALUES (450330, 450300, '平乐县', '3');
INSERT INTO `sys_china_area` VALUES (450332, 450300, '恭城瑶族自治县', '3');
INSERT INTO `sys_china_area` VALUES (450381, 450300, '荔浦市', '3');
INSERT INTO `sys_china_area` VALUES (450400, 450000, '梧州市', '2');
INSERT INTO `sys_china_area` VALUES (450403, 450400, '万秀区', '3');
INSERT INTO `sys_china_area` VALUES (450405, 450400, '长洲区', '3');
INSERT INTO `sys_china_area` VALUES (450406, 450400, '龙圩区', '3');
INSERT INTO `sys_china_area` VALUES (450421, 450400, '苍梧县', '3');
INSERT INTO `sys_china_area` VALUES (450422, 450400, '藤县', '3');
INSERT INTO `sys_china_area` VALUES (450423, 450400, '蒙山县', '3');
INSERT INTO `sys_china_area` VALUES (450481, 450400, '岑溪市', '3');
INSERT INTO `sys_china_area` VALUES (450500, 450000, '北海市', '2');
INSERT INTO `sys_china_area` VALUES (450502, 450500, '海城区', '3');
INSERT INTO `sys_china_area` VALUES (450503, 450500, '银海区', '3');
INSERT INTO `sys_china_area` VALUES (450512, 450500, '铁山港区', '3');
INSERT INTO `sys_china_area` VALUES (450521, 450500, '合浦县', '3');
INSERT INTO `sys_china_area` VALUES (450600, 450000, '防城港市', '2');
INSERT INTO `sys_china_area` VALUES (450602, 450600, '港口区', '3');
INSERT INTO `sys_china_area` VALUES (450603, 450600, '防城区', '3');
INSERT INTO `sys_china_area` VALUES (450621, 450600, '上思县', '3');
INSERT INTO `sys_china_area` VALUES (450681, 450600, '东兴市', '3');
INSERT INTO `sys_china_area` VALUES (450700, 450000, '钦州市', '2');
INSERT INTO `sys_china_area` VALUES (450702, 450700, '钦南区', '3');
INSERT INTO `sys_china_area` VALUES (450703, 450700, '钦北区', '3');
INSERT INTO `sys_china_area` VALUES (450721, 450700, '灵山县', '3');
INSERT INTO `sys_china_area` VALUES (450722, 450700, '浦北县', '3');
INSERT INTO `sys_china_area` VALUES (450800, 450000, '贵港市', '2');
INSERT INTO `sys_china_area` VALUES (450802, 450800, '港北区', '3');
INSERT INTO `sys_china_area` VALUES (450803, 450800, '港南区', '3');
INSERT INTO `sys_china_area` VALUES (450804, 450800, '覃塘区', '3');
INSERT INTO `sys_china_area` VALUES (450821, 450800, '平南县', '3');
INSERT INTO `sys_china_area` VALUES (450881, 450800, '桂平市', '3');
INSERT INTO `sys_china_area` VALUES (450900, 450000, '玉林市', '2');
INSERT INTO `sys_china_area` VALUES (450902, 450900, '玉州区', '3');
INSERT INTO `sys_china_area` VALUES (450903, 450900, '福绵区', '3');
INSERT INTO `sys_china_area` VALUES (450921, 450900, '容县', '3');
INSERT INTO `sys_china_area` VALUES (450922, 450900, '陆川县', '3');
INSERT INTO `sys_china_area` VALUES (450923, 450900, '博白县', '3');
INSERT INTO `sys_china_area` VALUES (450924, 450900, '兴业县', '3');
INSERT INTO `sys_china_area` VALUES (450981, 450900, '北流市', '3');
INSERT INTO `sys_china_area` VALUES (451000, 450000, '百色市', '2');
INSERT INTO `sys_china_area` VALUES (451002, 451000, '右江区', '3');
INSERT INTO `sys_china_area` VALUES (451003, 451000, '田阳区', '3');
INSERT INTO `sys_china_area` VALUES (451022, 451000, '田东县', '3');
INSERT INTO `sys_china_area` VALUES (451024, 451000, '德保县', '3');
INSERT INTO `sys_china_area` VALUES (451026, 451000, '那坡县', '3');
INSERT INTO `sys_china_area` VALUES (451027, 451000, '凌云县', '3');
INSERT INTO `sys_china_area` VALUES (451028, 451000, '乐业县', '3');
INSERT INTO `sys_china_area` VALUES (451029, 451000, '田林县', '3');
INSERT INTO `sys_china_area` VALUES (451030, 451000, '西林县', '3');
INSERT INTO `sys_china_area` VALUES (451031, 451000, '隆林各族自治县', '3');
INSERT INTO `sys_china_area` VALUES (451081, 451000, '靖西市', '3');
INSERT INTO `sys_china_area` VALUES (451082, 451000, '平果市', '3');
INSERT INTO `sys_china_area` VALUES (451100, 450000, '贺州市', '2');
INSERT INTO `sys_china_area` VALUES (451102, 451100, '八步区', '3');
INSERT INTO `sys_china_area` VALUES (451103, 451100, '平桂区', '3');
INSERT INTO `sys_china_area` VALUES (451121, 451100, '昭平县', '3');
INSERT INTO `sys_china_area` VALUES (451122, 451100, '钟山县', '3');
INSERT INTO `sys_china_area` VALUES (451123, 451100, '富川瑶族自治县', '3');
INSERT INTO `sys_china_area` VALUES (451200, 450000, '河池市', '2');
INSERT INTO `sys_china_area` VALUES (451202, 451200, '金城江区', '3');
INSERT INTO `sys_china_area` VALUES (451203, 451200, '宜州区', '3');
INSERT INTO `sys_china_area` VALUES (451221, 451200, '南丹县', '3');
INSERT INTO `sys_china_area` VALUES (451222, 451200, '天峨县', '3');
INSERT INTO `sys_china_area` VALUES (451223, 451200, '凤山县', '3');
INSERT INTO `sys_china_area` VALUES (451224, 451200, '东兰县', '3');
INSERT INTO `sys_china_area` VALUES (451225, 451200, '罗城仫佬族自治县', '3');
INSERT INTO `sys_china_area` VALUES (451226, 451200, '环江毛南族自治县', '3');
INSERT INTO `sys_china_area` VALUES (451227, 451200, '巴马瑶族自治县', '3');
INSERT INTO `sys_china_area` VALUES (451228, 451200, '都安瑶族自治县', '3');
INSERT INTO `sys_china_area` VALUES (451229, 451200, '大化瑶族自治县', '3');
INSERT INTO `sys_china_area` VALUES (451300, 450000, '来宾市', '2');
INSERT INTO `sys_china_area` VALUES (451302, 451300, '兴宾区', '3');
INSERT INTO `sys_china_area` VALUES (451321, 451300, '忻城县', '3');
INSERT INTO `sys_china_area` VALUES (451322, 451300, '象州县', '3');
INSERT INTO `sys_china_area` VALUES (451323, 451300, '武宣县', '3');
INSERT INTO `sys_china_area` VALUES (451324, 451300, '金秀瑶族自治县', '3');
INSERT INTO `sys_china_area` VALUES (451381, 451300, '合山市', '3');
INSERT INTO `sys_china_area` VALUES (451400, 450000, '崇左市', '2');
INSERT INTO `sys_china_area` VALUES (451402, 451400, '江州区', '3');
INSERT INTO `sys_china_area` VALUES (451421, 451400, '扶绥县', '3');
INSERT INTO `sys_china_area` VALUES (451422, 451400, '宁明县', '3');
INSERT INTO `sys_china_area` VALUES (451423, 451400, '龙州县', '3');
INSERT INTO `sys_china_area` VALUES (451424, 451400, '大新县', '3');
INSERT INTO `sys_china_area` VALUES (451425, 451400, '天等县', '3');
INSERT INTO `sys_china_area` VALUES (451481, 451400, '凭祥市', '3');
INSERT INTO `sys_china_area` VALUES (460000, 0, '海南省', '1');
INSERT INTO `sys_china_area` VALUES (460100, 460000, '海口市', '2');
INSERT INTO `sys_china_area` VALUES (460105, 460100, '秀英区', '3');
INSERT INTO `sys_china_area` VALUES (460106, 460100, '龙华区', '3');
INSERT INTO `sys_china_area` VALUES (460107, 460100, '琼山区', '3');
INSERT INTO `sys_china_area` VALUES (460108, 460100, '美兰区', '3');
INSERT INTO `sys_china_area` VALUES (460200, 460000, '三亚市', '2');
INSERT INTO `sys_china_area` VALUES (460202, 460200, '海棠区', '3');
INSERT INTO `sys_china_area` VALUES (460203, 460200, '吉阳区', '3');
INSERT INTO `sys_china_area` VALUES (460204, 460200, '天涯区', '3');
INSERT INTO `sys_china_area` VALUES (460205, 460200, '崖州区', '3');
INSERT INTO `sys_china_area` VALUES (460300, 460000, '三沙市', '2');
INSERT INTO `sys_china_area` VALUES (460400, 460000, '儋州市', '2');
INSERT INTO `sys_china_area` VALUES (469001, 460000, '五指山市', '2');
INSERT INTO `sys_china_area` VALUES (469002, 460000, '琼海市', '2');
INSERT INTO `sys_china_area` VALUES (469005, 460000, '文昌市', '2');
INSERT INTO `sys_china_area` VALUES (469006, 460000, '万宁市', '2');
INSERT INTO `sys_china_area` VALUES (469007, 460000, '东方市', '2');
INSERT INTO `sys_china_area` VALUES (469021, 460000, '定安县', '2');
INSERT INTO `sys_china_area` VALUES (469022, 460000, '屯昌县', '2');
INSERT INTO `sys_china_area` VALUES (469023, 460000, '澄迈县', '2');
INSERT INTO `sys_china_area` VALUES (469024, 460000, '临高县', '2');
INSERT INTO `sys_china_area` VALUES (469025, 460000, '白沙黎族自治县', '2');
INSERT INTO `sys_china_area` VALUES (469026, 460000, '昌江黎族自治县', '2');
INSERT INTO `sys_china_area` VALUES (469027, 460000, '乐东黎族自治县', '2');
INSERT INTO `sys_china_area` VALUES (469028, 460000, '陵水黎族自治县', '2');
INSERT INTO `sys_china_area` VALUES (469029, 460000, '保亭黎族苗族自治县', '2');
INSERT INTO `sys_china_area` VALUES (469030, 460000, '琼中黎族苗族自治县', '2');
INSERT INTO `sys_china_area` VALUES (500000, 0, '重庆市', '1');
INSERT INTO `sys_china_area` VALUES (500101, 500000, '万州区', '3');
INSERT INTO `sys_china_area` VALUES (500102, 500000, '涪陵区', '3');
INSERT INTO `sys_china_area` VALUES (500103, 500000, '渝中区', '3');
INSERT INTO `sys_china_area` VALUES (500104, 500000, '大渡口区', '3');
INSERT INTO `sys_china_area` VALUES (500105, 500000, '江北区', '3');
INSERT INTO `sys_china_area` VALUES (500106, 500000, '沙坪坝区', '3');
INSERT INTO `sys_china_area` VALUES (500107, 500000, '九龙坡区', '3');
INSERT INTO `sys_china_area` VALUES (500108, 500000, '南岸区', '3');
INSERT INTO `sys_china_area` VALUES (500109, 500000, '北碚区', '3');
INSERT INTO `sys_china_area` VALUES (500110, 500000, '綦江区', '3');
INSERT INTO `sys_china_area` VALUES (500111, 500000, '大足区', '3');
INSERT INTO `sys_china_area` VALUES (500112, 500000, '渝北区', '3');
INSERT INTO `sys_china_area` VALUES (500113, 500000, '巴南区', '3');
INSERT INTO `sys_china_area` VALUES (500114, 500000, '黔江区', '3');
INSERT INTO `sys_china_area` VALUES (500115, 500000, '长寿区', '3');
INSERT INTO `sys_china_area` VALUES (500116, 500000, '江津区', '3');
INSERT INTO `sys_china_area` VALUES (500117, 500000, '合川区', '3');
INSERT INTO `sys_china_area` VALUES (500118, 500000, '永川区', '3');
INSERT INTO `sys_china_area` VALUES (500119, 500000, '南川区', '3');
INSERT INTO `sys_china_area` VALUES (500120, 500000, '璧山区', '3');
INSERT INTO `sys_china_area` VALUES (500151, 500000, '铜梁区', '3');
INSERT INTO `sys_china_area` VALUES (500152, 500000, '潼南区', '3');
INSERT INTO `sys_china_area` VALUES (500153, 500000, '荣昌区', '3');
INSERT INTO `sys_china_area` VALUES (500154, 500000, '开州区', '3');
INSERT INTO `sys_china_area` VALUES (500155, 500000, '梁平区', '3');
INSERT INTO `sys_china_area` VALUES (500156, 500000, '武隆区', '3');
INSERT INTO `sys_china_area` VALUES (500229, 500000, '城口县', '3');
INSERT INTO `sys_china_area` VALUES (500230, 500000, '丰都县', '3');
INSERT INTO `sys_china_area` VALUES (500231, 500000, '垫江县', '3');
INSERT INTO `sys_china_area` VALUES (500233, 500000, '忠县', '3');
INSERT INTO `sys_china_area` VALUES (500235, 500000, '云阳县', '3');
INSERT INTO `sys_china_area` VALUES (500236, 500000, '奉节县', '3');
INSERT INTO `sys_china_area` VALUES (500237, 500000, '巫山县', '3');
INSERT INTO `sys_china_area` VALUES (500238, 500000, '巫溪县', '3');
INSERT INTO `sys_china_area` VALUES (500240, 500000, '石柱土家族自治县', '3');
INSERT INTO `sys_china_area` VALUES (500241, 500000, '秀山土家族苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (500242, 500000, '酉阳土家族苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (500243, 500000, '彭水苗族土家族自治县', '3');
INSERT INTO `sys_china_area` VALUES (510000, 0, '四川省', '1');
INSERT INTO `sys_china_area` VALUES (510100, 510000, '成都市', '2');
INSERT INTO `sys_china_area` VALUES (510104, 510100, '锦江区', '3');
INSERT INTO `sys_china_area` VALUES (510105, 510100, '青羊区', '3');
INSERT INTO `sys_china_area` VALUES (510106, 510100, '金牛区', '3');
INSERT INTO `sys_china_area` VALUES (510107, 510100, '武侯区', '3');
INSERT INTO `sys_china_area` VALUES (510108, 510100, '成华区', '3');
INSERT INTO `sys_china_area` VALUES (510112, 510100, '龙泉驿区', '3');
INSERT INTO `sys_china_area` VALUES (510113, 510100, '青白江区', '3');
INSERT INTO `sys_china_area` VALUES (510114, 510100, '新都区', '3');
INSERT INTO `sys_china_area` VALUES (510115, 510100, '温江区', '3');
INSERT INTO `sys_china_area` VALUES (510116, 510100, '双流区', '3');
INSERT INTO `sys_china_area` VALUES (510117, 510100, '郫都区', '3');
INSERT INTO `sys_china_area` VALUES (510121, 510100, '金堂县', '3');
INSERT INTO `sys_china_area` VALUES (510129, 510100, '大邑县', '3');
INSERT INTO `sys_china_area` VALUES (510131, 510100, '蒲江县', '3');
INSERT INTO `sys_china_area` VALUES (510132, 510100, '新津县', '3');
INSERT INTO `sys_china_area` VALUES (510181, 510100, '都江堰市', '3');
INSERT INTO `sys_china_area` VALUES (510182, 510100, '彭州市', '3');
INSERT INTO `sys_china_area` VALUES (510183, 510100, '邛崃市', '3');
INSERT INTO `sys_china_area` VALUES (510184, 510100, '崇州市', '3');
INSERT INTO `sys_china_area` VALUES (510185, 510100, '简阳市', '3');
INSERT INTO `sys_china_area` VALUES (510300, 510000, '自贡市', '2');
INSERT INTO `sys_china_area` VALUES (510302, 510300, '自流井区', '3');
INSERT INTO `sys_china_area` VALUES (510303, 510300, '贡井区', '3');
INSERT INTO `sys_china_area` VALUES (510304, 510300, '大安区', '3');
INSERT INTO `sys_china_area` VALUES (510311, 510300, '沿滩区', '3');
INSERT INTO `sys_china_area` VALUES (510321, 510300, '荣县', '3');
INSERT INTO `sys_china_area` VALUES (510322, 510300, '富顺县', '3');
INSERT INTO `sys_china_area` VALUES (510400, 510000, '攀枝花市', '2');
INSERT INTO `sys_china_area` VALUES (510402, 510400, '东区', '3');
INSERT INTO `sys_china_area` VALUES (510403, 510400, '西区', '3');
INSERT INTO `sys_china_area` VALUES (510411, 510400, '仁和区', '3');
INSERT INTO `sys_china_area` VALUES (510421, 510400, '米易县', '3');
INSERT INTO `sys_china_area` VALUES (510422, 510400, '盐边县', '3');
INSERT INTO `sys_china_area` VALUES (510500, 510000, '泸州市', '2');
INSERT INTO `sys_china_area` VALUES (510502, 510500, '江阳区', '3');
INSERT INTO `sys_china_area` VALUES (510503, 510500, '纳溪区', '3');
INSERT INTO `sys_china_area` VALUES (510504, 510500, '龙马潭区', '3');
INSERT INTO `sys_china_area` VALUES (510521, 510500, '泸县', '3');
INSERT INTO `sys_china_area` VALUES (510522, 510500, '合江县', '3');
INSERT INTO `sys_china_area` VALUES (510524, 510500, '叙永县', '3');
INSERT INTO `sys_china_area` VALUES (510525, 510500, '古蔺县', '3');
INSERT INTO `sys_china_area` VALUES (510600, 510000, '德阳市', '2');
INSERT INTO `sys_china_area` VALUES (510603, 510600, '旌阳区', '3');
INSERT INTO `sys_china_area` VALUES (510604, 510600, '罗江区', '3');
INSERT INTO `sys_china_area` VALUES (510623, 510600, '中江县', '3');
INSERT INTO `sys_china_area` VALUES (510681, 510600, '广汉市', '3');
INSERT INTO `sys_china_area` VALUES (510682, 510600, '什邡市', '3');
INSERT INTO `sys_china_area` VALUES (510683, 510600, '绵竹市', '3');
INSERT INTO `sys_china_area` VALUES (510700, 510000, '绵阳市', '2');
INSERT INTO `sys_china_area` VALUES (510703, 510700, '涪城区', '3');
INSERT INTO `sys_china_area` VALUES (510704, 510700, '游仙区', '3');
INSERT INTO `sys_china_area` VALUES (510705, 510700, '安州区', '3');
INSERT INTO `sys_china_area` VALUES (510722, 510700, '三台县', '3');
INSERT INTO `sys_china_area` VALUES (510723, 510700, '盐亭县', '3');
INSERT INTO `sys_china_area` VALUES (510725, 510700, '梓潼县', '3');
INSERT INTO `sys_china_area` VALUES (510726, 510700, '北川羌族自治县', '3');
INSERT INTO `sys_china_area` VALUES (510727, 510700, '平武县', '3');
INSERT INTO `sys_china_area` VALUES (510781, 510700, '江油市', '3');
INSERT INTO `sys_china_area` VALUES (510800, 510000, '广元市', '2');
INSERT INTO `sys_china_area` VALUES (510802, 510800, '利州区', '3');
INSERT INTO `sys_china_area` VALUES (510811, 510800, '昭化区', '3');
INSERT INTO `sys_china_area` VALUES (510812, 510800, '朝天区', '3');
INSERT INTO `sys_china_area` VALUES (510821, 510800, '旺苍县', '3');
INSERT INTO `sys_china_area` VALUES (510822, 510800, '青川县', '3');
INSERT INTO `sys_china_area` VALUES (510823, 510800, '剑阁县', '3');
INSERT INTO `sys_china_area` VALUES (510824, 510800, '苍溪县', '3');
INSERT INTO `sys_china_area` VALUES (510900, 510000, '遂宁市', '2');
INSERT INTO `sys_china_area` VALUES (510903, 510900, '船山区', '3');
INSERT INTO `sys_china_area` VALUES (510904, 510900, '安居区', '3');
INSERT INTO `sys_china_area` VALUES (510921, 510900, '蓬溪县', '3');
INSERT INTO `sys_china_area` VALUES (510923, 510900, '大英县', '3');
INSERT INTO `sys_china_area` VALUES (510981, 510900, '射洪市', '3');
INSERT INTO `sys_china_area` VALUES (511000, 510000, '内江市', '2');
INSERT INTO `sys_china_area` VALUES (511002, 511000, '市中区', '3');
INSERT INTO `sys_china_area` VALUES (511011, 511000, '东兴区', '3');
INSERT INTO `sys_china_area` VALUES (511024, 511000, '威远县', '3');
INSERT INTO `sys_china_area` VALUES (511025, 511000, '资中县', '3');
INSERT INTO `sys_china_area` VALUES (511083, 511000, '隆昌市', '3');
INSERT INTO `sys_china_area` VALUES (511100, 510000, '乐山市', '2');
INSERT INTO `sys_china_area` VALUES (511102, 511100, '市中区', '3');
INSERT INTO `sys_china_area` VALUES (511111, 511100, '沙湾区', '3');
INSERT INTO `sys_china_area` VALUES (511112, 511100, '五通桥区', '3');
INSERT INTO `sys_china_area` VALUES (511113, 511100, '金口河区', '3');
INSERT INTO `sys_china_area` VALUES (511123, 511100, '犍为县', '3');
INSERT INTO `sys_china_area` VALUES (511124, 511100, '井研县', '3');
INSERT INTO `sys_china_area` VALUES (511126, 511100, '夹江县', '3');
INSERT INTO `sys_china_area` VALUES (511129, 511100, '沐川县', '3');
INSERT INTO `sys_china_area` VALUES (511132, 511100, '峨边彝族自治县', '3');
INSERT INTO `sys_china_area` VALUES (511133, 511100, '马边彝族自治县', '3');
INSERT INTO `sys_china_area` VALUES (511181, 511100, '峨眉山市', '3');
INSERT INTO `sys_china_area` VALUES (511300, 510000, '南充市', '2');
INSERT INTO `sys_china_area` VALUES (511302, 511300, '顺庆区', '3');
INSERT INTO `sys_china_area` VALUES (511303, 511300, '高坪区', '3');
INSERT INTO `sys_china_area` VALUES (511304, 511300, '嘉陵区', '3');
INSERT INTO `sys_china_area` VALUES (511321, 511300, '南部县', '3');
INSERT INTO `sys_china_area` VALUES (511322, 511300, '营山县', '3');
INSERT INTO `sys_china_area` VALUES (511323, 511300, '蓬安县', '3');
INSERT INTO `sys_china_area` VALUES (511324, 511300, '仪陇县', '3');
INSERT INTO `sys_china_area` VALUES (511325, 511300, '西充县', '3');
INSERT INTO `sys_china_area` VALUES (511381, 511300, '阆中市', '3');
INSERT INTO `sys_china_area` VALUES (511400, 510000, '眉山市', '2');
INSERT INTO `sys_china_area` VALUES (511402, 511400, '东坡区', '3');
INSERT INTO `sys_china_area` VALUES (511403, 511400, '彭山区', '3');
INSERT INTO `sys_china_area` VALUES (511421, 511400, '仁寿县', '3');
INSERT INTO `sys_china_area` VALUES (511423, 511400, '洪雅县', '3');
INSERT INTO `sys_china_area` VALUES (511424, 511400, '丹棱县', '3');
INSERT INTO `sys_china_area` VALUES (511425, 511400, '青神县', '3');
INSERT INTO `sys_china_area` VALUES (511500, 510000, '宜宾市', '2');
INSERT INTO `sys_china_area` VALUES (511502, 511500, '翠屏区', '3');
INSERT INTO `sys_china_area` VALUES (511503, 511500, '南溪区', '3');
INSERT INTO `sys_china_area` VALUES (511504, 511500, '叙州区', '3');
INSERT INTO `sys_china_area` VALUES (511523, 511500, '江安县', '3');
INSERT INTO `sys_china_area` VALUES (511524, 511500, '长宁县', '3');
INSERT INTO `sys_china_area` VALUES (511525, 511500, '高县', '3');
INSERT INTO `sys_china_area` VALUES (511526, 511500, '珙县', '3');
INSERT INTO `sys_china_area` VALUES (511527, 511500, '筠连县', '3');
INSERT INTO `sys_china_area` VALUES (511528, 511500, '兴文县', '3');
INSERT INTO `sys_china_area` VALUES (511529, 511500, '屏山县', '3');
INSERT INTO `sys_china_area` VALUES (511600, 510000, '广安市', '2');
INSERT INTO `sys_china_area` VALUES (511602, 511600, '广安区', '3');
INSERT INTO `sys_china_area` VALUES (511603, 511600, '前锋区', '3');
INSERT INTO `sys_china_area` VALUES (511621, 511600, '岳池县', '3');
INSERT INTO `sys_china_area` VALUES (511622, 511600, '武胜县', '3');
INSERT INTO `sys_china_area` VALUES (511623, 511600, '邻水县', '3');
INSERT INTO `sys_china_area` VALUES (511681, 511600, '华蓥市', '3');
INSERT INTO `sys_china_area` VALUES (511700, 510000, '达州市', '2');
INSERT INTO `sys_china_area` VALUES (511702, 511700, '通川区', '3');
INSERT INTO `sys_china_area` VALUES (511703, 511700, '达川区', '3');
INSERT INTO `sys_china_area` VALUES (511722, 511700, '宣汉县', '3');
INSERT INTO `sys_china_area` VALUES (511723, 511700, '开江县', '3');
INSERT INTO `sys_china_area` VALUES (511724, 511700, '大竹县', '3');
INSERT INTO `sys_china_area` VALUES (511725, 511700, '渠县', '3');
INSERT INTO `sys_china_area` VALUES (511781, 511700, '万源市', '3');
INSERT INTO `sys_china_area` VALUES (511800, 510000, '雅安市', '2');
INSERT INTO `sys_china_area` VALUES (511802, 511800, '雨城区', '3');
INSERT INTO `sys_china_area` VALUES (511803, 511800, '名山区', '3');
INSERT INTO `sys_china_area` VALUES (511822, 511800, '荥经县', '3');
INSERT INTO `sys_china_area` VALUES (511823, 511800, '汉源县', '3');
INSERT INTO `sys_china_area` VALUES (511824, 511800, '石棉县', '3');
INSERT INTO `sys_china_area` VALUES (511825, 511800, '天全县', '3');
INSERT INTO `sys_china_area` VALUES (511826, 511800, '芦山县', '3');
INSERT INTO `sys_china_area` VALUES (511827, 511800, '宝兴县', '3');
INSERT INTO `sys_china_area` VALUES (511900, 510000, '巴中市', '2');
INSERT INTO `sys_china_area` VALUES (511902, 511900, '巴州区', '3');
INSERT INTO `sys_china_area` VALUES (511903, 511900, '恩阳区', '3');
INSERT INTO `sys_china_area` VALUES (511921, 511900, '通江县', '3');
INSERT INTO `sys_china_area` VALUES (511922, 511900, '南江县', '3');
INSERT INTO `sys_china_area` VALUES (511923, 511900, '平昌县', '3');
INSERT INTO `sys_china_area` VALUES (512000, 510000, '资阳市', '2');
INSERT INTO `sys_china_area` VALUES (512002, 512000, '雁江区', '3');
INSERT INTO `sys_china_area` VALUES (512021, 512000, '安岳县', '3');
INSERT INTO `sys_china_area` VALUES (512022, 512000, '乐至县', '3');
INSERT INTO `sys_china_area` VALUES (513200, 510000, '阿坝藏族羌族自治州', '2');
INSERT INTO `sys_china_area` VALUES (513201, 513200, '马尔康市', '3');
INSERT INTO `sys_china_area` VALUES (513221, 513200, '汶川县', '3');
INSERT INTO `sys_china_area` VALUES (513222, 513200, '理县', '3');
INSERT INTO `sys_china_area` VALUES (513223, 513200, '茂县', '3');
INSERT INTO `sys_china_area` VALUES (513224, 513200, '松潘县', '3');
INSERT INTO `sys_china_area` VALUES (513225, 513200, '九寨沟县', '3');
INSERT INTO `sys_china_area` VALUES (513226, 513200, '金川县', '3');
INSERT INTO `sys_china_area` VALUES (513227, 513200, '小金县', '3');
INSERT INTO `sys_china_area` VALUES (513228, 513200, '黑水县', '3');
INSERT INTO `sys_china_area` VALUES (513230, 513200, '壤塘县', '3');
INSERT INTO `sys_china_area` VALUES (513231, 513200, '阿坝县', '3');
INSERT INTO `sys_china_area` VALUES (513232, 513200, '若尔盖县', '3');
INSERT INTO `sys_china_area` VALUES (513233, 513200, '红原县', '3');
INSERT INTO `sys_china_area` VALUES (513300, 510000, '甘孜藏族自治州', '2');
INSERT INTO `sys_china_area` VALUES (513301, 513300, '康定市', '3');
INSERT INTO `sys_china_area` VALUES (513322, 513300, '泸定县', '3');
INSERT INTO `sys_china_area` VALUES (513323, 513300, '丹巴县', '3');
INSERT INTO `sys_china_area` VALUES (513324, 513300, '九龙县', '3');
INSERT INTO `sys_china_area` VALUES (513325, 513300, '雅江县', '3');
INSERT INTO `sys_china_area` VALUES (513326, 513300, '道孚县', '3');
INSERT INTO `sys_china_area` VALUES (513327, 513300, '炉霍县', '3');
INSERT INTO `sys_china_area` VALUES (513328, 513300, '甘孜县', '3');
INSERT INTO `sys_china_area` VALUES (513329, 513300, '新龙县', '3');
INSERT INTO `sys_china_area` VALUES (513330, 513300, '德格县', '3');
INSERT INTO `sys_china_area` VALUES (513331, 513300, '白玉县', '3');
INSERT INTO `sys_china_area` VALUES (513332, 513300, '石渠县', '3');
INSERT INTO `sys_china_area` VALUES (513333, 513300, '色达县', '3');
INSERT INTO `sys_china_area` VALUES (513334, 513300, '理塘县', '3');
INSERT INTO `sys_china_area` VALUES (513335, 513300, '巴塘县', '3');
INSERT INTO `sys_china_area` VALUES (513336, 513300, '乡城县', '3');
INSERT INTO `sys_china_area` VALUES (513337, 513300, '稻城县', '3');
INSERT INTO `sys_china_area` VALUES (513338, 513300, '得荣县', '3');
INSERT INTO `sys_china_area` VALUES (513400, 510000, '凉山彝族自治州', '2');
INSERT INTO `sys_china_area` VALUES (513401, 513400, '西昌市', '3');
INSERT INTO `sys_china_area` VALUES (513422, 513400, '木里藏族自治县', '3');
INSERT INTO `sys_china_area` VALUES (513423, 513400, '盐源县', '3');
INSERT INTO `sys_china_area` VALUES (513424, 513400, '德昌县', '3');
INSERT INTO `sys_china_area` VALUES (513425, 513400, '会理县', '3');
INSERT INTO `sys_china_area` VALUES (513426, 513400, '会东县', '3');
INSERT INTO `sys_china_area` VALUES (513427, 513400, '宁南县', '3');
INSERT INTO `sys_china_area` VALUES (513428, 513400, '普格县', '3');
INSERT INTO `sys_china_area` VALUES (513429, 513400, '布拖县', '3');
INSERT INTO `sys_china_area` VALUES (513430, 513400, '金阳县', '3');
INSERT INTO `sys_china_area` VALUES (513431, 513400, '昭觉县', '3');
INSERT INTO `sys_china_area` VALUES (513432, 513400, '喜德县', '3');
INSERT INTO `sys_china_area` VALUES (513433, 513400, '冕宁县', '3');
INSERT INTO `sys_china_area` VALUES (513434, 513400, '越西县', '3');
INSERT INTO `sys_china_area` VALUES (513435, 513400, '甘洛县', '3');
INSERT INTO `sys_china_area` VALUES (513436, 513400, '美姑县', '3');
INSERT INTO `sys_china_area` VALUES (513437, 513400, '雷波县', '3');
INSERT INTO `sys_china_area` VALUES (520000, 0, '贵州省', '1');
INSERT INTO `sys_china_area` VALUES (520100, 520000, '贵阳市', '2');
INSERT INTO `sys_china_area` VALUES (520102, 520100, '南明区', '3');
INSERT INTO `sys_china_area` VALUES (520103, 520100, '云岩区', '3');
INSERT INTO `sys_china_area` VALUES (520111, 520100, '花溪区', '3');
INSERT INTO `sys_china_area` VALUES (520112, 520100, '乌当区', '3');
INSERT INTO `sys_china_area` VALUES (520113, 520100, '白云区', '3');
INSERT INTO `sys_china_area` VALUES (520115, 520100, '观山湖区', '3');
INSERT INTO `sys_china_area` VALUES (520121, 520100, '开阳县', '3');
INSERT INTO `sys_china_area` VALUES (520122, 520100, '息烽县', '3');
INSERT INTO `sys_china_area` VALUES (520123, 520100, '修文县', '3');
INSERT INTO `sys_china_area` VALUES (520181, 520100, '清镇市', '3');
INSERT INTO `sys_china_area` VALUES (520200, 520000, '六盘水市', '2');
INSERT INTO `sys_china_area` VALUES (520201, 520200, '钟山区', '3');
INSERT INTO `sys_china_area` VALUES (520203, 520200, '六枝特区', '3');
INSERT INTO `sys_china_area` VALUES (520221, 520200, '水城县', '3');
INSERT INTO `sys_china_area` VALUES (520281, 520200, '盘州市', '3');
INSERT INTO `sys_china_area` VALUES (520300, 520000, '遵义市', '2');
INSERT INTO `sys_china_area` VALUES (520302, 520300, '红花岗区', '3');
INSERT INTO `sys_china_area` VALUES (520303, 520300, '汇川区', '3');
INSERT INTO `sys_china_area` VALUES (520304, 520300, '播州区', '3');
INSERT INTO `sys_china_area` VALUES (520322, 520300, '桐梓县', '3');
INSERT INTO `sys_china_area` VALUES (520323, 520300, '绥阳县', '3');
INSERT INTO `sys_china_area` VALUES (520324, 520300, '正安县', '3');
INSERT INTO `sys_china_area` VALUES (520325, 520300, '道真仡佬族苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (520326, 520300, '务川仡佬族苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (520327, 520300, '凤冈县', '3');
INSERT INTO `sys_china_area` VALUES (520328, 520300, '湄潭县', '3');
INSERT INTO `sys_china_area` VALUES (520329, 520300, '余庆县', '3');
INSERT INTO `sys_china_area` VALUES (520330, 520300, '习水县', '3');
INSERT INTO `sys_china_area` VALUES (520381, 520300, '赤水市', '3');
INSERT INTO `sys_china_area` VALUES (520382, 520300, '仁怀市', '3');
INSERT INTO `sys_china_area` VALUES (520400, 520000, '安顺市', '2');
INSERT INTO `sys_china_area` VALUES (520402, 520400, '西秀区', '3');
INSERT INTO `sys_china_area` VALUES (520403, 520400, '平坝区', '3');
INSERT INTO `sys_china_area` VALUES (520422, 520400, '普定县', '3');
INSERT INTO `sys_china_area` VALUES (520423, 520400, '镇宁布依族苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (520424, 520400, '关岭布依族苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (520425, 520400, '紫云苗族布依族自治县', '3');
INSERT INTO `sys_china_area` VALUES (520500, 520000, '毕节市', '2');
INSERT INTO `sys_china_area` VALUES (520502, 520500, '七星关区', '3');
INSERT INTO `sys_china_area` VALUES (520521, 520500, '大方县', '3');
INSERT INTO `sys_china_area` VALUES (520522, 520500, '黔西县', '3');
INSERT INTO `sys_china_area` VALUES (520523, 520500, '金沙县', '3');
INSERT INTO `sys_china_area` VALUES (520524, 520500, '织金县', '3');
INSERT INTO `sys_china_area` VALUES (520525, 520500, '纳雍县', '3');
INSERT INTO `sys_china_area` VALUES (520526, 520500, '威宁彝族回族苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (520527, 520500, '赫章县', '3');
INSERT INTO `sys_china_area` VALUES (520600, 520000, '铜仁市', '2');
INSERT INTO `sys_china_area` VALUES (520602, 520600, '碧江区', '3');
INSERT INTO `sys_china_area` VALUES (520603, 520600, '万山区', '3');
INSERT INTO `sys_china_area` VALUES (520621, 520600, '江口县', '3');
INSERT INTO `sys_china_area` VALUES (520622, 520600, '玉屏侗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (520623, 520600, '石阡县', '3');
INSERT INTO `sys_china_area` VALUES (520624, 520600, '思南县', '3');
INSERT INTO `sys_china_area` VALUES (520625, 520600, '印江土家族苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (520626, 520600, '德江县', '3');
INSERT INTO `sys_china_area` VALUES (520627, 520600, '沿河土家族自治县', '3');
INSERT INTO `sys_china_area` VALUES (520628, 520600, '松桃苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (522300, 520000, '黔西南布依族苗族自治州', '2');
INSERT INTO `sys_china_area` VALUES (522301, 522300, '兴义市', '3');
INSERT INTO `sys_china_area` VALUES (522302, 522300, '兴仁市', '3');
INSERT INTO `sys_china_area` VALUES (522323, 522300, '普安县', '3');
INSERT INTO `sys_china_area` VALUES (522324, 522300, '晴隆县', '3');
INSERT INTO `sys_china_area` VALUES (522325, 522300, '贞丰县', '3');
INSERT INTO `sys_china_area` VALUES (522326, 522300, '望谟县', '3');
INSERT INTO `sys_china_area` VALUES (522327, 522300, '册亨县', '3');
INSERT INTO `sys_china_area` VALUES (522328, 522300, '安龙县', '3');
INSERT INTO `sys_china_area` VALUES (522600, 520000, '黔东南苗族侗族自治州', '2');
INSERT INTO `sys_china_area` VALUES (522601, 522600, '凯里市', '3');
INSERT INTO `sys_china_area` VALUES (522622, 522600, '黄平县', '3');
INSERT INTO `sys_china_area` VALUES (522623, 522600, '施秉县', '3');
INSERT INTO `sys_china_area` VALUES (522624, 522600, '三穗县', '3');
INSERT INTO `sys_china_area` VALUES (522625, 522600, '镇远县', '3');
INSERT INTO `sys_china_area` VALUES (522626, 522600, '岑巩县', '3');
INSERT INTO `sys_china_area` VALUES (522627, 522600, '天柱县', '3');
INSERT INTO `sys_china_area` VALUES (522628, 522600, '锦屏县', '3');
INSERT INTO `sys_china_area` VALUES (522629, 522600, '剑河县', '3');
INSERT INTO `sys_china_area` VALUES (522630, 522600, '台江县', '3');
INSERT INTO `sys_china_area` VALUES (522631, 522600, '黎平县', '3');
INSERT INTO `sys_china_area` VALUES (522632, 522600, '榕江县', '3');
INSERT INTO `sys_china_area` VALUES (522633, 522600, '从江县', '3');
INSERT INTO `sys_china_area` VALUES (522634, 522600, '雷山县', '3');
INSERT INTO `sys_china_area` VALUES (522635, 522600, '麻江县', '3');
INSERT INTO `sys_china_area` VALUES (522636, 522600, '丹寨县', '3');
INSERT INTO `sys_china_area` VALUES (522700, 520000, '黔南布依族苗族自治州', '2');
INSERT INTO `sys_china_area` VALUES (522701, 522700, '都匀市', '3');
INSERT INTO `sys_china_area` VALUES (522702, 522700, '福泉市', '3');
INSERT INTO `sys_china_area` VALUES (522722, 522700, '荔波县', '3');
INSERT INTO `sys_china_area` VALUES (522723, 522700, '贵定县', '3');
INSERT INTO `sys_china_area` VALUES (522725, 522700, '瓮安县', '3');
INSERT INTO `sys_china_area` VALUES (522726, 522700, '独山县', '3');
INSERT INTO `sys_china_area` VALUES (522727, 522700, '平塘县', '3');
INSERT INTO `sys_china_area` VALUES (522728, 522700, '罗甸县', '3');
INSERT INTO `sys_china_area` VALUES (522729, 522700, '长顺县', '3');
INSERT INTO `sys_china_area` VALUES (522730, 522700, '龙里县', '3');
INSERT INTO `sys_china_area` VALUES (522731, 522700, '惠水县', '3');
INSERT INTO `sys_china_area` VALUES (522732, 522700, '三都水族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530000, 0, '云南省', '1');
INSERT INTO `sys_china_area` VALUES (530100, 530000, '昆明市', '2');
INSERT INTO `sys_china_area` VALUES (530102, 530100, '五华区', '3');
INSERT INTO `sys_china_area` VALUES (530103, 530100, '盘龙区', '3');
INSERT INTO `sys_china_area` VALUES (530111, 530100, '官渡区', '3');
INSERT INTO `sys_china_area` VALUES (530112, 530100, '西山区', '3');
INSERT INTO `sys_china_area` VALUES (530113, 530100, '东川区', '3');
INSERT INTO `sys_china_area` VALUES (530114, 530100, '呈贡区', '3');
INSERT INTO `sys_china_area` VALUES (530115, 530100, '晋宁区', '3');
INSERT INTO `sys_china_area` VALUES (530124, 530100, '富民县', '3');
INSERT INTO `sys_china_area` VALUES (530125, 530100, '宜良县', '3');
INSERT INTO `sys_china_area` VALUES (530126, 530100, '石林彝族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530127, 530100, '嵩明县', '3');
INSERT INTO `sys_china_area` VALUES (530128, 530100, '禄劝彝族苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530129, 530100, '寻甸回族彝族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530181, 530100, '安宁市', '3');
INSERT INTO `sys_china_area` VALUES (530300, 530000, '曲靖市', '2');
INSERT INTO `sys_china_area` VALUES (530302, 530300, '麒麟区', '3');
INSERT INTO `sys_china_area` VALUES (530303, 530300, '沾益区', '3');
INSERT INTO `sys_china_area` VALUES (530304, 530300, '马龙区', '3');
INSERT INTO `sys_china_area` VALUES (530322, 530300, '陆良县', '3');
INSERT INTO `sys_china_area` VALUES (530323, 530300, '师宗县', '3');
INSERT INTO `sys_china_area` VALUES (530324, 530300, '罗平县', '3');
INSERT INTO `sys_china_area` VALUES (530325, 530300, '富源县', '3');
INSERT INTO `sys_china_area` VALUES (530326, 530300, '会泽县', '3');
INSERT INTO `sys_china_area` VALUES (530381, 530300, '宣威市', '3');
INSERT INTO `sys_china_area` VALUES (530400, 530000, '玉溪市', '2');
INSERT INTO `sys_china_area` VALUES (530402, 530400, '红塔区', '3');
INSERT INTO `sys_china_area` VALUES (530403, 530400, '江川区', '3');
INSERT INTO `sys_china_area` VALUES (530423, 530400, '通海县', '3');
INSERT INTO `sys_china_area` VALUES (530424, 530400, '华宁县', '3');
INSERT INTO `sys_china_area` VALUES (530425, 530400, '易门县', '3');
INSERT INTO `sys_china_area` VALUES (530426, 530400, '峨山彝族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530427, 530400, '新平彝族傣族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530428, 530400, '元江哈尼族彝族傣族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530481, 530400, '澄江市', '3');
INSERT INTO `sys_china_area` VALUES (530500, 530000, '保山市', '2');
INSERT INTO `sys_china_area` VALUES (530502, 530500, '隆阳区', '3');
INSERT INTO `sys_china_area` VALUES (530521, 530500, '施甸县', '3');
INSERT INTO `sys_china_area` VALUES (530523, 530500, '龙陵县', '3');
INSERT INTO `sys_china_area` VALUES (530524, 530500, '昌宁县', '3');
INSERT INTO `sys_china_area` VALUES (530581, 530500, '腾冲市', '3');
INSERT INTO `sys_china_area` VALUES (530600, 530000, '昭通市', '2');
INSERT INTO `sys_china_area` VALUES (530602, 530600, '昭阳区', '3');
INSERT INTO `sys_china_area` VALUES (530621, 530600, '鲁甸县', '3');
INSERT INTO `sys_china_area` VALUES (530622, 530600, '巧家县', '3');
INSERT INTO `sys_china_area` VALUES (530623, 530600, '盐津县', '3');
INSERT INTO `sys_china_area` VALUES (530624, 530600, '大关县', '3');
INSERT INTO `sys_china_area` VALUES (530625, 530600, '永善县', '3');
INSERT INTO `sys_china_area` VALUES (530626, 530600, '绥江县', '3');
INSERT INTO `sys_china_area` VALUES (530627, 530600, '镇雄县', '3');
INSERT INTO `sys_china_area` VALUES (530628, 530600, '彝良县', '3');
INSERT INTO `sys_china_area` VALUES (530629, 530600, '威信县', '3');
INSERT INTO `sys_china_area` VALUES (530681, 530600, '水富市', '3');
INSERT INTO `sys_china_area` VALUES (530700, 530000, '丽江市', '2');
INSERT INTO `sys_china_area` VALUES (530702, 530700, '古城区', '3');
INSERT INTO `sys_china_area` VALUES (530721, 530700, '玉龙纳西族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530722, 530700, '永胜县', '3');
INSERT INTO `sys_china_area` VALUES (530723, 530700, '华坪县', '3');
INSERT INTO `sys_china_area` VALUES (530724, 530700, '宁蒗彝族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530800, 530000, '普洱市', '2');
INSERT INTO `sys_china_area` VALUES (530802, 530800, '思茅区', '3');
INSERT INTO `sys_china_area` VALUES (530821, 530800, '宁洱哈尼族彝族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530822, 530800, '墨江哈尼族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530823, 530800, '景东彝族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530824, 530800, '景谷傣族彝族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530825, 530800, '镇沅彝族哈尼族拉祜族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530826, 530800, '江城哈尼族彝族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530827, 530800, '孟连傣族拉祜族佤族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530828, 530800, '澜沧拉祜族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530829, 530800, '西盟佤族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530900, 530000, '临沧市', '2');
INSERT INTO `sys_china_area` VALUES (530902, 530900, '临翔区', '3');
INSERT INTO `sys_china_area` VALUES (530921, 530900, '凤庆县', '3');
INSERT INTO `sys_china_area` VALUES (530922, 530900, '云县', '3');
INSERT INTO `sys_china_area` VALUES (530923, 530900, '永德县', '3');
INSERT INTO `sys_china_area` VALUES (530924, 530900, '镇康县', '3');
INSERT INTO `sys_china_area` VALUES (530925, 530900, '双江拉祜族佤族布朗族傣族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530926, 530900, '耿马傣族佤族自治县', '3');
INSERT INTO `sys_china_area` VALUES (530927, 530900, '沧源佤族自治县', '3');
INSERT INTO `sys_china_area` VALUES (532300, 530000, '楚雄彝族自治州', '2');
INSERT INTO `sys_china_area` VALUES (532301, 532300, '楚雄市', '3');
INSERT INTO `sys_china_area` VALUES (532322, 532300, '双柏县', '3');
INSERT INTO `sys_china_area` VALUES (532323, 532300, '牟定县', '3');
INSERT INTO `sys_china_area` VALUES (532324, 532300, '南华县', '3');
INSERT INTO `sys_china_area` VALUES (532325, 532300, '姚安县', '3');
INSERT INTO `sys_china_area` VALUES (532326, 532300, '大姚县', '3');
INSERT INTO `sys_china_area` VALUES (532327, 532300, '永仁县', '3');
INSERT INTO `sys_china_area` VALUES (532328, 532300, '元谋县', '3');
INSERT INTO `sys_china_area` VALUES (532329, 532300, '武定县', '3');
INSERT INTO `sys_china_area` VALUES (532331, 532300, '禄丰县', '3');
INSERT INTO `sys_china_area` VALUES (532500, 530000, '红河哈尼族彝族自治州', '2');
INSERT INTO `sys_china_area` VALUES (532501, 532500, '个旧市', '3');
INSERT INTO `sys_china_area` VALUES (532502, 532500, '开远市', '3');
INSERT INTO `sys_china_area` VALUES (532503, 532500, '蒙自市', '3');
INSERT INTO `sys_china_area` VALUES (532504, 532500, '弥勒市', '3');
INSERT INTO `sys_china_area` VALUES (532523, 532500, '屏边苗族自治县', '3');
INSERT INTO `sys_china_area` VALUES (532524, 532500, '建水县', '3');
INSERT INTO `sys_china_area` VALUES (532525, 532500, '石屏县', '3');
INSERT INTO `sys_china_area` VALUES (532527, 532500, '泸西县', '3');
INSERT INTO `sys_china_area` VALUES (532528, 532500, '元阳县', '3');
INSERT INTO `sys_china_area` VALUES (532529, 532500, '红河县', '3');
INSERT INTO `sys_china_area` VALUES (532530, 532500, '金平苗族瑶族傣族自治县', '3');
INSERT INTO `sys_china_area` VALUES (532531, 532500, '绿春县', '3');
INSERT INTO `sys_china_area` VALUES (532532, 532500, '河口瑶族自治县', '3');
INSERT INTO `sys_china_area` VALUES (532600, 530000, '文山壮族苗族自治州', '2');
INSERT INTO `sys_china_area` VALUES (532601, 532600, '文山市', '3');
INSERT INTO `sys_china_area` VALUES (532622, 532600, '砚山县', '3');
INSERT INTO `sys_china_area` VALUES (532623, 532600, '西畴县', '3');
INSERT INTO `sys_china_area` VALUES (532624, 532600, '麻栗坡县', '3');
INSERT INTO `sys_china_area` VALUES (532625, 532600, '马关县', '3');
INSERT INTO `sys_china_area` VALUES (532626, 532600, '丘北县', '3');
INSERT INTO `sys_china_area` VALUES (532627, 532600, '广南县', '3');
INSERT INTO `sys_china_area` VALUES (532628, 532600, '富宁县', '3');
INSERT INTO `sys_china_area` VALUES (532800, 530000, '西双版纳傣族自治州', '2');
INSERT INTO `sys_china_area` VALUES (532801, 532800, '景洪市', '3');
INSERT INTO `sys_china_area` VALUES (532822, 532800, '勐海县', '3');
INSERT INTO `sys_china_area` VALUES (532823, 532800, '勐腊县', '3');
INSERT INTO `sys_china_area` VALUES (532900, 530000, '大理白族自治州', '2');
INSERT INTO `sys_china_area` VALUES (532901, 532900, '大理市', '3');
INSERT INTO `sys_china_area` VALUES (532922, 532900, '漾濞彝族自治县', '3');
INSERT INTO `sys_china_area` VALUES (532923, 532900, '祥云县', '3');
INSERT INTO `sys_china_area` VALUES (532924, 532900, '宾川县', '3');
INSERT INTO `sys_china_area` VALUES (532925, 532900, '弥渡县', '3');
INSERT INTO `sys_china_area` VALUES (532926, 532900, '南涧彝族自治县', '3');
INSERT INTO `sys_china_area` VALUES (532927, 532900, '巍山彝族回族自治县', '3');
INSERT INTO `sys_china_area` VALUES (532928, 532900, '永平县', '3');
INSERT INTO `sys_china_area` VALUES (532929, 532900, '云龙县', '3');
INSERT INTO `sys_china_area` VALUES (532930, 532900, '洱源县', '3');
INSERT INTO `sys_china_area` VALUES (532931, 532900, '剑川县', '3');
INSERT INTO `sys_china_area` VALUES (532932, 532900, '鹤庆县', '3');
INSERT INTO `sys_china_area` VALUES (533100, 530000, '德宏傣族景颇族自治州', '2');
INSERT INTO `sys_china_area` VALUES (533102, 533100, '瑞丽市', '3');
INSERT INTO `sys_china_area` VALUES (533103, 533100, '芒市', '3');
INSERT INTO `sys_china_area` VALUES (533122, 533100, '梁河县', '3');
INSERT INTO `sys_china_area` VALUES (533123, 533100, '盈江县', '3');
INSERT INTO `sys_china_area` VALUES (533124, 533100, '陇川县', '3');
INSERT INTO `sys_china_area` VALUES (533300, 530000, '怒江傈僳族自治州', '2');
INSERT INTO `sys_china_area` VALUES (533301, 533300, '泸水市', '3');
INSERT INTO `sys_china_area` VALUES (533323, 533300, '福贡县', '3');
INSERT INTO `sys_china_area` VALUES (533324, 533300, '贡山独龙族怒族自治县', '3');
INSERT INTO `sys_china_area` VALUES (533325, 533300, '兰坪白族普米族自治县', '3');
INSERT INTO `sys_china_area` VALUES (533400, 530000, '迪庆藏族自治州', '2');
INSERT INTO `sys_china_area` VALUES (533401, 533400, '香格里拉市', '3');
INSERT INTO `sys_china_area` VALUES (533422, 533400, '德钦县', '3');
INSERT INTO `sys_china_area` VALUES (533423, 533400, '维西傈僳族自治县', '3');
INSERT INTO `sys_china_area` VALUES (540000, 0, '西藏自治区', '1');
INSERT INTO `sys_china_area` VALUES (540100, 540000, '拉萨市', '2');
INSERT INTO `sys_china_area` VALUES (540102, 540100, '城关区', '3');
INSERT INTO `sys_china_area` VALUES (540103, 540100, '堆龙德庆区', '3');
INSERT INTO `sys_china_area` VALUES (540104, 540100, '达孜区', '3');
INSERT INTO `sys_china_area` VALUES (540121, 540100, '林周县', '3');
INSERT INTO `sys_china_area` VALUES (540122, 540100, '当雄县', '3');
INSERT INTO `sys_china_area` VALUES (540123, 540100, '尼木县', '3');
INSERT INTO `sys_china_area` VALUES (540124, 540100, '曲水县', '3');
INSERT INTO `sys_china_area` VALUES (540127, 540100, '墨竹工卡县', '3');
INSERT INTO `sys_china_area` VALUES (540200, 540000, '日喀则市', '2');
INSERT INTO `sys_china_area` VALUES (540202, 540200, '桑珠孜区', '3');
INSERT INTO `sys_china_area` VALUES (540221, 540200, '南木林县', '3');
INSERT INTO `sys_china_area` VALUES (540222, 540200, '江孜县', '3');
INSERT INTO `sys_china_area` VALUES (540223, 540200, '定日县', '3');
INSERT INTO `sys_china_area` VALUES (540224, 540200, '萨迦县', '3');
INSERT INTO `sys_china_area` VALUES (540225, 540200, '拉孜县', '3');
INSERT INTO `sys_china_area` VALUES (540226, 540200, '昂仁县', '3');
INSERT INTO `sys_china_area` VALUES (540227, 540200, '谢通门县', '3');
INSERT INTO `sys_china_area` VALUES (540228, 540200, '白朗县', '3');
INSERT INTO `sys_china_area` VALUES (540229, 540200, '仁布县', '3');
INSERT INTO `sys_china_area` VALUES (540230, 540200, '康马县', '3');
INSERT INTO `sys_china_area` VALUES (540231, 540200, '定结县', '3');
INSERT INTO `sys_china_area` VALUES (540232, 540200, '仲巴县', '3');
INSERT INTO `sys_china_area` VALUES (540233, 540200, '亚东县', '3');
INSERT INTO `sys_china_area` VALUES (540234, 540200, '吉隆县', '3');
INSERT INTO `sys_china_area` VALUES (540235, 540200, '聂拉木县', '3');
INSERT INTO `sys_china_area` VALUES (540236, 540200, '萨嘎县', '3');
INSERT INTO `sys_china_area` VALUES (540237, 540200, '岗巴县', '3');
INSERT INTO `sys_china_area` VALUES (540300, 540000, '昌都市', '2');
INSERT INTO `sys_china_area` VALUES (540302, 540300, '卡若区', '3');
INSERT INTO `sys_china_area` VALUES (540321, 540300, '江达县', '3');
INSERT INTO `sys_china_area` VALUES (540322, 540300, '贡觉县', '3');
INSERT INTO `sys_china_area` VALUES (540323, 540300, '类乌齐县', '3');
INSERT INTO `sys_china_area` VALUES (540324, 540300, '丁青县', '3');
INSERT INTO `sys_china_area` VALUES (540325, 540300, '察雅县', '3');
INSERT INTO `sys_china_area` VALUES (540326, 540300, '八宿县', '3');
INSERT INTO `sys_china_area` VALUES (540327, 540300, '左贡县', '3');
INSERT INTO `sys_china_area` VALUES (540328, 540300, '芒康县', '3');
INSERT INTO `sys_china_area` VALUES (540329, 540300, '洛隆县', '3');
INSERT INTO `sys_china_area` VALUES (540330, 540300, '边坝县', '3');
INSERT INTO `sys_china_area` VALUES (540400, 540000, '林芝市', '2');
INSERT INTO `sys_china_area` VALUES (540402, 540400, '巴宜区', '3');
INSERT INTO `sys_china_area` VALUES (540421, 540400, '工布江达县', '3');
INSERT INTO `sys_china_area` VALUES (540422, 540400, '米林县', '3');
INSERT INTO `sys_china_area` VALUES (540423, 540400, '墨脱县', '3');
INSERT INTO `sys_china_area` VALUES (540424, 540400, '波密县', '3');
INSERT INTO `sys_china_area` VALUES (540425, 540400, '察隅县', '3');
INSERT INTO `sys_china_area` VALUES (540426, 540400, '朗县', '3');
INSERT INTO `sys_china_area` VALUES (540500, 540000, '山南市', '2');
INSERT INTO `sys_china_area` VALUES (540502, 540500, '乃东区', '3');
INSERT INTO `sys_china_area` VALUES (540521, 540500, '扎囊县', '3');
INSERT INTO `sys_china_area` VALUES (540522, 540500, '贡嘎县', '3');
INSERT INTO `sys_china_area` VALUES (540523, 540500, '桑日县', '3');
INSERT INTO `sys_china_area` VALUES (540524, 540500, '琼结县', '3');
INSERT INTO `sys_china_area` VALUES (540525, 540500, '曲松县', '3');
INSERT INTO `sys_china_area` VALUES (540526, 540500, '措美县', '3');
INSERT INTO `sys_china_area` VALUES (540527, 540500, '洛扎县', '3');
INSERT INTO `sys_china_area` VALUES (540528, 540500, '加查县', '3');
INSERT INTO `sys_china_area` VALUES (540529, 540500, '隆子县', '3');
INSERT INTO `sys_china_area` VALUES (540530, 540500, '错那县', '3');
INSERT INTO `sys_china_area` VALUES (540531, 540500, '浪卡子县', '3');
INSERT INTO `sys_china_area` VALUES (540600, 540000, '那曲市', '2');
INSERT INTO `sys_china_area` VALUES (540602, 540600, '色尼区', '3');
INSERT INTO `sys_china_area` VALUES (540621, 540600, '嘉黎县', '3');
INSERT INTO `sys_china_area` VALUES (540622, 540600, '比如县', '3');
INSERT INTO `sys_china_area` VALUES (540623, 540600, '聂荣县', '3');
INSERT INTO `sys_china_area` VALUES (540624, 540600, '安多县', '3');
INSERT INTO `sys_china_area` VALUES (540625, 540600, '申扎县', '3');
INSERT INTO `sys_china_area` VALUES (540626, 540600, '索县', '3');
INSERT INTO `sys_china_area` VALUES (540627, 540600, '班戈县', '3');
INSERT INTO `sys_china_area` VALUES (540628, 540600, '巴青县', '3');
INSERT INTO `sys_china_area` VALUES (540629, 540600, '尼玛县', '3');
INSERT INTO `sys_china_area` VALUES (540630, 540600, '双湖县', '3');
INSERT INTO `sys_china_area` VALUES (542500, 540000, '阿里地区', '2');
INSERT INTO `sys_china_area` VALUES (542521, 542500, '普兰县', '3');
INSERT INTO `sys_china_area` VALUES (542522, 542500, '札达县', '3');
INSERT INTO `sys_china_area` VALUES (542523, 542500, '噶尔县', '3');
INSERT INTO `sys_china_area` VALUES (542524, 542500, '日土县', '3');
INSERT INTO `sys_china_area` VALUES (542525, 542500, '革吉县', '3');
INSERT INTO `sys_china_area` VALUES (542526, 542500, '改则县', '3');
INSERT INTO `sys_china_area` VALUES (542527, 542500, '措勤县', '3');
INSERT INTO `sys_china_area` VALUES (610000, 0, '陕西省', '1');
INSERT INTO `sys_china_area` VALUES (610100, 610000, '西安市', '2');
INSERT INTO `sys_china_area` VALUES (610102, 610100, '新城区', '3');
INSERT INTO `sys_china_area` VALUES (610103, 610100, '碑林区', '3');
INSERT INTO `sys_china_area` VALUES (610104, 610100, '莲湖区', '3');
INSERT INTO `sys_china_area` VALUES (610111, 610100, '灞桥区', '3');
INSERT INTO `sys_china_area` VALUES (610112, 610100, '未央区', '3');
INSERT INTO `sys_china_area` VALUES (610113, 610100, '雁塔区', '3');
INSERT INTO `sys_china_area` VALUES (610114, 610100, '阎良区', '3');
INSERT INTO `sys_china_area` VALUES (610115, 610100, '临潼区', '3');
INSERT INTO `sys_china_area` VALUES (610116, 610100, '长安区', '3');
INSERT INTO `sys_china_area` VALUES (610117, 610100, '高陵区', '3');
INSERT INTO `sys_china_area` VALUES (610118, 610100, '鄠邑区', '3');
INSERT INTO `sys_china_area` VALUES (610122, 610100, '蓝田县', '3');
INSERT INTO `sys_china_area` VALUES (610124, 610100, '周至县', '3');
INSERT INTO `sys_china_area` VALUES (610200, 610000, '铜川市', '2');
INSERT INTO `sys_china_area` VALUES (610202, 610200, '王益区', '3');
INSERT INTO `sys_china_area` VALUES (610203, 610200, '印台区', '3');
INSERT INTO `sys_china_area` VALUES (610204, 610200, '耀州区', '3');
INSERT INTO `sys_china_area` VALUES (610222, 610200, '宜君县', '3');
INSERT INTO `sys_china_area` VALUES (610300, 610000, '宝鸡市', '2');
INSERT INTO `sys_china_area` VALUES (610302, 610300, '渭滨区', '3');
INSERT INTO `sys_china_area` VALUES (610303, 610300, '金台区', '3');
INSERT INTO `sys_china_area` VALUES (610304, 610300, '陈仓区', '3');
INSERT INTO `sys_china_area` VALUES (610322, 610300, '凤翔县', '3');
INSERT INTO `sys_china_area` VALUES (610323, 610300, '岐山县', '3');
INSERT INTO `sys_china_area` VALUES (610324, 610300, '扶风县', '3');
INSERT INTO `sys_china_area` VALUES (610326, 610300, '眉县', '3');
INSERT INTO `sys_china_area` VALUES (610327, 610300, '陇县', '3');
INSERT INTO `sys_china_area` VALUES (610328, 610300, '千阳县', '3');
INSERT INTO `sys_china_area` VALUES (610329, 610300, '麟游县', '3');
INSERT INTO `sys_china_area` VALUES (610330, 610300, '凤县', '3');
INSERT INTO `sys_china_area` VALUES (610331, 610300, '太白县', '3');
INSERT INTO `sys_china_area` VALUES (610400, 610000, '咸阳市', '2');
INSERT INTO `sys_china_area` VALUES (610402, 610400, '秦都区', '3');
INSERT INTO `sys_china_area` VALUES (610403, 610400, '杨陵区', '3');
INSERT INTO `sys_china_area` VALUES (610404, 610400, '渭城区', '3');
INSERT INTO `sys_china_area` VALUES (610422, 610400, '三原县', '3');
INSERT INTO `sys_china_area` VALUES (610423, 610400, '泾阳县', '3');
INSERT INTO `sys_china_area` VALUES (610424, 610400, '乾县', '3');
INSERT INTO `sys_china_area` VALUES (610425, 610400, '礼泉县', '3');
INSERT INTO `sys_china_area` VALUES (610426, 610400, '永寿县', '3');
INSERT INTO `sys_china_area` VALUES (610428, 610400, '长武县', '3');
INSERT INTO `sys_china_area` VALUES (610429, 610400, '旬邑县', '3');
INSERT INTO `sys_china_area` VALUES (610430, 610400, '淳化县', '3');
INSERT INTO `sys_china_area` VALUES (610431, 610400, '武功县', '3');
INSERT INTO `sys_china_area` VALUES (610481, 610400, '兴平市', '3');
INSERT INTO `sys_china_area` VALUES (610482, 610400, '彬州市', '3');
INSERT INTO `sys_china_area` VALUES (610500, 610000, '渭南市', '2');
INSERT INTO `sys_china_area` VALUES (610502, 610500, '临渭区', '3');
INSERT INTO `sys_china_area` VALUES (610503, 610500, '华州区', '3');
INSERT INTO `sys_china_area` VALUES (610522, 610500, '潼关县', '3');
INSERT INTO `sys_china_area` VALUES (610523, 610500, '大荔县', '3');
INSERT INTO `sys_china_area` VALUES (610524, 610500, '合阳县', '3');
INSERT INTO `sys_china_area` VALUES (610525, 610500, '澄城县', '3');
INSERT INTO `sys_china_area` VALUES (610526, 610500, '蒲城县', '3');
INSERT INTO `sys_china_area` VALUES (610527, 610500, '白水县', '3');
INSERT INTO `sys_china_area` VALUES (610528, 610500, '富平县', '3');
INSERT INTO `sys_china_area` VALUES (610581, 610500, '韩城市', '3');
INSERT INTO `sys_china_area` VALUES (610582, 610500, '华阴市', '3');
INSERT INTO `sys_china_area` VALUES (610600, 610000, '延安市', '2');
INSERT INTO `sys_china_area` VALUES (610602, 610600, '宝塔区', '3');
INSERT INTO `sys_china_area` VALUES (610603, 610600, '安塞区', '3');
INSERT INTO `sys_china_area` VALUES (610621, 610600, '延长县', '3');
INSERT INTO `sys_china_area` VALUES (610622, 610600, '延川县', '3');
INSERT INTO `sys_china_area` VALUES (610625, 610600, '志丹县', '3');
INSERT INTO `sys_china_area` VALUES (610626, 610600, '吴起县', '3');
INSERT INTO `sys_china_area` VALUES (610627, 610600, '甘泉县', '3');
INSERT INTO `sys_china_area` VALUES (610628, 610600, '富县', '3');
INSERT INTO `sys_china_area` VALUES (610629, 610600, '洛川县', '3');
INSERT INTO `sys_china_area` VALUES (610630, 610600, '宜川县', '3');
INSERT INTO `sys_china_area` VALUES (610631, 610600, '黄龙县', '3');
INSERT INTO `sys_china_area` VALUES (610632, 610600, '黄陵县', '3');
INSERT INTO `sys_china_area` VALUES (610681, 610600, '子长市', '3');
INSERT INTO `sys_china_area` VALUES (610700, 610000, '汉中市', '2');
INSERT INTO `sys_china_area` VALUES (610702, 610700, '汉台区', '3');
INSERT INTO `sys_china_area` VALUES (610703, 610700, '南郑区', '3');
INSERT INTO `sys_china_area` VALUES (610722, 610700, '城固县', '3');
INSERT INTO `sys_china_area` VALUES (610723, 610700, '洋县', '3');
INSERT INTO `sys_china_area` VALUES (610724, 610700, '西乡县', '3');
INSERT INTO `sys_china_area` VALUES (610725, 610700, '勉县', '3');
INSERT INTO `sys_china_area` VALUES (610726, 610700, '宁强县', '3');
INSERT INTO `sys_china_area` VALUES (610727, 610700, '略阳县', '3');
INSERT INTO `sys_china_area` VALUES (610728, 610700, '镇巴县', '3');
INSERT INTO `sys_china_area` VALUES (610729, 610700, '留坝县', '3');
INSERT INTO `sys_china_area` VALUES (610730, 610700, '佛坪县', '3');
INSERT INTO `sys_china_area` VALUES (610800, 610000, '榆林市', '2');
INSERT INTO `sys_china_area` VALUES (610802, 610800, '榆阳区', '3');
INSERT INTO `sys_china_area` VALUES (610803, 610800, '横山区', '3');
INSERT INTO `sys_china_area` VALUES (610822, 610800, '府谷县', '3');
INSERT INTO `sys_china_area` VALUES (610824, 610800, '靖边县', '3');
INSERT INTO `sys_china_area` VALUES (610825, 610800, '定边县', '3');
INSERT INTO `sys_china_area` VALUES (610826, 610800, '绥德县', '3');
INSERT INTO `sys_china_area` VALUES (610827, 610800, '米脂县', '3');
INSERT INTO `sys_china_area` VALUES (610828, 610800, '佳县', '3');
INSERT INTO `sys_china_area` VALUES (610829, 610800, '吴堡县', '3');
INSERT INTO `sys_china_area` VALUES (610830, 610800, '清涧县', '3');
INSERT INTO `sys_china_area` VALUES (610831, 610800, '子洲县', '3');
INSERT INTO `sys_china_area` VALUES (610881, 610800, '神木市', '3');
INSERT INTO `sys_china_area` VALUES (610900, 610000, '安康市', '2');
INSERT INTO `sys_china_area` VALUES (610902, 610900, '汉滨区', '3');
INSERT INTO `sys_china_area` VALUES (610921, 610900, '汉阴县', '3');
INSERT INTO `sys_china_area` VALUES (610922, 610900, '石泉县', '3');
INSERT INTO `sys_china_area` VALUES (610923, 610900, '宁陕县', '3');
INSERT INTO `sys_china_area` VALUES (610924, 610900, '紫阳县', '3');
INSERT INTO `sys_china_area` VALUES (610925, 610900, '岚皋县', '3');
INSERT INTO `sys_china_area` VALUES (610926, 610900, '平利县', '3');
INSERT INTO `sys_china_area` VALUES (610927, 610900, '镇坪县', '3');
INSERT INTO `sys_china_area` VALUES (610928, 610900, '旬阳县', '3');
INSERT INTO `sys_china_area` VALUES (610929, 610900, '白河县', '3');
INSERT INTO `sys_china_area` VALUES (611000, 610000, '商洛市', '2');
INSERT INTO `sys_china_area` VALUES (611002, 611000, '商州区', '3');
INSERT INTO `sys_china_area` VALUES (611021, 611000, '洛南县', '3');
INSERT INTO `sys_china_area` VALUES (611022, 611000, '丹凤县', '3');
INSERT INTO `sys_china_area` VALUES (611023, 611000, '商南县', '3');
INSERT INTO `sys_china_area` VALUES (611024, 611000, '山阳县', '3');
INSERT INTO `sys_china_area` VALUES (611025, 611000, '镇安县', '3');
INSERT INTO `sys_china_area` VALUES (611026, 611000, '柞水县', '3');
INSERT INTO `sys_china_area` VALUES (620000, 0, '甘肃省', '1');
INSERT INTO `sys_china_area` VALUES (620100, 620000, '兰州市', '2');
INSERT INTO `sys_china_area` VALUES (620102, 620100, '城关区', '3');
INSERT INTO `sys_china_area` VALUES (620103, 620100, '七里河区', '3');
INSERT INTO `sys_china_area` VALUES (620104, 620100, '西固区', '3');
INSERT INTO `sys_china_area` VALUES (620105, 620100, '安宁区', '3');
INSERT INTO `sys_china_area` VALUES (620111, 620100, '红古区', '3');
INSERT INTO `sys_china_area` VALUES (620121, 620100, '永登县', '3');
INSERT INTO `sys_china_area` VALUES (620122, 620100, '皋兰县', '3');
INSERT INTO `sys_china_area` VALUES (620123, 620100, '榆中县', '3');
INSERT INTO `sys_china_area` VALUES (620200, 620000, '嘉峪关市', '2');
INSERT INTO `sys_china_area` VALUES (620300, 620000, '金昌市', '2');
INSERT INTO `sys_china_area` VALUES (620302, 620300, '金川区', '3');
INSERT INTO `sys_china_area` VALUES (620321, 620300, '永昌县', '3');
INSERT INTO `sys_china_area` VALUES (620400, 620000, '白银市', '2');
INSERT INTO `sys_china_area` VALUES (620402, 620400, '白银区', '3');
INSERT INTO `sys_china_area` VALUES (620403, 620400, '平川区', '3');
INSERT INTO `sys_china_area` VALUES (620421, 620400, '靖远县', '3');
INSERT INTO `sys_china_area` VALUES (620422, 620400, '会宁县', '3');
INSERT INTO `sys_china_area` VALUES (620423, 620400, '景泰县', '3');
INSERT INTO `sys_china_area` VALUES (620500, 620000, '天水市', '2');
INSERT INTO `sys_china_area` VALUES (620502, 620500, '秦州区', '3');
INSERT INTO `sys_china_area` VALUES (620503, 620500, '麦积区', '3');
INSERT INTO `sys_china_area` VALUES (620521, 620500, '清水县', '3');
INSERT INTO `sys_china_area` VALUES (620522, 620500, '秦安县', '3');
INSERT INTO `sys_china_area` VALUES (620523, 620500, '甘谷县', '3');
INSERT INTO `sys_china_area` VALUES (620524, 620500, '武山县', '3');
INSERT INTO `sys_china_area` VALUES (620525, 620500, '张家川回族自治县', '3');
INSERT INTO `sys_china_area` VALUES (620600, 620000, '武威市', '2');
INSERT INTO `sys_china_area` VALUES (620602, 620600, '凉州区', '3');
INSERT INTO `sys_china_area` VALUES (620621, 620600, '民勤县', '3');
INSERT INTO `sys_china_area` VALUES (620622, 620600, '古浪县', '3');
INSERT INTO `sys_china_area` VALUES (620623, 620600, '天祝藏族自治县', '3');
INSERT INTO `sys_china_area` VALUES (620700, 620000, '张掖市', '2');
INSERT INTO `sys_china_area` VALUES (620702, 620700, '甘州区', '3');
INSERT INTO `sys_china_area` VALUES (620721, 620700, '肃南裕固族自治县', '3');
INSERT INTO `sys_china_area` VALUES (620722, 620700, '民乐县', '3');
INSERT INTO `sys_china_area` VALUES (620723, 620700, '临泽县', '3');
INSERT INTO `sys_china_area` VALUES (620724, 620700, '高台县', '3');
INSERT INTO `sys_china_area` VALUES (620725, 620700, '山丹县', '3');
INSERT INTO `sys_china_area` VALUES (620800, 620000, '平凉市', '2');
INSERT INTO `sys_china_area` VALUES (620802, 620800, '崆峒区', '3');
INSERT INTO `sys_china_area` VALUES (620821, 620800, '泾川县', '3');
INSERT INTO `sys_china_area` VALUES (620822, 620800, '灵台县', '3');
INSERT INTO `sys_china_area` VALUES (620823, 620800, '崇信县', '3');
INSERT INTO `sys_china_area` VALUES (620825, 620800, '庄浪县', '3');
INSERT INTO `sys_china_area` VALUES (620826, 620800, '静宁县', '3');
INSERT INTO `sys_china_area` VALUES (620881, 620800, '华亭市', '3');
INSERT INTO `sys_china_area` VALUES (620900, 620000, '酒泉市', '2');
INSERT INTO `sys_china_area` VALUES (620902, 620900, '肃州区', '3');
INSERT INTO `sys_china_area` VALUES (620921, 620900, '金塔县', '3');
INSERT INTO `sys_china_area` VALUES (620922, 620900, '瓜州县', '3');
INSERT INTO `sys_china_area` VALUES (620923, 620900, '肃北蒙古族自治县', '3');
INSERT INTO `sys_china_area` VALUES (620924, 620900, '阿克塞哈萨克族自治县', '3');
INSERT INTO `sys_china_area` VALUES (620981, 620900, '玉门市', '3');
INSERT INTO `sys_china_area` VALUES (620982, 620900, '敦煌市', '3');
INSERT INTO `sys_china_area` VALUES (621000, 620000, '庆阳市', '2');
INSERT INTO `sys_china_area` VALUES (621002, 621000, '西峰区', '3');
INSERT INTO `sys_china_area` VALUES (621021, 621000, '庆城县', '3');
INSERT INTO `sys_china_area` VALUES (621022, 621000, '环县', '3');
INSERT INTO `sys_china_area` VALUES (621023, 621000, '华池县', '3');
INSERT INTO `sys_china_area` VALUES (621024, 621000, '合水县', '3');
INSERT INTO `sys_china_area` VALUES (621025, 621000, '正宁县', '3');
INSERT INTO `sys_china_area` VALUES (621026, 621000, '宁县', '3');
INSERT INTO `sys_china_area` VALUES (621027, 621000, '镇原县', '3');
INSERT INTO `sys_china_area` VALUES (621100, 620000, '定西市', '2');
INSERT INTO `sys_china_area` VALUES (621102, 621100, '安定区', '3');
INSERT INTO `sys_china_area` VALUES (621121, 621100, '通渭县', '3');
INSERT INTO `sys_china_area` VALUES (621122, 621100, '陇西县', '3');
INSERT INTO `sys_china_area` VALUES (621123, 621100, '渭源县', '3');
INSERT INTO `sys_china_area` VALUES (621124, 621100, '临洮县', '3');
INSERT INTO `sys_china_area` VALUES (621125, 621100, '漳县', '3');
INSERT INTO `sys_china_area` VALUES (621126, 621100, '岷县', '3');
INSERT INTO `sys_china_area` VALUES (621200, 620000, '陇南市', '2');
INSERT INTO `sys_china_area` VALUES (621202, 621200, '武都区', '3');
INSERT INTO `sys_china_area` VALUES (621221, 621200, '成县', '3');
INSERT INTO `sys_china_area` VALUES (621222, 621200, '文县', '3');
INSERT INTO `sys_china_area` VALUES (621223, 621200, '宕昌县', '3');
INSERT INTO `sys_china_area` VALUES (621224, 621200, '康县', '3');
INSERT INTO `sys_china_area` VALUES (621225, 621200, '西和县', '3');
INSERT INTO `sys_china_area` VALUES (621226, 621200, '礼县', '3');
INSERT INTO `sys_china_area` VALUES (621227, 621200, '徽县', '3');
INSERT INTO `sys_china_area` VALUES (621228, 621200, '两当县', '3');
INSERT INTO `sys_china_area` VALUES (622900, 620000, '临夏回族自治州', '2');
INSERT INTO `sys_china_area` VALUES (622901, 622900, '临夏市', '3');
INSERT INTO `sys_china_area` VALUES (622921, 622900, '临夏县', '3');
INSERT INTO `sys_china_area` VALUES (622922, 622900, '康乐县', '3');
INSERT INTO `sys_china_area` VALUES (622923, 622900, '永靖县', '3');
INSERT INTO `sys_china_area` VALUES (622924, 622900, '广河县', '3');
INSERT INTO `sys_china_area` VALUES (622925, 622900, '和政县', '3');
INSERT INTO `sys_china_area` VALUES (622926, 622900, '东乡族自治县', '3');
INSERT INTO `sys_china_area` VALUES (622927, 622900, '积石山保安族东乡族撒拉族自治县', '3');
INSERT INTO `sys_china_area` VALUES (623000, 620000, '甘南藏族自治州', '2');
INSERT INTO `sys_china_area` VALUES (623001, 623000, '合作市', '3');
INSERT INTO `sys_china_area` VALUES (623021, 623000, '临潭县', '3');
INSERT INTO `sys_china_area` VALUES (623022, 623000, '卓尼县', '3');
INSERT INTO `sys_china_area` VALUES (623023, 623000, '舟曲县', '3');
INSERT INTO `sys_china_area` VALUES (623024, 623000, '迭部县', '3');
INSERT INTO `sys_china_area` VALUES (623025, 623000, '玛曲县', '3');
INSERT INTO `sys_china_area` VALUES (623026, 623000, '碌曲县', '3');
INSERT INTO `sys_china_area` VALUES (623027, 623000, '夏河县', '3');
INSERT INTO `sys_china_area` VALUES (630000, 0, '青海省', '1');
INSERT INTO `sys_china_area` VALUES (630100, 630000, '西宁市', '2');
INSERT INTO `sys_china_area` VALUES (630102, 630100, '城东区', '3');
INSERT INTO `sys_china_area` VALUES (630103, 630100, '城中区', '3');
INSERT INTO `sys_china_area` VALUES (630104, 630100, '城西区', '3');
INSERT INTO `sys_china_area` VALUES (630105, 630100, '城北区', '3');
INSERT INTO `sys_china_area` VALUES (630106, 630100, '湟中区', '3');
INSERT INTO `sys_china_area` VALUES (630121, 630100, '大通回族土族自治县', '3');
INSERT INTO `sys_china_area` VALUES (630123, 630100, '湟源县', '3');
INSERT INTO `sys_china_area` VALUES (630200, 630000, '海东市', '2');
INSERT INTO `sys_china_area` VALUES (630202, 630200, '乐都区', '3');
INSERT INTO `sys_china_area` VALUES (630203, 630200, '平安区', '3');
INSERT INTO `sys_china_area` VALUES (630222, 630200, '民和回族土族自治县', '3');
INSERT INTO `sys_china_area` VALUES (630223, 630200, '互助土族自治县', '3');
INSERT INTO `sys_china_area` VALUES (630224, 630200, '化隆回族自治县', '3');
INSERT INTO `sys_china_area` VALUES (630225, 630200, '循化撒拉族自治县', '3');
INSERT INTO `sys_china_area` VALUES (632200, 630000, '海北藏族自治州', '2');
INSERT INTO `sys_china_area` VALUES (632221, 632200, '门源回族自治县', '3');
INSERT INTO `sys_china_area` VALUES (632222, 632200, '祁连县', '3');
INSERT INTO `sys_china_area` VALUES (632223, 632200, '海晏县', '3');
INSERT INTO `sys_china_area` VALUES (632224, 632200, '刚察县', '3');
INSERT INTO `sys_china_area` VALUES (632300, 630000, '黄南藏族自治州', '2');
INSERT INTO `sys_china_area` VALUES (632321, 632300, '同仁县', '3');
INSERT INTO `sys_china_area` VALUES (632322, 632300, '尖扎县', '3');
INSERT INTO `sys_china_area` VALUES (632323, 632300, '泽库县', '3');
INSERT INTO `sys_china_area` VALUES (632324, 632300, '河南蒙古族自治县', '3');
INSERT INTO `sys_china_area` VALUES (632500, 630000, '海南藏族自治州', '2');
INSERT INTO `sys_china_area` VALUES (632521, 632500, '共和县', '3');
INSERT INTO `sys_china_area` VALUES (632522, 632500, '同德县', '3');
INSERT INTO `sys_china_area` VALUES (632523, 632500, '贵德县', '3');
INSERT INTO `sys_china_area` VALUES (632524, 632500, '兴海县', '3');
INSERT INTO `sys_china_area` VALUES (632525, 632500, '贵南县', '3');
INSERT INTO `sys_china_area` VALUES (632600, 630000, '果洛藏族自治州', '2');
INSERT INTO `sys_china_area` VALUES (632621, 632600, '玛沁县', '3');
INSERT INTO `sys_china_area` VALUES (632622, 632600, '班玛县', '3');
INSERT INTO `sys_china_area` VALUES (632623, 632600, '甘德县', '3');
INSERT INTO `sys_china_area` VALUES (632624, 632600, '达日县', '3');
INSERT INTO `sys_china_area` VALUES (632625, 632600, '久治县', '3');
INSERT INTO `sys_china_area` VALUES (632626, 632600, '玛多县', '3');
INSERT INTO `sys_china_area` VALUES (632700, 630000, '玉树藏族自治州', '2');
INSERT INTO `sys_china_area` VALUES (632701, 632700, '玉树市', '3');
INSERT INTO `sys_china_area` VALUES (632722, 632700, '杂多县', '3');
INSERT INTO `sys_china_area` VALUES (632723, 632700, '称多县', '3');
INSERT INTO `sys_china_area` VALUES (632724, 632700, '治多县', '3');
INSERT INTO `sys_china_area` VALUES (632725, 632700, '囊谦县', '3');
INSERT INTO `sys_china_area` VALUES (632726, 632700, '曲麻莱县', '3');
INSERT INTO `sys_china_area` VALUES (632800, 630000, '海西蒙古族藏族自治州', '2');
INSERT INTO `sys_china_area` VALUES (632801, 632800, '格尔木市', '3');
INSERT INTO `sys_china_area` VALUES (632802, 632800, '德令哈市', '3');
INSERT INTO `sys_china_area` VALUES (632803, 632800, '茫崖市', '3');
INSERT INTO `sys_china_area` VALUES (632821, 632800, '乌兰县', '3');
INSERT INTO `sys_china_area` VALUES (632822, 632800, '都兰县', '3');
INSERT INTO `sys_china_area` VALUES (632823, 632800, '天峻县', '3');
INSERT INTO `sys_china_area` VALUES (640000, 0, '宁夏回族自治区', '1');
INSERT INTO `sys_china_area` VALUES (640100, 640000, '银川市', '2');
INSERT INTO `sys_china_area` VALUES (640104, 640100, '兴庆区', '3');
INSERT INTO `sys_china_area` VALUES (640105, 640100, '西夏区', '3');
INSERT INTO `sys_china_area` VALUES (640106, 640100, '金凤区', '3');
INSERT INTO `sys_china_area` VALUES (640121, 640100, '永宁县', '3');
INSERT INTO `sys_china_area` VALUES (640122, 640100, '贺兰县', '3');
INSERT INTO `sys_china_area` VALUES (640181, 640100, '灵武市', '3');
INSERT INTO `sys_china_area` VALUES (640200, 640000, '石嘴山市', '2');
INSERT INTO `sys_china_area` VALUES (640202, 640200, '大武口区', '3');
INSERT INTO `sys_china_area` VALUES (640205, 640200, '惠农区', '3');
INSERT INTO `sys_china_area` VALUES (640221, 640200, '平罗县', '3');
INSERT INTO `sys_china_area` VALUES (640300, 640000, '吴忠市', '2');
INSERT INTO `sys_china_area` VALUES (640302, 640300, '利通区', '3');
INSERT INTO `sys_china_area` VALUES (640303, 640300, '红寺堡区', '3');
INSERT INTO `sys_china_area` VALUES (640323, 640300, '盐池县', '3');
INSERT INTO `sys_china_area` VALUES (640324, 640300, '同心县', '3');
INSERT INTO `sys_china_area` VALUES (640381, 640300, '青铜峡市', '3');
INSERT INTO `sys_china_area` VALUES (640400, 640000, '固原市', '2');
INSERT INTO `sys_china_area` VALUES (640402, 640400, '原州区', '3');
INSERT INTO `sys_china_area` VALUES (640422, 640400, '西吉县', '3');
INSERT INTO `sys_china_area` VALUES (640423, 640400, '隆德县', '3');
INSERT INTO `sys_china_area` VALUES (640424, 640400, '泾源县', '3');
INSERT INTO `sys_china_area` VALUES (640425, 640400, '彭阳县', '3');
INSERT INTO `sys_china_area` VALUES (640500, 640000, '中卫市', '2');
INSERT INTO `sys_china_area` VALUES (640502, 640500, '沙坡头区', '3');
INSERT INTO `sys_china_area` VALUES (640521, 640500, '中宁县', '3');
INSERT INTO `sys_china_area` VALUES (640522, 640500, '海原县', '3');
INSERT INTO `sys_china_area` VALUES (650000, 0, '新疆维吾尔自治区', '1');
INSERT INTO `sys_china_area` VALUES (650100, 650000, '乌鲁木齐市', '2');
INSERT INTO `sys_china_area` VALUES (650102, 650100, '天山区', '3');
INSERT INTO `sys_china_area` VALUES (650103, 650100, '沙依巴克区', '3');
INSERT INTO `sys_china_area` VALUES (650104, 650100, '新市区', '3');
INSERT INTO `sys_china_area` VALUES (650105, 650100, '水磨沟区', '3');
INSERT INTO `sys_china_area` VALUES (650106, 650100, '头屯河区', '3');
INSERT INTO `sys_china_area` VALUES (650107, 650100, '达坂城区', '3');
INSERT INTO `sys_china_area` VALUES (650109, 650100, '米东区', '3');
INSERT INTO `sys_china_area` VALUES (650121, 650100, '乌鲁木齐县', '3');
INSERT INTO `sys_china_area` VALUES (650200, 650000, '克拉玛依市', '2');
INSERT INTO `sys_china_area` VALUES (650202, 650200, '独山子区', '3');
INSERT INTO `sys_china_area` VALUES (650203, 650200, '克拉玛依区', '3');
INSERT INTO `sys_china_area` VALUES (650204, 650200, '白碱滩区', '3');
INSERT INTO `sys_china_area` VALUES (650205, 650200, '乌尔禾区', '3');
INSERT INTO `sys_china_area` VALUES (650400, 650000, '吐鲁番市', '2');
INSERT INTO `sys_china_area` VALUES (650402, 650400, '高昌区', '3');
INSERT INTO `sys_china_area` VALUES (650421, 650400, '鄯善县', '3');
INSERT INTO `sys_china_area` VALUES (650422, 650400, '托克逊县', '3');
INSERT INTO `sys_china_area` VALUES (650500, 650000, '哈密市', '2');
INSERT INTO `sys_china_area` VALUES (650502, 650500, '伊州区', '3');
INSERT INTO `sys_china_area` VALUES (650521, 650500, '巴里坤哈萨克自治县', '3');
INSERT INTO `sys_china_area` VALUES (650522, 650500, '伊吾县', '3');
INSERT INTO `sys_china_area` VALUES (652300, 650000, '昌吉回族自治州', '2');
INSERT INTO `sys_china_area` VALUES (652301, 652300, '昌吉市', '3');
INSERT INTO `sys_china_area` VALUES (652302, 652300, '阜康市', '3');
INSERT INTO `sys_china_area` VALUES (652323, 652300, '呼图壁县', '3');
INSERT INTO `sys_china_area` VALUES (652324, 652300, '玛纳斯县', '3');
INSERT INTO `sys_china_area` VALUES (652325, 652300, '奇台县', '3');
INSERT INTO `sys_china_area` VALUES (652327, 652300, '吉木萨尔县', '3');
INSERT INTO `sys_china_area` VALUES (652328, 652300, '木垒哈萨克自治县', '3');
INSERT INTO `sys_china_area` VALUES (652700, 650000, '博尔塔拉蒙古自治州', '2');
INSERT INTO `sys_china_area` VALUES (652701, 652700, '博乐市', '3');
INSERT INTO `sys_china_area` VALUES (652702, 652700, '阿拉山口市', '3');
INSERT INTO `sys_china_area` VALUES (652722, 652700, '精河县', '3');
INSERT INTO `sys_china_area` VALUES (652723, 652700, '温泉县', '3');
INSERT INTO `sys_china_area` VALUES (652800, 650000, '巴音郭楞蒙古自治州', '2');
INSERT INTO `sys_china_area` VALUES (652801, 652800, '库尔勒市', '3');
INSERT INTO `sys_china_area` VALUES (652822, 652800, '轮台县', '3');
INSERT INTO `sys_china_area` VALUES (652823, 652800, '尉犁县', '3');
INSERT INTO `sys_china_area` VALUES (652824, 652800, '若羌县', '3');
INSERT INTO `sys_china_area` VALUES (652825, 652800, '且末县', '3');
INSERT INTO `sys_china_area` VALUES (652826, 652800, '焉耆回族自治县', '3');
INSERT INTO `sys_china_area` VALUES (652827, 652800, '和静县', '3');
INSERT INTO `sys_china_area` VALUES (652828, 652800, '和硕县', '3');
INSERT INTO `sys_china_area` VALUES (652829, 652800, '博湖县', '3');
INSERT INTO `sys_china_area` VALUES (652900, 650000, '阿克苏地区', '2');
INSERT INTO `sys_china_area` VALUES (652901, 652900, '阿克苏市', '3');
INSERT INTO `sys_china_area` VALUES (652902, 652900, '库车市', '3');
INSERT INTO `sys_china_area` VALUES (652922, 652900, '温宿县', '3');
INSERT INTO `sys_china_area` VALUES (652924, 652900, '沙雅县', '3');
INSERT INTO `sys_china_area` VALUES (652925, 652900, '新和县', '3');
INSERT INTO `sys_china_area` VALUES (652926, 652900, '拜城县', '3');
INSERT INTO `sys_china_area` VALUES (652927, 652900, '乌什县', '3');
INSERT INTO `sys_china_area` VALUES (652928, 652900, '阿瓦提县', '3');
INSERT INTO `sys_china_area` VALUES (652929, 652900, '柯坪县', '3');
INSERT INTO `sys_china_area` VALUES (653000, 650000, '克孜勒苏柯尔克孜自治州', '2');
INSERT INTO `sys_china_area` VALUES (653001, 653000, '阿图什市', '3');
INSERT INTO `sys_china_area` VALUES (653022, 653000, '阿克陶县', '3');
INSERT INTO `sys_china_area` VALUES (653023, 653000, '阿合奇县', '3');
INSERT INTO `sys_china_area` VALUES (653024, 653000, '乌恰县', '3');
INSERT INTO `sys_china_area` VALUES (653100, 650000, '喀什地区', '2');
INSERT INTO `sys_china_area` VALUES (653101, 653100, '喀什市', '3');
INSERT INTO `sys_china_area` VALUES (653121, 653100, '疏附县', '3');
INSERT INTO `sys_china_area` VALUES (653122, 653100, '疏勒县', '3');
INSERT INTO `sys_china_area` VALUES (653123, 653100, '英吉沙县', '3');
INSERT INTO `sys_china_area` VALUES (653124, 653100, '泽普县', '3');
INSERT INTO `sys_china_area` VALUES (653125, 653100, '莎车县', '3');
INSERT INTO `sys_china_area` VALUES (653126, 653100, '叶城县', '3');
INSERT INTO `sys_china_area` VALUES (653127, 653100, '麦盖提县', '3');
INSERT INTO `sys_china_area` VALUES (653128, 653100, '岳普湖县', '3');
INSERT INTO `sys_china_area` VALUES (653129, 653100, '伽师县', '3');
INSERT INTO `sys_china_area` VALUES (653130, 653100, '巴楚县', '3');
INSERT INTO `sys_china_area` VALUES (653131, 653100, '塔什库尔干塔吉克自治县', '3');
INSERT INTO `sys_china_area` VALUES (653200, 650000, '和田地区', '2');
INSERT INTO `sys_china_area` VALUES (653201, 653200, '和田市', '3');
INSERT INTO `sys_china_area` VALUES (653221, 653200, '和田县', '3');
INSERT INTO `sys_china_area` VALUES (653222, 653200, '墨玉县', '3');
INSERT INTO `sys_china_area` VALUES (653223, 653200, '皮山县', '3');
INSERT INTO `sys_china_area` VALUES (653224, 653200, '洛浦县', '3');
INSERT INTO `sys_china_area` VALUES (653225, 653200, '策勒县', '3');
INSERT INTO `sys_china_area` VALUES (653226, 653200, '于田县', '3');
INSERT INTO `sys_china_area` VALUES (653227, 653200, '民丰县', '3');
INSERT INTO `sys_china_area` VALUES (654000, 650000, '伊犁哈萨克自治州', '2');
INSERT INTO `sys_china_area` VALUES (654002, 654000, '伊宁市', '3');
INSERT INTO `sys_china_area` VALUES (654003, 654000, '奎屯市', '3');
INSERT INTO `sys_china_area` VALUES (654004, 654000, '霍尔果斯市', '3');
INSERT INTO `sys_china_area` VALUES (654021, 654000, '伊宁县', '3');
INSERT INTO `sys_china_area` VALUES (654022, 654000, '察布查尔锡伯自治县', '3');
INSERT INTO `sys_china_area` VALUES (654023, 654000, '霍城县', '3');
INSERT INTO `sys_china_area` VALUES (654024, 654000, '巩留县', '3');
INSERT INTO `sys_china_area` VALUES (654025, 654000, '新源县', '3');
INSERT INTO `sys_china_area` VALUES (654026, 654000, '昭苏县', '3');
INSERT INTO `sys_china_area` VALUES (654027, 654000, '特克斯县', '3');
INSERT INTO `sys_china_area` VALUES (654028, 654000, '尼勒克县', '3');
INSERT INTO `sys_china_area` VALUES (654200, 650000, '塔城地区', '2');
INSERT INTO `sys_china_area` VALUES (654201, 654200, '塔城市', '3');
INSERT INTO `sys_china_area` VALUES (654202, 654200, '乌苏市', '3');
INSERT INTO `sys_china_area` VALUES (654221, 654200, '额敏县', '3');
INSERT INTO `sys_china_area` VALUES (654223, 654200, '沙湾县', '3');
INSERT INTO `sys_china_area` VALUES (654224, 654200, '托里县', '3');
INSERT INTO `sys_china_area` VALUES (654225, 654200, '裕民县', '3');
INSERT INTO `sys_china_area` VALUES (654226, 654200, '和布克赛尔蒙古自治县', '3');
INSERT INTO `sys_china_area` VALUES (654300, 650000, '阿勒泰地区', '2');
INSERT INTO `sys_china_area` VALUES (654301, 654300, '阿勒泰市', '3');
INSERT INTO `sys_china_area` VALUES (654321, 654300, '布尔津县', '3');
INSERT INTO `sys_china_area` VALUES (654322, 654300, '富蕴县', '3');
INSERT INTO `sys_china_area` VALUES (654323, 654300, '福海县', '3');
INSERT INTO `sys_china_area` VALUES (654324, 654300, '哈巴河县', '3');
INSERT INTO `sys_china_area` VALUES (654325, 654300, '青河县', '3');
INSERT INTO `sys_china_area` VALUES (654326, 654300, '吉木乃县', '3');
INSERT INTO `sys_china_area` VALUES (659001, 650000, '石河子市', '2');
INSERT INTO `sys_china_area` VALUES (659002, 650000, '阿拉尔市', '2');
INSERT INTO `sys_china_area` VALUES (659003, 650000, '图木舒克市', '2');
INSERT INTO `sys_china_area` VALUES (659004, 650000, '五家渠市', '2');
INSERT INTO `sys_china_area` VALUES (659005, 650000, '北屯市', '2');
INSERT INTO `sys_china_area` VALUES (659006, 650000, '铁门关市', '2');
INSERT INTO `sys_china_area` VALUES (659007, 650000, '双河市', '2');
INSERT INTO `sys_china_area` VALUES (659008, 650000, '可克达拉市', '2');
INSERT INTO `sys_china_area` VALUES (659009, 650000, '昆玉市', '2');
INSERT INTO `sys_china_area` VALUES (659010, 650000, '胡杨河市', '2');
INSERT INTO `sys_china_area` VALUES (710000, 0, '台湾省', '1');
INSERT INTO `sys_china_area` VALUES (810000, 0, '香港特别行政区', '1');
INSERT INTO `sys_china_area` VALUES (820000, 0, '澳门特别行政区', '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_code` varchar(50) NOT NULL COMMENT '字典集代码',
  `dict_name` varchar(50) NOT NULL COMMENT '字典集名称',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `valid_status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0-停用，1-启用',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_dict_code` (`dict_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统字典集表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_code` varchar(50) NOT NULL COMMENT '字典集代码',
  `item_code` varchar(50) NOT NULL COMMENT '字典项代码',
  `item_name` varchar(50) NOT NULL COMMENT '字典项名称',
  `item_data` varchar(100) DEFAULT NULL COMMENT '字典项值',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `valid_status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0-停用，1-启用',
  `priority` int(10) unsigned NOT NULL COMMENT '优先级',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_dict_code` (`dict_code`,`item_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统字典项表';

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operate_no` varchar(30) NOT NULL DEFAULT '' COMMENT '操作账号',
  `operate_role_code` varchar(50) DEFAULT '' COMMENT '操作账号角色',
  `operate_ip` int(10) unsigned DEFAULT NULL COMMENT '操作IP',
  `operate_module_code` varchar(50) DEFAULT '' COMMENT '模块代码',
  `operate_url` varchar(200) DEFAULT '' COMMENT '请求地址',
  `operate_method` varchar(200) DEFAULT '' COMMENT '方法描述',
  `operate_exception` varchar(200) DEFAULT '' COMMENT '操作异常描述',
  `operate_content` text COMMENT '操作内容',
  `operate_type` varchar(15) DEFAULT '' COMMENT '操作类型：LOGIN，LOGOUT，INSERT，DELETE，UPDATE，EXCEPTION',
  `operate_type_desc` varchar(200) DEFAULT '' COMMENT '操作类型描述',
  `operate_consume_time` int(10) unsigned DEFAULT NULL COMMENT '操作耗时(毫秒)',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `superior` varchar(255) DEFAULT NULL COMMENT '操作账号角色的所有上级角色',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_operate_time` (`operate_time`,`operate_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统操作日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `module_id` int(10) unsigned NOT NULL COMMENT '模块ID',
  `module_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级模块ID，一级模块默认为0',
  `module_code` varchar(50) DEFAULT NULL COMMENT '模块代码',
  `module_name` varchar(30) NOT NULL DEFAULT '' COMMENT '模块名称',
  `module_url` varchar(50) DEFAULT '' COMMENT '模块URL',
  `module_level` char(4) NOT NULL COMMENT '模块层级，一级模块从10开始，二级模块与上级模块层级拼接，从01开始，如1001',
  `module_is_menu` char(1) NOT NULL DEFAULT '1' COMMENT '是否是菜单，0-不是菜单，1-是菜单，默认1',
  `module_for_permission` char(1) NOT NULL DEFAULT '1' COMMENT '是否需要设置权限，0-不需要，1-需要，默认1',
  `module_for_admin` char(1) NOT NULL DEFAULT '0' COMMENT '是否是超级管理员私有菜单，0-不是，1-是，默认0',
  `module_belong` char(1) NOT NULL DEFAULT '0' COMMENT '菜单分组，0-共有，1-操作员，2-非操作员，默认0',
  `module_icon` varchar(50) DEFAULT '' COMMENT '模块图标',
  `module_target` char(1) DEFAULT '' COMMENT '模块页面打开位置：0-页签打开，1-新页面打开',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `valid_status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0-停用，1-启用',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`module_id`) USING BTREE,
  UNIQUE KEY `uk_module_code` (`module_code`) USING BTREE,
  KEY `idx_module_parent_id` (`module_parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统模块表';

-- ----------------------------
-- Records of sys_module
-- ----------------------------
BEGIN;
INSERT INTO `sys_module` VALUES (10, 0, NULL, '系统管理', '', '10', '1', '1', '0', '0', 'layui-icon layui-icon-set', '', '', '1', '2018-09-02 20:40:37', '2020-03-19 13:50:09');
INSERT INTO `sys_module` VALUES (99, 0, NULL, '非菜单URL管理', '', '99', '0', '0', '0', '0', '', '', '系统中非菜单的请求URL', '1', '2018-09-02 20:40:37', '2020-03-16 23:52:43');
INSERT INTO `sys_module` VALUES (1001, 10, 'POWER', '权限项管理', 'system/power/main', '1001', '1', '1', '1', '0', 'layui-icon layui-icon-form', '0', '', '1', '2018-09-02 20:40:37', '2020-08-04 17:37:31');
INSERT INTO `sys_module` VALUES (1002, 10, 'MODULE', '模块管理', 'system/module/main', '1002', '1', '1', '1', '0', 'layui-icon layui-icon-form', '0', '', '1', '2018-09-02 20:40:37', '2020-08-04 17:37:34');
INSERT INTO `sys_module` VALUES (1003, 10, 'MODULE_POWER', '模块权限配置', 'system/modulepower/main', '1003', '1', '1', '1', '0', 'layui-icon layui-icon-form', '0', '', '1', '2018-09-02 20:40:37', '2020-08-04 17:37:38');
INSERT INTO `sys_module` VALUES (1004, 10, 'ROLE', '角色管理', 'system/role/main', '1004', '1', '1', '0', '0', 'layui-icon layui-icon-form', '0', '', '1', '2018-09-02 20:40:37', '2020-08-04 17:37:41');
INSERT INTO `sys_module` VALUES (1005, 10, 'OPERATOR', '操作员管理', 'system/operator/main', '1006', '1', '1', '0', '0', 'layui-icon layui-icon-form', '0', '', '1', '2018-09-02 20:40:37', '2020-08-04 17:37:43');
INSERT INTO `sys_module` VALUES (1006, 10, 'SUB', '子账号管理', 'system/sub/main', '1007', '1', '1', '0', '0', 'layui-icon layui-icon-form', '0', '', '1', '2018-09-02 20:40:37', '2020-08-04 17:37:46');
INSERT INTO `sys_module` VALUES (1007, 10, 'PARAM', '系统参数配置', 'system/param/main', '1008', '1', '1', '0', '0', 'layui-icon layui-icon-form', '0', '', '1', '2018-09-02 20:40:37', '2020-08-04 17:37:48');
INSERT INTO `sys_module` VALUES (1008, 10, 'WHITE_IP', 'IP白名单管理', 'system/whiteip/main', '1010', '1', '1', '0', '0', 'layui-icon layui-icon-form', '0', '', '1', '2018-09-02 20:40:37', '2020-08-04 17:37:50');
INSERT INTO `sys_module` VALUES (1009, 10, 'LOG', '操作日志', 'system/log/main', '1012', '1', '1', '0', '0', 'layui-icon layui-icon-form', '0', '', '1', '2018-09-02 20:40:37', '2020-08-04 17:37:52');
INSERT INTO `sys_module` VALUES (1010, 10, 'CODE_GENERATION', '代码生成工具', 'system/code/main', '1013', '1', '1', '1', '1', 'layui-icon layui-icon-form', '0', '', '1', '2018-10-30 20:46:00', '2020-08-04 17:37:54');
INSERT INTO `sys_module` VALUES (1011, 10, 'ORGANIZATION', '组织机构管理', 'system/organization/main', '1005', '1', '1', '0', '0', 'layui-icon layui-icon-form', '0', '', '1', '2019-05-06 21:08:53', '2020-08-04 17:37:57');
INSERT INTO `sys_module` VALUES (1012, 10, 'DICT', '数据字典管理', 'system/dict/main', '1009', '1', '1', '0', '0', 'layui-icon layui-icon-form', '0', '', '1', '2019-06-07 12:37:41', '2020-08-04 17:37:58');
INSERT INTO `sys_module` VALUES (1013, 10, 'JOB', '定时任务管理', 'system/job/main', '1011', '1', '1', '0', '0', 'layui-icon layui-icon-form', '0', '', '1', '2020-04-12 19:24:21', '2020-08-04 17:38:01');
INSERT INTO `sys_module` VALUES (9901, 99, 'LOGIN', '登录退出', '', '9901', '0', '0', '0', '0', '', '', '', '1', '2018-09-02 20:40:37', '2020-05-04 11:12:18');
INSERT INTO `sys_module` VALUES (9902, 99, 'INDEX', '首页', '', '9902', '0', '0', '0', '0', '', '', '', '1', '2018-09-02 20:40:37', '2020-05-04 11:12:01');
COMMIT;

-- ----------------------------
-- Table structure for sys_module_power
-- ----------------------------
DROP TABLE IF EXISTS `sys_module_power`;
CREATE TABLE `sys_module_power` (
  `mp_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `module_code` varchar(50) NOT NULL COMMENT '模块代码',
  `power_item` varchar(20) NOT NULL COMMENT '权限项',
  `alias_name` varchar(20) NOT NULL DEFAULT '' COMMENT '权限项别名',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`mp_id`) USING BTREE,
  KEY `idx_power_item` (`power_item`) USING BTREE,
  KEY `idx_module_code` (`module_code`) USING BTREE,
  CONSTRAINT `sys_module_power_ibfk_1` FOREIGN KEY (`module_code`) REFERENCES `sys_module` (`module_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='模块权限项关系表';

-- ----------------------------
-- Records of sys_module_power
-- ----------------------------
BEGIN;
INSERT INTO `sys_module_power` VALUES (1, 'LOGIN', 'VIEW', '浏览', '2018-09-04 15:44:39', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (2, 'INDEX', 'VIEW', '浏览', '2018-09-04 15:44:39', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (3, 'POWER', 'VIEW', '浏览', '2018-09-08 14:47:49', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (4, 'POWER', 'ADD', '添加', '2018-09-08 14:47:49', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (5, 'POWER', 'DELETE', '删除', '2018-09-08 14:47:49', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (6, 'POWER', 'UPDATE', '修改', '2018-09-08 14:47:49', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (7, 'POWER', 'PRIORITY', '调整优先级', '2018-09-08 14:54:48', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (8, 'MODULE', 'VIEW', '浏览', '2018-09-08 16:45:38', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (9, 'MODULE', 'ADD', '添加', '2018-09-08 16:45:38', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (10, 'MODULE', 'DELETE', '删除', '2018-09-08 16:45:38', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (11, 'MODULE', 'UPDATE', '修改', '2018-09-08 16:45:38', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (12, 'MODULE', 'PRIORITY', '调整优先级', '2018-09-08 16:45:38', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (13, 'MODULE_POWER', 'VIEW', '浏览', '2018-09-08 20:58:34', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (14, 'MODULE_POWER', 'ADD', '添加', '2018-09-08 20:58:34', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (15, 'MODULE_POWER', 'DELETE', '删除', '2018-09-08 20:58:34', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (16, 'MODULE_POWER', 'UPDATE', '修改', '2018-09-08 20:58:34', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (17, 'MODULE_POWER', 'CONFIG', '配置URL', '2018-09-08 20:58:34', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (18, 'ROLE', 'VIEW', '浏览', '2018-09-08 22:47:02', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (19, 'ROLE', 'ADD', '添加', '2018-09-08 22:47:08', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (20, 'ROLE', 'DELETE', '删除', '2018-09-08 22:47:12', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (21, 'ROLE', 'UPDATE', '编辑', '2018-09-08 22:47:16', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (22, 'ROLE', 'CONFIG', '配置权限', '2018-09-08 22:47:19', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (23, 'OPERATOR', 'VIEW', '浏览', '2018-09-09 12:00:52', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (24, 'OPERATOR', 'ADD', '添加', '2018-09-09 12:00:55', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (25, 'OPERATOR', 'DELETE', '删除', '2018-09-09 12:00:59', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (26, 'OPERATOR', 'UPDATE', '编辑', '2018-09-09 12:01:08', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (27, 'OPERATOR', 'PASSWORD', '修改密码', '2018-09-09 12:01:12', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (28, 'SUB', 'VIEW', '浏览', '2018-09-09 15:01:45', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (29, 'SUB', 'ADD', '添加', '2018-09-09 15:01:49', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (30, 'SUB', 'DELETE', '删除', '2018-09-09 15:01:54', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (31, 'SUB', 'UPDATE', '编辑', '2018-09-09 15:01:58', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (32, 'SUB', 'CONFIG', '配置权限', '2018-09-09 15:02:03', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (33, 'SUB', 'PASSWORD', '修改密码', '2018-09-09 15:02:08', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (34, 'PARAM', 'VIEW', '浏览', '2018-09-09 17:00:13', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (35, 'PARAM', 'ADD', '添加', '2018-09-09 17:00:16', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (36, 'PARAM', 'DELETE', '删除', '2018-09-09 17:00:20', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (37, 'PARAM', 'UPDATE', '编辑', '2018-09-09 17:00:24', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (38, 'PARAM', 'PRIORITY', '调整优先级', '2018-09-09 17:00:28', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (39, 'WHITE_IP', 'VIEW', '浏览', '2018-09-09 17:00:36', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (40, 'WHITE_IP', 'ADD', '添加', '2018-09-09 17:00:39', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (41, 'WHITE_IP', 'DELETE', '删除', '2018-09-09 17:00:43', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (42, 'WHITE_IP', 'UPDATE', '编辑', '2018-09-09 17:00:47', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (43, 'LOG', 'VIEW', '浏览', '2018-09-09 17:04:33', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (44, 'CODE_GENERATION', 'VIEW', '浏览', '2018-10-30 20:48:00', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (45, 'CODE_GENERATION', 'DOWNLOAD', '代码生成', '2018-10-30 20:48:21', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (46, 'ORGANIZATION', 'VIEW', '浏览', '2019-05-07 12:56:26', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (47, 'ORGANIZATION', 'ADD', '添加', '2019-05-07 13:49:34', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (48, 'ORGANIZATION', 'DELETE', '删除', '2019-05-07 13:49:44', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (49, 'ORGANIZATION', 'UPDATE', '编辑', '2019-05-07 13:49:54', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (50, 'DICT', 'VIEW', '浏览', '2019-06-07 13:00:14', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (51, 'DICT', 'ADD', '添加', '2019-06-07 13:00:14', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (52, 'DICT', 'DELETE', '删除', '2019-06-07 13:00:14', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (53, 'DICT', 'UPDATE', '编辑', '2019-06-07 13:02:35', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (54, 'JOB', 'VIEW', '浏览', '2020-04-12 19:28:22', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (55, 'JOB', 'ADD', '添加', '2020-04-12 19:28:22', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (56, 'JOB', 'DELETE', '删除', '2020-04-12 19:28:22', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (57, 'JOB', 'UPDATE', '编辑', '2020-04-12 19:28:22', '2020-05-04 11:43:31');
INSERT INTO `sys_module_power` VALUES (58, 'LOG', 'DELETE', '删除', '2020-05-05 09:28:01', '2020-05-05 09:28:01');
COMMIT;

-- ----------------------------
-- Table structure for sys_module_power_method
-- ----------------------------
DROP TABLE IF EXISTS `sys_module_power_method`;
CREATE TABLE `sys_module_power_method` (
  `mpm_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `mp_id` int(10) unsigned NOT NULL COMMENT '模块权限项ID',
  `class_name` varchar(100) NOT NULL COMMENT '类名',
  `url` varchar(100) NOT NULL COMMENT '请求URL',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`mpm_id`) USING BTREE,
  KEY `idx_mp_id` (`mp_id`) USING BTREE,
  CONSTRAINT `sys_module_power_method_ibfk_1` FOREIGN KEY (`mp_id`) REFERENCES `sys_module_power` (`mp_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='模块权限项方法配置表';

-- ----------------------------
-- Records of sys_module_power_method
-- ----------------------------
BEGIN;
INSERT INTO `sys_module_power_method` VALUES (1, 1, 'com.chanus.yuntao.boot.manager.controller.LoginController', '/login', '2018-09-04 15:45:19', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (2, 1, 'com.chanus.yuntao.boot.manager.controller.LoginController', '/rsa-public-key', '2018-09-04 15:45:19', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (3, 1, 'com.chanus.yuntao.boot.manager.controller.LoginController', '/verify-code', '2018-09-04 15:45:19', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (4, 1, 'com.chanus.yuntao.boot.manager.controller.LoginController', '/relogin', '2018-09-04 15:45:19', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (5, 1, 'com.chanus.yuntao.boot.manager.controller.LoginController', '/logout', '2018-09-04 15:45:19', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (6, 2, 'com.chanus.yuntao.boot.manager.controller.IndexController', '/index/index', '2018-09-04 15:45:19', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (7, 2, 'com.chanus.yuntao.boot.manager.controller.IndexController', '/index/reload-authority', '2018-09-04 15:45:19', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (8, 2, 'com.chanus.yuntao.boot.manager.controller.IndexController', '/index/user/operator-info', '2018-09-04 15:45:19', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (9, 2, 'com.chanus.yuntao.boot.manager.controller.IndexController', '/index/user/update-own-password', '2018-09-04 15:45:19', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (10, 3, 'com.chanus.yuntao.boot.manager.controller.PowerController', '/system/power/main', '2018-09-08 14:51:38', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (11, 3, 'com.chanus.yuntao.boot.manager.controller.PowerController', '/system/power/list', '2018-09-08 14:51:38', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (12, 4, 'com.chanus.yuntao.boot.manager.controller.PowerController', '/system/power/add', '2018-09-08 14:51:38', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (13, 5, 'com.chanus.yuntao.boot.manager.controller.PowerController', '/system/power/delete', '2018-09-08 14:51:38', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (14, 6, 'com.chanus.yuntao.boot.manager.controller.PowerController', '/system/power/update', '2018-09-08 14:51:38', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (15, 7, 'com.chanus.yuntao.boot.manager.controller.PowerController', '/system/power/priority', '2018-09-08 14:51:38', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (16, 8, 'com.chanus.yuntao.boot.manager.controller.ModuleController', '/system/module/main', '2018-09-08 16:47:40', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (17, 8, 'com.chanus.yuntao.boot.manager.controller.ModuleController', '/system/module/list', '2018-09-08 16:47:40', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (18, 8, 'com.chanus.yuntao.boot.manager.controller.ModuleController', '/system/module/tree', '2018-09-08 16:47:40', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (19, 9, 'com.chanus.yuntao.boot.manager.controller.ModuleController', '/system/module/add', '2018-09-08 16:47:40', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (20, 10, 'com.chanus.yuntao.boot.manager.controller.ModuleController', '/system/module/delete', '2018-09-08 16:47:40', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (21, 11, 'com.chanus.yuntao.boot.manager.controller.ModuleController', '/system/module/update', '2018-09-08 16:47:40', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (22, 12, 'com.chanus.yuntao.boot.manager.controller.ModuleController', '/system/module/priority', '2018-09-08 16:47:40', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (23, 13, 'com.chanus.yuntao.boot.manager.controller.ModulePowerController', '/system/modulepower/main', '2018-09-08 21:05:29', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (24, 13, 'com.chanus.yuntao.boot.manager.controller.ModulePowerController', '/system/modulepower/list', '2018-09-08 21:05:29', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (25, 13, 'com.chanus.yuntao.boot.manager.controller.ModuleController', '/system/module/modules', '2018-09-08 21:05:29', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (26, 14, 'com.chanus.yuntao.boot.manager.controller.ModulePowerController', '/system/modulepower/add', '2018-09-08 21:05:29', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (27, 15, 'com.chanus.yuntao.boot.manager.controller.ModulePowerController', '/system/modulepower/delete', '2018-09-08 21:05:29', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (28, 16, 'com.chanus.yuntao.boot.manager.controller.ModulePowerController', '/system/modulepower/update', '2018-09-08 21:05:29', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (29, 17, 'com.chanus.yuntao.boot.manager.controller.ModulePowerController', '/system/modulepower/method-main', '2018-09-08 21:44:14', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (30, 17, 'com.chanus.yuntao.boot.manager.controller.ModulePowerController', '/system/modulepower/method-list', '2018-09-08 21:44:14', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (31, 17, 'com.chanus.yuntao.boot.manager.controller.ModulePowerController', '/system/modulepower/urls', '2018-09-08 21:44:14', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (32, 17, 'com.chanus.yuntao.boot.manager.controller.ModulePowerController', '/system/modulepower/method-add', '2018-09-08 21:44:14', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (33, 17, 'com.chanus.yuntao.boot.manager.controller.ModulePowerController', '/system/modulepower/method-delete', '2018-09-08 21:44:14', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (34, 17, 'com.chanus.yuntao.boot.manager.controller.ModulePowerController', '/system/modulepower/method-update', '2018-09-08 21:44:14', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (35, 18, 'com.chanus.yuntao.boot.manager.controller.RoleController', '/system/role/main', '2018-09-08 22:48:05', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (36, 18, 'com.chanus.yuntao.boot.manager.controller.RoleController', '/system/role/list', '2018-09-08 22:48:09', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (37, 18, 'com.chanus.yuntao.boot.manager.controller.RoleController', '/system/role/tree', '2018-09-08 22:48:14', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (38, 18, 'com.chanus.yuntao.boot.manager.controller.RoleController', '/system/role/list-role-module-power', '2018-09-08 22:48:48', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (39, 19, 'com.chanus.yuntao.boot.manager.controller.RoleController', '/system/role/add', '2018-09-08 22:49:07', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (40, 20, 'com.chanus.yuntao.boot.manager.controller.RoleController', '/system/role/delete', '2018-09-08 22:49:18', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (41, 21, 'com.chanus.yuntao.boot.manager.controller.RoleController', '/system/role/update', '2018-09-08 22:49:28', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (42, 22, 'com.chanus.yuntao.boot.manager.controller.RoleController', '/system/role/grant', '2018-09-08 22:49:46', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (43, 23, 'com.chanus.yuntao.boot.manager.controller.OperatorController', '/system/operator/main', '2018-09-09 12:01:49', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (44, 23, 'com.chanus.yuntao.boot.manager.controller.OperatorController', '/system/operator/list', '2018-09-09 12:01:53', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (45, 23, 'com.chanus.yuntao.boot.manager.controller.OperatorController', '/system/operator/tree', '2018-09-09 12:01:58', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (46, 24, 'com.chanus.yuntao.boot.manager.controller.OperatorController', '/system/operator/add', '2018-09-09 12:02:11', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (47, 25, 'com.chanus.yuntao.boot.manager.controller.OperatorController', '/system/operator/delete', '2018-09-09 12:02:28', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (48, 26, 'com.chanus.yuntao.boot.manager.controller.OperatorController', '/system/operator/update', '2018-09-09 12:02:39', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (49, 27, 'com.chanus.yuntao.boot.manager.controller.OperatorController', '/system/operator/password', '2018-09-09 12:02:54', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (50, 28, 'com.chanus.yuntao.boot.manager.controller.SubController', '/system/sub/main', '2018-09-09 15:04:10', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (51, 28, 'com.chanus.yuntao.boot.manager.controller.SubController', '/system/sub/list', '2018-09-09 15:04:15', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (52, 29, 'com.chanus.yuntao.boot.manager.controller.SubController', '/system/sub/add', '2018-09-09 15:04:32', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (53, 30, 'com.chanus.yuntao.boot.manager.controller.SubController', '/system/sub/delete', '2018-09-09 15:04:43', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (54, 31, 'com.chanus.yuntao.boot.manager.controller.SubController', '/system/sub/update', '2018-09-09 15:04:57', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (55, 32, 'com.chanus.yuntao.boot.manager.controller.SubController', '/system/sub/configure', '2018-09-09 15:05:22', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (56, 33, 'com.chanus.yuntao.boot.manager.controller.SubController', '/system/sub/password', '2018-09-09 15:05:31', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (57, 34, 'com.chanus.yuntao.boot.manager.controller.ParamController', '/system/param/main', '2018-09-09 17:01:49', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (58, 34, 'com.chanus.yuntao.boot.manager.controller.ParamController', '/system/param/list', '2018-09-09 17:01:53', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (59, 34, 'com.chanus.yuntao.boot.manager.controller.ParamController', '/system/param/reload-param', '2018-09-09 17:02:05', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (60, 35, 'com.chanus.yuntao.boot.manager.controller.ParamController', '/system/param/add', '2018-09-09 17:02:37', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (61, 36, 'com.chanus.yuntao.boot.manager.controller.ParamController', '/system/param/delete', '2018-09-09 17:02:48', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (62, 37, 'com.chanus.yuntao.boot.manager.controller.ParamController', '/system/param/update', '2018-09-09 17:03:01', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (63, 38, 'com.chanus.yuntao.boot.manager.controller.ParamController', '/system/param/priority', '2018-09-09 17:03:13', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (64, 39, 'com.chanus.yuntao.boot.manager.controller.WhiteIpController', '/system/whiteip/main', '2018-09-09 17:03:32', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (65, 39, 'com.chanus.yuntao.boot.manager.controller.WhiteIpController', '/system/whiteip/list', '2018-09-09 17:03:35', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (66, 40, 'com.chanus.yuntao.boot.manager.controller.WhiteIpController', '/system/whiteip/add', '2018-09-09 17:03:45', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (67, 41, 'com.chanus.yuntao.boot.manager.controller.WhiteIpController', '/system/whiteip/delete', '2018-09-09 17:03:57', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (68, 42, 'com.chanus.yuntao.boot.manager.controller.WhiteIpController', '/system/whiteip/update', '2018-09-09 17:04:11', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (69, 43, 'com.chanus.yuntao.boot.manager.controller.LogController', '/system/log/main', '2018-09-09 17:04:47', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (70, 43, 'com.chanus.yuntao.boot.manager.controller.LogController', '/system/log/list', '2018-09-09 17:04:51', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (71, 43, 'com.chanus.yuntao.boot.manager.controller.LogController', '/system/log/content', '2018-09-09 17:04:54', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (72, 2, 'com.chanus.yuntao.boot.manager.controller.IndexController', '/index/user/headimage', '2018-09-11 19:08:23', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (73, 44, 'com.chanus.yuntao.boot.manager.controller.CodeGenerationController', '/system/code/main', '2018-10-30 20:49:02', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (74, 44, 'com.chanus.yuntao.boot.manager.controller.CodeGenerationController', '/system/code/list', '2018-10-30 21:40:21', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (75, 44, 'com.chanus.yuntao.boot.manager.controller.CodeGenerationController', '/system/code/table-column', '2018-10-30 22:05:40', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (76, 45, 'com.chanus.yuntao.boot.manager.controller.CodeGenerationController', '/system/code/generate', '2018-11-09 14:57:56', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (77, 45, 'com.chanus.yuntao.boot.manager.controller.CodeGenerationController', '/system/code/generate-download', '2018-11-09 15:10:28', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (78, 2, 'com.chanus.yuntao.boot.manager.controller.LoginController', '/check-login', '2019-05-06 20:22:39', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (79, 46, 'com.chanus.yuntao.boot.manager.controller.OrganizationController', '/system/organization/main', '2019-05-07 12:56:48', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (80, 46, 'com.chanus.yuntao.boot.manager.controller.OrganizationController', '/system/organization/list', '2019-05-07 12:56:57', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (81, 46, 'com.chanus.yuntao.boot.manager.controller.OrganizationController', '/system/organization/tree', '2019-05-07 12:57:07', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (82, 47, 'com.chanus.yuntao.boot.manager.controller.OrganizationController', '/system/organization/add', '2019-05-07 14:14:13', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (83, 48, 'com.chanus.yuntao.boot.manager.controller.OrganizationController', '/system/organization/delete', '2019-05-07 15:29:28', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (84, 49, 'com.chanus.yuntao.boot.manager.controller.OrganizationController', '/system/organization/update', '2019-05-07 15:29:47', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (85, 49, 'com.chanus.yuntao.boot.manager.controller.OrganizationController', '/system/organization/priority', '2019-05-07 16:44:44', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (86, 50, 'com.chanus.yuntao.boot.manager.controller.DictController', '/system/dict/main', '2019-06-07 13:09:07', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (87, 50, 'com.chanus.yuntao.boot.manager.controller.DictController', '/system/dict/list', '2019-06-07 13:09:07', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (88, 51, 'com.chanus.yuntao.boot.manager.controller.DictController', '/system/dict/add', '2019-06-07 13:09:07', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (89, 52, 'com.chanus.yuntao.boot.manager.controller.DictController', '/system/dict/delete', '2019-06-07 13:09:07', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (90, 53, 'com.chanus.yuntao.boot.manager.controller.DictController', '/system/dict/update', '2019-06-07 13:09:07', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (91, 50, 'com.chanus.yuntao.boot.manager.controller.DictItemController', '/system/dict/item/main', '2019-06-07 14:38:03', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (92, 50, 'com.chanus.yuntao.boot.manager.controller.DictItemController', '/system/dict/item/list', '2019-06-07 14:38:26', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (93, 51, 'com.chanus.yuntao.boot.manager.controller.DictItemController', '/system/dict/item/add', '2019-06-07 14:39:19', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (94, 52, 'com.chanus.yuntao.boot.manager.controller.DictItemController', '/system/dict/item/delete', '2019-06-07 14:39:36', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (95, 53, 'com.chanus.yuntao.boot.manager.controller.DictItemController', '/system/dict/item/update', '2019-06-07 14:39:48', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (96, 50, 'com.chanus.yuntao.boot.manager.controller.DictController', '/system/dict/reload', '2019-06-09 20:54:52', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (97, 54, 'com.chanus.yuntao.boot.manager.controller.ScheduleJobController', '/system/job/main', '2020-04-12 19:28:22', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (98, 54, 'com.chanus.yuntao.boot.manager.controller.ScheduleJobController', '/system/job/list', '2020-04-12 19:28:22', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (99, 55, 'com.chanus.yuntao.boot.manager.controller.ScheduleJobController', '/system/job/add', '2020-04-12 19:28:22', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (100, 56, 'com.chanus.yuntao.boot.manager.controller.ScheduleJobController', '/system/job/delete', '2020-04-12 19:28:22', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (101, 57, 'com.chanus.yuntao.boot.manager.controller.ScheduleJobController', '/system/job/update', '2020-04-12 19:28:22', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (102, 54, 'com.chanus.yuntao.boot.manager.controller.ScheduleTriggerController', '/system/job/trigger/main', '2020-04-14 10:16:21', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (103, 54, 'com.chanus.yuntao.boot.manager.controller.ScheduleTriggerController', '/system/job/trigger/list', '2020-04-14 10:16:32', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (104, 55, 'com.chanus.yuntao.boot.manager.controller.ScheduleTriggerController', '/system/job/trigger/add', '2020-04-14 10:29:34', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (105, 56, 'com.chanus.yuntao.boot.manager.controller.ScheduleTriggerController', '/system/job/trigger/delete', '2020-04-14 10:29:55', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (106, 57, 'com.chanus.yuntao.boot.manager.controller.ScheduleTriggerController', '/system/job/trigger/update', '2020-04-14 10:30:16', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (107, 57, 'com.chanus.yuntao.boot.manager.controller.ScheduleJobController', '/system/job/start', '2020-04-14 22:51:47', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (108, 57, 'com.chanus.yuntao.boot.manager.controller.ScheduleJobController', '/system/job/pause', '2020-04-15 12:42:03', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (109, 57, 'com.chanus.yuntao.boot.manager.controller.ScheduleJobController', '/system/job/resume', '2020-04-15 13:19:15', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (110, 57, 'com.chanus.yuntao.boot.manager.controller.ScheduleJobController', '/system/job/stop', '2020-04-15 13:19:28', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (111, 57, 'com.chanus.yuntao.boot.manager.controller.ScheduleJobController', '/system/job/trigger', '2020-04-15 17:16:33', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (112, 58, 'com.chanus.yuntao.boot.manager.controller.LogController', '/system/log/delete', '2020-05-05 09:32:15', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (113, 58, 'com.chanus.yuntao.boot.manager.controller.LogController', '/system/log/clear', '2020-05-05 09:33:29', '2020-08-24 14:50:39');
INSERT INTO `sys_module_power_method` VALUES (114, 11, 'com.chanus.yuntao.boot.manager.controller.ModuleController', '/system/module/transfer', '2020-05-05 10:41:48', '2020-08-24 14:50:39');
COMMIT;

-- ----------------------------
-- Table structure for sys_operator
-- ----------------------------
DROP TABLE IF EXISTS `sys_operator`;
CREATE TABLE `sys_operator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operator_no` varchar(30) NOT NULL DEFAULT '' COMMENT '操作员账号',
  `operator_name` varchar(30) NOT NULL DEFAULT '' COMMENT '操作员名称',
  `operator_password` char(64) NOT NULL COMMENT '操作员密码',
  `operator_role_code` varchar(50) NOT NULL COMMENT '操作员角色',
  `master_no` varchar(30) DEFAULT '' COMMENT '主账号',
  `master_role_code` varchar(50) DEFAULT '' COMMENT '主账号角色',
  `email` varchar(100) DEFAULT '' COMMENT '邮箱账号',
  `tel` varchar(50) DEFAULT '' COMMENT '电话号码',
  `head_image` varchar(50) DEFAULT '' COMMENT '头像图片路径',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `valid_status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0-停用，1-启用',
  `superior` varchar(255) NOT NULL COMMENT '所有上级角色代码',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_operator_no` (`operator_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='操作员表';

-- ----------------------------
-- Records of sys_operator
-- ----------------------------
BEGIN;
INSERT INTO `sys_operator` VALUES (1, 'yuntao', 'yuntao', '403b80d48cd2e99573da838690ff84ac498aa39822e6f0a3153a654820f04340', '0', '', '', '43DFC020D2623C98D3A4BCBABC21D227', 'B343446324CEB0B17B0365E220C85BE1', '', '', '1', '0', '2020-06-03 21:19:25', '2020-06-04 00:04:49');
INSERT INTO `sys_operator` VALUES (2, 'root', 'root', '6355e90f7ea94815a0adb39e722ca30ed2afc0806a170217570a3c883a65086e', '0', '', '', '43DFC020D2623C98D3A4BCBABC21D227', 'B343446324CEB0B17B0365E220C85BE1', '', '超级管理员', '1', '0', '2018-09-04 14:16:55', '2021-01-04 21:05:34');
INSERT INTO `sys_operator` VALUES (3, 'admin', 'admin', '2daceebc4e31654d326ae7889b397ed50ff7e5afff374d1f89525865fd87efe0', '10', '', '', '43DFC020D2623C98D3A4BCBABC21D227', 'B343446324CEB0B17B0365E220C85BE1', '', '系统管理员', '1', '0,10', '2018-09-09 12:11:47', '2020-08-11 16:28:00');
INSERT INTO `sys_operator` VALUES (4, 'system', 'system', 'a491ce8907a6e5ec70f24450793f886f3e20afd4cf70e9f6daa02e666d720fc5', '10', '', '', '43DFC020D2623C98D3A4BCBABC21D227', 'B343446324CEB0B17B0365E220C85BE1', '', '系统管理员', '1', '0,10', '2019-01-05 17:51:31', '2020-08-11 16:28:03');
COMMIT;

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `org_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '组织ID',
  `org_code` varchar(50) NOT NULL COMMENT '组织代码',
  `org_name` varchar(20) NOT NULL DEFAULT '' COMMENT '组织名称',
  `org_parent_id` int(10) unsigned NOT NULL COMMENT '上级组织ID',
  `org_short_name` varchar(50) DEFAULT '' COMMENT '组织简称',
  `org_long_name` varchar(100) DEFAULT '' COMMENT '组织全称',
  `org_location` varchar(100) DEFAULT '' COMMENT '组织地址',
  `org_phone` varchar(100) DEFAULT '' COMMENT '组织联系方式',
  `valid_status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0-停用，1-启用',
  `priority` int(10) unsigned NOT NULL COMMENT '优先级',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`org_id`) USING BTREE,
  UNIQUE KEY `uk_org_code` (`org_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='组织结构表';

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `param_code` varchar(50) NOT NULL COMMENT '参数代码',
  `param_data` varchar(100) NOT NULL COMMENT '参数值',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `valid_status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0-停用，1-启用',
  `modified_role_code` varchar(100) DEFAULT '' COMMENT '可以看到该参数的角色，多个角色用‘,’隔开，为空则所有角色都可以看到',
  `priority` int(10) unsigned NOT NULL COMMENT '优先级',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_param_code` (`param_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统基础参数表';

-- ----------------------------
-- Records of sys_param
-- ----------------------------
BEGIN;
INSERT INTO `sys_param` VALUES (1, 'sys_check_verify_code', '0', '登录时是否验证验证码：0-不验证，1-验证', '1', '0', 1, '2018-09-04 17:46:30', '2020-08-07 11:25:05');
INSERT INTO `sys_param` VALUES (2, 'sys_check_google_authenticator', '0', '登录时是否验证谷歌验证器：0-不验证，1-验证', '1', '0', 2, '2019-03-06 16:26:43', '2020-04-23 23:44:18');
INSERT INTO `sys_param` VALUES (3, 'sys_google_authenticator_secret', 'BUX5OUIKAG2UZWED', '登录时谷歌验证器密钥', '1', '0', 3, '2019-06-24 13:38:30', '2019-06-24 13:39:22');
INSERT INTO `sys_param` VALUES (4, 'sys_check_white_ip', '0', '登录时是否验证IP白名单：0-不验证，1-验证', '1', '0', 4, '2018-09-04 17:55:15', '2019-06-24 13:38:46');
INSERT INTO `sys_param` VALUES (5, 'sys_single_location_login', '0', '登录时是否验证单一位置登录：0-不验证，即同一账号可以同时在多处登录，1-验证，即同一账号只能同时在一处登录', '1', '0', 5, '2019-05-06 18:12:17', '2020-06-06 00:41:33');
COMMIT;

-- ----------------------------
-- Table structure for sys_power
-- ----------------------------
DROP TABLE IF EXISTS `sys_power`;
CREATE TABLE `sys_power` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `power_item` varchar(20) NOT NULL COMMENT '权限项代码',
  `power_name` varchar(20) NOT NULL COMMENT '权限项名称',
  `remark` varchar(100) DEFAULT '' COMMENT '备注',
  `priority` int(10) unsigned NOT NULL COMMENT '优先级',
  `valid_status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0-停用，1-启用',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_power_item` (`power_item`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统权限项表';

-- ----------------------------
-- Records of sys_power
-- ----------------------------
BEGIN;
INSERT INTO `sys_power` VALUES (1, 'ADD', '添加', '模块添加权限', 2, '1', '2018-09-04 15:18:18', '2018-09-08 15:53:03');
INSERT INTO `sys_power` VALUES (2, 'APPROVE', '审批', '审核批准权限', 8, '1', '2018-09-04 15:18:18', '2018-09-04 15:18:18');
INSERT INTO `sys_power` VALUES (3, 'CONFIG', '配置', '模块配置功能权限', 5, '1', '2018-09-04 15:18:18', '2018-09-04 15:18:18');
INSERT INTO `sys_power` VALUES (4, 'DELETE', '删除', '模块删除权限', 3, '1', '2018-09-04 15:18:18', '2018-09-04 15:18:18');
INSERT INTO `sys_power` VALUES (5, 'DOWNLOAD', '下载', '下载资源权限', 10, '1', '2018-09-04 15:18:18', '2020-02-19 13:32:34');
INSERT INTO `sys_power` VALUES (6, 'PASSWORD', '修改密码', '模块修改密码权限', 6, '1', '2018-09-04 15:18:18', '2018-09-04 15:18:18');
INSERT INTO `sys_power` VALUES (7, 'PRIORITY', '调整优先级', '调整优先级权限', 7, '1', '2018-09-04 15:18:18', '2018-09-04 15:18:18');
INSERT INTO `sys_power` VALUES (8, 'UPDATE', '编辑', '模块编辑权限', 4, '1', '2018-09-04 15:18:18', '2018-09-04 15:18:18');
INSERT INTO `sys_power` VALUES (9, 'UPLOAD', '上传', '上传资源权限', 9, '1', '2018-09-04 15:18:18', '2018-09-04 15:18:18');
INSERT INTO `sys_power` VALUES (10, 'VIEW', '浏览', '模块浏览权限', 1, '1', '2018-09-04 15:18:18', '2021-01-04 21:04:50');
INSERT INTO `sys_power` VALUES (11, 'DEPOSIT', '充值', '充值权限', 11, '1', '2020-05-04 15:15:00', '2021-01-04 21:56:21');
INSERT INTO `sys_power` VALUES (12, 'WITHDRAW', '提现', '提现权限', 12, '1', '2020-05-04 15:15:16', '2021-01-04 21:56:21');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `role_code` varchar(50) NOT NULL COMMENT '角色代码',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `parent_role_id` varchar(50) DEFAULT '' COMMENT '上级角色ID',
  `login_flag` char(1) NOT NULL DEFAULT '1' COMMENT '能否登录系统：0-不能登录，1-能登录',
  `has_operator` char(1) NOT NULL DEFAULT '1' COMMENT '是否可以创建操作员：0-不能，1-能',
  `valid_status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0-停用，1-启用',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `priority` int(10) unsigned NOT NULL COMMENT '优先级',
  `superior` varchar(255) NOT NULL COMMENT '所有上级角色代码',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_role_id` (`role_id`) USING BTREE,
  UNIQUE KEY `uk_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '0', '0', '超级管理员', '-1', '1', '1', '1', '具有所有权限', 1, '0', '2018-09-02 18:03:45', '2020-06-03 21:00:34');
INSERT INTO `sys_role` VALUES (2, '1', '1', '子账号', '-1', '1', '1', '1', '子账号', 99, '1', '2018-09-02 18:03:45', '2020-06-03 21:00:40');
INSERT INTO `sys_role` VALUES (3, '10', '10', '系统操作员', '0', '1', '1', '1', '', 1, '0,10', '2018-09-02 18:03:45', '2020-06-03 21:01:17');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_module_power
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_module_power`;
CREATE TABLE `sys_role_module_power` (
  `rmp_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_code` varchar(50) NOT NULL COMMENT '角色代码',
  `module_code` varchar(50) NOT NULL COMMENT '模块代码',
  `power_item` varchar(20) NOT NULL DEFAULT '' COMMENT '权限项',
  `sub_no` varchar(30) DEFAULT '' COMMENT '子账号',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`rmp_id`) USING BTREE,
  KEY `idx_module_code` (`module_code`) USING BTREE,
  KEY `idx_power_item` (`power_item`) USING BTREE,
  KEY `idx_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统角色权限表';

-- ----------------------------
-- Records of sys_role_module_power
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_schedule_job`;
CREATE TABLE `sys_schedule_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `job_name` varchar(120) NOT NULL COMMENT '任务名称',
  `job_group` varchar(180) NOT NULL COMMENT '任务组',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行类',
  `job_data` varchar(500) DEFAULT NULL COMMENT '属性配置，json格式',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `valid_status` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0-停止，1-启动，2-暂停',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_job_name` (`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='定时任务定义表';

-- ----------------------------
-- Records of sys_schedule_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_schedule_job` VALUES (1, 'TEST_JOB', 'TEST', 'com.chanus.yuntao.boot.manager.job.TestJob', '{\"a\":\"aaa\",\"b\":\"bbb\"}', '测试定时任务', '0', '2020-04-15 15:15:06', '2021-01-04 22:36:10');
COMMIT;

-- ----------------------------
-- Table structure for sys_schedule_trigger
-- ----------------------------
DROP TABLE IF EXISTS `sys_schedule_trigger`;
CREATE TABLE `sys_schedule_trigger` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `job_id` int(10) unsigned NOT NULL COMMENT '定时任务ID',
  `trigger_name` varchar(120) NOT NULL COMMENT '触发器名称',
  `trigger_group` varchar(180) NOT NULL COMMENT '触发器组',
  `trigger_cron` varchar(100) NOT NULL COMMENT 'Cron表达式',
  `trigger_start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `trigger_end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `trigger_data` varchar(500) DEFAULT NULL COMMENT '属性配置，json格式',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `valid_status` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0-停用，1-启用',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_trigger_name` (`trigger_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='定时任务触发器表表';

-- ----------------------------
-- Records of sys_schedule_trigger
-- ----------------------------
BEGIN;
INSERT INTO `sys_schedule_trigger` VALUES (1, 1, 'TEST_JOB_TRIGGER', 'TEST', '0/30 * * * * ?', NULL, NULL, '{\"key\":\"test_trigger\"}', 5, '测试触发器', '1', '2020-04-15 15:18:36', '2020-07-02 14:17:58');
COMMIT;

-- ----------------------------
-- Table structure for sys_white_ip
-- ----------------------------
DROP TABLE IF EXISTS `sys_white_ip`;
CREATE TABLE `sys_white_ip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增长字段',
  `white_ip` varchar(1000) NOT NULL COMMENT 'IP列表，多个以逗号分隔',
  `login_no` varchar(1000) DEFAULT '' COMMENT '登录账号列表，若为null则该组IP所有用户都可以登录',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `fixed_status` char(1) NOT NULL DEFAULT '0' COMMENT '是否固定IP：0-不固定，1-固定。若不固定IP，则其他组IP满足条件也可登录，若固定IP，则只能使用当前组IP登录',
  `valid_status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0-停用，1-启用',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统IP白名单';

-- ----------------------------
-- Records of sys_white_ip
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- View structure for view_login_user
-- ----------------------------
DROP VIEW IF EXISTS `view_login_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_login_user` AS select `sys_operator`.`operator_no` AS `login_no`,`sys_operator`.`operator_name` AS `login_name`,`sys_operator`.`operator_password` AS `password`,`sys_operator`.`operator_role_code` AS `role_code`,`sys_operator`.`master_no` AS `master_no`,`sys_operator`.`master_role_code` AS `master_role_code`,`sys_operator`.`valid_status` AS `valid_status`,`sys_operator`.`head_image` AS `head_image` from `sys_operator`;

-- ----------------------------
-- View structure for view_user
-- ----------------------------
DROP VIEW IF EXISTS `view_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_user` AS select `sys_operator`.`operator_no` AS `user_no` from `sys_operator`;

-- ----------------------------
-- Function structure for get_parent_roles
-- ----------------------------
DROP FUNCTION IF EXISTS `get_parent_roles`;
delimiter ;;
CREATE FUNCTION `get_parent_roles`(roleId varchar(50))
 RETURNS varchar(1000) CHARSET utf8mb4
BEGIN
  DECLARE parentRoleId varchar(50) DEFAULT '';
  DECLARE parentRoles varchar(1000) DEFAULT ',';

  WHILE (roleId IS NOT NULL AND roleId != '') DO
    SELECT parent_role_id INTO parentRoleId FROM sys_role WHERE role_id = roleId;
    IF (parentRoleId IS NOT NULL AND parentRoleId != '' AND parentRoleId != '-1') THEN
      SET parentRoles = CONCAT(parentRoles, parentRoleId, ',');
      SET roleId = parentRoleId;
    ELSE
      SET roleId = NULL;
    END IF;
  END WHILE;
  RETURN parentRoles;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for get_parent_roles_with_self
-- ----------------------------
DROP FUNCTION IF EXISTS `get_parent_roles_with_self`;
delimiter ;;
CREATE FUNCTION `get_parent_roles_with_self`(roleCode varchar(50))
 RETURNS varchar(1000) CHARSET utf8mb4
BEGIN
  DECLARE parentRoleCode varchar(50) DEFAULT '';
  DECLARE parentRoles varchar(1000) DEFAULT CONCAT(',', roleCode, ',');

  WHILE (roleCode IS NOT NULL AND roleCode != '') DO
    SELECT parent_role.role_code INTO parentRoleCode FROM sys_role role, sys_role parent_role WHERE role.parent_role_id = parent_role.role_id and role.role_code = roleCode;
    IF (parentRoleCode IS NULL OR parentRoleCode = '') THEN
			SET roleCode = NULL;
    ELSE
      SET parentRoles = CONCAT(parentRoles, parentRoleCode, ',');
      SET roleCode = parentRoleCode;
    END IF;
  END WHILE;
  RETURN parentRoles;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for has_child_role
-- ----------------------------
DROP FUNCTION IF EXISTS `has_child_role`;
delimiter ;;
CREATE FUNCTION `has_child_role`(pRoleId varchar(50))
 RETURNS char(1) CHARSET utf8mb4
BEGIN
  DECLARE childCount int(10) DEFAULT 0;
	
	SELECT COUNT(*) INTO childCount FROM sys_role WHERE parent_role_id = pRoleId;
	
	IF childCount > 0 THEN
		RETURN '1';
	ELSE
		RETURN '0';
	END IF;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

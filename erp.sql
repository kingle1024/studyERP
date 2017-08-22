-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.30 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- erp 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `erp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `erp`;

-- 테이블 erp.approvals 구조 내보내기
CREATE TABLE IF NOT EXISTS `approvals` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `etc` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `send_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `recv_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `type_code` varchar(50) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.approvals:~5 rows (대략적) 내보내기
DELETE FROM `approvals`;
/*!40000 ALTER TABLE `approvals` DISABLE KEYS */;
INSERT INTO `approvals` (`no`, `title`, `content`, `etc`, `state`, `send_id`, `recv_id`, `type_code`, `register_date`) VALUES
	(124, '18419 실습실 상하리프트 고장 났습니다.', '학생들이 불편을 겪고 있습니다\r\n이번 주 까지는 처리 부탁 드립니다!', '40번도 고장이 날 것 같습니다. 예비로 한 개 더 신청 부탁 드려요!', 2, 'kingle', 'admin', '1100', '2017-08-19 20:38:46'),
	(125, '관리자 승인 문서', '관리자 승인 문서', '', 1, 'kingle', 'admin', '1100', '2017-08-19 21:14:16'),
	(126, '받은문서 대기', '가', '가', 0, 'admin', 'teran1024@naver.com', '1100', '2017-08-19 21:43:42'),
	(127, '문서 신청', '문서 신청', '문서 신청', 0, 'admin', 'teran1024@naver.com', '1100', '2017-08-20 15:37:35'),
	(128, '문서 신청문서 신청', '문서 신청문서 신청', '문서 신청문서 신청', 0, 'teran1024@naver.com', 'teran1024@naver.com', '1000', '2017-08-20 15:39:57');
/*!40000 ALTER TABLE `approvals` ENABLE KEYS */;

-- 테이블 erp.approvals_sub 구조 내보내기
CREATE TABLE IF NOT EXISTS `approvals_sub` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `doc` int(11) NOT NULL,
  `step` int(11) DEFAULT NULL,
  `lastStep` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `send_id` varchar(50) DEFAULT NULL,
  `type_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `FK_approvals_sub_approvals` (`doc`),
  CONSTRAINT `FK_approvals_sub_approvals` FOREIGN KEY (`doc`) REFERENCES `approvals` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.approvals_sub:~4 rows (대략적) 내보내기
DELETE FROM `approvals_sub`;
/*!40000 ALTER TABLE `approvals_sub` DISABLE KEYS */;
INSERT INTO `approvals_sub` (`no`, `doc`, `step`, `lastStep`, `state`, `update_date`, `send_id`, `type_code`) VALUES
	(36, 124, 1, 2, 1, '2017-08-19 20:45:21', 'teran1024@naver.com', '1100'),
	(37, 124, 2, 2, 2, '2017-08-19 21:00:44', 'admin', '1100'),
	(38, 125, 1, 2, 1, '2017-08-19 21:14:29', 'teran1024@naver.com', '1100'),
	(39, 125, 2, 2, 1, '2017-08-19 21:14:40', 'admin', '1100');
/*!40000 ALTER TABLE `approvals_sub` ENABLE KEYS */;

-- 테이블 erp.approvals_system 구조 내보내기
CREATE TABLE IF NOT EXISTS `approvals_system` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `step` int(11) DEFAULT NULL,
  `lastStep` int(11) DEFAULT NULL,
  `recv_id` varchar(50) DEFAULT NULL,
  `type_code` varchar(50) DEFAULT NULL,
  `manager` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.approvals_system:~6 rows (대략적) 내보내기
DELETE FROM `approvals_system`;
/*!40000 ALTER TABLE `approvals_system` DISABLE KEYS */;
INSERT INTO `approvals_system` (`no`, `step`, `lastStep`, `recv_id`, `type_code`, `manager`) VALUES
	(1, 1, 2, 'teran1024@naver.com', '1100', '근장장'),
	(2, 2, 2, 'admin', '1100', '관리자'),
	(3, 1, 1, 'teran1024@naver.com', '1000', '근장장'),
	(4, 1, 3, 'teran1024@naver.com', '1200', '근장장'),
	(5, 2, 3, 'kingle', '1200', '근장장2'),
	(6, 3, 3, 'admin', '1200', '관리자');
/*!40000 ALTER TABLE `approvals_system` ENABLE KEYS */;

-- 테이블 erp.authorities 구조 내보내기
CREATE TABLE IF NOT EXISTS `authorities` (
  `email` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  KEY `FK_authorities_users` (`email`),
  CONSTRAINT `FK_authorities_users` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 erp.authorities:~8 rows (대략적) 내보내기
DELETE FROM `authorities`;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` (`email`, `authority`) VALUES
	('admin', 'ROLE_ADMIN'),
	('teran1024@naver.com', 'ROLE_USER'),
	('admin', 'ROLE_USER'),
	('kingle@naver.com', 'ROLE_USER'),
	('dlwodn907@gmail.com', 'ROLE_USER'),
	('tmzkdlgo@daum.net', 'ROLE_USER'),
	('test1@naver.com', 'ROLE_USER'),
	('kingle', 'ROLE_USER');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;

-- 테이블 erp.boards 구조 내보내기
CREATE TABLE IF NOT EXISTS `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(200) NOT NULL,
  `author` varchar(50) NOT NULL,
  `hit` int(11) NOT NULL,
  `register_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `delete_yn` tinyint(4) DEFAULT NULL,
  `type_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- 테이블 데이터 erp.boards:~35 rows (대략적) 내보내기
DELETE FROM `boards`;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
INSERT INTO `boards` (`id`, `title`, `content`, `author`, `hit`, `register_date`, `update_date`, `delete_yn`, `type_code`) VALUES
	(1, '2017학년도 실습실 근로장학생 명단입니다.', '정보통신학부 201255093 엄지용\r\n정보통신학부 201255043 이대근\r\n정보통신학부 201255062 이재우\r\n한 학기동안 잘해봐요^^\r\n\r\n근무일지 같이 첨부합니다.', '관리자', 138, '2017-03-05 09:37:39', '2017-08-19 20:24:31', 0, '1001'),
	(2, '학과별 실험 및 실습실 안전관리 자료', '자세한 사항은 첨부 파일을 확인해 주시기 바랍니다.', '관리자', 12, '2017-04-10 10:38:00', '2017-04-04 22:14:29', 0, '1001'),
	(3, '2017학년도 실습실 주요 일정', '5월 24일 - 전체 실습실 하드디스크 점검 5월 25일 - 리프트 점검', '관리자', 16, '2017-04-12 10:48:41', '2017-04-07 22:14:27', 0, '1001'),
	(4, '5월 실습실 주요 점검 항목 리스트입니다.', '1. 본체 고유번호 확인해주세요.\r\n\r\n2. SSD로 교체 안된 컴퓨터 확인해주세요.\r\n\r\n3. 수업시간에 사용하는 SW 제대로 설치되었는지 확인해 주세요.\r\n\r\n4. 컴퓨터가 모두 종료되어 있는지 확인해 주세요.', '관리자', 80, '2017-05-01 11:01:52', '2017-05-03 01:25:34', 0, '1001'),
	(5, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(6, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(7, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(8, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 96, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(9, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 96, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(10, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(11, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(12, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(13, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(14, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 95, '2017-05-09 09:33:38', '2017-07-17 13:30:51', 0, '1001'),
	(15, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(16, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 95, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(17, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 96, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(18, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(19, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 95, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(20, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(21, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 96, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(22, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 97, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(23, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 95, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(24, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 96, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(25, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 97, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(26, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 96, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(27, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(28, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 95, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(29, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(30, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 96, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(31, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~', '관리자', 211, '2017-05-09 09:33:38', '2017-07-25 21:34:50', 0, '1001'),
	(33, 'erp.war', 'erp.war', '관리자', 2, '2017-07-27 10:41:05', '2017-07-27 10:41:05', NULL, '1001'),
	(34, 'erp.war', 'erp.war', '관리자', 3, '2017-07-27 10:41:22', '2017-07-27 10:41:22', NULL, '1001'),
	(35, 'erp.warerp.war', 'erp.warerp.war', '관리자', 8, '2017-07-27 10:41:36', '2017-07-27 10:41:36', NULL, '1001'),
	(38, '파일 여러개 업로드', '파일 여러개 업로드', '관리자', 13, '2017-08-17 11:42:59', '2017-08-17 11:42:59', NULL, '1001');
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;

-- 테이블 erp.board_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_comment` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `board_no` int(11) NOT NULL,
  `author` varchar(50) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `register_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `type_code` varchar(50) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `FK_board_comment_common_code` (`type_code`),
  KEY `FK_board_comment_boards` (`board_no`),
  CONSTRAINT `FK_board_comment_boards` FOREIGN KEY (`board_no`) REFERENCES `boards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_board_comment_common_code` FOREIGN KEY (`type_code`) REFERENCES `common_code` (`type_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 테이블 데이터 erp.board_comment:~7 rows (대략적) 내보내기
DELETE FROM `board_comment`;
/*!40000 ALTER TABLE `board_comment` DISABLE KEYS */;
INSERT INTO `board_comment` (`no`, `board_no`, `author`, `comment`, `register_date`, `update_date`, `type_code`) VALUES
	(1, 1, '이재우', '알겠습니다!', '2017-05-08 09:57:11', '2017-05-08 09:57:14', '1001'),
	(2, 1, '엄지용', '확인했습니다!', '2017-05-08 09:58:21', '2017-05-08 09:58:22', '1001'),
	(3, 1, '이대근', '잘부탁드립니다^^', '2017-08-19 20:20:37', '2017-08-19 20:20:38', '1001'),
	(5, 5, '이대근', '12', '2017-06-03 20:26:32', NULL, '1001'),
	(6, 5, 'admin@naver.com', 'zz', '2017-06-03 20:41:17', NULL, '1001'),
	(7, 4, 'admin@naver.com', '오키', '2017-06-03 20:59:42', NULL, '1001'),
	(8, 38, 'teran1024@naver.com', 'dsf', '2017-08-20 21:08:07', NULL, '1001');
/*!40000 ALTER TABLE `board_comment` ENABLE KEYS */;

-- 테이블 erp.breakdown_document 구조 내보내기
CREATE TABLE IF NOT EXISTS `breakdown_document` (
  `no` int(11) NOT NULL,
  `distinguish` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `item` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `room_num` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`no`),
  CONSTRAINT `FK_breakdown_document_approvals` FOREIGN KEY (`no`) REFERENCES `approvals` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.breakdown_document:~4 rows (대략적) 내보내기
DELETE FROM `breakdown_document`;
/*!40000 ALTER TABLE `breakdown_document` DISABLE KEYS */;
INSERT INTO `breakdown_document` (`no`, `distinguish`, `item`, `room_num`) VALUES
	(124, '기자재', '상하 리프트', '18419'),
	(125, '기자재', '모니터', '18419'),
	(126, '기자재', '모니터', '18312'),
	(127, '기자재', '모니터', '18419');
/*!40000 ALTER TABLE `breakdown_document` ENABLE KEYS */;

-- 테이블 erp.common_code 구조 내보내기
CREATE TABLE IF NOT EXISTS `common_code` (
  `group_code` int(11) NOT NULL,
  `type_code` varchar(50) NOT NULL,
  `name_code` varchar(50) NOT NULL,
  PRIMARY KEY (`type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 erp.common_code:~10 rows (대략적) 내보내기
DELETE FROM `common_code`;
/*!40000 ALTER TABLE `common_code` DISABLE KEYS */;
INSERT INTO `common_code` (`group_code`, `type_code`, `name_code`) VALUES
	(1000, '1001', '공지 게시판'),
	(1000, '1002', '건의 게시판'),
	(1100, '1101', '소모품 신청 문서'),
	(1100, '1102', '고장 신청 문서'),
	(1100, '1103', '비정형 문서'),
	(1200, '1201', '근장장 승인'),
	(1200, '1202', '근장장 반려'),
	(1200, '1203', '관리자 승인'),
	(1200, '1204', '관리자 반려'),
	(1300, '1301', '고장 신청 문서');
/*!40000 ALTER TABLE `common_code` ENABLE KEYS */;

-- 테이블 erp.common_group 구조 내보내기
CREATE TABLE IF NOT EXISTS `common_group` (
  `group_code` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 erp.common_group:~5 rows (대략적) 내보내기
DELETE FROM `common_group`;
/*!40000 ALTER TABLE `common_group` DISABLE KEYS */;
INSERT INTO `common_group` (`group_code`, `name`) VALUES
	(1000, '게시판 구분'),
	(1100, '결재 문서 구분'),
	(1200, '결재 단계'),
	(1300, '결재 타입'),
	(1400, '고장현황 상태');
/*!40000 ALTER TABLE `common_group` ENABLE KEYS */;

-- 테이블 erp.consumables_document 구조 내보내기
CREATE TABLE IF NOT EXISTS `consumables_document` (
  `no` int(11) NOT NULL,
  `num` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.consumables_document:~0 rows (대략적) 내보내기
DELETE FROM `consumables_document`;
/*!40000 ALTER TABLE `consumables_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumables_document` ENABLE KEYS */;

-- 테이블 erp.files 구조 내보내기
CREATE TABLE IF NOT EXISTS `files` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `board_no` int(11) NOT NULL DEFAULT '0',
  `save_name` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `real_name` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `path` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.files:~52 rows (대략적) 내보내기
DELETE FROM `files`;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` (`no`, `board_no`, `save_name`, `real_name`, `path`) VALUES
	(8, 0, '0', '0', 'c:/spring/upload/'),
	(9, 0, '20170626045700', '0', 'c:/spring/upload/'),
	(10, 0, '20170626045851', '0', 'c:/spring/upload/'),
	(11, 0, '20170626045920', '0', 'c:/spring/upload/'),
	(66, 42, '20170627055930', '20170622091243', 'c:/spring/upload/'),
	(67, 43, '20170627062411.jpg', '2014-1-정통-전자회로이론및실습-기말시험지,모범답안(1).jpg', 'c:/spring/upload/'),
	(68, 43, '201706270624111.jpg', '2014-1-정통-전자회로이론및실습-기말시험지,모범답안(2).jpg', 'c:/spring/upload/'),
	(69, 44, '20170627062517.jpg', '2014-1-정통-전자회로이론및실습-기말시험지,모범답안(1).jpg', 'c:/spring/upload/'),
	(70, 44, '201706270625171.jpg', '2014-1-정통-전자회로이론및실습-기말시험지,모범답안(2).jpg', 'c:/spring/upload/'),
	(71, 45, '20170627062640.PNG', 'picture.PNG', 'c:/spring/upload/'),
	(72, 46, '20170627063040.jpg', '2014-1-정통-전자회로이론및실습-기말시험지,모범답안(1).jpg', 'c:/spring/upload/'),
	(73, 46, '201706270630401.jpg', '20122-122-정통-객체지향프로그래밍(A)-기말모범답안-2.jpg', 'c:/spring/upload/'),
	(74, 6, '20170628123329.jpg', '2014-1-정통-전자회로이론및실습-기말시험지,모범답안(1).jpg', 'c:/spring/upload/'),
	(75, 6, '201706281233291.jpg', '2014-1-정통-전자회로이론및실습-기말시험지,모범답안(2).jpg', 'c:/spring/upload/'),
	(76, 7, '20170628123522.jpg', '2014-1-정통-전자회로이론및실습-기말시험지,모범답안(1).jpg', 'c:/spring/upload/'),
	(77, 7, '201706281235221.jpg', '2014-1-정통-전자회로이론및실습-기말시험지,모범답안(2).jpg', 'c:/spring/upload/'),
	(78, 8, '20170628123658.jpg', '2014-1-정통-전자회로이론및실습-기말시험지,모범답안(1).jpg', 'c:/spring/upload/'),
	(79, 8, '201706281236581.jpg', '2014-1-정통-전자회로이론및실습-기말시험지,모범답안(2).jpg', 'c:/spring/upload/'),
	(81, 33, '20170715010124.PNG', '11.PNG', 'c:/spring/upload/'),
	(82, 34, '20170715010444.PNG', '11.PNG', '/root/upload/'),
	(93, 41, '20170715014935.PNG', '11.PNG', '/root/upload/'),
	(94, 41, '201707150149351.PNG', '2.PNG', '/root/upload/'),
	(97, 42, '20170715015111.PNG', '11.PNG', '/root/upload/'),
	(98, 42, '201707150151111.PNG', '2.PNG', '/root/upload/'),
	(99, 42, '201707150151112.PNG', '33.PNG', '/root/upload/'),
	(101, 43, '20170715015256.PNG', '11.PNG', '/root/upload/'),
	(102, 44, '20170715015401.PNG', '33.PNG', '/root/upload/'),
	(103, 45, '20170715015549.PNG', '11.PNG', '/root/upload/'),
	(104, 46, '20170715020548.PNG', '2.PNG', 'C:\\Spring\\upload'),
	(105, 47, '201707150206021.PNG', '33.PNG', 'C:\\Spring\\upload'),
	(110, 52, '20170715023934.PNG', '11.PNG', 'C:\\Spring\\upload\\'),
	(120, 61, '201707150317422.PNG', '44.PNG', 'C:\\Spring\\upload\\'),
	(122, 61, '201707150317424.PNG', '2.PNG', 'C:\\Spring\\upload\\'),
	(124, 62, '20170715040244.PNG', '44.PNG', 'C:\\Spring\\upload\\'),
	(126, 63, '201707150422561.PNG', '33.PNG', 'C:\\Spring\\upload\\'),
	(133, 64, '201707150825134.PNG', '11 (1).PNG', 'C:\\Spring\\upload\\'),
	(137, 65, '201707150857273.PNG', '11.PNG', 'C:\\Spring\\upload\\'),
	(144, 31, '201707150937142.PNG', '2.PNG', 'C:\\Spring\\upload\\'),
	(146, 31, '20170717013832.PNG', '11.PNG', '/upload/'),
	(150, 75, '20170720014815.zip', 'excelTest (1).zip', '/upload/'),
	(153, 76, '20170720085554.war', 'erp.war', '/upload/'),
	(154, 33, '20170727104105.war', 'erp.war', '/upload/'),
	(155, 34, '201707271041221.war', 'erp.war', '/upload/'),
	(156, 35, '201707271041362.war', 'erp.war', '/upload/'),
	(157, 36, '20170817113958.PNG', '1.PNG', '/upload/'),
	(158, 36, '201708171139581.PNG', '2.PNG', '/upload/'),
	(159, 36, '201708171139582.PNG', '1.PNG', '/upload/'),
	(160, 37, '20170817114104.PNG', '1.PNG', '/upload/'),
	(161, 37, '201708171141041.PNG', '2.PNG', '/upload/'),
	(162, 38, '20170817114259.PNG', '1.PNG', '/upload/'),
	(163, 38, '201708171142591.PNG', '2.PNG', '/upload/'),
	(164, 1, '20170819082431.xlsx', '2017_행정(일반)근로_표준근무일지.xlsx', '/upload/');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;

-- 테이블 erp.free_document 구조 내보내기
CREATE TABLE IF NOT EXISTS `free_document` (
  `no` int(11) unsigned zerofill NOT NULL,
  `content` varchar(50) DEFAULT NULL,
  `etc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.free_document:~0 rows (대략적) 내보내기
DELETE FROM `free_document`;
/*!40000 ALTER TABLE `free_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `free_document` ENABLE KEYS */;

-- 테이블 erp.messages 구조 내보내기
CREATE TABLE IF NOT EXISTS `messages` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `recv_id` varchar(50) NOT NULL,
  `send_id` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(200) NOT NULL,
  `send_date` datetime NOT NULL,
  `recv_date` datetime DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- 테이블 데이터 erp.messages:~15 rows (대략적) 내보내기
DELETE FROM `messages`;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`no`, `recv_id`, `send_id`, `title`, `content`, `send_date`, `recv_date`) VALUES
	(1, 'teran1024@naver.com', 'admin', '근로장학생 선발을 축하드립니다!!', '향후 계획은 첨부 파일을 확인해 주세요.', '2017-07-05 16:17:13', '2017-05-08 21:41:51'),
	(2, 'teran1024@naver.com', 'tmzkdlgo@daum.net', '반가워요! 기존 근로장학생이에요~', '제 번호는 010-1111-2222에요 문자 하나만 부탁해요ㅋ', '2017-07-07 10:12:28', '2017-05-06 22:21:03'),
	(3, 'teran1024@naver.com', 'dlwodn907@gmail.com', 'ㅋㅋㅋㅋ 나도 합격했다~', '앞으로 잘해보자!!!', '2017-07-09 13:33:29', NULL),
	(4, 'teran1024@naver.com', 'admin', '학생~ 쪽지 보면 행정실로 와줘요', '의논해야 할 사항이 있습니다;;', '2017-07-15 11:47:35', '2017-06-24 20:35:48'),
	(5, 'teran1024@naver.com', 'dlwodn907@gmail.com', '18312강의실 점검 내용 남길께.', '청소 했고, 컴퓨터 모두 종료 돼있는지 확인했어', '2017-07-03 19:21:01', '2017-05-09 12:33:24'),
	(6, 'teran1024@naver.com', 'kingle@naver.com', '형!! 내용 확인해주세요', '다음주에 실습실 전체점검 해야 된대요. 앞으로 확인해야 할 일들', '2017-07-12 15:07:33', '2017-06-24 20:35:46'),
	(7, 'admin', 'teran1024@naver.com', '네!!!! 열심이 하겠습니다!', '많이 지켜봐 주세요~~', '2017-07-06 15:28:23', '2017-03-06 15:45:25'),
	(8, 'dlwodn907@gmail.com', 'teran1024@naver.com', '형 모임때 회의록 가져와요~', '선생님이 가져오래요!!', '2017-07-06 22:12:38', '2017-04-12 22:27:22'),
	(9, 'teran1024@naver.com', 'teran1024@naver.com', '오늘 점검하고 가야 할 것들!!', '1. 컴퓨터 정상 부팅 내용 2. 파손 여부 3. 리프트 작동 여부', '2017-07-25 18:24:36', '2017-05-09 12:35:41'),
	(10, 'admin', 'teran1024@naver.com', '요청하신 사항 처리 완료하였습니다.', '더 시키실 일 있으면 연락 주세요~', '2017-08-06 12:12:33', '2017-05-06 22:31:18'),
	(14, 'kingle@naver.com', 'teran1024@naver.com', '18312 점검하고 쪽지남겨주세요', '꼭 남겨주세요. 시간 확인해야 해요', '2017-08-09 01:38:04', '2017-05-26 17:49:03'),
	(18, 'admin', 'admin', '이번주에 하는 회식 이요..', '갑작스럽게 집 안에 일이 생겨서 못 가게 될 것 같습니다....', '2017-08-19 20:32:10', '2017-08-20 09:59:18'),
	(19, 'admin', 'admin', '하계방학 스터디 안녕하신가요', '하계방학 스터디 안녕하신가요\r\n하계방학 스터디 안녕하신가요\r\n하계방학 스터디 안녕하신가요', '2017-08-20 20:25:53', '2017-08-20 20:33:07'),
	(20, 'admin', 'kingle', '하계방학 스터디 안녕하세요', '하계방학 스터디 안녕하세요\r\n하계방학 스터디 안녕하세요\r\n하계방학 스터디 안녕하세요', '2017-08-20 21:22:08', '2017-08-20 21:22:11'),
	(21, 'admin', 'kingle', '하계스터디 안녕하세요', '하계스터디 안녕하세요', '2017-08-20 21:24:40', '2017-08-20 22:11:57');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- 테이블 erp.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `socialNumFront` varchar(10) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 테이블 데이터 erp.users:~7 rows (대략적) 내보내기
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `name`, `password`, `socialNumFront`, `enabled`) VALUES
	(1, 'dlwodn907@gmail.com', '이재우', '$2a$10$.ohfiNj9Hh44W3h7D0JPk.vMy6ssCW6LQThBUA.nu6LQhTavTdKLW', '', 1),
	(2, 'teran1024@naver.com', '엄지용', '$2a$10$tIbjyBa2Ipc8.g3vS6uPYesU/Rzas.J2toGdKYqbQxF2JWe1aypiO', '', 1),
	(3, 'admin', '관리자', '$2a$10$C309v2FBo3lbPUCzt5bdrewQ6qPOpnhgEyhhrqLNLsFoFA7xQXgeO', '', 1),
	(4, 'tmzkdlgo@daum.net', '이대근', '$2a$11$/.ej4SKI/VaogwQJzMLJBenzrVbDN9O8WHyuhHgJ89qJEftaz2PPi', '', 1),
	(5, 'kingle@naver.com', '김연아', '$2a$11$iLYWb0GPXzcrGqaDtBuYeu9A45alChqBrX4Z.QHUH1rwA0Tu6X6Z.', '', 1),
	(8, 'test1@naver.com', '엄지용', '$2a$11$r0J6/zSh0yq9ow9opcIpu.9xT8nS0zMA4hfCfhEQI7CL3xSegoIoO', '931024', 1),
	(9, 'kingle', '엄지용', '$2a$11$YxicLtTj/iYxcjbBu1XHHOMoIRBQuleCOZf6lXFk2gIgvIzvYStqe', '931024', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- 테이블 erp.workexcel 구조 내보내기
CREATE TABLE IF NOT EXISTS `workexcel` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `workDate` date DEFAULT NULL,
  `week` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `endSubStart` time DEFAULT NULL,
  `content` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.workexcel:~21 rows (대략적) 내보내기
DELETE FROM `workexcel`;
/*!40000 ALTER TABLE `workexcel` DISABLE KEYS */;
INSERT INTO `workexcel` (`no`, `workDate`, `week`, `startTime`, `endTime`, `endSubStart`, `content`) VALUES
	(58, '2017-01-02', '금', '13:00:00', '18:00:00', '05:00:00', '네트워크 점검'),
	(59, '2017-01-02', '토', '16:00:00', '18:00:00', '02:00:00', '월간 점검'),
	(60, '2017-01-04', '일', '16:00:00', '18:00:00', '02:00:00', '아무거나 점검'),
	(61, '2017-01-02', '금', '13:00:00', '18:00:00', '05:00:00', '네트워크 점검'),
	(62, '2017-01-02', '토', '16:00:00', '18:00:00', '02:00:00', '월간 점검'),
	(63, '2017-01-04', '일', '16:00:00', '18:00:00', '02:00:00', '아무거나 점검'),
	(64, '2017-01-02', '금', '13:00:00', '18:00:00', '05:00:00', '네트워크 점검'),
	(65, '2017-01-02', '토', '16:00:00', '18:00:00', '02:00:00', '월간 점검'),
	(66, '2017-01-04', '일', '16:00:00', '18:00:00', '02:00:00', '아무거나 점검'),
	(67, '2017-01-02', '금', '13:00:00', '18:00:00', '05:00:00', '네트워크 점검'),
	(68, '2017-01-02', '토', '16:00:00', '18:00:00', '02:00:00', '월간 점검'),
	(69, '2017-01-04', '일', '16:00:00', '18:00:00', '02:00:00', '아무거나 점검'),
	(70, '2017-01-02', '금', '13:00:00', '13:09:00', '00:09:00', '네트워크 점검'),
	(71, '2017-01-02', '토', '16:00:00', '17:30:00', '01:30:00', '월간 점검'),
	(72, '2017-01-04', '일', '16:00:00', '17:45:00', '01:45:00', '아무거나 점검'),
	(73, '2017-01-02', '금', '13:00:00', '13:09:00', '00:09:00', '네트워크 점검'),
	(74, '2017-01-02', '토', '16:00:00', '17:30:00', '01:30:00', '월간 점검'),
	(75, '2017-01-04', '일', '16:00:00', '17:45:00', '01:45:00', '아무거나 점검'),
	(76, '2017-01-02', '금', '13:00:00', '13:09:00', '00:09:00', '네트워크 점검'),
	(77, '2017-01-02', '토', '16:00:00', '17:30:00', '01:30:00', '월간 점검'),
	(78, '2017-01-04', '일', '16:00:00', '17:45:00', '01:45:00', '아무거나 점검');
/*!40000 ALTER TABLE `workexcel` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

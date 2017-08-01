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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.approvals:~16 rows (대략적) 내보내기
/*!40000 ALTER TABLE `approvals` DISABLE KEYS */;
INSERT INTO `approvals` (`no`, `title`, `content`, `etc`, `state`, `send_id`, `recv_id`, `type_code`, `register_date`) VALUES
	(1, '관리자의 대기 근장장의 진행', 'content1', 'etc1', 0, 'admin', 'admin', '1100', '2017-07-29 14:54:03'),
	(2, '근장장의 반려', 'content2', 'etc2', 2, 'admin', 'admin', '1100', '2017-07-29 14:54:43'),
	(3, '근장장 승인, 관리자 승인', 'content3', 'etc3', 1, 'admin', 'admin', '1100', '2017-07-29 14:56:16'),
	(4, '근장장 승인, 관리자 반려', 'content4', 'etc4', 2, 'admin', 'admin', '1100', '2017-07-29 15:55:44'),
	(5, '근장장 대기', 'content5', 'etc5', 0, 'admin', 'admin', '1000', '2017-07-29 15:55:45'),
	(6, '근장장 승인 끝', 'content6', 'etc6', 1, 'admin', 'admin', '1000', '2017-07-29 16:46:54'),
	(16, '근장장이 받습니다', '근장장이 받습니다', '근장장이 받습니다', 0, 'admin', 'admin', NULL, '2017-07-30 17:33:00'),
	(23, '근장장 후 관리자1', '근장장 후 관리자1', '근장장 후 관리자1', 0, 'admin', 'admin', '1100', '2017-07-31 21:40:34'),
	(26, '근장장이 결정', '근장장이 결정', '근장장이 결정', 0, 'teran1024@naver.com', 'teran1024@naver.com', '1000', '2017-07-31 22:18:32'),
	(27, '근장장 후에 관리자_1', '근장장 후에 관리자_1', '근장장 후에 관리자_1', 0, 'teran1024@naver.com', 'admin', '1100', '2017-07-31 22:18:46'),
	(28, '111111', '111', '111', 0, 'teran1024@naver.com', 'teran1024@naver.com', '1000', '2017-07-31 22:21:39'),
	(29, '222', '222', '222', 1, 'teran1024@naver.com', 'admin', '1100', '2017-07-31 22:21:50'),
	(30, '반려할것임111', '반려할것임111', '반려할것임111', 2, 'teran1024@naver.com', 'teran1024@naver.com', '1000', '2017-07-31 22:29:27'),
	(31, '22', '222', '22', 2, 'teran1024@naver.com', 'teran1024@naver.com', '1100', '2017-07-31 22:30:44'),
	(32, '반려2', '2', '2', 2, 'teran1024@naver.com', 'teran1024@naver.com', '1100', '2017-07-31 22:31:07'),
	(33, '반려22', '반려22', '22', 2, 'teran1024@naver.com', 'admin', '1100', '2017-07-31 22:31:29');
/*!40000 ALTER TABLE `approvals` ENABLE KEYS */;

-- 테이블 erp.approvals_sub 구조 내보내기
CREATE TABLE IF NOT EXISTS `approvals_sub` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `doc` int(11) DEFAULT NULL,
  `ing` int(11) DEFAULT NULL,
  `last` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `send_id` varchar(50) DEFAULT NULL,
  `type_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.approvals_sub:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `approvals_sub` DISABLE KEYS */;
INSERT INTO `approvals_sub` (`no`, `doc`, `ing`, `last`, `state`, `update_date`, `send_id`, `type_code`) VALUES
	(1, 1, 1, 2, 1, '2017-07-29 14:57:05', 'teran1024@naver.com', '1100'),
	(2, 2, 1, 2, 2, '2017-07-29 14:57:30', 'teran1024@naver.com', '1100'),
	(3, 3, 1, 2, 1, '2017-07-29 15:06:55', 'teran1024@naver.com', '1100'),
	(4, 3, 2, 2, 1, '2017-07-29 15:07:07', 'admin', '1100'),
	(5, 4, 1, 2, 1, '2017-07-29 15:07:57', 'teran1024@naver.com', '1100'),
	(6, 4, 2, 2, 2, '2017-07-29 15:08:10', 'admin', '1100'),
	(7, 5, 1, 1, 1, '2017-07-29 16:47:12', 'teran1024@naver.com', '1000'),
	(8, 25, 1, 1, 1, '2017-07-31 22:06:20', 'teran1024@naver.com', '1000'),
	(9, 23, 1, 2, 1, '2017-07-31 22:14:43', 'teran1024@naver.com', '1100'),
	(10, 23, 1, 2, 1, '2017-07-31 22:17:34', 'teran1024@naver.com', '1100'),
	(11, 27, 1, 2, 1, '2017-07-31 22:18:52', 'teran1024@naver.com', '1100'),
	(12, 29, 1, 2, 1, '2017-07-31 22:21:56', 'teran1024@naver.com', '1100'),
	(13, 29, 1, 2, 1, '2017-07-31 22:22:46', 'teran1024@naver.com', '1100'),
	(14, 29, 1, 2, 1, '2017-07-31 22:23:19', 'teran1024@naver.com', '1100'),
	(15, 29, 2, 2, 1, '2017-07-31 22:23:48', 'admin', '1100'),
	(16, 30, 1, 1, 2, '2017-07-31 22:30:34', 'teran1024@naver.com', '1000'),
	(17, 31, 1, 2, 2, '2017-07-31 22:30:49', 'teran1024@naver.com', '1100'),
	(18, 32, 1, 2, 2, '2017-07-31 22:31:16', 'teran1024@naver.com', '1100'),
	(19, 33, 1, 2, 1, '2017-07-31 22:31:33', 'teran1024@naver.com', '1100'),
	(20, 33, 2, 2, 2, '2017-07-31 22:31:45', 'admin', '1100');
/*!40000 ALTER TABLE `approvals_sub` ENABLE KEYS */;

-- 테이블 erp.approvals_system 구조 내보내기
CREATE TABLE IF NOT EXISTS `approvals_system` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `ing` int(11) DEFAULT NULL,
  `last` int(11) DEFAULT NULL,
  `recv_id` varchar(50) DEFAULT NULL,
  `type_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.approvals_system:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `approvals_system` DISABLE KEYS */;
INSERT INTO `approvals_system` (`no`, `ing`, `last`, `recv_id`, `type_code`) VALUES
	(1, 1, 2, 'teran1024@naver.com', '1100'),
	(2, 2, 2, 'admin', '1100'),
	(3, 1, 1, 'teran1024@naver.com', '1000');
/*!40000 ALTER TABLE `approvals_system` ENABLE KEYS */;

-- 테이블 erp.authorities 구조 내보내기
CREATE TABLE IF NOT EXISTS `authorities` (
  `email` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  KEY `FK_authorities_users` (`email`),
  CONSTRAINT `FK_authorities_users` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 erp.authorities:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` (`email`, `authority`) VALUES
	('admin', 'ROLE_ADMIN'),
	('teran1024@naver.com', 'ROLE_USER'),
	('admin', 'ROLE_USER'),
	('kingle@nate.com', 'ROLE_USER'),
	('dlwodn907@gmail.com', 'ROLE_USER'),
	('tmzkdlgo@daum.net', 'ROLE_USER'),
	('test@naver.com', 'ROLE_USER'),
	('test1@naver.com', 'ROLE_USER');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- 테이블 데이터 erp.boards:~35 rows (대략적) 내보내기
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
INSERT INTO `boards` (`id`, `title`, `content`, `author`, `hit`, `register_date`, `update_date`, `delete_yn`, `type_code`) VALUES
	(1, '2017학년도 실습실 근로장학생 명단입니다.', '정보통신학부 201255093 엄지용, 정보통신학부 201255043 이대근', '관리자', 127, '2017-03-05 09:37:39', '2017-03-02 22:14:30', 0, '1001'),
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
	(16, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(17, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(18, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(19, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(20, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(21, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 95, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(22, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 96, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(23, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(24, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(25, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 95, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(26, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(27, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(28, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(29, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 94, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(30, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~~', '관리자', 96, '2017-05-09 09:33:38', '2017-05-09 01:34:01', 0, '1001'),
	(31, '근로장학생 회식 장소 및 일정 이에요~', '5월 20일날 기말고사 끝나고 나누리에서 회식해요! 회비는 오천원~', '관리자', 205, '2017-05-09 09:33:38', '2017-07-25 21:34:50', 0, '1001'),
	(33, 'erp.war', 'erp.war', '관리자', 2, '2017-07-27 10:41:05', '2017-07-27 10:41:05', NULL, '1001'),
	(34, 'erp.war', 'erp.war', '관리자', 3, '2017-07-27 10:41:22', '2017-07-27 10:41:22', NULL, '1001'),
	(35, 'erp.warerp.war', 'erp.warerp.war', '관리자', 3, '2017-07-27 10:41:36', '2017-07-27 10:41:36', NULL, '1001'),
	(36, 'erp.war', 'erp.war', '관리자', 2, '2017-07-27 10:42:28', '2017-07-27 10:42:28', NULL, '1001');
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
  CONSTRAINT `FK_board_comment_common_code` FOREIGN KEY (`type_code`) REFERENCES `common_code` (`type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 테이블 데이터 erp.board_comment:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board_comment` DISABLE KEYS */;
INSERT INTO `board_comment` (`no`, `board_no`, `author`, `comment`, `register_date`, `update_date`, `type_code`) VALUES
	(1, 1, '개똥이', '알겠습니다!', '2017-05-08 09:57:11', '2017-05-08 09:57:14', '1001'),
	(2, 1, '엄지용', '확인했습니다!', '2017-05-08 09:58:21', '2017-05-08 09:58:22', '1001'),
	(3, 1, 'test', 'zzzz', '2017-05-26 17:13:48', '2017-05-26 17:13:48', '1001'),
	(4, 1, 'test', '12', '2017-05-26 17:18:36', '2017-05-26 17:18:36', '1001'),
	(5, 5, 'test', '12', '2017-06-03 20:26:32', NULL, '1001'),
	(6, 5, 'admin@naver.com', 'zz', '2017-06-03 20:41:17', NULL, '1001'),
	(7, 4, 'admin@naver.com', '오키', '2017-06-03 20:59:42', NULL, '1001'),
	(12, 31, 'admin@naver.com', '2', '2017-07-17 22:01:57', NULL, '1001');
/*!40000 ALTER TABLE `board_comment` ENABLE KEYS */;

-- 테이블 erp.breakdown_document 구조 내보내기
CREATE TABLE IF NOT EXISTS `breakdown_document` (
  `no` int(11) NOT NULL,
  `breakdown_distinguish` varchar(50) DEFAULT NULL,
  `breakdown_type` varchar(50) DEFAULT NULL,
  `room_num` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no`),
  CONSTRAINT `FK_breakdown_document_approvals` FOREIGN KEY (`no`) REFERENCES `approvals` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.breakdown_document:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `breakdown_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `breakdown_document` ENABLE KEYS */;

-- 테이블 erp.common_code 구조 내보내기
CREATE TABLE IF NOT EXISTS `common_code` (
  `group_code` int(11) NOT NULL,
  `type_code` varchar(50) NOT NULL,
  `name_code` varchar(50) NOT NULL,
  PRIMARY KEY (`type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 erp.common_code:~10 rows (대략적) 내보내기
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
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.files:~44 rows (대략적) 내보내기
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
	(156, 35, '201707271041362.war', 'erp.war', '/upload/');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;

-- 테이블 erp.free_document 구조 내보내기
CREATE TABLE IF NOT EXISTS `free_document` (
  `no` int(11) unsigned zerofill NOT NULL,
  `content` varchar(50) DEFAULT NULL,
  `etc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.free_document:~0 rows (대략적) 내보내기
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- 테이블 데이터 erp.messages:~14 rows (대략적) 내보내기
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`no`, `recv_id`, `send_id`, `title`, `content`, `send_date`, `recv_date`) VALUES
	(1, 'teran1024@naver.com', 'admin@naver.com', '근로장학생 선발을 축하드립니다!!', '향후 계획은 첨부 파일을 확인해 주세요.', '2017-03-05 16:17:13', '2017-05-08 21:41:51'),
	(2, 'teran1024@naver.com', 'tmzkdlgo@daum.net', '반가워요! 기존 근로장학생이에요~', '제 번호는 010-1111-2222에요 문자 하나만 부탁해요ㅋ', '2017-03-07 10:12:28', '2017-05-06 22:21:03'),
	(3, 'teran1024@naver.com', 'dlwodn907@gmail.com', 'ㅋㅋㅋㅋ 나도 합격했다~', '앞으로 잘해보자!!!', '2017-03-09 13:33:29', NULL),
	(4, 'teran1024@naver.com', 'admin@naver.com', '학생~ 쪽지 보면 행정실로 와줘요', '의논해야 할 사항이 있습니다;;', '2017-03-15 11:47:35', '2017-06-24 20:35:48'),
	(5, 'teran1024@naver.com', 'dlwodn907@gmail.com', '18312강의실 점검 내용 남길께.', '청소 했고, 컴퓨터 모두 종료 돼있는지 확인했어', '2017-04-03 19:21:01', '2017-05-09 12:33:24'),
	(6, 'teran1024@naver.com', 'kingle@nate.com', '형!! 내용 확인해주세요', '다음주에 실습실 전체점검 해야 된대요. 앞으로 확인해야 할 일들', '2017-04-12 15:07:33', '2017-06-24 20:35:46'),
	(7, 'admin@naver.com', 'teran1024@naver.com', '네!!!! 열심이 하겠습니다!', '많이 지켜봐 주세요~~', '2017-05-06 15:28:23', '2017-03-06 15:45:25'),
	(8, 'dlwodn907@gmail.com', 'teran1024@naver.com', '형 모임때 회의록 가져와요~', '선생님이 가져오래요!!', '2017-05-06 22:12:38', '2017-04-12 22:27:22'),
	(9, 'teran1024@naver.com', 'teran1024@naver.com', '오늘 점검하고 가야 할 것들!!', '1. 컴퓨터 정상 부팅 내용 2. 파손 여부 3. 리프트 작동 여부', '2017-04-25 18:24:36', '2017-05-09 12:35:41'),
	(10, 'admin@naver.com', 'teran1024@naver.com', '요청하신 사항 처리 완료하였습니다.', '더 시키실 일 있으면 연락 주세요~', '2017-05-06 12:12:33', '2017-05-06 22:31:18'),
	(14, 'kingle@naver.com', 'teran1024@naver.com', '18312 점검하고 쪽지남겨주세요', '꼭 남겨주세요. 시간 확인해야 해요', '2017-05-09 01:38:04', '2017-05-26 17:49:03'),
	(15, 'admin@naver.com', 'admin@naver.com', '이번주에 하는 회식 이요..', '\r\n갑작스럽게 집 안에 일이 생겨서 못 가게 될 것 같습니다.\r\n\r\n죄송합니다.', '2017-05-09 03:03:42', '2017-05-09 03:03:46'),
	(16, 'admin@naver.com', 'admin@naver.com', '1234', '1234\r\n1234\r\n1234', '2017-06-29 13:40:15', '2017-06-29 13:40:16'),
	(17, 'admin@naver', 'admin@naver.com', '1212', '1212', '2017-07-17 13:33:54', '2017-07-17 13:33:55');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- 테이블 erp.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `user_no` int(11) NOT NULL DEFAULT '0',
  `user_id` varchar(50) DEFAULT NULL,
  `user_pw` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 erp.user:~13 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_no`, `user_id`, `user_pw`) VALUES
	(1, '1', '1'),
	(2, '2', '2'),
	(3, '3', '3'),
	(4, '3', '3'),
	(5, '3', '3'),
	(6, '3', '3'),
	(7, '3', '3'),
	(8, '3', '3'),
	(9, '3', '3'),
	(10, '3', '3'),
	(11, '3', '3'),
	(12, '3', '3'),
	(13, '3', '3');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 테이블 데이터 erp.users:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `name`, `password`, `socialNumFront`, `enabled`) VALUES
	(1, 'dlwodn907@gmail.com', '이재우', '$2a$10$.ohfiNj9Hh44W3h7D0JPk.vMy6ssCW6LQThBUA.nu6LQhTavTdKLW', '', 1),
	(2, 'teran1024@naver.com', '엄지용', '$2a$10$tIbjyBa2Ipc8.g3vS6uPYesU/Rzas.J2toGdKYqbQxF2JWe1aypiO', '', 1),
	(3, 'admin', '관리자', '$2a$10$C309v2FBo3lbPUCzt5bdrewQ6qPOpnhgEyhhrqLNLsFoFA7xQXgeO', '', 1),
	(4, 'tmzkdlgo@daum.net', '이대근', '$2a$11$/.ej4SKI/VaogwQJzMLJBenzrVbDN9O8WHyuhHgJ89qJEftaz2PPi', '', 1),
	(5, 'kingle@nate.com', '김연아', '$2a$11$iLYWb0GPXzcrGqaDtBuYeu9A45alChqBrX4Z.QHUH1rwA0Tu6X6Z.', '', 1),
	(7, 'test@naver.com', '엄지용', '$2a$11$1JNaUZc3zVzPFYpj9gTE3ul1yTR7R/G2hYJ7yMCJ9xrPMIl16BRDa', '931024', 1),
	(8, 'test1@naver.com', '엄지용', '$2a$11$r0J6/zSh0yq9ow9opcIpu.9xT8nS0zMA4hfCfhEQI7CL3xSegoIoO', '931024', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

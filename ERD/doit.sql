SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS c_write;
DROP TABLE IF EXISTS p_write;
DROP TABLE IF EXISTS t_write;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS t_score;
DROP TABLE IF EXISTS toilet_info;




/* Create Tables */

CREATE TABLE comment
(
	co_uid int NOT NULL AUTO_INCREMENT,
	co_content varchar(200) NOT NULL,
	co_regdate datetime DEFAULT now(),
	co_puid int NOT NULL,
	co_depth int DEFAULT 1,
	mb_uid int NOT NULL,
	PRIMARY KEY (co_uid)
);


CREATE TABLE c_write
(
	cwr_uid int NOT NULL AUTO_INCREMENT,
	cwr_subject varchar(40) NOT NULL,
	cwr_content text,
	cwr_viewcnt int DEFAULT 0,
	cwr_regdate datetime DEFAULT now(),
	mb_uid int NOT NULL,
	PRIMARY KEY (cwr_uid)
);


CREATE TABLE member
(
	mb_uid int NOT NULL AUTO_INCREMENT,
	mb_id varchar(20) NOT NULL,
	mb_password varchar(20) NOT NULL,
	mb_email varchar(30) NOT NULL,
	mb_emailHash varchar(100),
	mb_emailSign boolean default false,
	mb_regdate datetime DEFAULT now(),
	mb_level int NOT NULL DEFAULT 1 CHECK(mb_level >= 1 AND mb_level <= 2),
	PRIMARY KEY (mb_uid),
	UNIQUE (mb_id)
);


CREATE TABLE p_write
(
	pwr_uid int NOT NULL AUTO_INCREMENT,
	pwr_subject varchar(40) NOT NULL,
	pwr_content text,
	pwr_viewcnt int DEFAULT 0,
	pwr_regdate datetime DEFAULT now(),
	mb_uid int NOT NULL,
	PRIMARY KEY (pwr_uid)
);


CREATE TABLE toilet_info
(
	t_uid int NOT NULL AUTO_INCREMENT,
	t_name varchar(30) NOT NULL,
	t_location varchar(100) NOT NULL,
	-- 시/군/구로 구분
	-- 
	t_location_O varchar(100) COMMENT '시/군/구로 구분
',
	t_latitude double NOT NULL,
	t_longitude double NOT NULL,
	t_gender int DEFAULT 0,
	t_kid_M int DEFAULT 0,
	t_kid_W int,
	t_disabled_M int,
	t_disabled_W int,
	t_count_M int,
	t_count_W int,
	PRIMARY KEY (t_uid)
);


CREATE TABLE t_score
(
	ts_uid int NOT NULL AUTO_INCREMENT,
	ts_score double,
	t_uid int NOT NULL,
	PRIMARY KEY (ts_uid)
);


CREATE TABLE t_write
(
	twr_uid int NOT NULL AUTO_INCREMENT,
	twr_subject varchar(40) NOT NULL,
	twr_score double NOT NULL DEFAULT 1 CHECK(twr_score >= 0 AND twr_score <= 5),
	twr_content text,
	twr_viewcnt int DEFAULT 0,
	twr_regdate datetime DEFAULT now(),
	mb_uid int NOT NULL,
	t_uid int NOT NULL,
	ts_uid int NOT NULL,
	PRIMARY KEY (twr_uid)
);



/* Create Foreign Keys */

ALTER TABLE comment
	ADD FOREIGN KEY (mb_uid)
	REFERENCES member (mb_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE c_write
	ADD FOREIGN KEY (mb_uid)
	REFERENCES member (mb_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE p_write
	ADD FOREIGN KEY (mb_uid)
	REFERENCES member (mb_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE t_write
	ADD FOREIGN KEY (mb_uid)
	REFERENCES member (mb_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE t_score
	ADD FOREIGN KEY (t_uid)
	REFERENCES toilet_info (t_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE t_write
	ADD FOREIGN KEY (t_uid)
	REFERENCES toilet_info (t_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE t_write
	ADD FOREIGN KEY (ts_uid)
	REFERENCES t_score (ts_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


INSERT INTO `p_write`
		(pwr_subject, pwr_content, pwr_viewcnt, mb_uid)
	VALUES
	('ㅎㅇㅎㅇ', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ1', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ2', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ3', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ1', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ2', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ3', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),('ㅎㅇㅎㅇ', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ1', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ2', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ3', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),('ㅎㅇㅎㅇ', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ1', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ2', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ3', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),('ㅎㅇㅎㅇ', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ1', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ2', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ3', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),('ㅎㅇㅎㅇ', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ1', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ2', 'ㅎㅇㅎㅇㅎㅇ', 1, 3),
	('ㅎㅇㅎㅇ3', 'ㅎㅇㅎㅇㅎㅇ', 1, 3)
	;


SELECT * FROM `member`;

INSERT INTO t_write
   (twr_subject, mb_uid, twr_score, t_uid, ts_uid)
VALUES
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4)
;

INSERT INTO t_score
   (ts_score, t_uid)
VALUES
   (3.52, 1);

select * from t_score;
select * from t_write, member, t_score where (t_write.mb_uid = member.mb_uid and t_write.t_uid = 1) and (t_write.t_uid = t_score.t_uid and t_score.ts_uid = (select max(ts_uid) from t_score)) ORDER BY twr_uid desc LIMIT 0, 15;

INSERT IGNORE INTO `toilet_info` (`t_uid`, `t_name`, `t_location`, `t_location_O`, `t_latitude`, `t_longitude`, `t_gender`, `t_kid_M`, `t_kid_W`, `t_disabled_M`, `t_disabled_W`, `t_count_M`, `t_count_W`) VALUES
   (1, '메세나 폴리스 1층/지1층(2곳)', '서울특별시 마포구 양화로 45(서교동)', '서울특별시 마포구', 37.55111548, 126.9137443, 0, 0, 0, 1, 1, 9, 18),
   (2, '(GS칼텍스직영)부천고속주유소', '경기도 부천시 신흥로 434 (내동)', '경기도 부천시', 37.536865, 126.814883, 0, 0, 0, 0, 0, 1, 1),
   (3, '(구)관리사무실', '경기도 평택시 현덕면 권관리 551-33', '경기도 평택시', 36.918954, 126.883591, 0, 0, 0, 0, 1, 6, 5),
   (4, '(구)마정시장 공중화장실', '충청남도 부여군 남면 마정리 825', '충청남도 부여군', 36.2256533, 126.8335726, 1, 0, 0, 0, 0, 0, 0),
   (5, '(구)소방서', '강원도 속초시 동해대로 4219', '강원도 속초시', 38.19606857, 128.577187, 0, 0, 0, 0, 0, 1, 1);
  INSERT INTO `member`
   (mb_id, mb_password, mb_email, `mb_emailHash`, `mb_emailSign`, mb_level)
VALUES
   ('admin', '1234', 'aa@aa.com', 1234, true, 2),
   ('aa', 'aa', 'aa@aa.com', 1235, true, 1)
;

INSERT IGNORE INTO `toilet_info` (`t_uid`, `t_name`, `t_location`, `t_location_O`, `t_latitude`, `t_longitude`, `t_gender`, `t_kid_M`, `t_kid_W`, `t_disabled_M`, `t_disabled_W`, `t_count_M`, `t_count_W`) VALUES
   (1, '메세나 폴리스 1층/지1층(2곳)', '서울특별시 마포구 양화로 45(서교동)', '서울특별시 마포구', 37.55111548, 126.9137443, 0, 0, 0, 1, 1, 9, 18),
   (2, '(GS칼텍스직영)부천고속주유소', '경기도 부천시 신흥로 434 (내동)', '경기도 부천시', 37.536865, 126.814883, 0, 0, 0, 0, 0, 1, 1),
   (3, '(구)관리사무실', '경기도 평택시 현덕면 권관리 551-33', '경기도 평택시', 36.918954, 126.883591, 0, 0, 0, 0, 1, 6, 5),
   (4, '(구)마정시장 공중화장실', '충청남도 부여군 남면 마정리 825', '충청남도 부여군', 36.2256533, 126.8335726, 1, 0, 0, 0, 0, 0, 0),
   (5, '(구)소방서', '강원도 속초시 동해대로 4219', '강원도 속초시', 38.19606857, 128.577187, 0, 0, 0, 0, 0, 1, 1);

INSERT INTO t_score
   (ts_score, t_uid)
VALUES
   (3.52, 2),
   (4.82, 3),
   (2.11, 4),
   (3.48, 5)
;

INSERT INTO `member`
   (mb_id, mb_password, mb_email, `mb_emailHash`, `mb_emailSign`, mb_level)
VALUES
   ('bb', 'bb', 'aa@aa.com', 1234, true, 1),
   ('iiii', '1111', 'phile7@naver.com', 1234, true,1),
   ('iiii1', '1111', 'phile7@naver.com', 1234, true,1),
   ('iiii2', '1111', 'phile7@naver.com', 1234, true,1),
   ('iiii3', '1111', 'phile7@naver.com', 1234, true,1)
;

INSERT INTO p_write
   (pwr_subject, mb_uid)
VALUES
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2)
;


INSERT INTO c_write
   (cwr_subject, mb_uid)
VALUES
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2),
   ('bb', 2)
;

INSERT INTO t_write
   (twr_subject, mb_uid, twr_score, t_uid, ts_uid)
VALUES
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4),
   ('bb', 2, 4, 1, 4)
   
;

INSERT INTO t_score
   (ts_score, t_uid)
VALUES
   (3.52, 1)
;

SELECT * FROM `member`;
select * from t_write tw;
select * from t_score;
select * from t_write, member, t_score where (t_write.mb_uid = member.mb_uid and t_write.t_uid = 1) and (t_write.t_uid = t_score.t_uid and t_score.ts_uid = (select max(ts_uid) from t_score)) ORDER BY twr_uid desc LIMIT 0, 15; 
  
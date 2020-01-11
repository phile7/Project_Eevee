SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS c_file;
DROP TABLE IF EXISTS c_write;
DROP TABLE IF EXISTS p_file;
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


CREATE TABLE c_file
(
	cbf_uid int NOT NULL AUTO_INCREMENT,
	cbf_source varchar(100) NOT NULL,
	cbf_file varchar(100) NOT NULL,
	cbf_order int DEFAULT 1,
	cwr_uid int NOT NULL,
	PRIMARY KEY (cbf_uid)
);


CREATE TABLE c_write
(
	cwr_uid int NOT NULL AUTO_INCREMENT,
	cwr_subject varchar(40) NOT NULL,
	cwr_type varchar(2) NOT NULL,
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


CREATE TABLE p_file
(
	pbf_uid int NOT NULL AUTO_INCREMENT,
	pbf_source varchar(100) NOT NULL,
	pbf_file varchar(100) NOT NULL,
	pbf_order int DEFAULT 1,
	pwr_uid int NOT NULL,
	PRIMARY KEY (pbf_uid)
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
	t_latitude double NOT NULL,
	t_longitude double NOT NULL,
	t_gender int DEFAULT 0,
	t_kid int DEFAULT 0,
	t_disabled int,
	t_vdm int DEFAULT 0,
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

ALTER TABLE c_file
	ADD FOREIGN KEY (cwr_uid)
	REFERENCES c_write (cwr_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


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


ALTER TABLE p_file
	ADD FOREIGN KEY (pwr_uid)
	REFERENCES p_write (pwr_uid)
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




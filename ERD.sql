SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS COMMENTS;
DROP TABLE IF EXISTS FILES;
DROP TABLE IF EXISTS BOARD;
DROP TABLE IF EXISTS CATEGORYS;
DROP TABLE IF EXISTS MEMBERS;




/* Create Tables */

CREATE TABLE BOARD
(
	uuid varchar(40) NOT NULL,
	title varchar(50) NOT NULL,
	contents text,
	hits int unsigned NOT NULL,
	write_time datetime,
	modify_time datetime,
	category varchar(20) NOT NULL,
	id varchar(30) NOT NULL,
	user_delete boolean NOT NULL,
	PRIMARY KEY (uuid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE CATEGORYS
(
	category varchar(20) NOT NULL,
	PRIMARY KEY (category)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE COMMENTS
(
	comment_contents varchar(255) NOT NULL,
	uuid varchar(40) NOT NULL,
	id varchar(30) NOT NULL,
	write_time datetime NOT NULL,
	PRIMARY KEY (comment_contents, uuid, id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE FILES
(
	file_name varchar(255) NOT NULL,
	path varchar(255) NOT NULL,
	size int unsigned NOT NULL,
	format varchar(20) NOT NULL,
	uuid varchar(40) NOT NULL,
	PRIMARY KEY (file_name)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE MEMBERS
(
	id varchar(30) NOT NULL,
	password varchar(255) NOT NULL,
	permission varchar(20) NOT NULL,
	cell_phone varchar(20) NOT NULL,
	email varchar(50) NOT NULL,
	name varchar(30) NOT NULL,
	sponsor_status boolean NOT NULL,
	m_delete boolean NOT NULL,
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* Create Foreign Keys */
ALTER TABLE COMMENTS
	ADD FOREIGN KEY (uuid)
	REFERENCES BOARD (uuid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FILES
	ADD FOREIGN KEY (uuid)
	REFERENCES BOARD (uuid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE BOARD
	ADD FOREIGN KEY (category)
	REFERENCES CATEGORYS (category)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE BOARD
	ADD FOREIGN KEY (id)
	REFERENCES MEMBERS (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE COMMENTS
	ADD FOREIGN KEY (id)
	REFERENCES MEMBERS (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


INSERT INTO MEMBERS VALUES('Admin', password('kosta6006'), 'Admin', '00000000000', '000@0000.com', '관리자', 0, 0);
INSERT INTO CATEGORYS VALUES('소개 마당');
INSERT INTO CATEGORYS VALUES('소식 마당');
INSERT INTO CATEGORYS VALUES('책 마당');
INSERT INTO CATEGORYS VALUES('영화 마당');
INSERT INTO CATEGORYS VALUES('정보 마당');
INSERT INTO CATEGORYS VALUES('영세중립 마당');
INSERT INTO CATEGORYS VALUES('살림 마당');
INSERT INTO CATEGORYS VALUES('관장 게시판');
INSERT INTO CATEGORYS VALUES('자유 게시판');
INSERT INTO CATEGORYS VALUES('후원 마당');
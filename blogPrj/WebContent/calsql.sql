DROP TABLE member
CASCADE CONSTRAINT;

create table member(
	
	m_id varchar2(50) primary key,			-- 아이디
	m_pw varchar2(50) not null,			-- 비밀번호
	m_name varchar2(50) not null,
	m_gender varchar2(2) not null,
	m_birthday varchar2(12) not null,
	m_email varchar2(50) not null,		-- 이메일
	m_phone varchar2(50) not null,		-- 전화번호
	
	m_action number default 0,		-- 인증
	m_logchk number default 0, 		-- 로그인 실패 카운트
	m_logdate date,			-- 로그인 한 날
	m_faildate date,			-- 로그인 실패했을 때, 시간 입력
	M_AUTH number default 3
);

insert into member values ('d','d','디디슬','1','dd@i.com','19931026','010-0818', 0, 0, sysdate, sysdate, 3)
insert into member values ('bae','b','배','1','dd@i.com','19931026','010-0818', 0, 0, sysdate, sysdate, 3)
insert into member values ('cae','c','새','1','dd@i.com','19931026','010-0818', 0, 0, sysdate, sysdate, 3)
------------------------------------------------------------------
DROP TABLE SCHWRITE
CASCADE CONSTRAINT;

DROP SEQUENCE SEQ_SIST_SCHWRITE;

CREATE TABLE SCHWRITE(
	sch_writenum number primary key,		-- seq
	sch_id varchar2(50) not null,			-- 작성자 이름
	sch_title varchar2(50) not null,		-- 캘린더 제목,
	sch_star number,				-- 매우중요:2, 보통중요:1, 안중요:1
	sch_location varchar2(50),				-- 장소
	sch_startdate varchar2(50) not null,	-- 시작날짜 입력
	sch_starttime varchar2(50),				-- 시작시간 입력 
	sch_enddate varchar2(50) not null,		-- 끝날짜 입력
	sch_endtime varchar2(50),				-- 끝시간 입력
	sch_rdate varchar2(50) not null,		-- 등록하는 날짜 입력
	sch_allday number,			-- 종일이면 1, 안 종일:0
	--sch_member varchar2(50),				-- 초대하는 친구
	sch_public number,						-- 공개:0, 비공개:1
	sch_sticker varchar2(150),				-- 스티커 이름
	sch_content varchar2(150),				-- 내용
	sch_docname varchar2(150),				-- 문서 이름
	sch_alarm varchar2(50) not null,		-- 스케쥴 알람 시간 
	sch_finish number default 0,			-- 스케쥴 완료:1, 비완료:0	
	sch_calnum number				
);

CREATE SEQUENCE SEQ_SIST_SCHWRITE
START WITH 1 INCREMENT BY 1;

ALTER TABLE SCHWRITE
ADD CONSTRAINT FK_SIST_SCHWRITE FOREIGN KEY(sch_id)
REFERENCES MEMBER(m_id);  

ALTER TABLE SCHWRITE
ADD CONSTRAINT FK_SIST_SCHWRITE2 FOREIGN KEY(sch_calnum)
REFERENCES calendar(cal_num); 


select * from schwrite;
	

	
SELECT sch_writenum, sch_id, 
		   sch_star, sch_title, 
		   sch_startdate, sch_starttime,
		   sch_enddate, sch_endtime
		   sch_sticker, sch_content
	FROM 
	(SELECT ROW_NUMBER() OVER
		(PARTITION BY SUBSTR(sch_startdate, 1, 8) ORDER BY sch_startdate ASC) RN,
		sch_writenum,  sch_id, 
		   sch_star, sch_title, 
		   sch_startdate, sch_starttime,
		   sch_enddate, sch_endtime,
		   sch_sticker, sch_content
		FROM schwrite
		WHERE sch_id='d' AND SUBSTR(sch_starttime, 1, 8)='오전 12:00'
	)
WHERE RN BETWEEN 1 AND 5	
	
	
select * from schwrite;

------------------------------------------------------------------------------
-- 캘린더 만들기
DROP TABLE calendar
CASCADE CONSTRAINT;

DROP SEQUENCE SEQ_SIST_CALENDAR;

create table calendar(
	cal_num number primary key,		-- seq
	cal_name varchar2(50) not null,	-- 캘린더 이름
	cal_content varchar2(1000), 	-- 캘린더 설명
	cal_alarm varchar2(50) not null	-- 캘린더 알람 시간
);

CREATE SEQUENCE SEQ_SIST_calendar
START WITH 1 INCREMENT BY 1;

--ALTER TABLE SCHWRITE
--ADD CONSTRAINT SEQ_SIST_calendar FOREIGN KEY(sch_id)
--REFERENCES MEMBER(m_id);  
-----------------------------------------------------


-------------------------------------------------------------------
DROP TABLE sch_invite
CASCADE CONSTRAINT;

DROP SEQUENCE SEQ_SIST_INVITE;

create table SCH_INVITE(
	invite_num number primary key,		-- seq
	sch_writenum number,				-- 일정 번호
	cal_num varchar2(50),				-- 캘린더 번호
	invite_id varchar2(50) NOT NULL,	-- 초대 하는 사람
	invited_id varchar2(50) 			-- 초대 받는 친구
);

CREATE SEQUENCE SEQ_SIST_INVITE
START WITH 1 INCREMENT BY 1;

ALTER TABLE SCH_INVITE
ADD CONSTRAINT FK_SIST_SCH_INVITE FOREIGN KEY(invite_id)
REFERENCES member(M_id);  


------------------------------------------------------------------------------
-- 이웃 테이블
create table friend(
	fnd_seq number primary key, 		-- seq
	fnd_myid varchar2(50), 		-- 내 아이디
	fnd_fndid varchar2(50),		-- 이웃 아이디
	fnd_groupname varchar2(50), 	-- 그룹명
	fnd_chk number not null 		-- 이웃 / 서로 이웃 여부
);

CREATE SEQUENCE SEQ_FRIEND
START WITH 1 INCREMENT BY 1;

ALTER TABLE friend
ADD CONSTRAINT FK_FND_MYID FOREIGN KEY(fnd_myid)
REFERENCES member(M_id); 

insert into friend values (SEQ_FRIEND.NEXTVAL, 'd', 'bae', '내이웃들', 1);
insert into friend values (SEQ_FRIEND.NEXTVAL, 'd', 'cae', '내이웃들', 1);

insert into friend values (SEQ_FRIEND.NEXTVAL, 'cae', 'd', '내이웃들', 1);
insert into friend values (SEQ_FRIEND.NEXTVAL, 'cae', 'bae', '내이웃들', 1);
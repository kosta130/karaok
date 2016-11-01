drop table tb_member;
create table tb_member
(
	id varchar2(50) constraint member_id_pk primary key,
	pwd varchar2(50) not null,
	name varchar2(50) not null,
	nickname varchar2(50) unique not null,
	birth date not null,
	tel varchar2(50) not null
);

--[게임소식]
--공지사항
drop table tb_notice;
create table tb_notice
(
num number(20) constraint notice_num_pk primary key,
nickname varchar2(50),
subject varchar2(100),
contents varchar2(1000),
ndate date,
constraint tb_notice_fk_nickname foreign key(nickname) references tb_member(nickname)
);

drop sequence seq_notice_num;
create sequence seq_notice_num
increment by 1
start with 1
nocycle
nocache;

--개발자노트
drop table tb_update;
create table tb_update
(
num number(20) constraint update_num_pk primary key,
nickname varchar2(50),
subject varchar2(100),
contents varchar2(1000),
ndate date,
hits number(20),
constraint tb_update_fk_nickname foreign key(nickname) references tb_member(nickname)
);

drop sequence seq_update_num;
create sequence seq_update_num
increment by 1
start with 1
nocycle
nocache;


--[이벤트]

--이벤트
drop table tb_event;
create table tb_event
(	
	num number(20) constraint event_num_pk primary key,
	id varchar2(50),
	point varchar2(100),
	subject varchar2(100),
	contents varchar2(1000),
	startDate date,
	endDate date,
	fileName varchar2(100),
	state varchar2(50),
	constraint tb_event_fk_id foreign key(id) references tb_member(id)
);
create sequence seq_event_num
increment by 1
start with 1
nocycle
nocache;

--[커뮤니티]
--자유게시판
drop table tb_free;
create table tb_free
(
num number(20) constraint free_num_pk primary key,
nickname varchar2(50),
subject varchar2(100),
contents varchar2(1000),
ndate date,
constraint tb_free_fk_nickname foreign key(nickname) references tb_member(nickname)
);

drop sequence seq_free_num;
create sequence seq_free_num
increment by 1
start with 1
nocycle
nocache;

insert into tb_free values (seq_free_num.nextval,'오1', '안녕', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오2', '안녕', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오3', '안녕', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오4', '안녕', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오5', '안녕', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오6', '안녕', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오1', '안녕1', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오2', '안녕1', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오3', '안녕1', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오4', '안녕1', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오5', '안녕1', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오6', '안녕1', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오1', '안녕12', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오2', '안녕12', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오3', '안녕12', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오4', '안녕12', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오5', '안녕12', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오6', '안녕12', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오1', '안녕123', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오2', '안녕123', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오3', '안녕123', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오4', '안녕123', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오5', '안녕123', '리턴3조',sysdate);
insert into tb_free values (seq_free_num.nextval,'오6', '안녕123', '리턴3조',sysdate);

delete from TB_FREE
select * from TB_FREE

select * from TB_member
--랭킹게시판
  29 풍경      풍경보세요~   C:/Users/SungWook/git/karaok/Karaok/WebContent/imgtest11.jpg

drop table tb_rank;
create table tb_rank
(
num number(30)  primary key,
score number(30) not null,
nickname varchar2(50) references tb_member(nickname) not null,
ndate date,
rank number(30)
);

drop sequence seq_rank_num;
create sequence seq_rank_num
increment by 1
start with 1
nocycle
nocache;

insert into tb_rank values(4, 20, '오1', sysdate,0);
insert into tb_rank values(1, 30, '오2', sysdate,0);
insert into tb_rank values(2, 40, '오3', sysdate,0);
insert into tb_rank values(3, 50, '오1', sysdate,0);
insert into tb_rank values(5, 40, '오4', sysdate,0);
insert into tb_rank values(6, 80, '오5', sysdate,0);
insert into tb_rank values(7, 60, '오4', sysdate,0);
insert into tb_rank values(8, 40, '오6', sysdate,0);
insert into tb_rank values(9, 70, '오7', sysdate,0);
insert into tb_rank values(10, 89, '오8', sysdate,0);
insert into tb_rank values(11, 99, '오9', sysdate,0);
insert into tb_rank values(12, 98, '오10', sysdate,0);
insert into tb_rank values(13, 97, '오11', sysdate,0);
insert into tb_rank values(14, 96, '오12', sysdate,0);
insert into tb_rank values(15, 95, '오13', sysdate,0);
insert into tb_rank values(16, 94, '오14', sysdate,0);
insert into tb_rank values(17, 93, '오15', sysdate,0);
insert into tb_rank values(18, 92, '오16', sysdate,0);

SELECT *
 		FROM (
   			 SELECT RANK() OVER(ORDER BY SCORE DESC)rank, nickname, SCORE
     		FROM (SELECT tb_rank.*
           		, row_number() OVER (PARTITION BY nickname ORDER BY score DESC, ndate) rn
         		FROM tb_rank
        		)
     			WHERE rn = 1
     			 ORDER BY row_number() OVER (ORDER BY score DESC, ndate, nickname)
    			)
		 WHERE ROWNUM <= 10 

		 
--스크린샷게시판

drop table tb_screen;


create table tb_screen
(
num number(20) constraint screen_num_pk primary key,
id varchar2(50),
subject varchar2(100),
contents varchar2(1000),
jumsu number(20),
idate date,
seek number(20),
fileName varchar2(50),
constraint tb_screen_fk_id foreign key(id) references tb_member(id)
)










--[고객센터]
--QnA

--FAQ

select *from tb_event
delete from tb_member where id='lee52x@naver.com'

insert into tb_member values ('lee52x@naver.com', 1234, '이성욱', '드루미드루미', sysdate, '010-7157-8550');
select id,subject,name,contents from tb_event natural join tb_member

		select num,id,subject,point,contents,fileName,startDate,endDate,state 
			from tb_event natural join tb_member
			where endDate<sysdate
			order by num desc
			
<<<<<<< HEAD
=======

insert into tb_notice values (seq_notice_num.nextval, '드루미드루미', 'gonggong', 'hihihi', sysdate);
delete from tb_notice where nickname='드루미드루미';
insert into tb_update values (seq_update_num.nextval, '드루미드루미', '도', '하이', sysdate);
insert into tb_member values ('ojh5797@naver.com', 1234, '오정훈', '오1', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@naver.co', 1234, '오정훈', '오2', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nave.com', 1234, '오정훈', '오3', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@naer.com', 1234, '오정훈', '오4', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nve.com', 1234, '오정훈', '오5', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nvr.com', 1234, '오정훈', '오6', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nver.com', 1234, '오정훈', '오7', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@ner.com', 1234, '오정훈', '오8', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@ver.com', 1234, '오정훈', '오9', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nver.cm', 1234, '오정훈', '오10', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nvoer.cm', 1234, '오정훈', '오11', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nveir.cm', 1234, '오정훈', '오12', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nverh.cm', 1234, '오정훈', '오13', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nvehr.cm', 1234, '오정훈', '오14', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nverd.cm', 1234, '오정훈', '오15', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nverg.cm', 1234, '오정훈', '오16', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nverb.cm', 1234, '오정훈', '오17', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nverc.cm', 1234, '오정훈', '오18', sysdate, '010-3952-5797');

insert into tb_notice values (seq_notice_num.nextval, '드루미드루미', 'gonggong', 'hihihi', sysdate);
delete from tb_notice where nickname='드루미드루미';
insert into tb_update values (seq_update_num.nextval, '드루미드루미', '도', '하이', sysdate);
insert into tb_member values ('ojh5797@naver.com', 1234, '오정훈', '오바사키', sysdate, '010-3952-5797');
insert into tb_notice values (seq_notice_num.nextval, '오바사키', '2016년 10월 20일 공지사항입니다.', '제곧내', sysdate);

select * from tb_notice
select NUM,NICKNAME,SUBJECT,CONTENTS,NDATE from TB_UPDATE order by NUM desc;
select * from tb_notice
delete from tb_notice where num between 7 and 18 
select NUM,NICKNAME,SUBJECT,CONTENTS,NDATE from TB_UPDATE order by NUM desc;

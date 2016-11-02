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





--[이벤트]

--이벤트
drop table tb_event
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
delete from tb_free where num=46;
delete from tb_free where num between 29 and 44;
create table tb_free
(
num number(20) constraint free_num_pk primary key,
nickname varchar2(50),
subject varchar2(100),
contents varchar2(1000),
ndate date,
hits number(20),
constraint tb_free_fk_nickname foreign key(nickname) references tb_member(nickname)
);

drop sequence seq_free_num;
create sequence seq_free_num
increment by 1
start with 1
nocycle
nocache;
--자유게시판 댓글
drop table free_reply;
select * from free_reply
create table free_reply(
	freeNum number(20) constraint free_replyNum_pk primary key,
	num number(20),
	nickname varchar2(50),
	ndate Date,
	contents varchar2(1000),
	constraint tb_Rfree_fk_nickname foreign key(num) references tb_free(num)
);
drop sequence seq_Rfree_num;
create sequence seq_Rfree_num
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
score number(20) constraint rank_score_pk primary key,
id varchar2(50) constraint rank_id_fk references tb_member(id),
nickname varchar2(50) constraint rank_nickname_fk references tb_member(nickname)
);
--스크린샷게시판

drop table tb_screen
create table tb_screen
(
num number(20) constraint screen_num_pk primary key,
nickname varchar2(50),
subject varchar2(100),
contents varchar2(1000),
ndate date,
seek number(20),
fileName varchar2(50),
constraint tb_screen_fk_nickname foreign key(nickname) references tb_member(nickname)
);

select * from tb_screen

delete from tb_screen where num between 79 and 86;
drop sequence seq_screen_num;
create sequence seq_screen_num
increment by 1
start with 1
nocycle
nocache;
--스크린샷 댓글
drop table screen_reply;
select * from screen_reply
create table screen_reply(
	screenNum number(20) constraint screen_replyNum_pk primary key,
	num number(20),
	nickname varchar2(50),
	ndate Date,
	contents varchar2(1000),
	constraint tb_Rscreen_fk_nickname foreign key(num) references tb_screen(num)
);
drop sequence seq_Rscreen_num;
create sequence seq_Rscreen_num
increment by 1
start with 1
nocycle
nocache;


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
			

insert into tb_notice values (seq_notice_num.nextval, '드루미드루미', 'gonggong', 'hihihi', sysdate);
delete from tb_notice where nickname='드루미드루미';
insert into tb_update values (seq_update_num.nextval, '드루미드루미', '도', '하이', sysdate);
insert into tb_member values ('ojh5797@naver.com', 1234, '오정훈', '오바사키', sysdate, '010-3952-5797');
insert into tb_notice values (seq_notice_num.nextval, '오바사키', '2016년 10월 20일 공지사항입니다.', '제곧내', sysdate);

select * from tb_notice
select NUM,NICKNAME,SUBJECT,CONTENTS,NDATE from TB_UPDATE order by NUM desc;

select * from tb_screen;

-- 테스트

select num,nickname,subject,ndate,seek,fileName
 		from  (select num,nickname,subject,ndate,seek,fileName, rownum rn   
      	from ( select num,nickname,subject,ndate,seek,fileName
        from tb_screen order by num desc))  
        where rn between 1 and 10; 
        
update  tb_screen set fileName='120.jpg';        




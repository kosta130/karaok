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
id varchar2(50),
subject varchar2(100),
contents varchar2(1000),
ndate date,
constraint tb_notice_fk_id foreign key(id) references tb_member(id)
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
id varchar2(50),
subject varchar2(100),
contents varchar2(1000),
ndate date,
constraint tb_update_fk_id foreign key(id) references tb_member(id)
);

drop sequence seq_update_num;
create sequence seq_update_num
increment by 1
start with 1
nocycle
nocache;

--[이벤트]
--이벤트

--[커뮤니티]
--자유게시판
drop table tb_free;
create table tb_free
(
num number(20) constraint free_num_pk primary key,
id varchar2(50),
subject varchar2(100),
contents varchar2(1000),
ndate date,
constraint tb_free_fk_id foreign key(id) references tb_member(id)
);

drop sequence seq_free_num;
create sequence seq_free_num
increment by 1
start with 1
nocycle
nocache;

--랭킹게시판
drop table tb_rank;
create table tb_rank
(
score number(20) constraint rank_score_pk primary key,
id varchar2(50) constraint rank_id_fk references tb_member(id),
nickname varchar2(50) constraint rank_nickname_fk references tb_member(nickname)
);

--스크린샷게시판

--[고객센터]
--QnA

--FAQ
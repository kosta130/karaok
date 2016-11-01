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

--[���Ӽҽ�]
--��������
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

--�����ڳ�Ʈ
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


--[�̺�Ʈ]

--�̺�Ʈ
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

--[Ŀ�´�Ƽ]
--�����Խ���
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

insert into tb_free values (seq_free_num.nextval,'��1', '�ȳ�', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��2', '�ȳ�', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��3', '�ȳ�', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��4', '�ȳ�', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��5', '�ȳ�', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��6', '�ȳ�', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��1', '�ȳ�1', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��2', '�ȳ�1', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��3', '�ȳ�1', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��4', '�ȳ�1', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��5', '�ȳ�1', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��6', '�ȳ�1', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��1', '�ȳ�12', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��2', '�ȳ�12', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��3', '�ȳ�12', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��4', '�ȳ�12', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��5', '�ȳ�12', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��6', '�ȳ�12', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��1', '�ȳ�123', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��2', '�ȳ�123', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��3', '�ȳ�123', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��4', '�ȳ�123', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��5', '�ȳ�123', '����3��',sysdate);
insert into tb_free values (seq_free_num.nextval,'��6', '�ȳ�123', '����3��',sysdate);

delete from TB_FREE
select * from TB_FREE

select * from TB_member
--��ŷ�Խ���
  29 ǳ��      ǳ�溸����~   C:/Users/SungWook/git/karaok/Karaok/WebContent/imgtest11.jpg

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

insert into tb_rank values(4, 20, '��1', sysdate,0);
insert into tb_rank values(1, 30, '��2', sysdate,0);
insert into tb_rank values(2, 40, '��3', sysdate,0);
insert into tb_rank values(3, 50, '��1', sysdate,0);
insert into tb_rank values(5, 40, '��4', sysdate,0);
insert into tb_rank values(6, 80, '��5', sysdate,0);
insert into tb_rank values(7, 60, '��4', sysdate,0);
insert into tb_rank values(8, 40, '��6', sysdate,0);
insert into tb_rank values(9, 70, '��7', sysdate,0);
insert into tb_rank values(10, 89, '��8', sysdate,0);
insert into tb_rank values(11, 99, '��9', sysdate,0);
insert into tb_rank values(12, 98, '��10', sysdate,0);
insert into tb_rank values(13, 97, '��11', sysdate,0);
insert into tb_rank values(14, 96, '��12', sysdate,0);
insert into tb_rank values(15, 95, '��13', sysdate,0);
insert into tb_rank values(16, 94, '��14', sysdate,0);
insert into tb_rank values(17, 93, '��15', sysdate,0);
insert into tb_rank values(18, 92, '��16', sysdate,0);

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

		 
--��ũ�����Խ���

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










--[������]
--QnA

--FAQ

select *from tb_event
delete from tb_member where id='lee52x@naver.com'

insert into tb_member values ('lee52x@naver.com', 1234, '�̼���', '���̵���', sysdate, '010-7157-8550');
select id,subject,name,contents from tb_event natural join tb_member

		select num,id,subject,point,contents,fileName,startDate,endDate,state 
			from tb_event natural join tb_member
			where endDate<sysdate
			order by num desc
			
<<<<<<< HEAD
=======

insert into tb_notice values (seq_notice_num.nextval, '���̵���', 'gonggong', 'hihihi', sysdate);
delete from tb_notice where nickname='���̵���';
insert into tb_update values (seq_update_num.nextval, '���̵���', '��', '����', sysdate);
insert into tb_member values ('ojh5797@naver.com', 1234, '������', '��1', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@naver.co', 1234, '������', '��2', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nave.com', 1234, '������', '��3', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@naer.com', 1234, '������', '��4', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nve.com', 1234, '������', '��5', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nvr.com', 1234, '������', '��6', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nver.com', 1234, '������', '��7', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@ner.com', 1234, '������', '��8', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@ver.com', 1234, '������', '��9', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nver.cm', 1234, '������', '��10', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nvoer.cm', 1234, '������', '��11', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nveir.cm', 1234, '������', '��12', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nverh.cm', 1234, '������', '��13', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nvehr.cm', 1234, '������', '��14', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nverd.cm', 1234, '������', '��15', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nverg.cm', 1234, '������', '��16', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nverb.cm', 1234, '������', '��17', sysdate, '010-3952-5797');
insert into tb_member values ('ojh5797@nverc.cm', 1234, '������', '��18', sysdate, '010-3952-5797');

insert into tb_notice values (seq_notice_num.nextval, '���̵���', 'gonggong', 'hihihi', sysdate);
delete from tb_notice where nickname='���̵���';
insert into tb_update values (seq_update_num.nextval, '���̵���', '��', '����', sysdate);
insert into tb_member values ('ojh5797@naver.com', 1234, '������', '���ٻ�Ű', sysdate, '010-3952-5797');
insert into tb_notice values (seq_notice_num.nextval, '���ٻ�Ű', '2016�� 10�� 20�� ���������Դϴ�.', '����', sysdate);

select * from tb_notice
select NUM,NICKNAME,SUBJECT,CONTENTS,NDATE from TB_UPDATE order by NUM desc;
select * from tb_notice
delete from tb_notice where num between 7 and 18 
select NUM,NICKNAME,SUBJECT,CONTENTS,NDATE from TB_UPDATE order by NUM desc;

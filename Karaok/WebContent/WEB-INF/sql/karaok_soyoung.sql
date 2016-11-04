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





--[�̺�Ʈ]

--�̺�Ʈ
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

--[Ŀ�´�Ƽ]
drop table tb_free;
delete from tb_free where num=46;
delete from tb_free where num between 29 and 44;
--�����Խ���
drop table tb_free cascade constraints;
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
--�����Խ��� ���
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
create sequence seq_Rfree_num
increment by 1
start with 1
nocycle
nocache;

drop sequence seq_Rfree_num;
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
score number(20) constraint rank_score_pk primary key,
id varchar2(50) constraint rank_id_fk references tb_member(id),
nickname varchar2(50) constraint rank_nickname_fk references tb_member(nickname)
);
--��ũ�����Խ���

drop table tb_screen cascade constraints
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

delete from tb_screen where subject='gyuj'

select * from tb_screen

delete from tb_screen where num between 79 and 86;
drop sequence seq_screen_num;
create sequence seq_screen_num
increment by 1
start with 1
nocycle
nocache;
--��ũ���� ���
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


--[������]
--QnA
drop table tb_qna
create table tb_qna
(
num number(20) constraint qna_num_pk primary key,
nickname varchar2(50),
subject varchar2(100),
contents varchar2(1000),
ndate date,
hits number(20),
constraint tb_qna_fk_nickname foreign key(nickname) references tb_member(nickname)
);

drop sequence seq_qna_num
create sequence seq_qna_num
increment by 1
start with 1
nocycle
nocache;
<!-- qna ��� ���̺�  -->
drop table qna_reply
create table qna_reply(
	qnaNum number(20) constraint qna_replyNum_pk primary key,
	num number(20),
	nickname varchar2(50),
	edate Date,
	contents varchar2(1000),
	constraint tb_Rqna_fk_nickname foreign key(num) references tb_qna(num)
)

select*from qna_reply

drop sequence seq_Rqna_num;
create sequence seq_Rqna_num
increment by 1
start with 1
nocycle
nocache;
--FAQ

select *from tb_event
delete from tb_member where id='lee52x@naver.com'

insert into tb_member values ('lee52x@naver.com', 1234, '�̼���', '���̵���', sysdate, '010-7157-8550');
select id,subject,name,contents from tb_event natural join tb_member

		select num,id,subject,point,contents,fileName,startDate,endDate,state 
			from tb_event natural join tb_member
			where endDate<sysdate
			order by num desc
			

insert into tb_notice values (seq_notice_num.nextval, '���̵���', 'gonggong', 'hihihi', sysdate);
delete from tb_notice where nickname='���̵���';
insert into tb_update values (seq_update_num.nextval, '���̵���', '��', '����', sysdate);
insert into tb_member values ('ojh5797@naver.com', 1234, '������', '���ٻ�Ű', sysdate, '010-3952-5797');
insert into tb_notice values (seq_notice_num.nextval, '���ٻ�Ű', '2016�� 10�� 20�� ���������Դϴ�.', '����', sysdate);

select * from tb_notice
select NUM,NICKNAME,SUBJECT,CONTENTS,NDATE from TB_UPDATE order by NUM desc;

select * from tb_screen;

-- �׽�Ʈ

select num,nickname,subject,ndate,seek,fileName
 		from  (select num,nickname,subject,ndate,seek,fileName, rownum rn   
      	from ( select num,nickname,subject,ndate,seek,fileName
        from tb_screen order by num desc))  
        where rn between 1 and 10; 
        
update  tb_screen set fileName='120.jpg';        




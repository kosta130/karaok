select * from tb_qna;

drop table tb_qna;
create table tb_qna
(
num number(20) constraint qna_num_pk primary key,
nickname varchar2(50),
subject varchar2(100),
contents varchar2(1000),
ndate date
constraint tb_qna_fk_nickname foreign key(nickname) references tb_member(nickname)
);

alter table tb_qna add constraint tb_qna_fk_nickname foreign key(nickname) references tb_member(nickname)
on delete cascade

ALTER TABLE tb_qna ADD constraint tb_qna_fk_nickname FOREIGN KEY(nickname) REFERENCES qna_reply(num) ON DELETE CASCADE

drop sequence seq_qna_num;
create sequence seq_qna_num
increment by 1
start with 1
nocycle
nocache;

insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께1.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께2.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께3.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께4.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께5.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께6.', '제곧내', sysdate);

insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께14', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께15.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께16.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께17.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께18.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께19.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께20.', '제곧내', sysdate);

insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께7.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께8.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께9.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께10.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께11.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께12.', '제곧내', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '오바사키', '이것이 궁금하당께13.', '제곧내', sysdate);

delete from tb_qna where nickname='오바사키';

delete from qna_reply;
drop table qna_reply
<!-- qna 댓글 테이블  -->
create table qna_reply(
	qnaNum number(20) constraint qna_replyNum_pk primary key,
	num number(20),
	nickname varchar2(50),
	edate Date,
	contents varchar2(1000),
	constraint tb_Rqna_fk_nickname foreign key(num) references tb_qna(num)
)

select*from qna_reply
drop table tb_qna_reply;
create table tb_qna_reply
(
nickname varchar2(50) references tb_member(nickname) primary key,
contents varchar2(1000)

);

create sequence seq_Rqna_num
increment by 1
start with 1
nocycle
nocache;

select*from tb_qna

	delete from tb_qna on delete CASCADE 
	where num=3
	
	
select CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME
from user_constraints
where CONSTRAINT_NAME = 'TB_RQNA_FK_NICKNAME' 

delete * 


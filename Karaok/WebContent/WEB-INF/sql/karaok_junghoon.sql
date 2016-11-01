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

insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲1.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲2.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲3.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲4.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲5.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲6.', '����', sysdate);

insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲14', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲15.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲16.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲17.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲18.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲19.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲20.', '����', sysdate);

insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲7.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲8.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲9.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲10.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲11.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲12.', '����', sysdate);
insert into tb_qna values (seq_qna_num.nextval, '���ٻ�Ű', '�̰��� �ñ��ϴ粲13.', '����', sysdate);

delete from tb_qna where nickname='���ٻ�Ű';

delete from qna_reply;
drop table qna_reply
<!-- qna ��� ���̺�  -->
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


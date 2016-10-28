select * from tb_qna;

drop table tb_qna;
create table tb_qna
(
num number(20) constraint qna_num_pk primary key,
nickname varchar2(50),
subject varchar2(100),
contents varchar2(1000),
ndate date,
constraint tb_qna_fk_nickname foreign key(nickname) references tb_member(nickname)
);

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

drop table tb_qna_reply;
create table tb_qna_reply
(
reply_num number(20) primary key,
num number(20),
nickname varchar2(50),
contents varchar2(1000),
constraint tb_reply_fk_num foreign key(num) references tb_qna(num)
);

select * from tb_qna_reply;

-- ������̺�
drop table reply;
create table reply(
   no       number primary key,   -- ��� ��ȣ
   num		number,
   nickname     varchar2(15) not null,
   contents  varchar2(200) not null,
   foreign key(num) references tb_qna(num)
);

drop sequence reply_seq;
create sequence reply_seq
       start with 1
       increment by 1
       nocycle
       nocache;





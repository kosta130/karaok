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

-- 댓글테이블
drop table reply;
create table reply(
   no       number primary key,   -- 댓글 번호
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





drop table tb_event cascade constraints
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

drop table tb_faq

create table tb_faq(
	num number(20) constraint faq_num_pk primary key,
	id varchar2(50),
	subject varchar2(3000),
	contents varchar2(3000),
	options varchar2(50),
	fileName varchar2(100),
	constraint tb_faq_fk_id foreign key(id) references tb_member(id)
)

create sequence seq_faq_num
increment by 1
start with 1
nocycle
nocache;


select * from tb_faq


		select num,id,subject,contents,options,fileName from tb_faq natural join tb_member
			order by num desc
			
			
delete from tb_faq where num=1


select count(*) from tb_faq
select *From tb_faq

select num,id,subject,contents,options,filename
	from (select num,id,subject,contents,options,filename, rownum rn from tb_faq) 
	
	select num,id,subject,contents,options,filename, rownum rn from (
		select num,id,subject,contents,options,filename from tb_faq)
		where rn between 1 and 10

				
 select num,nickname,subject,contents,ndate   
 	from  (select num,nickname,subject,contents,ndate, rownum rn)   
      from ( select num,nickname,subject,contents,ndate    
           from tb_notice order by num desc))  
              where rn between 1 and 10  
              
 select * from(
 		select A.*,rownum rn
 			from(
 				select *from tb_faq order by num desc
 				)A
 			)
 			where rn between 1 and 10


 			
drop table event_reply

<!-- �̺�Ʈ ��� ���̺�  -->
create table event_reply(
	replyNum number(20) constraint evnet_replyNum_pk primary key,
	num number(20),
	id varchar2(50),
	edate Date,
	contents varchar2(1000),
	constraint tb_Revent_fk_id foreign key(num) references tb_event(num) ON DELETE CASCADE
)

create sequence seq_Revent_num
increment by 1
start with 1
nocycle
nocache;
select*from tb_event

	insert into event_reply values(seq_Revent_num.nextval,#num#,#id#,sysdate,#contents#)
	insert into event_reply values(seq_Revent_num.nextval,156,'lee52x@naver.com',sysdate,'����������')
	
select *from event_reply from num=156
select *from event_reply

select*from tb_event

select id,replyNum,point,subject,contents,startDate,endDate,fileName from tb_event natural join event_reply  
where num=156



	select * from event_reply where num=156
	
	
	select*from tb_member
	
	
	select*from tb_notice
	
	
		select num, nickname, subject, contents, ndate, rownum rn
			from (select num, nick name, subject, contents, ndate from tb_notice)
					where rownum
				order by num desc

	
				
				
				select * from tb_update
				
				insert into tb_free values(6,'���̵���','�����Խ�������','�����Խ����Դϴ�',sysdate,3)
		

	select*From tb_free
	
	
	select*from tb_notice
	
	
	select num, nickname, subject, contents, ndate, hits
	from tb_notice
	where num= between 1 and (select max(num) from tb_notice)  
	
	
	
	select max(num) m ,nickname,subject,contents,ndate,hits from
		(select min(num) n,nickname,subject,contents,ndate,hits from tb_notice)
			where num between n and m
			order by num desc
	
	
	
	 select * from(
       select A.*,rownum rn
          from(
             select *from tb_notice order by num desc
             )A
          )
          where rn between #start# and #end#
          
          
          select * from (select * from tb_notice order by num desc) where rownum between 1 and 5
			select num,id,subject,point,contents,fileName,startDate,endDate,state 
			from tb_event natural join tb_member
			where endDate > sysdate
			order by endDate desc
	
select * from (select * from tb_event order by num desc) where rownum between 1 and 5 and where endDate>sysdate
order by endDate desc

select * from (select * from tb_event order by num desc) where rownum=1

select*from tb_update

select*from tb_screen

drop table tb_screen cascade constraint


select*from tb_qna
select*from qna_reply
select * from tb_event 
delete from tb_event where num=154 cascad


	select num, nickname, subject, contents, ndate, hits
	from tb_qna where nickname='���ٻ�Ű'
	order by num desc

	
	
	select num from tb_qna natural join qna_reply 
	where num=1
	
	
	select*from tb_qna
	
	select*from tb_member
	insert into tb_member values('admin','admin','������','������','1981-10-10','010-2341-2345')
	
		select num, nickname, subject, contents, ndate, hits,reply_count
	from tb_qna
	order by num desc
	
	
	
	
	
	  <!-- �α����� ���̵� ������ ���븸 ���̱� -->
  <select id="selectAll" parameterClass="String" resultClass="Qna">
	select num, nickname, subject, contents, ndate, hits,reply_count
	from tb_qna where nickname='���̵���'
	order by num desc
  </select>
  
  <!-- ������ ���̵�� �α��� ������ ��� ����ڰ� �ø� ���� ���� ���̱� -->
    <select id="selectAdminAll"  resultClass="Qna">
	select num, nickname, subject, contents, ndate, hits,reply_count
	from tb_qna
	order by num desc
  </select>
	
	
	select * from (select * from tb_qna order by num desc) where rownum between 1 and 5 and nickname='���̵���'
	
	
	
	
	
	SELECT *
 		FROM (
   			 SELECT RANK() OVER(ORDER BY SCORE DESC)rank, nickname, SCORE
     		FROM (SELECT tb_rank.*
           		, row_number() OVER (PARTITION BY nickname ORDER BY score DESC) rn
         		FROM tb_rank
        		)
     			WHERE rn = 1
     			 ORDER BY row_number() OVER (ORDER BY score DESC, nickname)
     			 
     			 
create table tb_rank
(
num number(30) constraint rank_num_pk primary key,
score number(30) not null,
nickname varchar2(50) references tb_member(nickname) not null
);

select*from tb_member
insert into tb_member values('k10','1234','ȫ�浿','����10','2020-01-03','010-1234-1234')


insert into tb_rank values(11,1002,'����10')
	
	select num,score,nickname from tb_rank
	
			select num,score,nickname from tb_rank 
		order by score desc
	
		
		
			     select num,score,nickname from tb_rank natural join tb_member
         where nickname like '����'
	
         
         select*From tb_qna
         
         
         
         
          select * from(
       select A.*,rownum rn
          from(
             select *from tb_faq order by num desc
             )A
          )
          where rn between 1 and 6
	
          
          drop table tb_rank;
create table tb_rank
(
num number(30) constraint rank_num_pk  primary key,
score number(30) not null,
nickname varchar2(50),
foreign key(nickname) references tb_member(nickname)
);

alter table tb_rank score add default 0

alter table tb_rank score add(score number(30),default=0)

select*from tb_rank

select*from tb_member

insert into tb_rank values(seq_rank_num.nextval,0,'���̵��')
	insert into tb_rank values(seq_rank_num.nextval(),0,#nickname#)

drop table tb_member cascade constraints;
create table tb_member
(
	id varchar2(50) constraint member_id_pk primary key,
	pwd varchar2(50) not null,
	name varchar2(50) not null,
	nickname varchar2(50) unique not null,
	birth date not null,
	tel varchar2(50) not null
);

insert into tb_member values('test','test','�����','�����','1980-01-02','010-2312-1234')

select*from tb_member

drop table tb_member


create table tb_member
(
	id varchar2(50) constraint member_id_pk primary key,
	pwd varchar2(50) not null,
	name varchar2(50) not null,
	nickname varchar2(50) unique not null,
	birth date not null,
	tel varchar2(50) not null
);

select *from tb_member

insert into tb_member values('admin','admin','������','������','1980-02-28','010-7157-8550')


select*from tb_faq

delete from tb_faq where num=85


select*from tb_qna



insert into tb_qna values (1, '������', 'ȸ�������� �� �˴ϴ�.', 'ȸ�������� ���� �ʽ��ϴ�.', '2016-10-16',0,0);
insert into tb_qna values (2, '�̼���', '�α����� �� �˴ϴ�.', '�α����� ���� �ʽ��ϴ�.', '2016-10-16',0,0);
insert into tb_qna values (3, '������', '���� ������ �� �˴ϴ�', '������ ���� �ʽ��ϴ�.', '2016-10-18',0,0);
insert into tb_qna values (4, '������', '��й�ȣ�� ��ġ���� �ʴٰ� �մϴ�.', '��й�ȣ�� ��ġ���� �ʴ´ٰ� �մϴ�', '2016-10-18',0,0);
insert into tb_qna values (5, '�̼���', '������ ���װ� �߰ߵǾ����ϴ�.', '������ ��Ȯ�� �ƴµ� ����ó���� ���� �ʽ��ϴ�.', '2016-10-18',0,0);
insert into tb_qna values (6, '������', '���� ������ �ȵǿ�.', '���ӽ����� ���� �ʽ��ϴ�.', '2016-10-19',0,0);
insert into tb_qna values (7, '��ҿ�', '����ȭ���� �̻��ؿ�.', '���� ������ ������ ȭ���� ���������� ���߽��ϴ�.', '2016-10-20',0,0);
insert into tb_qna values (8, '�Ǽ���', 'ȭ�鿡 �̻��� ���ڰ� ������.', '����ȭ�� �ڷ� �̻��� ���ڰ� ���Դϴ�.', '2016-10-20',0,0);
insert into tb_qna values (9, '��ҿ�', '���� ���� �ǿ�.', '���� �ø� ���� ���� �˴ϴ�.', '2016-10-26',0,0);
insert into tb_qna values (10, '������', '���� ������ �ȵǿ�.', '���� �� ��ŷ�� ���µ� ������ �ȵǾ� �ֽ��ϴ�.', '2016-10-26',0,0);
insert into tb_qna values (11, '�Ǽ���', '���� �� �弳 �Ű�� ���� �ϸ� �ǳ���?', '�����ϴٰ� ���ϴ� ������ �Ű��ϰ� �ͽ��ϴ�.', '2016-10-26',0,0);
insert into tb_qna values (12, '�̼���', '�̸��� ���� �� �ؾ� �ϳ���?', '���� ���̴� ���� ���ϳ���?', '2016-10-27',0,0);
insert into tb_qna values (13, '������', '������ �ߴ� ���̵� ���� �Ұ��� �Ѱ���?', '������ �޴� ���� ���̵� ���� �Ұ��� �Ѱ���?', '2016-10-28',0,0);
insert into tb_qna values (14, '������', '�̺�Ʈ�� ��÷ �Ǿ��µ�....', '�̺�Ʈ�� ��÷ �Ǿ��µ� ������ �����ϴ�', '2016-10-29',0,0);
insert into tb_qna values (15, '�Ǽ���', '��� ������ �ȵ˴ϴ�.', '��忡 �����޴µ� ������ ���� �ʽ��ϴ�.', '2016-10-30',0,0);
insert into tb_qna values (16, '�̼���', 'ȸ�� Ż��� ��� �ϳ���?', 'ȸ�� Ż���ϰ� �ͽ��ϴ�.', '2016-11-01',0,0);
insert into tb_qna values (17, '��ҿ�', '���ӻ����� �ȵ˴ϴ�.', '���� ���� �ϰ� �;��.', '2016-11-01',0,0);
insert into tb_qna values (18, '�Ǽ���', '������ ����� �� �����ϴ�.', '�� ���̵�� ȸ�������Ϸ� �޴µ� �ȵǿ�', '2016-11-03',0,0);
insert into tb_qna values (19, '������', '���۹�ư�� ������ �ʽ��ϴ�.', '���� ������ �ȵ˴ϴ�.', '2016-11-04',0,0);
insert into tb_qna values (20, '������', '�ε��� ������ �ȵ˴ϴ�.', '���� �ε��� ������ �ȵ˴ϴ�..', '2016-11-04',0,0);


select*From tb_faq

delete from tb_faq where num=87


select*from tb_qna 
delete from tb_qna where num=42

select *from tb_member
delete from tb_member where id='test' cascade constraints




select*from tb_faq
update tb_faq set subject='[Ű���������] �α��� �� ������ �����ߴٴ� �޽����� ��' where num=82


 [Ű���������] è�Ǿ� ���� ȭ�鿡�� Maestro ���� �޽��� �߻�

 [Ű���������] ������ ���� ����� ������ �ֽ��ϴ�. � �κп� ������ �ִ� �ǰ���?

 [Ű���������] ��ȭ������ ���� ������ ������ �� �ִ� ����� ������ �ֳ���?

 [Ű���������] �����ӵ�(��)�� ���� �� ��Ÿ���� ������ �����ΰ���?

 [Ű���������] �α��� �� ������ �����ߴٴ� �޽����� ���ɴϴ�. � �κ��� Ȯ���ؾ� �ϳ���?

�̺�Ʈ
 





insert into tb_free values (2,'�̼���', ' ���ӿ�����ġ/����/�����/���ϴ��ΰ�Ư¡ ', '��� 1. ���ӿ��� ���ѽ��ϰ� ��ġ�ֱ��ϰ� ����Ǵ� ����ɿ��ϰ� ä��â �������¾ֵ鿡�� �������϶�������� ������������ ������������',sysdate,0);
insert into tb_free values (3,'��ҿ�', '��� ���� â�� ������ �����', '�����ƿ��� �������� �뿩�ؼ� ��������� ���Ҵµ� �̰� Ÿ���� �����ϰ� ������ �Ǵµ�

Ȥ�� ��Ƽ��ٶ� �����ų���� ������?',sysdate,0);
insert into tb_free values (4,'������', '���� ���� ���� ���ε�', '���� ���ε� ����Ʈ �������� ���� �� �ֳ���?',sysdate,0);
insert into tb_free values (5,'�Ǽ���', '�����������', '���� ����Ʈ�� �������� ��� �ٽ� �޴��� �� ���� �׷��µ�

 

��� �ٽ� �޾ƾ� �ϴ��� �˷��ֽǼ�����������.......

 

��Ź�����',sysdate,0);
insert into tb_free values (6,'������', '�������� Ȯ�ι��������', '����.. ��� �������� ������ ����..

 

�ٽ� �����Ϸ��µ� �����ӱⰣ�� �Ѵ� ä�������� ��ä��������

 

Ȯ���� �� �ִ� ����� �ֳ���',sysdate,0);
insert into tb_free values (7,'Ȳ����', ' �ŷ��� ������ ����.... ', '���ڴԵ�� �ŷ��ҿ��� ������ �ѹ����...

 

��¥ ���Ĺ����Ű��礻��....... 

 

��¥ �ٸ��� �충 ������ ������ ������

 

���ĳ� �������� ����� ������ �̻�������....����',sysdate,0);
insert into tb_free values (8,'�̴��', '�ű԰����ܵ���.�̺�Ʈ �� ��� �򳪿�.  ', '�̷����� �ʺ����� �Ӵ��߿� �ű� �����ڴ� 5�� ���� 
�������� �ִٴ���.. 
���� ����� �����Ȱ� ��ã�ڴ��󱸿�. 

�׸��� ��.. ��x x�������� ������ �� 3���� �ְ� 
�ϳ��� �糪�� . �ٸ��� ����.�̰ǹ������ �˰ڴµ� 
������ �ϳ��� ������? 

�ƽôº� ��� �޾��ֽ� �� �����ϰڽ��ϴ�(__) ',sysdate,0);
insert into tb_free values (9,'��ö', ' �Ϻιг��� ����Ʈ ���� ', '���������� �ִ� �ϲ��� ������޶���ϴ� �ֹ��� �ִµ� ���캸�� ����Ʈ�� �Ϸᰡ �ȵ�',sysdate,0);
insert into tb_free values (10,'������', ' ������ ��񿣻��� ���� ���� ���� ', '�׷���, �����縷 �������׿���

���� ���̾� ������


������ ��񿣻��� ���ڸ� ����ٰ� �Ǿ��ֳ׿�?
',sysdate,0);
insert into tb_free values (11,'��ȣâ', ' < ����chuu > ģ��/�ʽ�/���� ��ƿ�~~ ', '�� ���밡�� ����� �޾��ֳ���? ��.�� �ű������ε�....',sysdate,0);
insert into tb_free values (12,'������', ' �ӿ� �߰� �� ... �׸���  ', '�� �԰� �ٴٿ� ���� ���� �� �̻����ڳ��� .

�� ���׿��� ���� �ٴϰ� �ش޶�� ���Ϸ��� ���� ���Ҿ�� ��',sysdate,0);
insert into tb_free values (13,'�ֻ��', '�����縷�� ��Ʈ���� �߿��մϴ�', '�׷��� ��ڰ� ���� ��Ʈ�� �ϴ� ���� ���� ���̵尡 �ʿ��մϴ�....

�׷� �� ������ �츮�� �� �װڱ�..',sysdate,0);
insert into tb_free values (14,'������', ' ���� ������or���񷡰� ��Ʈor������ �����ؿ�~   ', '��Ź�帳�ϴ�...',sysdate,0);
insert into tb_free values (15,'������', ' ���߿� ���ؼ� �����Դϴ� ', '������ ��ų�� ������ �̹��� �߸� �����̻� �����ʰ� �������� �״�� ���ٰ� ������ϴ�,

 

�׷��� ������ �̹��� �ȶ߰� �����ִ°Ŷ�� ���� ������ �÷��� �̹��� ���� �ʿ䰡 �ֳ���? ',sysdate,0);
insert into tb_free values (16,'����ȯ', '�Ƶ�ȥ �̺�Ʈ ��÷�� ���� ������ ����', '28�Ϻ��� ��ζ�� �ߴµ� ���Ϻ����� 11�� 1�����ķ� �شٰ� �س��� ������ ����',sysdate,0);
insert into tb_free values (17,'������', '������ �ؾ��Ѵٸ� �� ��°� �̵��ϱ��?', '����� ��_��',sysdate,0);
insert into tb_free values (18,'�̱���', ' ������� ������µ� ������� ���۸��� �����ϴ°�..  ', '������� �����ҷ��� ���� �ٸ� �ؿշ����� ��ƾߵȴٴµ� ȥ�ڶ� �ʹ� ���̳���

�쿬�� ���ױ��� ��� ����� �ȴ��� �������� �����Ѱ���?',sysdate,0);

commit




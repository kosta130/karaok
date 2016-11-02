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

<!-- 이벤트 댓글 테이블  -->
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
	insert into event_reply values(seq_Revent_num.nextval,156,'lee52x@naver.com',sysdate,'ㅋㅋㅋㅋㅋ')
	
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
				
				insert into tb_free values(6,'드루미드루미','자유게시판제목','자유게시판입니당',sysdate,3)
		

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

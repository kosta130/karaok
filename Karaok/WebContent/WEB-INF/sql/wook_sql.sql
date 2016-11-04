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


	select num, nickname, subject, contents, ndate, hits
	from tb_qna where nickname='오바사키'
	order by num desc

	
	
	select num from tb_qna natural join qna_reply 
	where num=1
	
	
	select*from tb_qna
	
	select*from tb_member
	insert into tb_member values('admin','admin','관리자','관리자','1981-10-10','010-2341-2345')
	
		select num, nickname, subject, contents, ndate, hits,reply_count
	from tb_qna
	order by num desc
	
	
	
	
	
	  <!-- 로그인한 아이디가 질문한 내용만 보이기 -->
  <select id="selectAll" parameterClass="String" resultClass="Qna">
	select num, nickname, subject, contents, ndate, hits,reply_count
	from tb_qna where nickname='드루미드루미'
	order by num desc
  </select>
  
  <!-- 관리자 아이디로 로그인 했을시 모든 사용자가 올린 질문 내용 보이기 -->
    <select id="selectAdminAll"  resultClass="Qna">
	select num, nickname, subject, contents, ndate, hits,reply_count
	from tb_qna
	order by num desc
  </select>
	
	
	select * from (select * from tb_qna order by num desc) where rownum between 1 and 5 and nickname='드루미드루미'
	
	
	
	
	
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
insert into tb_member values('k10','1234','홍길동','오바10','2020-01-03','010-1234-1234')


insert into tb_rank values(11,1002,'오바10')
	
	select num,score,nickname from tb_rank
	
			select num,score,nickname from tb_rank 
		order by score desc
	
		
		
			     select num,score,nickname from tb_rank natural join tb_member
         where nickname like '오바'
	
         
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

insert into tb_rank values(seq_rank_num.nextval,0,'드루미드루')
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

insert into tb_member values('test','test','사용자','사용자','1980-01-02','010-2312-1234')

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

insert into tb_member values('admin','admin','관리자','관리자','1980-02-28','010-7157-8550')


select*from tb_faq

delete from tb_faq where num=85


select*from tb_qna



insert into tb_qna values (1, '오정훈', '회원가입이 안 됩니다.', '회원가입이 되질 않습니다.', '2016-10-16',0,0);
insert into tb_qna values (2, '이성욱', '로그인이 안 됩니다.', '로그인이 되질 않습니다.', '2016-10-16',0,0);
insert into tb_qna values (3, '김현영', '게임 실행이 안 됩니다', '게임이 되질 않습니다.', '2016-10-18',0,0);
insert into tb_qna values (4, '오정훈', '비밀번호가 일치하지 않다고 합니다.', '비밀번호가 일치하지 않는다고 합니다', '2016-10-18',0,0);
insert into tb_qna values (5, '이성욱', '게임중 버그가 발견되었습니다.', '정답을 정확히 쳤는데 정답처리가 되질 않습니다.', '2016-10-18',0,0);
insert into tb_qna values (6, '김현영', '게임 실행이 안되요.', '게임실행이 되질 않습니다.', '2016-10-19',0,0);
insert into tb_qna values (7, '김소영', '실행화면이 이상해요.', '게임 실행을 누르니 화면이 검정색으로 변했습니다.', '2016-10-20',0,0);
insert into tb_qna values (8, '권성준', '화면에 이상한 글자가 보여요.', '게임화면 뒤로 이상한 글자가 보입니다.', '2016-10-20',0,0);
insert into tb_qna values (9, '김소영', '글이 삭제 되요.', '제가 올린 글이 삭제 됩니다.', '2016-10-26',0,0);
insert into tb_qna values (10, '오정훈', '점수 저장이 안되요.', '게임 후 랭킹에 갓는데 저장이 안되어 있습니다.', '2016-10-26',0,0);
insert into tb_qna values (11, '권성준', '게임 내 욕설 신고는 어디다 하면 되나요?', '게임하다가 욕하는 유저를 신고하고 싶습니다.', '2016-10-26',0,0);
insert into tb_qna values (12, '이성욱', '이메일 인증 꼭 해야 하나요?', '인증 없이는 게임 못하나요?', '2016-10-27',0,0);
insert into tb_qna values (13, '김현영', '예전에 했던 아이디 복구 불가능 한가요?', '예전에 햇던 게임 아이디 복구 불가능 한가요?', '2016-10-28',0,0);
insert into tb_qna values (14, '오정훈', '이벤트에 당첨 되었는데....', '이벤트에 당첨 되었는데 연락이 없습니다', '2016-10-29',0,0);
insert into tb_qna values (15, '권성준', '길드 가입이 안됩니다.', '길드에 가입햇는데 가입이 되질 않습니다.', '2016-10-30',0,0);
insert into tb_qna values (16, '이성욱', '회원 탈퇴는 어떻게 하나요?', '회원 탈퇴하고 싶습니다.', '2016-11-01',0,0);
insert into tb_qna values (17, '김소영', '게임삭제가 안됩니다.', '게임 삭제 하고 싶어요.', '2016-11-01',0,0);
insert into tb_qna values (18, '권성준', '계정이 도용된 것 같습니다.', '제 아이디로 회원가입하려 햇는데 안되요', '2016-11-03',0,0);
insert into tb_qna values (19, '김현영', '시작버튼이 눌리지 않습니다.', '게임 시작이 안됩니다.', '2016-11-04',0,0);
insert into tb_qna values (20, '오정훈', '로딩중 실행이 안됩니다.', '게임 로딩중 실행이 안됩니다..', '2016-11-04',0,0);


select*From tb_faq

delete from tb_faq where num=87


select*from tb_qna 
delete from tb_qna where num=42

select *from tb_member
delete from tb_member where id='test' cascade constraints




select*from tb_faq
update tb_faq set subject='[키보드워리어] 로그인 시 연결이 실패했다는 메시지가 발생' where num=82


 [키보드워리어] 챔피언 선택 화면에서 Maestro 오류 메시지 발생

 [키보드워리어] 연결이 자주 끊기는 현상이 있습니다. 어떤 부분에 문제가 있는 건가요?

 [키보드워리어] 방화벽으로 인한 문제를 개선할 수 있는 방법은 무엇이 있나요?

 [키보드워리어] 반응속도(핑)가 높을 때 나타나는 증상은 무엇인가요?

 [키보드워리어] 로그인 시 연결이 실패했다는 메시지가 나옵니다. 어떤 부분을 확인해야 하나요?

이벤트
 









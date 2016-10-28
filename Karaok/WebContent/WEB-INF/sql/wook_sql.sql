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

insert into tb_faq(seq_faq_num,'lee52x@naver.com','[蝶帖原昔球] 嬢恐 惟績昔亜推?' ,'蝶帖原昔球澗 失舌莫 蝶遣斗研 識澱馬食 惟績聖 搭背 切重戚 壱献 蝶遣斗研 
整失獣徹壱 亜荷嬢 蟹亜澗 整失 獣皇傾戚芝税 働失聖 走観 惟績脊艦陥.

蝶遣斗澗 乞砧 陥叱 腰税 失舌聖 暗団 切重税 莫殿研 刃失馬惟 鞠澗汽 
神送 惟績聖 搭背 条嬢走澗 井蝿帖拭 税背辞幻 失舌戚 亜管馬惟 桔艦陥. 

惟績税 奄沙莫縦精 爽嬢走澗 舘嬢研 益顕 毒拭 益顕生稽 益形辞 竺誤馬壱 限蓄澗 
益顕訂綜 惟績生稽 巷廃廃 但税旋 降雌引 雌雌径戚 降番鞠澗 古酔 嘘整旋昔 惟績税
莫殿脊艦陥.' ,'game',null)


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

<!-- 戚坤闘 奇越 砺戚鷺  -->
create table event_reply(
	replyNum number(20) constraint evnet_replyNum_pk primary key,
	num number(20),
	id varchar2(50),
	edate Date,
	contents varchar2(1000),
	constraint tb_Revent_fk_id foreign key(num) references tb_event(num)
)

create sequence seq_Revent_num
increment by 1
start with 1
nocycle
nocache;
select*from tb_event

	insert into event_reply values(seq_Revent_num.nextval,#num#,#id#,sysdate,#contents#)
	insert into event_reply values(seq_Revent_num.nextval,156,'lee52x@naver.com',sysdate,'せせせせせ')
	
select *from event_reply

select replyNum,num,id,edate,contents from event_reply where contents='せせせせせ'
select replyNum,num,id,edate,contents from event_reply

select replyNum,num,id,edate,contents from event_reply where contents=#contents#



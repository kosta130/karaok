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

create table tb_faq(
	num number(20) constraint faq_num_pk primary key,
	id varchar2(50),
	subject varchar2(100),
	contents varchar2(1000),
	fileName varchar2(100),
	constraint tb_faq_fk_id foreign key(id) references tb_member(id)
)

create sequence seq_faq_num
increment by 1
start with 1
nocycle
nocache;


select * from tb_faq
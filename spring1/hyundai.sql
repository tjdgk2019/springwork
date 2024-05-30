create database hyundai;

use hyundai;

create table board(bno int auto_increment primary key, title varchar(200), content varchar(1000), author varchar(20) default 'admin',
vcnt int default 0, resdate timestamp default current_timestamp);

insert into board(title, content) values ('더미글 제목1', '더미글 내용1 입니다.');
insert into board(title, content) values ('더미글 제목2', '더미글 내용2 입니다.');
insert into board(title, content) values ('더미글 제목3', '더미글 내용3 입니다.');
insert into board(title, content) values ('더미글 제목4', '더미글 내용4 입니다.');
insert into board(title, content) values ('더미글 제목5', '더미글 내용5 입니다.');
insert into board(title, content) values ('더미글 제목6', '더미글 내용6 입니다.');

create table member(id varchar(20) primary key, pw varchar(500) not null, name varchar(100) not null, email varchar(300) not null, 
tel varchar(100) not null, addr1 varchar(200), addr2 varchar(100), postcode varchar(50), birth date, resdate timestamp default current_timestamp);

select * from board;
select * from member;
select * from qna;

drop table member;
drop table board;

create table free(no int auto_increment primary key, title varchar(200), content varchar(1000), hits int default 0, resdate timestamp default current_timestamp,
id varchar(20), name varchar(100));

alter table free add constraint fk_mem foreign key (id) references member(id);

create table qna(no int auto_increment primary key,
title varchar(200), content varchar(1000),
lev int default 1, parno int default 0, 
hits int default 0, resdate timestamp default current_timestamp,
id varchar(20), name varchar(100));

alter table qna add constraint fk_mem0 
foreign key (id) references member(id);

create table fileboard(no int auto_increment primary key,
title varchar(200), content varchar(1000), url varchar(300),
hits int default 0, resdate timestamp default current_timestamp,
author varchar(20));

create table product(pno int auto_increment primary key,
cate varchar(20) not null, pname varchar(100) not null, 
com varchar(1000), price int default 1000, 
img varchar(300));

alter table product add img2 varchar(300);
alter table product add img3 varchar(300);

create table inventory(ino int auto_increment primary key,
pno int, iprice int default 1000, oprice int default 1000,
amount int default 1, remark varchar(200),
foreign key(pno) references product(pno)); 

alter table inventory add resdate timestamp default current_timestamp;

select * from sales;
create table sales(sno int auto_increment primary key,
pno int, amount int default 1, tot int, id varchar(20),
paymethod varchar(20), paynum varchar(30), 
addr varchar(300), tel varchar(100), 
delcom varchar(50), deltel varchar(50), 
delno varchar(50), delstatus varchar(20), 
st varchar(20));

alter table sales add constraint fk_mem1 
foreign key (id) references member(id);

alter table sales add constraint fk_pro1 
foreign key (pno) references product(pno);

alter table sales add resdate timestamp default current_timestamp;

create table basket(bno int auto_increment primary key,
id varchar(20), pno int, amount int, remark varchar(100));

alter table basket add constraint fk_mem2 
foreign key (id) references member(id);

alter table basket add constraint fk_pro2 
foreign key (pno) references product(pno);

alter table basket add resdate timestamp default current_timestamp;

-- 총 게시물 수
select COUNT(*) from board;

-- 공지사항 목록
select * from board order by resdate desc;

-- 공지사항 상세보기
select * from board where bno=1;

-- 공지사항 글 등록
insert into board values (default, '글 제목', '글 내용', 'admin', default, default);

-- 공지사항 변경
update board set title='수정 글 제목', content='수정 글 내용' where bno=1;

-- 공지사항 조회수 증가
update board set vcnt=vcnt+1 where bno=1;

-- 공지사항 삭제
delete from board where bno=1;

-- 자료실 총 게시물 수
select COUNT(*) from fileboard;

-- 자료실 목록
select no, title, content, url, hits, resdate, author from fileboard 
order by resdate desc 
limit 0, 5;

-- 자료실 상세보기
select * from fileboard where no=1;

-- 자료실 글 등록
insert into fileboard values (default, '자료실 글 제목', '자료실 글 내용', 
'파일명', default, default, 'admin');

-- 자료실 글 수정
update fileboard set title='수정된 자료실 제목', content='수정된 자료실 글' where no=1;

-- 자쇼실 글 조회수 증가
update fileboard set hits=hits+1 where no=1;

-- 자료실 글 삭제
delete from fileboard where no=1;

-- 자유게시판 목록 조회
select f.no, f.title, f.content, f.hits, f.resdate, m.id, m.name 
from free f, member m 
where f.id=m.id order by f.resdate desc 
limit 0, 5;

-- 자유게시판 상세 보기
select f.no, f.title, f.content, f.hits, f.resdate, m.id, m.name 
from free f, member m 
where f.id=m.id and no=1;

-- 자유게시판 글 등록
insert into free values 
(default, '글 제목', '글 내용', default, default, 
'아이디', '작성자명');

-- 자유게시판 글 변경
update free set title='제목 수정', 
content='내용 수정' where no=1;

-- 자유게시판 글 조회수 증가
update free set hits=hits+1 where no=1;

-- 자유게시판 글 삭제
delete from free where no=1;

-- 묻고 답하기 목록 조회
select q.no, q.title, q.content, q.lev, q.parno, q.hits, q.resdate, m.id, m.name 
from qna q, member m 
where q.id=m.id order by q.resdate desc  
limit 0, 5;

-- 묻고 답하기 상세 보기
select q.no, q.title, q.content, q.lev, q.parno, q.hits, q.resdate, m.id, m.name 
from qna q, member m 
where q.id=m.id and no=1;

-- 질문 글 등록
insert into qna values (default, '질문 제목', '질문 내용',
 default, default, default, default, 
 '아이디','작성자명');

-- 질문 글에 대한 부모 글번호 변경
update qna set parno=1 where no=1;

-- 답변 글 등록
insert into qna values (default, '[답변] 질문 제목', 
'[답변] 질문 내용', 2, 1, default, default, 
'아이디', '작성자명');

-- 묻고 답하기 글 변경
update qna set title='제목 변경', content='내용 변경' 
where no=1;

-- 묻고 답하기 글 조회수 증가
update qna set hits=hits+1 where no=1;

-- 묻고 답하기 글 삭제
delete from qna where no=1;

select * from sales;

-- 관리자 판매 전체 목록
select s.no, p.pno, s.amount, s.tot, m.id, s.paymethod, s.paynum, 
s.addr, s.tel, s.delcom, s.deltel, s.delno, s.delstatus, s.resdate 
from sales s, product p, member m where s.pno=p.pno and s.id=m.id 
order by resdate desc;

-- 고객별 구매 목록
select s.no, p.pno, s.amount, s.tot, m.id, s.paymethod, s.paynum, 
s.addr, s.tel, s.delcom, s.deltel, s.delno, s.delstatus, s.resdate 
from sales s, product p, member m where s.pno=p.pno and s.id=m.id and id='아이디'  
order by resdate desc;

-- 해당 구매 건별 구매 상세 내역
select s.no, p.pno, s.amount, s.tot, m.id, s.paymethod, s.paynum, 
s.addr, s.tel, s.delcom, s.deltel, s.delno, s.delstatus, s.resdate 
from sales s, product p, member m where s.pno=p.pno and s.id=m.id and sno=1;

-- 구매 처리
insert into sales values (default, 1, 2, 40000,
'아이디', '결제방법', '결제번호', '주소', '연락처', 
'배송사', '배송기사연락처', '배송코드', 
'배송상태', '거래상태', default);

-- 배송지 변경
update sales set addr='변경 주소', tel='전화번호' where sno=1;

-- 배송 처리
update sales set delcom='배송사', deltel='배송기사연락처', 
delstatus='배송상태', st='거래상태' where sno=1;

-- 반품 처리
delete from sales where sno=1;


select * from basket;

-- 사용자별 장바구니 목록
select b.bno, m.id, p.pno, b.amount, b.remark, b.resdate 
from basket b, product p, member m where b.pno=p.pno and b.id=m.id and id='아이디'  
order by resdate desc;

-- 장바구니 상세보기
select b.bno, m.id, p.pno, b.amount, b.remark, b.resdate 
from basket b, product p, member m 
where b.pno=p.pno and b.id=m.id and bno=1;

-- 장바구니 추가
insert into basket values (default, '아이디', 
1, 2, '', default);

-- 장바구니 정보 변경
update basket set amount=3, remark=''  
where bno=1;

-- 장바구니 정보 제거
delete from basket where bno=1;

show databases;

use morning;

show tables;

desc member;

insert into member(id, pw, name, email, tel) values ('admin', '1234', '관리자', 'admin@morning.com', '010-2848-1234');

select * from member where id='admin';

delete from member where id='admin';

commit;

desc free;

drop view ckboard;

create view ckboard as (select f.no as no, f.title as title, f.content as content, f.hits as hits,
f.resdate, m.id as id, m.name as name from free f, member m where f.id=m.id);

select * from ckboard;

commit;

select * from fileboard;

delete from fileboard where no=3;

select * from product;

delete from product where pno=3;

ALTER TABLE product AUTO_INCREMENT = 1;

-- ALTER TABLE product AUTO_INCREMENT = 1;

desc product;

desc inventory;

select p.pno as pno, p.cate as cate, p.pname as pname,
p.com as com, p.img as img, p.img2 as img2, p.img3 as img3,
avg(i.iprice) as iprice, max(i.oprice) as oprice,
sum(i.amount) as amount from product p, inventory i 
where p.pno=i.pno;

insert into inventory values (default, 1, 600, 900, 10, '', default);

drop view productvo;

create view productvo as (select p.pno as pno, p.cate as cate, p.pname as pname,
p.com as com, p.img as img, p.img2 as img2, p.img3 as img3,
avg(i.iprice) as iprice, max(i.oprice) as oprice,
sum(i.amount) as amount from product p, inventory i 
where p.pno=i.pno); 


drop view inventoryvo;

select i.ino as ino, i.pno as pno, p.pname as pname, 
avg(i.iprice) as iprice, 
max(i.oprice) as oprice, sum(i.amount) as amount, 
i.remark as remark, max(i.resdate) as resdate 
from inventory i, product p where i.pno=p.pno group by p.pno, i.pno;

create view inventoryvo as (select i.ino as ino, i.pno as pno, p.pname as pname, 
avg(i.iprice) as iprice, 
max(i.oprice) as oprice, sum(i.amount) as amount, 
i.remark as remark, max(i.resdate) as resdate 
from inventory i, product p where i.pno=p.pno group by p.pno, i.pno);

select * from productvo where pno=1;

select * from inventoryvo where pno=1;

select * from sales;

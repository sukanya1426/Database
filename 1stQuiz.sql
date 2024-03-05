drop table reserves;
drop table boats;
drop table sailors;

create table sailors(
sid number(20),
sname varchar2(20),
age number(20),
constraint sailors_pk primary key(sid)
);

create table boats(
bid number(20),
bname varchar2(20),
color varchar2(20),
constraint boats_pk primary key(bid)
);

create table reserves(
sid number(20),
bid number(20),
day varchar2(20),
constraint reserves_pk primary key(sid,bid),
constraint reserves_fk1 foreign key(sid) references sailors(sid),
constraint reserves_fk2 foreign key(bid) references boats(bid)
);
insert into sailors values(22,'Andy',24);
insert into sailors values(23,'Roy',43);
insert into sailors values(24,'Hotario',23);
insert into sailors values(25,'Dustin',45);
insert into sailors values(26,'hotarioo',21);
insert into sailors values(27,'Alex',65);
insert into sailors values(28,'robin',43);
insert into sailors values(29,'Andrew',23);
insert into sailors values(30,'anna',67);
insert into sailors values(31,'Abc',34);

insert into boats values(101,'a','blue');
insert into boats values(102,'b','red');
insert into boats values(103,'c','green');
insert into boats values(104,'d','red');

insert into reserves values(22,102,'10/10/98');
insert into reserves values(22,103,'10/10/98');
insert into reserves values(22,104,'10/10/98');
insert into reserves values(22,101,'10/10/98');
insert into reserves values(25,102,'10/10/98');
insert into reserves values(25,103,'10/10/98');
insert into reserves values(25,104,'10/10/98');
insert into reserves values(26,103,'10/10/98');
insert into reserves values(24,101,'10/10/98');
insert into reserves values(26,102,'10/10/98');

select sname
from sailors,boats,reserves
where reserves.sid= sailors.sid and boats.bid=103
group by sname;

select sname
from sailors,boats,reserves
where boats.color='red' and boats.bid=reserves.bid and reserves.sid=sailors.sid
group by sname;

select color
from sailors,boats,reserves
where sname='Andy' and sailors.sid = reserves.sid and reserves.bid = boats.bid
group by color;

select sname
from sailors,boats,reserves
where reserves.sid= sailors.sid and boats.bid=103
 and
 boats.color='red' and boats.bid=reserves.bid and reserves.sid=sailors.sid
group by sname;




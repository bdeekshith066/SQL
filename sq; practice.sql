create database bmsce;
use bmsce;

create table students(
usn int primary key,
name varchar(50),
admission int not null);

create table teachers(
id int primary key,
name varchar(50),
subject varchar(30));


insert into students
(usn,name,admission)
values
(101,'harsha',03),
(102,'varsha',04),
(103,'rohan',05);

select *
from students
where name like '%sha';

drop database bmsce;
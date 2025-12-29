select * from student;

select 
    name as 이름,   
  substr(birthday, 1, 2) as 년도,
  substr(birthday, 4, 2) as 월,
  substr(birthday, 6, 4) as 일
from student;    

select
    name,
    tel,
    instr(tel, ')') as "괄호위치"
from student
where deptno1 = 201;

select
    name,
    tel,
    instr(tel , '3') as 첫3위치 -- instr(tel , '3', 1,1) as "첫3위치"
from student
where deptno1 = 101;


select 
    name,
    tel,
    SUBSTR(tel, 1, INSTR(tel, ')') -1) AS 지역번호
from student    
where deptno1 = 201;

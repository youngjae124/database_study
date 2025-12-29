select * from student;
select * from professor;

select studno as 번호 , name as 이름, id as 아이디 from student
where height >= 160 and height <= 175
UNION all
select profno, name , id  from professor
where deptno in (101,102,103,201) and bonus is null;


select 
      '이름:' || name,
     '아이디:' || id,
     '주민번호:' || substr(jumin, 1, 6)|| '-' || substr(jumin,7, 7) 주민번호 
from student;
 